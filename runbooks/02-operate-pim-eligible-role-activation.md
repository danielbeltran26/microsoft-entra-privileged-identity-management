# Runbook: Operate a PIM Eligible Role Activation

## Purpose

Provide a repeatable procedure for requesting, approving, using, closing, and
reviewing a protected Microsoft Entra role activation.

## Run locations

- Requester: separate InPrivate or Incognito browser session.
- Approver: a different browser session that does not share requester sign-in.
- Audit and policy administration: Microsoft Entra admin center.

## Preconditions

1. Confirm the correct Microsoft Entra tenant.
2. Confirm the requester has an eligible assignment for the required role.
3. Confirm the selected role is the least-privileged role for the task.
4. Confirm the role policy requires the intended MFA, justification, ticket,
   duration, and approval controls.
5. Confirm a designated approver is available.
6. Confirm the work has an approved ticket reference and rollback condition.

## Request activation

1. Sign in as the eligible role member.
2. Open **ID Governance** > **Privileged Identity Management** > **My roles**.
3. Select **Microsoft Entra roles** and locate the eligible assignment.
4. Select **Activate**.
5. Complete Azure MFA when prompted.
6. Select only the duration and scope required for the task.
7. Enter a meaningful business justification, ticket system, and ticket number.
8. Submit the request once.
9. Open **My requests** and confirm the request is **Pending approval**.
10. Do not repeat the request while the original remains pending.

## Approve or deny

1. Sign in through the separate approver session.
2. Open **ID Governance** > **Privileged Identity Management** > **Approve requests**.
3. Select **Microsoft Entra roles** and open the pending request.
4. Confirm the requester, role, scope, duration, reason, and ticket context.
5. Confirm that the request is appropriate and that the approver is not the requester.
6. Record an approval or denial justification.
7. Submit the decision once.

Microsoft documents that delegated approvers have 24 hours to decide a request
and cannot approve their own requests.

## Validate active access

1. Return to the requester session.
2. Open **My roles** > **Microsoft Entra roles** > **Active assignments**.
3. Refresh once if the approved role is not immediately visible.
4. Confirm the role state is activated, an end time is present, and
   **Deactivate** is available.
5. Perform only the approved task.
6. Do not expand scope, assign additional roles, retain credentials, or create
   unrelated objects.

## Close access

1. Complete validation of the approved task.
2. Remove any temporary validation object when the test plan requires cleanup.
3. Return to **Active assignments**.
4. Select **Deactivate** and confirm.
5. Verify the role no longer appears as currently active.
6. Do not wait for automatic expiry when the approved work has already ended.

## Review audit evidence

1. Open **Privileged Identity Management** > **Microsoft Entra roles** > **My audit**.
2. Filter to the relevant role and time window.
3. Confirm the assignment, request, approval, activation, and deactivation events.
4. Confirm successful status and expected actor separation.
5. Record any missing, delayed, duplicated, or failed event for investigation.

## Alert validation

After an activation-policy remediation:

1. Use the authorized administrative session.
2. Open **Microsoft Entra roles** > **Alerts**.
3. Select **Scan**, wait for completion, and refresh once.
4. Confirm the targeted alert clears.
5. Do not dismiss or fix unrelated alerts as part of the validation.

## Stop conditions

Stop and escalate if:

- the requester sees a role or scope different from the approved request;
- activation succeeds without a configured mandatory control;
- the requester can approve their own request;
- no fixed activation end time appears;
- the controlled task requires broader privilege than planned;
- deactivation fails or the role remains active unexpectedly;
- the audit sequence is missing or inconsistent; or
- evidence exposes a password, token, personal email address, tenant domain, or
  complete user principal name.

## References

- [Activate Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-activate-role)
- [Approve or deny requests for Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-approval-workflow)
- [View audit history for Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-use-audit-log)
