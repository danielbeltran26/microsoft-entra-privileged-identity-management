# Microsoft Entra Privileged Identity Management

## Implementation status

**Status: In progress — Milestones 1 through 6 complete.** Milestone 1 establishes
the Microsoft Entra Privileged Identity Management (PIM) readiness and security
baseline. Milestone 2 remediates the first baseline alert and validates a
governed, time-bound User Administrator activation from assignment through
deactivation. Milestone 3 hardens Global Administrator, replaces routine
standing access with approval-controlled eligibility, and preserves two
governed emergency-access exceptions. Milestone 4 extends just-in-time access
to a dedicated role-assignable group with controlled Directory Readers
membership. Milestone 5 validates time-bound assignment extension, expiration,
renewal, and removal. Milestone 6 validates PIM monitoring, independent access
review, recovery assurance, escalation, and administrative session closure.
The final milestone remains pending and is identified in the delivery roadmap.

This controlled synthetic implementation demonstrates privileged-access
governance for Microsoft Entra roles. It progresses from
read-only discovery through role-specific policy hardening, just-in-time
activation, approval, emergency-access governance, monitoring, and final
operational assurance.

This is a hands-on laboratory implementation. It does not claim an
organization-wide production deployment.

## Executive overview

| Area | Current state |
| --- | --- |
| Business problem | Permanent and weakly governed privileged access increases the impact of identity compromise and reduces accountability |
| Platform | Microsoft Entra ID with PIM for Microsoft Entra roles |
| Controlled identities | Synthetic administration, approver, eligible-role, and emergency-access identities |
| Implemented scope | Milestones 1–6: readiness, baseline assessment, role-policy remediation, eligible assignment, approval-controlled activation, standing-access reduction, emergency-access exceptions, PIM for Groups, assignment lifecycle, alert and audit monitoring, access review, recovery assurance, and escalation |
| Current tenant progress | Milestone 6 complete; Milestone 7 integrated assurance and handover has not started |
| Recovery boundary | Two separately governed cloud-only emergency-access identities retain permanent active Global Administrator as documented recovery exceptions |
| Evidence boundary | Retained screenshots exclude complete tenant UPNs, personal email addresses, authentication secrets, and tenant configuration identifiers |
| Final target | A validated least-privilege PIM operating model with time-bound elevation, approval, monitoring, lifecycle controls, and operational handover |

## Business scenario and objective

Standing privileged access remains continuously available to an identity and
therefore to an attacker who compromises it. Default PIM settings may also lack
the activation controls appropriate for a role's impact.

This implementation demonstrates how to:

- identify permanent and high-impact privileged assignments;
- establish a trustworthy pre-change baseline;
- define role-specific activation and assignment controls;
- prefer eligible, time-bound access over routine standing privilege;
- require MFA, justification, ticket information, and approval where appropriate;
- preserve separately governed emergency access before reducing Global
  Administrator assignments;
- validate extension, expiration, renewal, and removal decisions for time-bound
  eligibility;
- validate the request, approval, activation, use, deactivation, and audit
  sequence; and
- convert portal configuration into a repeatable operational process.

## Architecture and control flow

```mermaid
flowchart TD
    A["Synthetic privileged identities"] --> B["Microsoft Entra roles"]
    B --> C["PIM assignments and role policies"]
    C --> D["MFA, justification, ticket, and approval"]
    D --> E["Time-bound privileged access"]
    E --> F["Audit, alerts, review, and deactivation"]
```

