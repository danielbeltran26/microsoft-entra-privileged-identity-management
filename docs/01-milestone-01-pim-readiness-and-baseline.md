# Milestone 1: PIM Readiness and Security Baseline

## Objective

Establish a controlled, evidence-backed baseline for Microsoft Entra Privileged Identity Management before changing role assignments or policies.

## Change boundary

This milestone was observational. No role setting, assignment, alert, license, user, group, or authentication configuration was changed as part of the baseline review.

## Activities performed

1. Confirmed that Microsoft Entra PIM was available for Microsoft Entra roles.
2. Reviewed Discovery and insights for standing privileged access.
3. Scanned and recorded the initial PIM security alerts.
4. Opened the MFA activation alert without mitigating or dismissing it.
5. Reviewed the Microsoft Entra role settings inventory.
6. Captured Directory Readers defaults.
7. Captured Global Administrator activation, assignment, and notification defaults.
8. Removed screenshots containing tenant-specific identity data from the release set.
9. Recorded SHA-256 hashes for every approved evidence image.

## Observed state

### Discovery and insights

- Four active permanent Global Administrator assignments were reported.
- The dashboard recommended retaining fewer than five permanent Global Administrators, with two reserved for emergency scenarios.
- The dashboard reported zero service principals with privileged-role assignments.

Discovery cards are recorded as portal observations. They are not treated as a substitute for a complete directory-role export.

### Security alerts

| Alert | Count | Portal severity | Disposition in Milestone 1 |
| --- | ---: | --- | --- |
| Roles do not require multifactor authentication for activation | 1 | Medium | Recorded; Directory Readers identified |
| Too many Global Administrators | 4 | Low | Recorded for later assignment and exception review |

### Directory Readers defaults

| Setting | Observed state |
| --- | --- |
| Activation maximum duration | 8 hours |
| On activation, require | None |
| Require justification on activation | Yes |
| Require ticket information on activation | No |
| Require approval to activate | No |
| Approvers | None |
| Allow permanent eligible assignment | Yes |
| Allow permanent active assignment | Yes |
| Require MFA on active assignment | No |
| Require justification on active assignment | Yes |

### Global Administrator defaults

| Setting | Observed state |
| --- | --- |
| Activation maximum duration | 8 hours |
| On activation, require | Azure MFA |
| Require justification on activation | Yes |
| Require ticket information on activation | No |
| Require approval to activate | No |
| Approvers | None |
| Allow permanent eligible assignment | Yes |
| Allow permanent active assignment | Yes |
| Require MFA on active assignment | No |
| Require justification on active assignment | Yes |

Default notification recipients were enabled for the administrator, assignee or requestor, and approver categories shown in the portal. No additional recipient addresses were recorded.

## Risk interpretation

- Standing Global Administrator access increases exposure because privileges remain continuously available.
- A role that can be activated without MFA lacks an important elevation control.
- Default settings are not automatically appropriate for every role; controls should reflect role impact and operational recovery requirements.
- Emergency-access exceptions must be distinguished from routine administrative access before permanent assignments are changed.

## Milestone outcome

PIM readiness was confirmed and the initial privileged-access control gaps were documented without changing the tenant. The baseline provides the comparison point for controlled remediation and end-to-end activation testing in later milestones.

## References

- [What is Microsoft Entra Privileged Identity Management?](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-configure)
- [Plan a Privileged Identity Management deployment](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-deployment-plan)
- [Security alerts for Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-configure-security-alerts)
- [Configure Microsoft Entra role settings in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-change-default-settings)

