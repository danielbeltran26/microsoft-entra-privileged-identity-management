# Milestone 1 Test and Validation Record

## Validation approach

Each test compares an expected read-only outcome with the observed Microsoft
Entra portal evidence.

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

## Exit criteria

Milestone 1 is complete when all seven portal observations pass and the
collection remains read-only.

## Result

PIM readiness, security alerts, and the original role-policy state were
successfully recorded without changing the tenant.