The detailed trust boundaries, responsibilities, and privileged-access design
principles are documented in the
[PIM Governance Operating Model](architecture/01-pim-governance-operating-model.md).
The Milestone 2 request and approval path is documented in the
[Eligible Access and Activation Flow](architecture/02-pim-eligible-access-and-activation-flow.md).
The Global Administrator assignment and emergency-recovery design is documented
in the [Global Administrator Governance Model](architecture/03-global-administrator-governance-model.md).
The group-based privileged-access boundary is documented in the
[PIM for Groups Just-in-Time Membership Model](architecture/04-pim-for-groups-just-in-time-membership-model.md).
The extension, expiration, renewal, and removal decision path is documented in
the [Privileged Assignment Lifecycle Model](architecture/05-privileged-assignment-lifecycle-model.md).
The monitoring, review, recovery, and escalation controls are documented in the
[Privileged Access Monitoring and Assurance Model](architecture/06-privileged-access-monitoring-and-assurance-model.md).

## Engineering scope

- PIM readiness and licensing availability
- Discovery and insights for Microsoft Entra privileged roles
- PIM security-alert assessment and remediation validation
- Role-specific activation, assignment, and notification settings
- Eligible and time-bound Microsoft Entra role assignments
- MFA, justification, ticket, and approval controls
- Global Administrator standing-access reduction and emergency-access exceptions
- PIM for Groups and controlled privileged-group membership
- Activation, deactivation, expiration, renewal, extension, and removal lifecycle
- PIM audit evidence, monitoring, operational review, and recovery procedures

Azure resource roles, production-scale privileged populations, and entitlement
management are outside the current implementation scope.

## Delivery roadmap

| Milestone | Principal outcome | Status |
| ---: | --- | --- |
| 1 | PIM readiness, privileged-role discovery, security alerts, and pre-change role-policy baseline | **Complete** |
| 2 | Directory Readers MFA remediation and end-to-end User Administrator eligible activation, approval, use, audit, and deactivation | **Complete** |
| 3 | Global Administrator policy hardening, standing-access reduction, and governed emergency-access exceptions | **Complete** |
| 4 | PIM for Groups and controlled privileged-group membership | **Complete** |
| 5 | Privileged assignment lifecycle validation covering expiration, renewal, extension, and removal decisions | **Complete** |
| 6 | PIM alerts, audit monitoring, periodic review, escalation, and recovery operations | **Complete** |
| 7 | Integrated privileged-access scenario, final assurance, limitations, and operational handover | Not started |

## Milestone 1: readiness and security baseline

Milestone 1 was observational. No role setting, assignment, alert, licence,
identity, group, or authentication configuration was changed during baseline
collection.

### Baseline findings

| Area | Observation | Milestone 1 disposition |
| --- | --- | --- |
| PIM readiness | PIM for Microsoft Entra roles was available and accessible | Validated |
| Global Administrator exposure | Four active permanent Global Administrator assignments were reported | Recorded for later assignment and emergency-access review |
| Activation security | Directory Readers was reported as not requiring MFA for activation | Recorded as a Medium PIM alert |
| Service principals | Discovery and insights reported zero service principals with privileged-role assignments | Recorded as a portal observation |
| Role settings | The reviewed role settings were marked as unmodified | Baseline captured before remediation |

The portal observations do not replace a complete Microsoft Graph role export
or formal access certification.

### Milestone 1 evidence

| Evidence | Demonstrates |
| --- | --- |
| [Discovery and insights baseline](screenshots/m01-02-pim-discovery-insights-baseline.png) | Initial privileged-assignment recommendations |
| [PIM security-alert baseline](screenshots/m01-03-pim-security-alerts-baseline.png) | Initial alert names and counts |
| [Directory Readers MFA alert](screenshots/m01-04-pim-mfa-alert-directory-readers.png) | Role identified by the activation-MFA alert |
| [Unmodified role-settings inventory](screenshots/m01-06-pim-role-settings-unmodified-baseline.png) | Pre-change Microsoft Entra role-settings state |
| [Directory Readers default settings](screenshots/m01-07-pim-directory-readers-default-settings.png) | Original activation and assignment controls |
| [Global Administrator default settings](screenshots/m01-08-pim-global-admin-default-settings.png) | Original activation and assignment controls |
| [Global Administrator default notifications](screenshots/m01-09-pim-global-admin-default-notifications.png) | Original notification configuration |

