# PIM Monitoring, Review, and Escalation Standard

## Control requirements

1. PIM alerts must be reviewed on a defined operational cadence and after
   material privileged-access changes.
2. Privileged role lifecycle events must be reconciled in Resource audit against
   approved activity and expected PIM service actions.
3. High-impact eligible assignments must undergo periodic access review by an
   authorized reviewer who is not the reviewed subject.
4. Review decisions must include a business reason. Denied or no-longer-required
   access must be removed when review results are applied.
5. Review completion must be validated using decision counts and the resulting
   assignment state; the list label alone is not sufficient evidence.
6. Two dedicated emergency-access Global Administrator identities must remain
   available, independently governed, and excluded from routine administration.
7. Emergency-account use or unexpected Global Administrator activity must be
   escalated immediately and investigated as a security event.
8. Routine privileged sessions must be deactivated as soon as the task ends.
9. Evidence retained for publication must exclude secrets, complete tenant user
   principal names, personal email addresses, and tenant object identifiers.

## Review frequency

| Control | Minimum cadence |
| --- | --- |
| PIM alerts | Weekly and after material PIM changes |
| Privileged audit reconciliation | Weekly |
| High-impact eligible-role access review | Quarterly |
| Emergency-access assignment presence | Monthly |
| Emergency-access sign-in and operational test | At least every 90 days, subject to organizational procedure |

## Severity and response

| Severity | Example | Required response |
| --- | --- | --- |
| Critical | Unauthorised emergency-account use or unexpected active Global Administrator | Preserve evidence, contain access, notify security leadership, begin incident response |
| High | Unapproved privileged assignment or unexplained policy weakening | Remove or disable unsafe access when authorized, investigate, and escalate |
| Medium | PIM alert showing a control gap without observed misuse | Assign remediation owner and date; validate after change |
| Low | Expected administrative or service event | Reconcile to the approved activity and close with evidence |

## Exceptions

Permanent privilege is prohibited for routine administration. Emergency-access
assignments are the documented exception and require compensating monitoring,
restricted credential custody, and recurring validation.

