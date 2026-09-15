# Runbook: Operate Global Administrator Access

## Purpose

Provide a safe procedure for routine Global Administrator activation,
assignment changes, emergency access, deactivation, audit review, and alert
reconciliation.

## Preconditions

- The operator has a current eligible Global Administrator assignment.
- At least one designated approver is available who is not the requester.
- Both emergency-access identities are enabled, independently protected, and
  periodically validated.
- The planned work has a business justification and ticket reference.
- A recovery session remains available during high-impact assignment changes.

## Routine activation

1. Sign in with the eligible administration identity.
2. Open **Identity governance > Privileged Identity Management > My roles >
   Microsoft Entra roles > Eligible assignments**.
3. Select **Activate** for Global Administrator.
4. Request no more than the required duration and never more than one hour.
5. Complete Azure MFA.
6. Enter the approved business justification, ticket system, and ticket number.
7. Submit the request and confirm it remains pending.
8. A separate designated approver validates scope, duration, and ticket context.
9. The approver records a decision justification and approves or denies.
10. The requester confirms the active assignment, fixed end time, and
    **Deactivate** action before beginning work.

## Privileged work

1. Perform only the approved task.
2. Avoid unrelated configuration changes during the active window.
3. Record unexpected behavior in the associated ticket.
4. Stop if emergency-access availability, approval integrity, or assignment
   state becomes uncertain.

## Assignment reduction

1. Validate both emergency-access identities before removing standing Global
   Administrator access.
2. Keep a recovery session open under a separate emergency identity.
3. Confirm the exact member, assignment type, scope, and permanence before
   removal.
4. Convert the routine administrator to eligible access and prove activation
   before removing the personal assignment.
5. Never remove both emergency assignments or the only routine eligible path.
6. Confirm final inventory:
   - two permanent active emergency identities;
   - one time-bound eligible routine administrator; and
   - no personal Global Administrator assignment.

## Deactivation

1. Return to **My roles > Microsoft Entra roles > Active assignments**.
2. Select **Deactivate** for Global Administrator.
3. Confirm the role disappears from active assignments.
4. Confirm the eligible assignment remains.

## Audit review

Verify that PIM audit history contains:

1. eligible assignment or assignment update;
2. activation request;
3. independent approval;
4. successful activation;
5. any approved assignment removal; and
6. successful deactivation.

Escalate missing, failed, self-approved, or unexplained events.

## Alert reconciliation

1. Start only one PIM alert scan.
2. Allow the scan to finish before starting another.
3. If an alert contains a removed assignment, compare it with the authoritative
   role assignment tabs and audit history.
4. Do not use **Fix** or **Dismiss** while the data is inconsistent.
5. Refresh after the running scan completes and record the final result.

## Emergency use

Use an emergency-access identity only when routine administration cannot be
activated or a tenant-wide incident requires the recovery path. After use:

1. notify the designated security owner;
2. preserve sign-in and audit evidence;
3. review the triggering incident and actions taken;
4. validate or rotate affected credentials and authentication methods; and
5. re-test both recovery identities.

## References

- [Activate Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-activate-role)
- [Approve or deny requests for Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-approval-workflow)
- [Manage emergency access accounts in Microsoft Entra ID](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)
