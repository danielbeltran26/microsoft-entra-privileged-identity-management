# PIM Eligible Access Control Standard

## Purpose

Define the minimum controls for routine Microsoft Entra role elevation through
PIM and record the Milestone 2 User Administrator implementation profile.

## Control requirements

| Control ID | Requirement | Milestone 2 implementation |
| --- | --- | --- |
| PIM-EA-01 | Use the least-privileged role capable of completing the approved task. | User Administrator was used for a controlled user-management task instead of Global Administrator. |
| PIM-EA-02 | Prefer eligible access over routine active assignment. | The test identity received a direct eligible assignment. |
| PIM-EA-03 | Bound eligibility with start and end dates. | Eligibility was limited to six months. |
| PIM-EA-04 | Require strong verification at activation. | Azure MFA was required. |
| PIM-EA-05 | Require a business reason and traceable ticket reference. | Justification, ticket system, and ticket number were required. |
| PIM-EA-06 | Require independent approval for protected roles. | User Administrator required approval by one of two designated member approvers. |
| PIM-EA-07 | Limit the active privilege window. | Self-activation was limited to two hours. |
| PIM-EA-08 | Prohibit requester self-approval. | Request and approval used separate synthetic identities. |
| PIM-EA-09 | End access when the approved work finishes. | The requester manually deactivated User Administrator after the test. |
| PIM-EA-10 | Retain auditable lifecycle evidence. | PIM audit history recorded the request, approval, activation, and deactivation. |
| PIM-EA-11 | Validate related security alerts after remediation. | The MFA activation alert cleared; the unrelated Global Administrator alert remained open. |
| PIM-EA-12 | Publish only necessary, privacy-safe evidence. | Eight approved screenshots are hashed; exploratory and identity-bearing images are excluded. |

## User Administrator profile

| Setting | Required value |
| --- | --- |
| Activation maximum duration | 2 hours |
| On activation, require | Azure MFA |
| Require justification | Yes |
| Require ticket information | Yes |
| Require approval | Yes |
| Approvers | Two designated member identities |
| Custom extension requirements | No |
| Allow permanent eligible assignment | No |
| Expire eligible assignments after | 6 months |
| Allow permanent active assignment | No |
| Expire active assignments after | 1 month |
| Require MFA on active assignment | Yes |
| Require justification on active assignment | Yes |

Notification configuration remains unchanged unless a separate communication
requirement is approved.

## Request requirements

An activation request must identify:

- the bounded task requiring privilege;
- the minimum duration required;
- a meaningful justification;
- a ticket system and reference; and
- the applicable directory scope.

The approver must assess task legitimacy, role suitability, duration, scope, and
requester identity. Approval is a security decision, not an administrative
formality.

## Emergency and exception handling

This standard does not govern emergency-access Global Administrator identities.
Those identities require separate controls, monitoring, and validation before
Milestone 3 changes standing Global Administrator access.

Any exception for a routine privileged identity must record the role, business
need, owner, duration, compensating controls, review date, and removal condition.

## Evidence requirements

- Capture pre-change settings before remediation.
- Capture post-change controls after the portal reports success.
- Prove that approval blocks immediate activation.
- Prove the active assignment has an end time.
- Verify deactivation and audit history.
- Record SHA-256 hashes for approved evidence.
- Do not publish passwords, authentication secrets, personal email addresses,
  tenant domains, or complete user principal names.

## References

- [Configure Microsoft Entra role settings in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-change-default-settings)
- [Assign Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-add-role-to-user)
- [Approve or deny requests for Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-approval-workflow)

