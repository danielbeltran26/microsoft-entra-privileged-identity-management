# Milestone 4 Test and Validation Record

## Test summary

| Item | Value |
| --- | --- |
| Test date | 16 September 2026 |
| Environment | Controlled synthetic Microsoft Entra tenant |
| Scope | PIM for Groups, role-assignable group design, Member policy, eligible membership, approval, activation, deactivation, and audit |
| Change method | Microsoft Entra admin center |
| Overall result | Pass |
| Final active-membership state | Temporary Member activation manually deactivated; eligible assignment retained |

## Test cases

| Test ID | Test | Expected result | Evidence or record | Result |
| --- | --- | --- | --- | --- |
| M04-T01 | Establish an empty privileged-group baseline | Dedicated group has no active members before assignment | `m04-01-pim-directory-readers-group-empty-baseline.png` | Pass |
| M04-T02 | Record the settings baseline | Member and Owner settings are initially unmodified | `m04-02-pim-group-default-settings-baseline.png` | Pass |
| M04-T03 | Harden the Member policy | Two-hour activation, MFA, justification, ticket, approval, six-month eligibility, and no permanent Member assignments are enforced | `m04-03-pim-group-member-hardened-settings.png` | Pass |
| M04-T04 | Bind the directory role to the group | Directory Readers is active, direct, directory-scoped, and permanently assigned to the dedicated group | `m04-04-pim-group-directory-readers-role-assignment.png` | Pass |
| M04-T05 | Create eligible membership | Controlled user receives direct eligible Member access ending after six months | `m04-05-pim-group-eligible-membership-available.png` | Pass |
| M04-T06 | Enforce the approval gate | Activation remains pending until authorization by a separate approver | `m04-06-pim-group-membership-activation-pending.png` | Pass |
| M04-T07 | Validate bounded activation | Approved membership is activated with a two-hour end time and **Deactivate** action | `m04-07-pim-group-membership-active.png` | Pass |
| M04-T08 | Validate separation of duties | Requester and approver are separate identities | PIM request and audit records | Pass |
| M04-T09 | Perform controlled read-only use | Directory information loads during the active window and no directory object is changed | Operator verification; identity-bearing page intentionally excluded | Pass |
| M04-T10 | Deactivate temporary membership | Active group membership is manually removed while eligibility remains | PIM state and audit records | Pass |
| M04-T11 | Review the complete audit sequence | Eligible assignment, request, approval, activation, membership addition, and deactivation events succeed | `m04-08-pim-group-audit-history.png` | Pass |
| M04-T12 | Preserve control-boundary separation | Conditional Access pilot group remains unchanged and privileged access uses a dedicated group | Group design and operator verification | Pass |

## Control assertions

### Dedicated privileged-access boundary

The directory role is assigned to a purpose-built role-assignable group. A
Conditional Access scope group was not reused for privileged access.

### Least standing privilege

The tested user is eligible for Member access but is neither a permanent member
nor a group owner. The group has no unnecessary owner assignment.

### Protected activation

Activation requires Azure MFA, justification, ticket information, and approval.
The maximum activation is two hours.

### Separation of duties

The requester did not approve its own activation. A separate designated
approver completed the decision.

### Bounded access

The approved membership had a fixed end time and was manually deactivated as
soon as validation finished. The eligible assignment remained for future
governed activation.

### Evidence boundary

The basic directory-read check supports the functional test but is not treated
as the sole proof of authorization. The role binding, eligible assignment,
active-membership state, and audit records provide the authoritative control
evidence.

## Exit criteria

| Criterion | Result |
| --- | --- |
| Dedicated role-assignable group established | Met |
| Empty membership baseline captured | Met |
| Member settings hardened | Met |
| Directory Readers assigned to the group | Met |
| Time-bound eligible Member assignment created | Met |
| MFA, justification, ticket, and independent approval exercised | Met |
| Two-hour active membership validated | Met |
| Temporary membership manually deactivated | Met |
| Eligible assignment retained | Met |
| Complete successful audit sequence reviewed | Met |
| Conditional Access group left unchanged | Met |

## Final result

**PASS:** Milestone 4 implemented and validated a dedicated PIM for Groups
control path for just-in-time Directory Readers membership.

## References

- [Privileged Identity Management for Groups](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/concept-pim-for-groups)
- [Configure PIM for Groups settings](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/groups-role-settings)
- [Activate group membership or ownership](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/groups-activate-roles)
- [Approve activation requests for group members and owners](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/groups-approval-workflow)
- [Microsoft Entra audit logs](https://learn.microsoft.com/en-us/entra/identity/monitoring-health/concept-audit-logs)

