# Runbook: Operate the Privileged Assignment Lifecycle

## Purpose

Provide a repeatable procedure for reviewing, extending, renewing, and removing
time-bound Microsoft Entra role assignments in PIM.

## Preconditions

- The operator is authorized to manage the target Microsoft Entra role.
- The exact user, role, directory scope, assignment type, start time, and end
  time are known.
- The role policy permits the requested duration.
- Continued access has a current business justification.
- An authorized approver who is not the requester is available when approval is
  required.
- Emergency-access identities are excluded from routine lifecycle operations.

## Review the current assignment

1. Open the [Microsoft Entra admin center](https://entra.microsoft.com/) in the
   correct tenant.
2. Go to **ID Governance > Privileged Identity Management > Microsoft Entra
   roles > Assignments**.
3. Locate the exact identity and role.
4. Confirm whether the assignment is **Eligible**, **Active**, or **Expired**.
5. Record the current start time, end time, membership type, and scope.
6. Check for duplicate or overlapping assignments before continuing.

## Extend an assignment before expiration

1. Sign in as the eligible user and open **Privileged Identity Management > My
   roles > Microsoft Entra roles > Eligible assignments**.
2. Locate the assignment that is approaching expiration and select **Extend**.
3. Enter a concise justification that confirms the continuing need.
4. Submit the request and confirm that it is pending when approval is required.
5. A separate authorized administrator opens **Approve requests > Microsoft
   Entra roles**.
6. Verify the identity, role, current end time, requested duration, and
   justification.
7. Approve or deny the request and record the decision reason.
8. Refresh **Eligible assignments** and confirm the revised end time.

## Allow and verify expiration

1. Do not extend or replace the assignment selected for the expiration test.
2. After its end time, refresh **My roles** and open **Expired assignments**.
3. Confirm the role appears as expired and offers **Renew**, not active access.
4. Do not select **Activate** as a substitute for renewal.
5. Review **Resource audit** and confirm the automatic removal event succeeded.

## Renew an expired assignment

1. In **My roles > Expired assignments**, locate the exact expired role and
   select **Renew**.
2. Enter a new justification for continued access and submit the request.
3. Confirm that the request is pending when approval is required.
4. A separate authorized administrator reviews the requester, role, previous
   expiration, new duration, and justification.
5. Approve or deny the request and record the decision reason.
6. Refresh **Eligible assignments** and verify that the role has returned with
   a new bounded end time.
7. Confirm no permanent or duplicate assignment was created.

## Remove access when it is no longer required

1. Return to **Microsoft Entra roles > Assignments** using an authorized
   administrator account.
2. Locate the exact temporary assignment.
3. Confirm that no approved task still depends on it.
4. Remove the eligible assignment.
5. Repeat only for other temporary assignments covered by the same approved
   lifecycle decision.
6. Do not remove unrelated eligibility or emergency-access assignments.
7. Refresh the assignment inventory and verify the intended final state.

## Audit review

1. Open **Microsoft Entra roles > Resource audit**.
2. Set a date range that covers the complete lifecycle.
3. Filter by the controlled identity when necessary.
4. Confirm successful records for:
   - original eligible assignment creation;
   - extension request and decision;
   - automatic expiration;
   - renewal request and decision;
   - renewed eligible assignment; and
   - final assignment removals.
5. Investigate any failed, duplicate, self-approved, permanent, or unexplained
   event.

## Recovery and escalation

- If the portal reports that a requested duration exceeds the maximum, use an
  end time within the configured role-policy limit.
- If the assignment state has not refreshed, wait briefly, refresh the page,
  and verify Resource audit before repeating the action.
- If an approval is completed but eligibility is not restored, inspect the
  request status and audit events before creating a new assignment.
- If the wrong assignment was changed, stop further actions, preserve the audit
  record, and escalate to the privileged-access owner.
- Do not use an emergency-access identity unless the documented recovery
  criteria are met.

## References

- [Renew Microsoft Entra role assignments in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-renew-extend)
- [Assign Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-add-role-to-user)
- [View audit history for Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-use-audit-log)
