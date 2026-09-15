# Milestone 3: Global Administrator Remediation

## Objective

Reduce routine standing Global Administrator access without weakening tenant
recovery. The milestone hardens the role policy, converts routine administration
to eligible access, validates the complete approval-controlled activation path,
removes the personal assignment, retains two emergency-access exceptions, and
confirms the resulting PIM alert state.

## Starting condition

The Milestone 1 baseline identified four direct, permanent active Global
Administrator assignments:

- one personal identity;
- one routine administration identity; and
- two dedicated emergency-access identities.

The default role policy allowed an eight-hour activation, did not require ticket
information or approval, allowed permanent eligible assignments, and did not
require MFA when an active assignment was created.

## Recovery prerequisites

Before changing assignments, both emergency-access identities were tested in
separate browser sessions. Each could sign in and displayed a permanent active
Global Administrator assignment. This check established two independent
recovery paths before routine standing access was reduced.

Identity-bearing verification screens were not retained.

## Implemented Global Administrator policy

| Policy area | Implemented value |
| --- | --- |
| Activation maximum | 1 hour |
| Authentication on activation | Azure MFA required |
| Activation justification | Required |
| Ticket information | Required |
| Approval | Required |
| Approvers | Two designated member identities |
| Pre-approval custom extension | Not required |
| Post-approval custom extension | Not required |
| Permanent eligible assignment | Not allowed |
| Eligible assignment expiry | 6 months |
| Permanent active assignment | Allowed for governed emergency-access exceptions |
| MFA on active assignment | Required |
| Justification on active assignment | Required |

Notification settings were retained.

## Assignment remediation

The routine administration identity was changed from permanent active Global
Administrator to a direct eligible assignment ending 14 March 2027. The two
emergency-access identities remained permanent active. The personal identity
was removed from Global Administrator only after the eligible activation path
had been proven.

The resulting assignment model is:

| Function | Active permanent | Eligible time-bound |
| --- | ---: | ---: |
| Emergency recovery | 2 | 0 |
| Routine administration | 0 | 1 |
| Personal use | 0 | 0 |

## Activation and approval test

The eligible routine administrator requested a one-hour Global Administrator
activation using Azure MFA, a controlled validation justification, ticket system
`Jira`, and ticket number `IAM-PIM-GA-0001`.

The request remained pending until a separate designated approver approved it.
The activated role then appeared with a fixed end time and a **Deactivate**
action. The role was manually deactivated before the one-hour maximum elapsed.

## Personal-assignment removal

While the tested eligible administrator was active and the two recovery
identities remained available, the personal Global Administrator assignment was
removed. The user object itself was not deleted or otherwise modified.

## Audit and alert validation

PIM audit history recorded the policy update, assignment conversion, activation
request, independent approval, successful activation, personal-assignment
removal, and successful deactivation.

The first post-change alert view still reported the removed identity because an
earlier PIM alert scan was processing stale assignment data. The authoritative
role tabs already showed two active emergency assignments and one eligible
routine assignment. No additional role was removed and the alert was not fixed
or dismissed. After the existing scan completed, the Alerts page returned **No
results**.

This distinction is important: assignment inventory and audit records were used
as the authoritative state, while asynchronous alert processing was allowed to
converge.

## Outcome

Milestone 3 passed. Routine Global Administrator access now requires a
time-bound PIM activation with MFA, justification, ticket information, and
independent approval. The personal assignment was removed, two emergency
recovery assignments were preserved, the privileged session was deactivated,
the complete event sequence was auditable, and the PIM alert cleared after scan
completion.

## References

- [Plan a Privileged Identity Management deployment](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-deployment-plan)
- [Manage emergency access accounts in Microsoft Entra ID](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)
- [Assign Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-add-role-to-user)
- [Approve or deny requests for Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-approval-workflow)
- [Security alerts for Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-configure-security-alerts)
