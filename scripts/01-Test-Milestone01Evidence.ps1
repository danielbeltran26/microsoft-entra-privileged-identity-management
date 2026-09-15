[CmdletBinding()]
param(
    [string]$ProjectRoot = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'

$RequiredFiles = @(
    'README.md'
    'architecture\01-pim-governance-operating-model.md'
    'data\01-milestone-01-baseline-findings.csv'
    'data\02-milestone-01-evidence-manifest.csv'
    'docs\01-milestone-01-pim-readiness-and-baseline.md'
    'docs\02-milestone-01-test-and-validation-record.md'
    'policies\01-pim-baseline-control-requirements.md'
    'runbooks\01-review-pim-readiness-and-alerts.md'
    'scripts\01-Test-Milestone01Evidence.ps1'
    'screenshots\m01-02-pim-discovery-insights-baseline.png'
    'screenshots\m01-03-pim-security-alerts-baseline.png'
    'screenshots\m01-04-pim-mfa-alert-directory-readers.png'
    'screenshots\m01-06-pim-role-settings-unmodified-baseline.png'
    'screenshots\m01-07-pim-directory-readers-default-settings.png'
    'screenshots\m01-08-pim-global-admin-default-settings.png'
    'screenshots\m01-09-pim-global-admin-default-notifications.png'
)

$ExpectedScreenshotNames = @(
    'm01-02-pim-discovery-insights-baseline.png'
    'm01-03-pim-security-alerts-baseline.png'
    'm01-04-pim-mfa-alert-directory-readers.png'
    'm01-06-pim-role-settings-unmodified-baseline.png'
    'm01-07-pim-directory-readers-default-settings.png'
    'm01-08-pim-global-admin-default-settings.png'
    'm01-09-pim-global-admin-default-notifications.png'
)

$MissingFiles = @(
    $RequiredFiles | Where-Object {
        -not (Test-Path -LiteralPath (Join-Path $ProjectRoot $_) -PathType Leaf)
    }
)

$ScreenshotFolder = Join-Path $ProjectRoot 'screenshots'
$ActualScreenshotNames = @(
    Get-ChildItem -LiteralPath $ScreenshotFolder -File -Filter 'm01-*.png' |
        Select-Object -ExpandProperty Name
)

$UnexpectedScreenshots = @(
    $ActualScreenshotNames | Where-Object { $_ -notin $ExpectedScreenshotNames }
)

$MissingScreenshots = @(
    $ExpectedScreenshotNames | Where-Object { $_ -notin $ActualScreenshotNames }
)

$ManifestPath = Join-Path $ProjectRoot 'data\02-milestone-01-evidence-manifest.csv'
$HashMismatch = @()

if (Test-Path -LiteralPath $ManifestPath -PathType Leaf) {
    $Manifest = Import-Csv -LiteralPath $ManifestPath

    foreach ($Item in $Manifest) {
        $EvidencePath = Join-Path $ScreenshotFolder $Item.FileName

        if (Test-Path -LiteralPath $EvidencePath -PathType Leaf) {
            $ActualHash = (Get-FileHash -LiteralPath $EvidencePath -Algorithm SHA256).Hash
            $ActualLength = (Get-Item -LiteralPath $EvidencePath).Length

            if ($ActualHash -ne $Item.SHA256 -or $ActualLength -ne [long]$Item.Length) {
                $HashMismatch += $Item.FileName
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

$ValidationPassed = (
    $MissingFiles.Count -eq 0 -and
    $MissingScreenshots.Count -eq 0 -and
    $UnexpectedScreenshots.Count -eq 0 -and
    $HashMismatch.Count -eq 0 -and
    $PowerShellParseErrors.Count -eq 0 -and
    $PrivacyFindings.Count -eq 0
)

[PSCustomObject]@{
    ProjectRoot                  = $ProjectRoot
    RequiredFileCount            = $RequiredFiles.Count
    MissingFileCount             = $MissingFiles.Count
    ExpectedScreenshotCount      = $ExpectedScreenshotNames.Count
    FoundScreenshotCount         = $ActualScreenshotNames.Count
    UnexpectedScreenshotCount    = $UnexpectedScreenshots.Count
    HashMismatchCount            = $HashMismatch.Count
    PowerShellFileCount          = $PowerShellFiles.Count
    PowerShellParseErrorCount    = $PowerShellParseErrors.Count
    PrivacyFindingCount          = $PrivacyFindings.Count
    TemporaryExcludedFromScan    = $true
    ManualUploadPackageRequired  = $true
    ActiveDirectoryChanges       = $false
    MicrosoftEntraChanges        = $false
    ValidationPassed             = $ValidationPassed
}

if (-not $ValidationPassed) {
    if ($MissingFiles.Count -gt 0) {
        Write-Warning "Missing files: $($MissingFiles -join ', ')"
    }

    if ($MissingScreenshots.Count -gt 0) {
        Write-Warning "Missing screenshots: $($MissingScreenshots -join ', ')"
    }

    if ($UnexpectedScreenshots.Count -gt 0) {
        Write-Warning "Unexpected screenshots: $($UnexpectedScreenshots -join ', ')"
    }

    if ($HashMismatch.Count -gt 0) {
        Write-Warning "Evidence hash or length mismatch: $($HashMismatch -join ', ')"
    }

    if ($PowerShellParseErrors.Count -gt 0) {
        $PowerShellParseErrors | ForEach-Object { Write-Warning $_ }
    }

    if ($PrivacyFindings.Count -gt 0) {
        Write-Warning "Privacy findings: $($PrivacyFindings -join ', ')"
    }

    throw 'Milestone 1 validation failed.'
}

Write-Host ''
Write-Host 'PASS: Milestone 1 evidence and project files are validated.' -ForegroundColor Green
