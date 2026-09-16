# Milestone 4: PIM for Groups Implementation

## Objective

Implement a dedicated PIM-governed group that provides just-in-time Directory
Readers access through eligible group membership. The milestone establishes a
role-assignable group, hardens its Member policy, assigns a directory role to
the group, exercises independent approval, validates bounded activation, and
removes the temporary membership when the task finishes.

## Starting condition

The tenant contained Conditional Access scope groups, including a workforce
pilot group with three permanent direct members. That group was not repurposed
for privileged access because combining Conditional Access scope and directory
role membership would create an unnecessary dependency between separate
security controls.

A dedicated role-assignable security group was therefore created for this
milestone. Before the first eligible assignment, its PIM assignment inventory
contained no active members and its Member and Owner settings were unmodified.

## Dedicated group

| Property | Implemented value |
| --- | --- |
| Display name | `GG_PIM_Directory_Readers` |
| Type | Security |
| Membership type | Assigned |
| Source | Cloud |
| Microsoft Entra role assignability | Enabled |
| Initial direct members | 0 |
| Initial owners | 0 |
| Intended use | PIM-controlled just-in-time Directory Readers access |

## Member-policy hardening

The Member policy was updated to require:

- a two-hour maximum activation;
- Azure MFA;
- business justification;
- ticket information;
- approval by one of two designated member approvers;
- a maximum eligible-assignment duration of six months;
- no permanent eligible membership;
- no permanent active membership;
- a maximum active-assignment duration of one month;
- Azure MFA for administrator-created active assignments; and
- justification for administrator-created active assignments.

Notification settings were retained. Owner settings were not modified because
no owner assignment was required or created.

## Role binding and eligible membership

Directory Readers was assigned directly and permanently to the dedicated group
at Default Directory scope. This stable group-to-role binding does not by
itself grant the tested user access.

The controlled user received a direct eligible **Member** assignment ending 15
March 2027. The user was not made an owner and did not receive permanent or
immediate active membership.

## Activation and approval test

The eligible member requested a two-hour activation using Azure MFA, the
controlled validation justification, ticket system `Jira`, and ticket number
`IAM-PIM-0003`.

The request remained pending until a separate designated approver authorized
it. After approval, PIM displayed active direct Member status, a fixed end time,
and a **Deactivate** action. The requester did not approve its own request.

## Controlled use and deactivation

During the active window, the user confirmed that directory information could
be accessed without making any change. This functional observation was treated
as supporting evidence rather than conclusive authorization proof because
default member permissions can already expose some basic directory data.

The authoritative assurance came from the combination of the group's Directory
Readers assignment, eligible membership, approved PIM activation, fixed end
time, and audit history.

The active membership was manually deactivated approximately six minutes after
activation. The eligible assignment remained available for future governed use.

## Audit validation

Microsoft Entra audit logs recorded successful events for:

- the permanent Directory Readers assignment to the group;
- creation of the time-bound eligible Member assignment;
- submission of the activation request;
- creation of the approval request;
- approval by the separate approver;
- completion of PIM activation;
- addition of the active group member; and
- removal of the group member during manual deactivation.

## Outcome

Milestone 4 passed. Directory Readers is available through a dedicated
role-assignable group, while tested user access is controlled through
time-bound eligible membership, MFA, justification, ticket information,
independent approval, a two-hour activation maximum, manual deactivation, and
auditable lifecycle events.

## References

- [Privileged Identity Management for Groups](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/concept-pim-for-groups)
- [Configure PIM for Groups settings](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/groups-role-settings)
- [Assign eligibility for a group](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/groups-assign-member-owner)
- [Activate group membership or ownership](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/groups-activate-roles)
- [Approve activation requests for group members and owners](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/groups-approval-workflow)
- [Microsoft Entra audit logs](https://learn.microsoft.com/en-us/entra/identity/monitoring-health/concept-audit-logs)

