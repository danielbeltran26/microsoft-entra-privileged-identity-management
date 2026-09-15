# Milestone 2: Eligible Access Remediation

## Objective

Remediate the activation-MFA baseline finding and prove that a protected
Microsoft Entra role can be assigned as time-bound eligible access, activated
through MFA and independent approval, used for a bounded task, and deactivated
with a complete PIM audit trail.

## Change boundary

Milestone 2 changed only the in-scope PIM role policies and one synthetic
eligible role assignment. It did not change Global Administrator settings,
remove any Global Administrator assignment, configure PIM for Groups, assign a
licence, or retain the temporary validation identity.

## Implemented configuration

### Directory Readers remediation

The role policy was updated so activation requires Azure MFA. The eight-hour
maximum, justification requirement, ticket setting, approval setting,
assignment settings, and notifications were retained. A later PIM alert rescan
confirmed that the activation-MFA alert no longer appeared.

### User Administrator policy

The pre-change role policy allowed an eight-hour activation, did not require
ticket information or approval, and allowed permanent eligible and permanent
active assignments.

The implemented role profile is:

| Policy area | Implemented value |
| --- | --- |
| Activation maximum | 2 hours |
| Authentication context | Azure MFA |
| Activation justification | Required |
| Ticket information | Required |
| Approval | Required |
| Approvers | 2 member identities; no group approver |
| Pre-approval custom extension | Not required |
| Post-approval custom extension | Not required |
| Permanent eligible assignment | Not allowed |
| Eligible assignment expiry | 6 months |
| Permanent active assignment | Not allowed |
| Active assignment expiry | 1 month |
| MFA on active assignment | Required |
| Justification on active assignment | Required |

Notification settings were left unchanged.

## Eligible assignment

One direct User Administrator assignment was created with:

- assignment type: eligible;
- scope: Default Directory;
- start: 15 September 2026;
- end: 14 March 2027; and
- duration: the policy maximum of six months.

No active or permanent assignment was created during this step.

## Activation and approval test

The eligible identity opened **My roles**, confirmed User Administrator was
available, and requested a two-hour activation. The request included Azure MFA,
a synthetic business justification, ticket system `Jira`, and ticket number
`IAM-PIM-0001`.

The request entered **Pending approval** rather than granting immediate access.
A separate designated approver reviewed and approved it with a recorded
justification. The requester then confirmed that User Administrator appeared as
activated with a fixed end time and a **Deactivate** action.

## Controlled privileged task

During the active window, the requester created one disabled, unlicensed
synthetic user with no group or role assignments. The object was used only to
demonstrate that the activated User Administrator permission functioned and was
deleted immediately afterward. The generated password was neither copied nor
retained.

No screenshot of the temporary object was retained because it added no unique
control evidence.

## Session closure and audit

User Administrator was manually deactivated before the two-hour activation
maximum elapsed. The PIM audit history recorded:

1. eligible role assignment;
2. activation request;
3. approval;
4. successful activation; and
5. successful deactivation.

The audit record confirmed that the tested identity returned to eligible-only
state after the controlled task.

## Alert outcome

The post-change PIM alert scan no longer displayed **Roles don't require
multi-factor authentication for activation**. The separate alert concerning the
number of Global Administrators remained open and was not fixed or dismissed.

## Rollback and recovery design

If activation controls had blocked required administration unexpectedly, the
privileged-role administrator could compare the configuration with the
Milestone 1 and pre-change User Administrator baselines, remove the test
eligibility, and restore only the affected role-policy values. No rollback was
required during the completed test.

## Outcome

Milestone 2 passed. The MFA alert was remediated, the User Administrator policy
was hardened, a time-bound eligible assignment was exercised through an
independent approval gate, the privileged task completed, access was manually
deactivated, and the full sequence was present in PIM audit history.

## References

- [Configure Microsoft Entra role settings in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-change-default-settings)
- [Assign Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-add-role-to-user)
- [Activate Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-activate-role)
- [Approve or deny requests for Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-approval-workflow)
- [View audit history for Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-use-audit-log)
- [Security alerts for Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-configure-security-alerts)
