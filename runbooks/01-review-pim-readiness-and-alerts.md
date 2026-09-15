# Runbook: Review PIM Readiness and Security Alerts

## Purpose

Provide a repeatable read-only procedure for reviewing Microsoft Entra PIM readiness, privileged-role exposure, role settings, and security alerts.

## Run location

Microsoft Entra admin center in a laptop browser.

## Required access

Use an account authorized to view Microsoft Entra role assignments and PIM configuration. This runbook does not grant or activate a role.

## Procedure

1. Open **Identity governance** > **Privileged Identity Management**.
2. Select **Microsoft Entra roles**.
3. Open **Discovery and insights** and record the visible assignment recommendations.
4. Open **Alerts** and select **Scan** when a current assessment is required.
5. Record each alert name, count, and portal severity.
6. Open an alert only to review its detail. Do not select **Fix**, **Mitigate**, or **Dismiss** during baseline collection.
7. Open **Settings** and record whether the selected roles are modified.
8. Open each in-scope role and record its activation, assignment, and notification settings.
9. Compare observations with the baseline control requirements.
10. Record findings and proposed responses before authorizing any change.

## Stop conditions

Stop and escalate the review if:

- The correct tenant cannot be confirmed.
- The account unexpectedly requires a privileged activation.
- A portal action would modify or dismiss an alert.
- A screenshot contains a user principal name, personal email address, or unrelated identity detail.
- Emergency-access assignments cannot be distinguished from routine administration.

## Evidence handling

- Capture only evidence required by the test plan.
- Use the approved milestone filename at capture time.
- Do not retain duplicate or exploratory screenshots in the repository evidence folder.
- Record a SHA-256 hash after the final evidence set is approved.
- Keep the local `temporary` folder excluded from Git.

## Expected output

- Updated baseline findings.
- An approved evidence set.
- A clear list of open risks and proposed remediation actions.
- No tenant configuration change.

## References

- [Security alerts for Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-configure-security-alerts)
- [Configure Microsoft Entra role settings in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-change-default-settings)

