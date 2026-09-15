# Milestone 1 Test and Validation Record

## Validation approach

Each test compares an expected read-only outcome with the observed Microsoft Entra portal evidence. Evidence integrity is checked using the SHA-256 values in `data/02-milestone-01-evidence-manifest.csv`.

## Test results

| Test | Expected result | Evidence | Result |
| --- | --- | --- | --- |
| M01-T01 | PIM Discovery and insights loads for Microsoft Entra roles | `m01-02-pim-discovery-insights-baseline.png` | Pass |
| M01-T02 | Initial PIM alerts are visible without remediation | `m01-03-pim-security-alerts-baseline.png` | Pass |
| M01-T03 | MFA alert detail identifies Directory Readers | `m01-04-pim-mfa-alert-directory-readers.png` | Pass |
| M01-T04 | Microsoft Entra role settings show the original unmodified state | `m01-06-pim-role-settings-unmodified-baseline.png` | Pass |
| M01-T05 | Directory Readers default activation and assignment settings are recorded | `m01-07-pim-directory-readers-default-settings.png` | Pass |
| M01-T06 | Global Administrator default activation and assignment settings are recorded | `m01-08-pim-global-admin-default-settings.png` | Pass |
| M01-T07 | Global Administrator default notifications are recorded | `m01-09-pim-global-admin-default-notifications.png` | Pass |

## Evidence controls

- Exactly seven Milestone 1 screenshots are included.
- Every screenshot is listed in the evidence manifest.
- File length and SHA-256 values must match the approved evidence.
- Tenant-specific identities and user principal names are not included in the approved screenshot set.
- The local `temporary` folder must remain excluded from Git.
- The validation script must parse without PowerShell syntax errors.

## Exit criteria

Milestone 1 is ready for release only when:

1. All required project files exist.
2. All seven screenshot hashes match the manifest.
3. No unexpected `m01-*.png` file exists in the repository screenshot folder.
4. No prohibited identity wording appears in the text release files.
5. The PowerShell validation script reports `ValidationPassed : True`.
6. The generated upload folder contains only the approved Milestone 1 files.

## Result

The portal evidence inventory passed before package creation: seven expected screenshots were present, with zero missing and zero unexpected Milestone 1 screenshots.

