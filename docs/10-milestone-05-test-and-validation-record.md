# Milestone 5 Test and Validation Record

## Test summary

| Item | Value |
| --- | --- |
| Test dates | 24–26 September 2026 |
| Environment | Controlled synthetic Microsoft Entra tenant |
| Scope | Time-bound eligible assignments, extension, expiration, renewal, approval, removal, and audit |
| Change method | Microsoft Entra admin center |
| Overall result | Pass |
| Final lifecycle state | Temporary Directory Readers and Reports Reader eligibility removed; existing User Administrator eligibility retained |

## Test cases

| Test ID | Test | Expected result | Evidence or record | Result |
| --- | --- | --- | --- | --- |
| M05-T01 | Establish a time-bound Directory Readers assignment | Controlled user receives direct eligible Directory Readers with a defined end time | Assignment inventory and audit record | Pass |
| M05-T02 | Request extension before expiration | Eligible user can submit an extension while the assignment remains current | PIM request and audit records | Pass |
| M05-T03 | Enforce extension approval | A separate authorized administrator decides the request | PIM approval and audit records | Pass |
| M05-T04 | Validate the extended assignment | Directory Readers remains eligible with a revised end time and is not made active or permanent | Eligible-assignment state and audit record | Pass |
| M05-T05 | Establish a short Reports Reader assignment | Controlled user receives direct time-bound eligible Reports Reader | Assignment inventory and audit record | Pass |
| M05-T06 | Validate automatic expiration | Reports Reader moves to Expired assignments after its fixed end time and offers **Renew** | `m05-01-pim-reports-reader-expired-assignment.png` | Pass |
| M05-T07 | Request renewal after expiration | Expired Reports Reader can be submitted for renewal with new justification | PIM request and audit records | Pass |
| M05-T08 | Enforce renewal approval | Renewal remains governed by a separate authorized approval decision | PIM approval and audit records | Pass |
| M05-T09 | Validate bounded renewal | Reports Reader returns to Eligible assignments with a new end time and no permanent assignment | `m05-02-pim-reports-reader-renewed-assignment.png` | Pass |
| M05-T10 | Remove temporary eligibility | Directory Readers and Reports Reader assignments are removed after validation | Assignment inventory and audit record | Pass |
| M05-T11 | Preserve unrelated access | Existing User Administrator eligibility and documented emergency access remain unchanged | Final assignment review | Pass |
| M05-T12 | Reconcile the complete lifecycle | Extension, expiration, renewal, reinstatement, and removal events have successful status | `m05-03-pim-assignment-lifecycle-audit-history.png` | Pass |

## Control assertions

### Time-bound eligibility

Both lifecycle-test roles used direct eligible assignments with defined end
times. Neither role was converted to permanent or active access.

### Extension before expiration

Directory Readers was extended while still eligible. The request required a
continued business need and an approval decision separate from the requester.

### Expiration without residual access

Reports Reader reached its configured end time and moved to the expired state.
The portal offered renewal; it did not show an active assignment.

### Renewal after fresh authorization

Renewal required a new request and approval. The renewed Reports Reader
assignment returned as eligible with a new bounded end time.

### Complete removal

The temporary Directory Readers and Reports Reader assignments were removed
after testing. The unrelated User Administrator eligibility and documented
emergency-access boundary were preserved.

### Auditability

Resource audit showed successful events for the assignment changes, approval
decisions, automatic expiration, renewed eligibility, and final removals.

## Exit criteria

| Criterion | Result |
| --- | --- |
| Direct time-bound assignments used | Met |
| Extension completed before expiration | Met |
| Expiration occurred automatically | Met |
| Expired state verified | Met |
| Renewal required fresh approval | Met |
| Renewed assignment received a bounded end time | Met |
| Temporary lifecycle assignments removed | Met |
| Unrelated eligibility preserved | Met |
| Emergency-access assignments unchanged | Met |
| Complete successful audit sequence reviewed | Met |

## Final result

**PASS:** Milestone 5 validated the complete assignment lifecycle for
extension, expiration, renewal, and removal while preserving unrelated and
emergency access.

## References

- [Renew Microsoft Entra role assignments in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-renew-extend)
- [Assign Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-add-role-to-user)
- [View audit history for Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-how-to-use-audit-log)