Screenshots containing tenant-specific identities or user principal names were
not retained.

## Milestone 2: eligible access and activation control

Milestone 2 moved from observation to controlled remediation. Directory Readers
was updated to require MFA during activation. User Administrator was then
hardened and tested through a complete eligible-access workflow.

### Implemented controls

| Area | Implemented state | Validation |
| --- | --- | --- |
| Directory Readers | Azure MFA required during activation; unrelated settings retained | Post-change policy evidence and PIM alert rescan |
| User Administrator activation | Two-hour maximum, Azure MFA, justification, ticket information, and approval by two designated members | Hardened-settings evidence and pending approval request |
| User Administrator assignment | Permanent eligible and permanent active assignments disabled; eligible assignments expire after six months; active assignments expire after one month | Hardened-settings evidence |
| Eligible access | One direct, directory-scoped eligible assignment created from 15 September 2026 through 14 March 2027 | Eligible-role evidence |
| Privileged operation | A disabled, unlicensed synthetic validation identity was created and then deleted | Operator validation during the active window; no credentials retained |
| Session closure | User Administrator was manually deactivated before its two-hour maximum elapsed | Active-state and audit-history evidence |
| Alert outcome | The activation-MFA alert cleared; the separate Global Administrator count alert remained open | Post-remediation alert evidence |

### Milestone 2 evidence

| Evidence | Demonstrates |
| --- | --- |
| [Directory Readers MFA enforced](screenshots/m02-01-pim-directory-readers-mfa-enforced.png) | Azure MFA enabled for Directory Readers activation |
| [User Administrator default settings](screenshots/m02-02-pim-user-administrator-default-settings.png) | Pre-change activation and assignment baseline |
| [User Administrator hardened settings](screenshots/m02-03-pim-user-administrator-hardened-settings.png) | Two-hour activation and strengthened activation and assignment controls |
| [Eligible role available](screenshots/m02-04-pim-eligible-role-activation-available.png) | User Administrator eligibility and Activate action |
| [Activation request pending](screenshots/m02-05-pim-user-administrator-activation-request-pending.png) | Approval gate prevented immediate elevation |
| [Active assignment](screenshots/m02-06-pim-user-administrator-active-assignment.png) | Approved, time-bound role activation |
| [PIM audit history](screenshots/m02-07-pim-user-administrator-audit-history.png) | Assignment, request, approval, activation, and deactivation sequence |
| [Alerts after remediation](screenshots/m02-08-pim-alerts-after-mfa-remediation.png) | MFA alert resolved and unrelated Global Administrator alert retained |

Three exploratory files prefixed `m02-review-` were not retained because they
add no unique control evidence.

## Milestone 3: Global Administrator governance

Milestone 3 reduced routine standing Global Administrator access while
preserving two separately validated emergency-recovery paths.

### Implemented controls

| Area | Implemented state | Validation |
| --- | --- | --- |
| Global Administrator activation | One-hour maximum with Azure MFA, justification, ticket information, and independent approval | Hardened-settings and pending-request evidence |
| Routine administration | Permanent active assignment replaced by a direct eligible assignment expiring after six months | Assignment inventory and PIM audit |
| Personal standing access | Global Administrator assignment removed without deleting the identity | PIM audit history |
| Emergency recovery | Two dedicated identities retained as permanent active Global Administrators | Independent sign-in and assignment validation; identity-bearing screens excluded |
| Session closure | Tested Global Administrator activation manually deactivated before its maximum duration | Active-state and audit evidence |
| Alert outcome | Initial stale result reconciled against authoritative assignments; completed scan returned no results | Final PIM Alerts evidence |

### Milestone 3 evidence

