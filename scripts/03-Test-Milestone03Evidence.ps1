[CmdletBinding()]
param(
    [string]$ProjectRoot = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'

$RequiredFiles = @(
    'README.md'
    'architecture\01-pim-governance-operating-model.md'
    'architecture\02-pim-eligible-access-and-activation-flow.md'
    'architecture\03-global-administrator-governance-model.md'
    'data\01-milestone-01-baseline-findings.csv'
    'data\02-milestone-01-evidence-manifest.csv'
    'data\03-milestone-02-control-validation.csv'
    'data\04-milestone-02-evidence-manifest.csv'
    'data\05-milestone-03-control-validation.csv'
    'data\06-milestone-03-evidence-manifest.csv'
    'docs\01-milestone-01-pim-readiness-and-baseline.md'
    'docs\02-milestone-01-test-and-validation-record.md'
    'docs\03-milestone-02-eligible-access-remediation.md'
    'docs\04-milestone-02-test-and-validation-record.md'
    'docs\05-milestone-03-global-administrator-remediation.md'
    'docs\06-milestone-03-test-and-validation-record.md'
    'policies\01-pim-baseline-control-requirements.md'
    'policies\02-pim-eligible-access-control-standard.md'
    'policies\03-global-administrator-and-emergency-access-standard.md'
    'runbooks\01-review-pim-readiness-and-alerts.md'
    'runbooks\02-operate-pim-eligible-role-activation.md'
    'runbooks\03-operate-global-administrator-access.md'
    'scripts\01-Test-Milestone01Evidence.ps1'
    'scripts\02-Test-Milestone02Evidence.ps1'
    'scripts\03-Test-Milestone03Evidence.ps1'
    'screenshots\m01-02-pim-discovery-insights-baseline.png'
    'screenshots\m01-03-pim-security-alerts-baseline.png'
    'screenshots\m01-04-pim-mfa-alert-directory-readers.png'
    'screenshots\m01-06-pim-role-settings-unmodified-baseline.png'
    'screenshots\m01-07-pim-directory-readers-default-settings.png'
    'screenshots\m01-08-pim-global-admin-default-settings.png'
    'screenshots\m01-09-pim-global-admin-default-notifications.png'
    'screenshots\m02-01-pim-directory-readers-mfa-enforced.png'
    'screenshots\m02-02-pim-user-administrator-default-settings.png'
    'screenshots\m02-03-pim-user-administrator-hardened-settings.png'
    'screenshots\m02-04-pim-eligible-role-activation-available.png'
    'screenshots\m02-05-pim-user-administrator-activation-request-pending.png'
    'screenshots\m02-06-pim-user-administrator-active-assignment.png'
    'screenshots\m02-07-pim-user-administrator-audit-history.png'
    'screenshots\m02-08-pim-alerts-after-mfa-remediation.png'
    'screenshots\m03-01-pim-global-administrator-hardened-settings.png'
    'screenshots\m03-02-pim-global-administrator-activation-request-pending.png'
    'screenshots\m03-03-pim-global-administrator-active-assignment.png'
    'screenshots\m03-04-pim-global-administrator-audit-history.png'
    'screenshots\m03-05-pim-alerts-after-global-administrator-remediation.png'
)

$ExpectedMilestone03Screenshots = @(
    'm03-01-pim-global-administrator-hardened-settings.png'
    'm03-02-pim-global-administrator-activation-request-pending.png'
    'm03-03-pim-global-administrator-active-assignment.png'
    'm03-04-pim-global-administrator-audit-history.png'
    'm03-05-pim-alerts-after-global-administrator-remediation.png'
)

$MissingFiles = @(
    $RequiredFiles | Where-Object {
        -not (Test-Path -LiteralPath (Join-Path $ProjectRoot $_) -PathType Leaf)
    }
)

$ScreenshotFolder = Join-Path $ProjectRoot 'screenshots'
$ActualMilestone03Screenshots = @(
    Get-ChildItem -LiteralPath $ScreenshotFolder -File -Filter 'm03-*.png' |
        Select-Object -ExpandProperty Name
)

$MissingScreenshots = @(
    $ExpectedMilestone03Screenshots | Where-Object {
        $_ -notin $ActualMilestone03Screenshots
    }
)

$UnexpectedPublicScreenshots = @(
    $ActualMilestone03Screenshots | Where-Object {
        $_ -notin $ExpectedMilestone03Screenshots
    }
)

$ManifestPath = Join-Path $ProjectRoot 'data\06-milestone-03-evidence-manifest.csv'
$ManifestEntryCount = 0
$ManifestNameMismatch = @()
$EvidenceHashMismatch = @()
$PngSignatureMismatch = @()

if (Test-Path -LiteralPath $ManifestPath -PathType Leaf) {
    $Manifest = @(Import-Csv -LiteralPath $ManifestPath)
    $ManifestEntryCount = $Manifest.Count
    $ManifestNames = @($Manifest | Select-Object -ExpandProperty FileName)

    $ManifestNameMismatch = @(
        @($ExpectedMilestone03Screenshots | Where-Object { $_ -notin $ManifestNames }) +
        @($ManifestNames | Where-Object { $_ -notin $ExpectedMilestone03Screenshots })
    )

    foreach ($Item in $Manifest) {
        $EvidencePath = Join-Path $ScreenshotFolder $Item.FileName

        if (Test-Path -LiteralPath $EvidencePath -PathType Leaf) {
            $ActualHash = (Get-FileHash -LiteralPath $EvidencePath -Algorithm SHA256).Hash
            $ActualLength = (Get-Item -LiteralPath $EvidencePath).Length

            if ($ActualHash -ne $Item.SHA256 -or $ActualLength -ne [long]$Item.Length) {
                $EvidenceHashMismatch += $Item.FileName
            }

            $Bytes = [System.IO.File]::ReadAllBytes($EvidencePath)
            $ExpectedPngSignature = @(137, 80, 78, 71, 13, 10, 26, 10)

            if ($Bytes.Length -lt 8) {
                $PngSignatureMismatch += $Item.FileName
            }
            else {
                for ($Index = 0; $Index -lt 8; $Index++) {
                    if ($Bytes[$Index] -ne $ExpectedPngSignature[$Index]) {
                        $PngSignatureMismatch += $Item.FileName
                        break
                    }
                }
            }
        }
    }
}

$PowerShellParseErrors = @()
$PowerShellFiles = @(
    Get-ChildItem -LiteralPath (Join-Path $ProjectRoot 'scripts') -File -Filter '*.ps1'
)

foreach ($PowerShellFile in $PowerShellFiles) {
    $Tokens = $null
    $Errors = $null
    [System.Management.Automation.Language.Parser]::ParseFile(
        $PowerShellFile.FullName,
        [ref]$Tokens,
        [ref]$Errors
    ) | Out-Null

    foreach ($ParseError in $Errors) {
        $PowerShellParseErrors += "$($PowerShellFile.Name): $($ParseError.Message)"
    }
}

$ProhibitedPatterns = @(
    ('(?i)' + 'da' + 'niel')
    ('(?i)' + 'bel' + 'tran')
    ('(?i)' + 'onmicro' + 'soft\.com')
    ('(?i)' + '@out' + 'look\.com')
    ('(?i)' + 'fuji' + 'tsu')
)

$PrivacyFindings = @()
$TextFiles = @(
    Get-ChildItem -LiteralPath $ProjectRoot -File -Recurse |
        Where-Object {
            $_.FullName -notlike "$ProjectRoot\temporary\*" -and
            $_.FullName -notlike "$ProjectRoot\.git\*" -and
            $_.Extension -in @('.md', '.csv', '.ps1')
        }
)

foreach ($TextFile in $TextFiles) {
    $Content = Get-Content -LiteralPath $TextFile.FullName -Raw

    foreach ($Pattern in $ProhibitedPatterns) {
        if ($Content -match $Pattern) {
            $PrivacyFindings += $TextFile.FullName.Substring($ProjectRoot.Length).TrimStart('\')
            break
        }
    }
}

$BrokenRelativeLinks = @()
$MarkdownFiles = @(
    Get-ChildItem -LiteralPath $ProjectRoot -File -Recurse -Filter '*.md' |
        Where-Object {
            $_.FullName -notlike "$ProjectRoot\temporary\*" -and
            $_.FullName -notlike "$ProjectRoot\.git\*"
        }
)

foreach ($MarkdownFile in $MarkdownFiles) {
    $MarkdownContent = Get-Content -LiteralPath $MarkdownFile.FullName -Raw
    $LinkMatches = [regex]::Matches($MarkdownContent, '\]\(([^)]+)\)')

    foreach ($LinkMatch in $LinkMatches) {
        $Target = $LinkMatch.Groups[1].Value.Trim()

        if ($Target -match '^(https?://|mailto:|#)') {
            continue
        }

        $TargetWithoutAnchor = ($Target -split '#')[0]

        if ([string]::IsNullOrWhiteSpace($TargetWithoutAnchor)) {
            continue
        }

        $ResolvedTarget = Join-Path $MarkdownFile.DirectoryName $TargetWithoutAnchor

        if (-not (Test-Path -LiteralPath $ResolvedTarget)) {
            $RelativeMarkdownPath = $MarkdownFile.FullName.Substring($ProjectRoot.Length).TrimStart('\')
            $BrokenRelativeLinks += "$RelativeMarkdownPath -> $Target"
        }
    }
}

$ReadmePath = Join-Path $ProjectRoot 'README.md'
$ReadmeContent = $(
    if (Test-Path -LiteralPath $ReadmePath -PathType Leaf) {
        Get-Content -LiteralPath $ReadmePath -Raw
    }
    else {
        ''
    }
)

$Milestone03ReadmeCorrect = (
    $ReadmeContent -match 'Milestones 1, 2, and 3 published' -and
    $ReadmeContent -match '\| 3 \| Global Administrator policy hardening[^\r\n]+\*\*Complete — published\*\*'
)

$AccidentalCopyNameCount = @(
    Get-ChildItem -LiteralPath $ProjectRoot -File -Recurse |
        Where-Object {
            $_.FullName -notlike "$ProjectRoot\temporary\*" -and
            $_.FullName -notlike "$ProjectRoot\.git\*" -and
            ($_.BaseName -match '\(\d+\)$' -or $_.BaseName -match ' - Copy$')
        }
).Count

$ValidationPassed = (
    $MissingFiles.Count -eq 0 -and
    $MissingScreenshots.Count -eq 0 -and
    $UnexpectedPublicScreenshots.Count -eq 0 -and
    $ManifestEntryCount -eq $ExpectedMilestone03Screenshots.Count -and
    $ManifestNameMismatch.Count -eq 0 -and
    $EvidenceHashMismatch.Count -eq 0 -and
    $PngSignatureMismatch.Count -eq 0 -and
    $PowerShellParseErrors.Count -eq 0 -and
    $PrivacyFindings.Count -eq 0 -and
    $BrokenRelativeLinks.Count -eq 0 -and
    $AccidentalCopyNameCount -eq 0 -and
    $Milestone03ReadmeCorrect
)

[PSCustomObject]@{
    ProjectRoot                       = $ProjectRoot
    RequiredCumulativeFileCount       = $RequiredFiles.Count
    MissingFileCount                  = $MissingFiles.Count
    ExpectedMilestone03EvidenceCount  = $ExpectedMilestone03Screenshots.Count
    FoundMilestone03EvidenceCount     = $ActualMilestone03Screenshots.Count
    UnexpectedPublicEvidenceCount     = $UnexpectedPublicScreenshots.Count
    EvidenceManifestEntryCount        = $ManifestEntryCount
    EvidenceManifestNameMismatchCount = $ManifestNameMismatch.Count
    EvidenceHashMismatchCount         = $EvidenceHashMismatch.Count
    PngSignatureMismatchCount         = $PngSignatureMismatch.Count
    PowerShellFileCount               = $PowerShellFiles.Count
    PowerShellParseErrorCount         = $PowerShellParseErrors.Count
    BrokenRelativeLinkCount           = $BrokenRelativeLinks.Count
    PrivacyFindingCount               = $PrivacyFindings.Count
    AccidentalCopyNameCount            = $AccidentalCopyNameCount
    Milestone03ReadmeCorrect           = $Milestone03ReadmeCorrect
    GitIgnoreRequired                  = $false
    TemporaryExcludedFromScan          = $true
    ActiveDirectoryChanges             = $false
    MicrosoftEntraChanges              = $false
    ValidationPassed                   = $ValidationPassed
}

if (-not $ValidationPassed) {
    if ($MissingFiles.Count -gt 0) {
        Write-Warning "Missing files: $($MissingFiles -join ', ')"
    }
    if ($MissingScreenshots.Count -gt 0) {
        Write-Warning "Missing screenshots: $($MissingScreenshots -join ', ')"
    }
    if ($UnexpectedPublicScreenshots.Count -gt 0) {
        Write-Warning "Unexpected public screenshots: $($UnexpectedPublicScreenshots -join ', ')"
    }
    if ($ManifestNameMismatch.Count -gt 0) {
        Write-Warning "Manifest names do not match the expected evidence set: $($ManifestNameMismatch -join ', ')"
    }
    if ($EvidenceHashMismatch.Count -gt 0) {
        Write-Warning "Evidence hash or length mismatch: $($EvidenceHashMismatch -join ', ')"
    }
    if ($PngSignatureMismatch.Count -gt 0) {
        Write-Warning "Invalid PNG signature: $($PngSignatureMismatch -join ', ')"
    }
    if ($PowerShellParseErrors.Count -gt 0) {
        $PowerShellParseErrors | ForEach-Object { Write-Warning $_ }
    }
    if ($BrokenRelativeLinks.Count -gt 0) {
        $BrokenRelativeLinks | ForEach-Object { Write-Warning "Broken relative link: $_" }
    }
    if ($PrivacyFindings.Count -gt 0) {
        Write-Warning "Privacy findings: $($PrivacyFindings -join ', ')"
    }
    if ($AccidentalCopyNameCount -gt 0) {
        Write-Warning 'One or more public filenames appear to be accidental copies.'
    }
    if (-not $Milestone03ReadmeCorrect) {
        Write-Warning 'README does not report Milestone 3 as complete and published.'
    }

    throw 'Milestone 3 cumulative release validation failed.'
}

Write-Host ''
Write-Host 'PASS: Milestone 3 cumulative release is complete and validated.' -ForegroundColor Green
