# Milestone 2 Test and Validation Record

## Test summary

| Item | Value |
| --- | --- |
| Test date | 15 September 2026 |
| Environment | Controlled synthetic Microsoft Entra tenant |
| Scope | Directory Readers activation MFA and User Administrator eligible-access workflow |
| Change method | Microsoft Entra admin center |
| Overall result | Pass |
| Remaining open finding | Global Administrator count alert; deferred to Milestone 3 |

## Test cases

| Test ID | Test | Expected result | Evidence or record | Result |
| --- | --- | --- | --- | --- |
| M02-T01 | Review Directory Readers after remediation | Azure MFA is required for activation | `m02-01-pim-directory-readers-mfa-enforced.png` | Pass |
| M02-T02 | Capture User Administrator baseline | Eight-hour default and permissive assignment controls are recorded before change | `m02-02-pim-user-administrator-default-settings.png` | Pass |
| M02-T03 | Validate hardened User Administrator settings | Two-hour maximum, MFA, justification, ticket, approval, and time-bound assignment controls are present | `m02-03-pim-user-administrator-hardened-settings.png` | Pass |
| M02-T04 | Validate eligible assignment | User Administrator appears as eligible with an **Activate** action | `m02-04-pim-eligible-role-activation-available.png` | Pass |
| M02-T05 | Submit protected activation | Request remains pending rather than activating immediately | `m02-05-pim-user-administrator-activation-request-pending.png` | Pass |
| M02-T06 | Approve through a separate identity | Designated approver can approve with justification; requester does not self-approve | PIM audit evidence | Pass |
| M02-T07 | Validate active state | User Administrator appears activated with a two-hour end time and **Deactivate** | `m02-06-pim-user-administrator-active-assignment.png` | Pass |
| M02-T08 | Perform bounded privileged action | Disabled unlicensed validation identity is created without groups or roles | Operator validation; screenshot intentionally not retained | Pass |
| M02-T09 | Remove validation object | Temporary identity is deleted after the access test | Operator validation | Pass |
| M02-T10 | Deactivate before expiry | Current active User Administrator access is removed | PIM audit evidence | Pass |
| M02-T11 | Review complete audit sequence | Assignment, request, approval, activation, and deactivation are successful | `m02-07-pim-user-administrator-audit-history.png` | Pass |
| M02-T12 | Rescan PIM alerts | Activation-MFA alert is absent; unrelated Global Administrator alert remains | `m02-08-pim-alerts-after-mfa-remediation.png` | Pass |
| M02-T13 | Validate release integrity | Eight evidence files match manifest lengths and SHA-256 hashes | `data/04-milestone-02-evidence-manifest.csv` | Pass |
| M02-T14 | Validate release privacy and structure | Required files exist; review-only images are excluded; scripts parse; relative links resolve; prohibited identity wording is absent | `scripts/02-Test-Milestone02Evidence.ps1` | Pass |

## Control assertions

### Least privilege

The test used User Administrator instead of Global Administrator for the
controlled user-management task. Eligibility was direct, directory-scoped, and
time-bound.

### Just-in-time access

No active User Administrator assignment existed before approval. The active
assignment was created only after the eligible identity completed the required
activation workflow.

### Separation of duties

The eligible role member submitted the request and a separate designated
approver authorized it. Microsoft documents that approvers cannot approve their
own activation requests.

### Bounded privilege

The role policy limited self-activation to two hours. The requester manually
deactivated the role immediately after the test rather than leaving it active
for the full window.

### Traceability

The PIM audit view showed the lifecycle events required to reconstruct the
tested activation. Portal audit history is time-limited, so production use would
also export logs for longer retention and correlation.

## Evidence integrity result

- Expected Milestone 2 public screenshots: 8
- Found Milestone 2 public screenshots: 8
- Missing screenshots: 0
- Unexpected public Milestone 2 screenshots: 0
- Hash or length mismatches: 0
- Review-only screenshots included in the release: 0

## Exit criteria

| Criterion | Result |
| --- | --- |
| Directory Readers activation MFA enabled | Met |
| User Administrator pre-change baseline retained | Met |
| Hardened User Administrator policy validated | Met |
| Time-bound eligible assignment visible | Met |
| Approval gate exercised with separate approver | Met |
| Privileged action completed and temporary object removed | Met |
| Role manually deactivated | Met |
| Audit sequence validated | Met |
| MFA alert cleared without dismissing the remaining alert | Met |
| Public evidence privacy and integrity validation passed | Met |

## Final result

**PASS:** Milestone 2 implementation, functional testing, security control
validation, evidence integrity, and public-release checks completed successfully.

## References

- [Activate Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-activate-role)
- [Approve or deny requests for Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-approval-workflow)
- [View audit history for Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-use-audit-log)

