# Privileged Assignment Lifecycle Standard

## Purpose

Define the minimum controls for creating, extending, renewing, reviewing, and
removing time-bound privileged assignments in Microsoft Entra Privileged
Identity Management (PIM).

## Scope

This standard applies to direct eligible and active assignments for Microsoft
Entra roles. Emergency-access exceptions are governed separately and must not
be converted into routine lifecycle assignments.

## Assignment requirements

1. Routine privileged access must use an eligible assignment unless a
   documented exception requires active access.
2. Every non-emergency assignment must have a defined start time and end time.
3. The role and scope must be limited to the access required for the approved
   task or duty.
4. Permanent eligibility must not be used to avoid periodic review.
5. Assignment creation must record a meaningful justification.
6. Existing assignments must be checked before a new assignment is added to
   prevent duplicate or overlapping privilege.

## Extension requirements

1. An extension may be requested only while the assignment is still eligible
   or active and approaching its end time.
2. The request must confirm that the original business need continues.
3. The revised end time must remain within the role policy's maximum duration.
4. The requester must not approve its own extension.
5. Denied, cancelled, or incomplete requests must not change the existing end
   time.

## Expiration requirements

1. A time-bound assignment must be allowed to expire when continued access has
   not been approved.
2. Expiration must not be bypassed by creating a permanent active assignment.
3. An expired assignment must be treated as unavailable even when it remains
   visible in the portal for historical or renewal purposes.
4. Automatic expiration events must be included in periodic audit review.

## Renewal requirements

1. Renewal applies only after an assignment has expired.
2. Renewal must require a new justification and an authorized approval
   decision.
3. The renewed assignment must have a new bounded end time.
4. The requester must not approve its own renewal.
5. Renewal must be denied when the role, scope, identity, or business need is
   no longer appropriate.

## Removal requirements

1. Eligibility must be removed when the user changes duties, leaves the
   approved population, or no longer requires the role.
2. Before removal, the operator must verify the exact identity, role, scope,
   assignment type, and current state.
3. Active access must be deactivated before or as part of removal when
   immediate termination is required.
4. Removal of one lifecycle assignment must not alter unrelated eligible roles
   or emergency-access assignments.

## Approval and accountability

1. Extension and renewal decisions must be completed by an authorized
   administrator or designated approver.
2. Approval must evaluate the requested role, scope, duration, business need,
   and any associated operational record.
3. Approval comments must identify why continued access is appropriate.
4. The requester and approver must be separate identities.
5. Failed or abandoned requests must be investigated before a replacement
   assignment is created.

## Monitoring and review

1. Assignment creation, update, extension, expiration, renewal, activation,
   deactivation, and removal events must be auditable.
2. Resource audit must be reviewed after a lifecycle operation to confirm the
   expected sequence and successful status.
3. Unexpected permanent, active, duplicate, or overlapping assignments must be
   investigated.
4. Reviewers must reconcile portal state with audit records before declaring a
   lifecycle action complete.
5. Production implementations should send relevant audit events to the
   security monitoring platform for retention and alerting.

## Implemented laboratory profile

| Control | Implemented value |
| --- | --- |
| Controlled identity | Synthetic privileged user |
| Extension role | Directory Readers |
| Expiration and renewal role | Reports Reader |
| Assignment type | Direct eligible |
| Approval | Required for user-initiated extension and renewal |
| Final state | Temporary reader-role eligibility removed |
| Preserved access | Existing User Administrator eligibility and documented emergency access |

## References

- [Assign Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-add-role-to-user)
- [Renew Microsoft Entra role assignments in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-renew-extend)
- [View audit history for Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-use-audit-log)