| Evidence | Demonstrates |
| --- | --- |
| [Global Administrator hardened settings](screenshots/m03-01-pim-global-administrator-hardened-settings.png) | One-hour activation and strengthened activation and assignment controls |
| [Activation request pending](screenshots/m03-02-pim-global-administrator-activation-request-pending.png) | Approval gate prevented immediate Global Administrator elevation |
| [Active assignment](screenshots/m03-03-pim-global-administrator-active-assignment.png) | Approved one-hour Global Administrator activation |
| [Privacy-redacted PIM audit history](screenshots/m03-04-pim-global-administrator-audit-history.png) | Policy, assignment, approval, activation, removal, and deactivation events |
| [Alerts after remediation](screenshots/m03-05-pim-alerts-after-global-administrator-remediation.png) | Completed PIM alert scan returned no results |

Identity-bearing assignment details and the transient stale-alert detail were
not retained.

## Milestone 4: PIM for Groups

Milestone 4 implemented a dedicated role-assignable security group for
just-in-time Directory Readers access without repurposing an existing
Conditional Access scope group.

### Implemented controls

| Area | Implemented state | Validation |
| --- | --- | --- |
| Privileged group boundary | Dedicated cloud security group with assigned membership and Microsoft Entra role assignability | Empty baseline and group configuration review |
| Group-to-role binding | Directory Readers assigned directly and permanently to the dedicated group at Default Directory scope | Assigned-role evidence |
| Member activation | Two-hour maximum with Azure MFA, justification, ticket information, and independent approval | Hardened-settings and pending-request evidence |
| Member assignment | Permanent eligible and permanent active membership disabled; eligibility expires after six months | Hardened-settings and eligible-assignment evidence |
| Least privilege | One direct eligible Member assignment; no owner assignment | Eligible-membership evidence |
| Session closure | Tested membership manually deactivated after the controlled task | Active-state and audit evidence |
| Auditability | Eligible assignment, request, approval, activation, membership addition, and removal recorded successfully | Microsoft Entra audit evidence |

The directory read performed during the active window was a supporting
functional check. It is not treated as sole authorization proof because default
member permissions may already expose some basic directory information.

### Milestone 4 evidence

| Evidence | Demonstrates |
| --- | --- |
| [Empty group baseline](screenshots/m04-01-pim-directory-readers-group-empty-baseline.png) | No active Member assignment before implementation |
| [Unmodified group settings](screenshots/m04-02-pim-group-default-settings-baseline.png) | Pre-change Member and Owner settings state |
| [Hardened Member settings](screenshots/m04-03-pim-group-member-hardened-settings.png) | Two-hour activation and strengthened assignment controls |
| [Directory Readers group assignment](screenshots/m04-04-pim-group-directory-readers-role-assignment.png) | Active direct role binding at Default Directory scope |
| [Eligible membership available](screenshots/m04-05-pim-group-eligible-membership-available.png) | Direct time-bound Member eligibility and Activate action |
| [Activation request pending](screenshots/m04-06-pim-group-membership-activation-pending.png) | Approval gate prevented immediate membership activation |
| [Active membership](screenshots/m04-07-pim-group-membership-active.png) | Approved two-hour Member activation and Deactivate action |
| [Group audit history](screenshots/m04-08-pim-group-audit-history.png) | Assignment, request, approval, activation, membership addition, and removal sequence |

## Milestone 5: privileged assignment lifecycle

Milestone 5 validated how time-bound eligible assignments are continued,
expired, restored, and closed. Directory Readers exercised extension before
expiration. Reports Reader exercised automatic expiration and approval-gated
renewal. Both temporary reader-role assignments were then removed.

### Implemented controls

