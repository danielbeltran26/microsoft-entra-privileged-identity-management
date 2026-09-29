# Milestone 7: Test and Validation Record

## Test results

| Test | Expected result | Observed result | Status |
| --- | --- | --- | --- |
| Eligible activation | Existing group eligibility can be activated only through PIM | Member activation request submitted for the dedicated role-assignable group | Pass |
| Independent approval | Requester cannot approve its own activation | Separate designated approver approved the request | Pass |
| Bounded access | Approved access is direct, active, and time-limited | Active assignment displayed Activated state, end time, and Deactivate action | Pass |
| Controlled use | Validation remains within read-only scope | Synthetic directory profile reviewed without modification | Pass |
| Initial deactivation | Active membership is removed after use | Initial processing event failed and was retained for investigation | Observed |
| Deactivation retry | Supported retry removes residual active access | Later removal request and completion succeeded | Pass |
| Audit completeness | Request, approval, activation, and closure are recorded | Complete sequence visible with failed attempt and successful retry | Pass |
| Final alerts | Current PIM alert state is reviewed | Final scan returned No results | Pass |
| Recovery assurance | Two emergency-access assignments remain available | Two active, direct, permanent Global Administrator assignments confirmed | Pass |
| Administrative closure | Temporary monitoring elevation is removed | IAM-Admin Global Administrator activation deactivated | Pass |
| Privacy | Evidence excludes secrets and complete tenant identifiers | Approved images contain only synthetic role, group, and account labels | Pass |

## Residual limitations

- The implementation uses a small synthetic tenant and does not test production
  scale, workload identities, multi-tenant administration, or Azure resource
  roles.
- Portal evidence is point-in-time and does not replace centralized long-term
  log retention, SIEM correlation, or automated compliance reporting.
- The read-only directory check is supporting evidence rather than a standalone
  authorization test because default member permissions can expose limited data.
- Emergency-access presence was validated, but a production recovery exercise
  requires controlled credential custody, monitored sign-in, documented
  notification, and approved test scheduling.
- Licensing availability and notification delivery require ongoing monitoring.

## Exit criteria

- Integrated request, approval, activation, task, and closure completed.
- Failed removal attempt reconciled with a successful retry.
- No residual active group membership remained.
- Final alert scan completed.
- Two emergency-access assignments remained unchanged.
- Temporary Global Administrator elevation was deactivated.
- Operational ownership and production-improvement requirements documented.

All Milestone 7 exit criteria passed.

