# PIM for Groups Access Control Standard

## Purpose

Define the minimum controls for groups that convey privileged access through
Microsoft Entra role assignment or another security-sensitive entitlement.

## Group design requirements

1. Privileged access must use a dedicated group with a documented purpose.
2. A Conditional Access scope group must not be reused as a privileged-access
   group.
3. A group assigned to a Microsoft Entra role must be role-assignable.
4. Membership must be assigned rather than dynamic when PIM eligibility is
   required.
5. The group-to-resource or group-to-role binding must be reviewed separately
   from user membership.
6. Group ownership must be limited to identities with a documented operational
   requirement.

## Eligible membership requirements

1. Routine privileged users must be eligible Members rather than permanent
   active members.
2. Eligible assignments must be time-bound and may not exceed six months
   without review.
3. Permanent eligible membership must be disabled.
4. Permanent active membership must be disabled.
5. Owner eligibility must not be granted when Member access is sufficient.

## Activation requirements

1. Activation may not exceed two hours for the implemented Directory Readers
   group.
2. Activation must require Azure MFA.
3. Activation must require business justification and ticket information.
4. Activation must require approval by a designated approver.
5. A requester must not approve its own activation.
6. Access must be manually deactivated when the approved task finishes.

## Administrative assignment requirements

1. Administrators must not create permanent active Member assignments.
2. Administrator-created active assignments must have an end date, require
   justification, and satisfy the configured MFA control.
3. Assignment changes must identify the exact group, role, member, assignment
   type, start time, and end time before confirmation.
4. Removing active membership must not remove the underlying eligible
   assignment unless eligibility is also being revoked through an approved
   lifecycle decision.

## Approval requirements

1. At least two suitable approvers should be configured to reduce dependency on
   a single identity.
2. Approval must validate the requested scope, duration, justification, and
   ticket context.
3. Approvers must deny requests that are unexplained, excessive, expired, or
   submitted by an identity they cannot independently validate.
4. Approval decisions must include a meaningful justification.

## Monitoring and review

1. Eligible assignment, request, approval, activation, deactivation,
   expiration, extension, and removal events must be auditable.
2. Unexpected permanent or active membership must be investigated.
3. Changes to the group-to-role assignment must receive high-impact change
   review.
4. Eligible assignments must be reviewed before expiration.
5. Group owners and approvers must be reviewed periodically.
6. Production implementations should export relevant Microsoft Entra audit and
   sign-in events to the security monitoring platform.

## Implemented lab profile

| Control | Value |
| --- | --- |
| Group | `GG_PIM_Directory_Readers` |
| Group type | Role-assignable security group with assigned membership |
| Bound role | Directory Readers |
| User assignment | Direct eligible Member |
| Eligible expiry | Six months |
| Activation maximum | Two hours |
| Activation controls | MFA, justification, ticket, approval |
| Permanent Member assignment | Prohibited |
| Owner assignment | None |

## References

- [Privileged Identity Management for Groups](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/concept-pim-for-groups)
- [Configure PIM for Groups settings](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/groups-role-settings)
- [Assign eligibility for a group](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/groups-assign-member-owner)
- [Approve activation requests for group members and owners](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/groups-approval-workflow)