| Area | Implemented state | Validation |
| --- | --- | --- |
| Assignment boundary | Direct, time-bound eligible assignments used for Directory Readers and Reports Reader | Assignment state and audit history |
| Extension | Directory Readers extended before expiry after a user request and separate administrator approval | Revised eligible end time and audit history |
| Expiration | Reports Reader allowed to reach its fixed end time and move to Expired assignments | Expired-state evidence and automatic-removal audit event |
| Renewal | Expired Reports Reader renewed after a fresh justification and separate administrator approval | Renewed eligible end time and audit history |
| Least privilege | No permanent or active reader-role assignment created | Assignment-state review |
| Final removal | Temporary Directory Readers and Reports Reader eligibility removed after validation | Audit history and final assignment review |
| Preservation | Existing User Administrator eligibility and documented emergency access left unchanged | Final assignment review |

### Milestone 5 evidence

| Evidence | Demonstrates |
| --- | --- |
| [Expired Reports Reader assignment](screenshots/m05-01-pim-reports-reader-expired-assignment.png) | Reports Reader reached the expired state and offers renewal |
| [Renewed Reports Reader assignment](screenshots/m05-02-pim-reports-reader-renewed-assignment.png) | Reports Reader returned as eligible with a new bounded end time |
| [Assignment lifecycle audit history](screenshots/m05-03-pim-assignment-lifecycle-audit-history.png) | Extension, expiration, renewal, reinstatement, and removal events succeeded |

## Milestone 6: monitoring and operational assurance

Milestone 6 moved the implementation into recurring privileged-access
assurance. PIM alerts and Resource audit were reviewed, eligible User
Administrator access received an independent access-review decision, the
post-review assignment remained eligible and time-bound, two emergency-access
Global Administrator assignments remained available, and temporary
administrative elevation was closed.

### Implemented controls

| Area | Implemented state | Validation |
| --- | --- | --- |
| Alert monitoring | Current PIM Alerts view reviewed and returned no results | Operational alert evidence |
| Access certification | One-time review of eligible User Administrator access by a separate reviewer | Active review and decision summary |
| Decision completeness | One approved, zero denied, and zero not reviewed | Completed review overview |
| Post-review least privilege | Reviewed assignment remained eligible, direct, and time-bound | Eligible assignment inventory |
| Audit monitoring | Recent privileged lifecycle activity reconciled in Resource audit | Filtered audit evidence with successful results |
| Recovery assurance | Two permanent active emergency Global Administrators confirmed without modification | Controlled operator verification |
| Session closure | Temporary IAM-Admin Global Administrator activation deactivated | Controlled operator verification |

### Milestone 6 evidence

| Evidence | Demonstrates |
| --- | --- |
| [PIM alerts operational review](screenshots/m06-01-pim-alerts-operational-review.png) | Current PIM alert review returned no results |
| [Active access review](screenshots/m06-02-pim-user-administrator-access-review-active.png) | Review entered the active state |
| [Completed access-review decision](screenshots/m06-03-pim-user-administrator-access-review-completed.png) | One approval and no outstanding or denied decisions |
| [Eligible assignment retained](screenshots/m06-04-pim-user-administrator-eligible-retained.png) | Continued access remained eligible and bounded |
| [Operational audit review](screenshots/m06-05-pim-operational-audit-review.png) | Recent privileged lifecycle operations were available for reconciliation |

## Documentation map

