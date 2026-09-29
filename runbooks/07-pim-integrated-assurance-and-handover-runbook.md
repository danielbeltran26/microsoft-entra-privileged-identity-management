# PIM Integrated Assurance and Handover Runbook

## Purpose

Execute a controlled end-to-end assurance test and hand the PIM operating model
to its named owners without leaving residual privileged access.

## Preconditions

- Eligible requester, independent approver, and monitoring administrator are
  available.
- The requester has an existing eligible assignment.
- Two emergency-access identities remain available and are not used for testing.
- A change or validation reference is assigned.

## Integrated validation

1. The requester opens <https://entra.microsoft.com/> and submits a justified,
   time-bound activation request for the eligible assignment.
2. An independent approver validates identity, role, purpose, duration, and
   reference before approving.
3. The requester confirms the assignment is active and bounded.
4. Perform only the approved operation. For a Directory Readers validation,
   use a read-only directory check and make no configuration change.
5. Deactivate immediately after the task and confirm the active assignment is
   removed.
6. Review audit events for request, approval, activation, and removal.
7. Record failed events and their disposition. Confirm any retry is separately
   logged and successfully closes access.
8. Run a final PIM alert scan and record every open finding or the point-in-time
   no-results state.
9. Confirm both emergency-access Global Administrator assignments remain active,
   direct, and permanent without modifying them.
10. Deactivate any temporary monitoring-administrator elevation.

## Handover checklist

- Confirm the policy, architecture, implementation records, test records,
  structured control results, and evidence inventory are complete.
- Assign owners for policy, approvals, monitoring, recovery, and evidence.
- Establish weekly alert and audit review, quarterly access review, monthly
  recovery-assignment review, and periodic emergency-access testing.
- Record production gaps, including scale, automation, retention, integration,
  licensing continuity, and emergency credential custody.
- Review the escalation matrix with IAM and security operations.

## Rollback and recovery

If access remains active unexpectedly, attempt deactivation again and verify the
new audit event. If the retry fails, escalate immediately to an authorized PIM
administrator. Do not use an emergency account unless normal administrative
access is unavailable and the documented emergency procedure is invoked.

## Completion condition

The scenario is complete when the approved operation is finished, active access
is removed, audit events are reconciled, alerts are reviewed, recovery access is
confirmed, and temporary monitoring elevation is closed.

