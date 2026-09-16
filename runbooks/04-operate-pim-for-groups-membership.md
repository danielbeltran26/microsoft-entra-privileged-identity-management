# Runbook: Operate PIM for Groups Membership

## Purpose

Provide a repeatable procedure for eligible group-membership assignment,
approval-controlled activation, bounded use, deactivation, audit review, and
assignment maintenance.

## Preconditions

- The target group is approved for privileged access and is enabled in PIM for
  Groups.
- The group-to-role or group-to-resource assignment is verified.
- Member settings enforce the approved activation and assignment controls.
- The requester has a current eligible Member assignment.
- A designated approver who is not the requester is available.
- The work has an approved justification and ticket reference.

## Create eligible membership

1. Open **ID Governance > Privileged Identity Management > Groups**.
2. Select the exact target group and open **Assignments**.
3. Select **Add assignments**.
4. Choose **Member**, not **Owner**, unless ownership is explicitly required.
5. Select the exact controlled identity.
6. Choose **Eligible**.
7. Clear any permanent-eligibility option and apply an end date within the
   configured maximum.
8. Confirm the assignment and verify it under **Eligible assignments**.

## Request activation

1. Sign in using the eligible identity.
2. Open **ID Governance > Privileged Identity Management > My roles > Groups**.
3. Locate the eligible Member assignment and select **Activate**.
4. Request only the time needed and never exceed the configured maximum.
5. Complete Azure MFA.
6. Enter the approved business justification, ticket system, and ticket number.
7. Submit the request and confirm that it remains pending.

## Approve or deny

1. A separate designated approver opens **Privileged Identity Management >
   Approve requests > Groups**.
2. Verify the requester, group, Member role, duration, justification, and ticket
   context.
3. Deny the request if its purpose, scope, or duration is not appropriate.
4. Otherwise enter the approval justification and confirm approval.
5. Never approve your own activation request.

## Validate active membership

1. The requester refreshes **My roles > Groups > Active assignments**.
2. Confirm the exact group, **Member** role, direct membership, active state,
   fixed end time, and **Deactivate** action.
3. Wait briefly and refresh if downstream access has not propagated.
4. Perform only the approved task.
5. Do not make unrelated group, role, identity, or policy changes.

## Deactivate

1. Return to **My roles > Groups > Active assignments**.
2. Select **Deactivate** for the exact group.
3. Confirm the active assignment disappears.
4. Confirm the eligible assignment remains unless an approved removal is also
   required.

## Audit review

Verify successful records for:

1. eligible Member assignment;
2. activation request;
3. approval request;
4. independent approval;
5. activation completion;
6. addition of active group membership; and
7. removal of group membership during deactivation.

Investigate failed, self-approved, unexplained, permanent, or out-of-window
events.

## Renewal, extension, and removal

1. Review eligible membership before expiration.
2. Validate continued business need and approver suitability.
3. Extend or renew only for a defined period and record the decision.
4. Remove eligibility when the user changes duties or no longer requires the
   access path.
5. Review the group-to-role assignment separately before removing the group or
   changing its privileged function.

## Recovery and escalation

- If activation succeeds but access is delayed, verify active membership, sign
  out, and sign in again before escalating.
- If the wrong group or role was selected, stop and cancel the request before
  approval.
- If unexpected permanent membership appears, remove it through an approved
  change and review the audit sequence.
- Do not use emergency-access identities for routine PIM for Groups operations.

## References

- [Assign eligibility for a group](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/groups-assign-member-owner)
- [Activate group membership or ownership](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/groups-activate-roles)
- [Approve activation requests for group members and owners](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/groups-approval-workflow)
- [Configure PIM for Groups settings](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/groups-role-settings)
- [Microsoft Entra audit logs](https://learn.microsoft.com/en-us/entra/identity/monitoring-health/concept-audit-logs)

