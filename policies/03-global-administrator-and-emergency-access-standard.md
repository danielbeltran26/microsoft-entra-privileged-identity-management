# Global Administrator and Emergency Access Standard

## Purpose

Define the minimum controls for Global Administrator eligibility, activation,
standing emergency access, assignment review, monitoring, and recovery.

## Policy requirements

### Routine Global Administrator access

1. Routine administrators must use eligible rather than permanent active
   assignments.
2. Eligible assignments must be time-bound and may not exceed six months
   without review and renewal.
3. Activation may not exceed one hour.
4. Activation must require Azure MFA, business justification, ticket
   information, and approval.
5. The requester must not approve its own activation.
6. Access must be manually deactivated when the task finishes.
7. Personal identities must not retain Global Administrator unless a documented
   exception is approved.

### Emergency-access exception

1. At least two dedicated emergency-access identities must be maintained.
2. Emergency identities may hold permanent active Global Administrator so
   recovery does not depend on PIM activation or a single approver.
3. Emergency identities must not be used for routine administration.
4. Their credentials and authentication methods must be independently
   protected and recoverable.
5. Policies that could block emergency sign-in must contain deliberate,
   documented exclusions with compensating monitoring.
6. Every emergency-account sign-in or role use must generate immediate review.
7. Operability must be tested at least every 90 days and after material
   authentication or access-policy changes.

### Assignment changes

1. At least two proven recovery paths must remain available throughout a Global
   Administrator assignment change.
2. Assignment inventory and audit records are authoritative when alert data is
   delayed or inconsistent.
3. A low-risk alert must not be cleared by removing a required recovery account
   or the only routine eligible administrator.
4. Role removals must target the exact assignment and must not delete the user
   object.

### Monitoring and review

1. PIM request, approval, activation, deactivation, expiry, extension, and
   removal events must be retained according to the organization's audit
   requirements.
2. Eligible assignments must be reviewed before expiration.
3. Permanent emergency assignments require periodic independent review.
4. PIM alert findings must be reconciled with live role assignments before
   remediation.
5. Production implementations should export relevant Entra audit and sign-in
   records to the security monitoring platform.

## Implemented lab profile

| Control | Value |
| --- | --- |
| Routine Global Administrator | One direct eligible assignment |
| Eligible expiry | Six months |
| Activation maximum | One hour |
| Activation controls | MFA, justification, ticket, approval |
| Emergency Global Administrators | Two permanent active assignments |
| Personal Global Administrator | Removed |
| Final PIM alert state | No results after scan completion |

## Exceptions

Permanent active Global Administrator is prohibited for routine use. The only
implemented exception is the two dedicated emergency-access identities. Any
additional exception requires documented business ownership, expiry or review
date, monitoring, and approval.

## References

- [Manage emergency access accounts in Microsoft Entra ID](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)
- [Best practices for Microsoft Entra roles](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/best-practices)
- [Plan a Privileged Identity Management deployment](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-deployment-plan)
