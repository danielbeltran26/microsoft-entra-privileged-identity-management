# Milestone 3 Test and Validation Record

## Test summary

| Item | Value |
| --- | --- |
| Test date | 15 September 2026 |
| Environment | Controlled synthetic Microsoft Entra tenant |
| Scope | Global Administrator policy, assignments, activation, emergency-access exceptions, audit, and alerts |
| Change method | Microsoft Entra admin center |
| Overall result | Pass |
| Final alert state | No PIM security alerts displayed after scan completion |

## Test cases

| Test ID | Test | Expected result | Evidence or record | Result |
| --- | --- | --- | --- | --- |
| M03-T01 | Validate emergency recovery paths | Two dedicated identities can sign in and show permanent active Global Administrator | Operator verification; identity-bearing screenshots intentionally excluded | Pass |
| M03-T02 | Harden Global Administrator policy | One-hour maximum, MFA, justification, ticket, approval, and six-month eligible limit are present | `m03-01-pim-global-administrator-hardened-settings.png` | Pass |
| M03-T03 | Convert routine administration | Routine administrator is eligible rather than permanent active and expires after six months | Portal verification and PIM audit | Pass |
| M03-T04 | Submit protected activation | Global Administrator request remains pending rather than activating immediately | `m03-02-pim-global-administrator-activation-request-pending.png` | Pass |
| M03-T05 | Enforce separation of duties | A separate designated approver authorizes the request | PIM audit evidence | Pass |
| M03-T06 | Validate bounded activation | Global Administrator is activated with a one-hour end time and **Deactivate** action | `m03-03-pim-global-administrator-active-assignment.png` | Pass |
| M03-T07 | Remove personal standing access | Personal Global Administrator assignment is removed without deleting the identity | PIM audit evidence | Pass |
| M03-T08 | Preserve emergency access | Two permanent active emergency assignments remain after remediation | Authoritative assignment inventory verification | Pass |
| M03-T09 | Deactivate routine privilege | Activated Global Administrator access is manually ended | PIM audit evidence | Pass |
| M03-T10 | Review the complete audit sequence | Policy, assignment, request, approval, activation, removal, and deactivation events succeed | Privacy-redacted `m03-04-pim-global-administrator-audit-history.png` | Pass |
| M03-T11 | Reconcile transient alert data | Stale alert output is not used to remove additional administrators; live assignments remain authoritative | Operator verification and completed rescan | Pass |
| M03-T12 | Validate final alert state | PIM Alerts displays **No results** after the existing scan completes | `m03-05-pim-alerts-after-global-administrator-remediation.png` | Pass |
| M03-T13 | Validate release integrity | Five evidence files match manifest lengths and SHA-256 hashes | `data/06-milestone-03-evidence-manifest.csv` | Pass |
| M03-T14 | Validate privacy and structure | Required files exist, scripts parse, links resolve, and prohibited identity wording is absent | `scripts/03-Test-Milestone03Evidence.ps1` | Pass |

## Control assertions

### Least standing privilege

Routine and personal identities no longer hold permanent active Global
Administrator. Standing privilege is limited to two documented recovery
identities.

### Just-in-time administration

The routine administrator must use a one-hour eligible activation. MFA,
justification, ticket information, and approval are enforced before access is
granted.

### Separation of duties

The requester did not approve its own activation. A separate designated
approver completed the authorization decision.

### Recovery availability

Both emergency-access identities were proven usable before any permanent
assignment was removed. They remained active throughout the transition.

### Bounded privilege

The test activation included a fixed end time and was manually deactivated as
soon as the remediation task finished.

### Authoritative-state reconciliation

When alert output temporarily retained a removed assignment, the assignment
tabs and PIM audit were checked before taking action. The alert was allowed to
complete its existing scan and then cleared without **Fix** or **Dismiss**.

## Evidence integrity result

- Expected Milestone 3 public screenshots: 5
- Found Milestone 3 public screenshots: 5
- Missing screenshots: 0
- Unexpected public Milestone 3 screenshots: 0
- Hash or length mismatches: 0

## Exit criteria

| Criterion | Result |
| --- | --- |
| Emergency recovery paths validated before change | Met |
| Global Administrator policy hardened | Met |
| Routine administrator converted to time-bound eligible access | Met |
| Independent approval exercised | Met |
| One-hour activation validated | Met |
| Personal Global Administrator assignment removed | Met |
| Two permanent emergency assignments retained | Met |
| Activated routine privilege manually deactivated | Met |
| Audit sequence validated | Met |
| Final PIM alert scan returned no results | Met |
| Public evidence privacy and integrity validation passed | Met |

## Final result

**PASS:** Milestone 3 implementation, recovery protection, functional testing,
audit validation, alert reconciliation, evidence integrity, and public-release
checks completed successfully.

## References

- [Manage emergency access accounts in Microsoft Entra ID](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)
- [Activate Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-activate-role)
- [View audit history for Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-use-audit-log)
- [Security alerts for Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-configure-security-alerts)