| Area | Artifact |
| --- | --- |
| Architecture and trust boundaries | [PIM Governance Operating Model](architecture/01-pim-governance-operating-model.md) |
| Eligible-access sequence | [Eligible Access and Activation Flow](architecture/02-pim-eligible-access-and-activation-flow.md) |
| Milestone implementation record | [PIM Readiness and Security Baseline](docs/01-milestone-01-pim-readiness-and-baseline.md) |
| Testing and exit criteria | [Milestone 1 Test and Validation Record](docs/02-milestone-01-test-and-validation-record.md) |
| Baseline findings | [Milestone 1 Baseline Findings](data/01-milestone-01-baseline-findings.csv) |
| Control requirements | [PIM Baseline Control Requirements](policies/01-pim-baseline-control-requirements.md) |
| Operational procedure | [PIM Readiness and Alert Review Runbook](runbooks/01-review-pim-readiness-and-alerts.md) |
| Milestone 2 implementation record | [Eligible Access Remediation](docs/03-milestone-02-eligible-access-remediation.md) |
| Milestone 2 testing and exit criteria | [Milestone 2 Test and Validation Record](docs/04-milestone-02-test-and-validation-record.md) |
| Milestone 2 control results | [Milestone 2 Control Validation](data/03-milestone-02-control-validation.csv) |
| Eligible-access standard | [PIM Eligible Access Control Standard](policies/02-pim-eligible-access-control-standard.md) |
| Activation procedure | [PIM Eligible Role Activation Runbook](runbooks/02-operate-pim-eligible-role-activation.md) |
| Global Administrator design | [Global Administrator Governance Model](architecture/03-global-administrator-governance-model.md) |
| Milestone 3 implementation record | [Global Administrator Remediation](docs/05-milestone-03-global-administrator-remediation.md) |
| Milestone 3 testing and exit criteria | [Milestone 3 Test and Validation Record](docs/06-milestone-03-test-and-validation-record.md) |
| Milestone 3 control results | [Milestone 3 Control Validation](data/05-milestone-03-control-validation.csv) |
| Global Administrator standard | [Global Administrator and Emergency Access Standard](policies/03-global-administrator-and-emergency-access-standard.md) |
| Global Administrator procedure | [Global Administrator Operations Runbook](runbooks/03-operate-global-administrator-access.md) |
| PIM for Groups design | [PIM for Groups Just-in-Time Membership Model](architecture/04-pim-for-groups-just-in-time-membership-model.md) |
| Milestone 4 implementation record | [PIM for Groups Implementation](docs/07-milestone-04-pim-for-groups-implementation.md) |
| Milestone 4 testing and exit criteria | [Milestone 4 Test and Validation Record](docs/08-milestone-04-test-and-validation-record.md) |
| Milestone 4 control results | [Milestone 4 Control Validation](data/07-milestone-04-control-validation.csv) |
| PIM for Groups standard | [PIM for Groups Access Control Standard](policies/04-pim-for-groups-access-control-standard.md) |
| Group-membership procedure | [PIM for Groups Membership Runbook](runbooks/04-operate-pim-for-groups-membership.md) |
| Assignment lifecycle design | [Privileged Assignment Lifecycle Model](architecture/05-privileged-assignment-lifecycle-model.md) |
| Milestone 5 implementation record | [Privileged Assignment Lifecycle](docs/09-milestone-05-privileged-assignment-lifecycle.md) |
| Milestone 5 testing and exit criteria | [Milestone 5 Test and Validation Record](docs/10-milestone-05-test-and-validation-record.md) |
| Milestone 5 control results | [Milestone 5 Control Validation](data/09-milestone-05-control-validation.csv) |
| Assignment lifecycle standard | [Privileged Assignment Lifecycle Standard](policies/05-privileged-assignment-lifecycle-standard.md) |
| Assignment lifecycle procedure | [Privileged Assignment Lifecycle Runbook](runbooks/05-operate-privileged-assignment-lifecycle.md) |
| Monitoring and assurance design | [Privileged Access Monitoring and Assurance Model](architecture/06-privileged-access-monitoring-and-assurance-model.md) |
| Milestone 6 implementation record | [Monitoring and Operational Assurance](docs/11-milestone-06-monitoring-and-operational-assurance.md) |
| Milestone 6 testing and exit criteria | [Milestone 6 Test and Validation Record](docs/12-milestone-06-test-and-validation-record.md) |
| Milestone 6 control results | [Milestone 6 Control Validation](data/11-milestone-06-control-validation.csv) |
| Monitoring and escalation standard | [PIM Monitoring, Review, and Escalation Standard](policies/06-pim-monitoring-review-and-escalation-standard.md) |
| Monitoring and access-review procedure | [PIM Monitoring, Access Review, and Recovery Runbook](runbooks/06-operate-pim-monitoring-access-review-and-recovery.md) |

