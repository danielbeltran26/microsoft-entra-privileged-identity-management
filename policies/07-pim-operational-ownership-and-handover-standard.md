# PIM Operational Ownership and Handover Standard

## Purpose

Define the minimum ownership, review, evidence, escalation, and continuity
requirements for operating the completed PIM control set.

## Ownership

| Responsibility | Accountable function |
| --- | --- |
| PIM role and group policy | Privileged Access Administration |
| Eligibility approval and periodic certification | Designated business or security approver |
| Alert and audit triage | Security Operations |
| Emergency-access custody and testing | Identity Security leadership |
| Evidence retention and control reporting | IAM governance owner |

## Mandatory operating requirements

1. Routine administrative access must remain eligible and time-bound.
2. High-impact activation must require MFA, justification, ticket information,
   an approved duration, and independent approval.
3. Active access must be deactivated immediately after the approved task.
4. PIM alerts and privileged audit activity must be reviewed on the defined
   cadence and after material changes.
5. Eligible access must receive periodic access certification.
6. Two dedicated emergency-access Global Administrator identities must remain
   available and must not be used for routine administration.
7. Failed privileged operations must be investigated and correlated with any
   later successful retry. A successful retry does not erase the failed event.
8. Unexpected emergency-account activity, unexplained Global Administrator
   activation, or unauthorized policy weakening requires immediate escalation.
9. Published evidence must exclude secrets, complete tenant UPNs, personal
   email addresses, and tenant object identifiers.

## Evidence retention

Operational evidence should retain the request purpose, approver decision,
bounded activation, relevant task result, deactivation, audit reconciliation,
and alert disposition. Production retention periods must follow organizational,
regulatory, and investigation requirements.

## Handover acceptance criteria

- Control owners and escalation paths are assigned.
- Recurring monitoring and review activities are scheduled.
- Emergency-access custody and testing procedures are documented.
- Known lab limitations are accepted and tracked for production improvement.
- The integrated activation scenario completes without residual active access.