## Security and engineering controls

- No passwords, access tokens, authentication secrets, personal email
  addresses, or tenant-specific user principal names are retained.
- Baseline evidence was captured before remediation.
- Exploratory and identity-bearing screenshots were not retained.
- The requester and approver functions were separated for the tested activation.
- The elevated role was activated only for a bounded task and manually
  deactivated when the task ended.
- Directory Readers is bound to a dedicated role-assignable group while user
  membership remains eligible, time-bound, and approval-controlled.
- Direct role eligibility is extended or renewed only after a fresh request,
  bounded end time, and authorized approval decision.
- Temporary lifecycle-test assignments are removed when their approved purpose
  ends, without altering unrelated eligibility.
- Conditional Access scope groups are not reused as privileged-access groups.
- Emergency-access identities are separated from routine administration,
  independently validated, and retained as documented permanent exceptions.
- High-impact eligible access is periodically reviewed by an independent
  reviewer and reconciled against the resulting assignment state.
- PIM alerts and privileged audit activity are reviewed using defined triage
  and escalation criteria.
- Later control changes require explicit test outcomes, rollback criteria, and
  post-change evidence.

## Technical documentation structure

| Path | Purpose |
| --- | --- |
| `architecture/` | PIM scope, trust boundaries, responsibilities, and operating model |
| `data/` | Structured baseline findings and control-validation results |
| `docs/` | Milestone implementation and validation records |
| `policies/` | Privileged-access control requirements and role-policy decisions |
| `runbooks/` | Repeatable review, activation, recovery, and monitoring procedures |
| `screenshots/` | Approved numbered technical evidence |

## Current limitations and production improvements

- The implementation uses a small controlled synthetic tenant population.
- Milestone 1 portal discovery is not a substitute for a complete Microsoft
  Graph inventory or formal access review.
- The controlled User Administrator task validates the elevation path at lab
  scale; it does not replace production change approval or representative user
  acceptance testing.
- Emergency-access operability was validated at lab scale; production use would
  require independent monitoring, documented ownership, controlled credential
  custody, and recurring recovery exercises.
- The Milestone 4 directory-read observation is not a standalone authorization
  test because ordinary member users may read some basic directory information.
  Assurance therefore relies on the role binding, PIM assignment state, and
  audit sequence.
- Monitoring, escalation, access review, and recovery-presence checks were
  validated at lab scale; the final milestone must integrate these controls
  into the end-to-end assurance and operational handover.
- Production adoption would require representative scale, formal ownership,
  change approval, periodic access certification, independent emergency-access
  monitoring, licence continuity, and integration with enterprise ticketing and
  security operations.

## Authoritative Microsoft references

- [What is Microsoft Entra Privileged Identity Management?](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-configure)
- [Plan a Privileged Identity Management deployment](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-deployment-plan)
- [Security alerts for Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-configure-security-alerts)
- [Configure Microsoft Entra role settings in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-change-default-settings)
- [Assign Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-add-role-to-user)
- [Renew Microsoft Entra role assignments in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-renew-extend)
- [Activate Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-activate-role)
- [Approve or deny requests for Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-approval-workflow)
- [View audit history for Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-use-audit-log)
- [Manage emergency-access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)
- [Microsoft Entra ID Governance licensing fundamentals](https://learn.microsoft.com/en-us/entra/id-governance/licensing-fundamentals)
- [Privileged Identity Management for Groups](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/concept-pim-for-groups)
- [Configure PIM for Groups settings](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/groups-role-settings)
- [Assign eligibility for a group](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/groups-assign-member-owner)
- [Activate group membership or ownership](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/groups-activate-roles)
- [Approve activation requests for group members and owners](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/groups-approval-workflow)
- [Microsoft Entra audit logs](https://learn.microsoft.com/en-us/entra/identity/monitoring-health/concept-audit-logs)
