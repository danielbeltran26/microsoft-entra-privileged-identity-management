# Project Lessons Learned

## Purpose

Capture the engineering, governance, operational, and evidence-management
lessons identified during the seven-milestone Microsoft Entra Privileged
Identity Management implementation.

## 1. Baseline before remediation

Capturing the original role settings, assignment state, alerts, and recovery
boundary before making changes was essential. Without a pre-change baseline,
the project could show only a final configuration—not what risk was reduced or
whether unrelated controls were preserved.

**Future application:** record configuration, assignment, licensing, alert, and
recovery state before every material privileged-access change.

## 2. Eligibility alone is not sufficient governance

Changing an administrator from active to eligible reduces standing exposure,
but strong governance also requires MFA, justification, ticket context,
duration limits, approval, notification, audit, and prompt deactivation.

**Future application:** assess the complete activation and assignment policy,
not only whether an identity is labelled eligible.

## 3. Global Administrator reduction requires recovery assurance

Routine standing Global Administrator access should not be removed until a
separate recovery path is confirmed. The two emergency-access identities were
therefore treated as governed exceptions rather than remediation failures.

**Future application:** establish ownership, credential custody, monitoring,
and recurring testing for emergency access before reducing ordinary standing
privilege.

## 4. Privileged groups need a dedicated boundary

Reusing a Conditional Access scope group for privileged membership would mix
policy targeting with authorization. A dedicated role-assignable group created
a clearer trust boundary and a more auditable PIM for Groups workflow.

**Future application:** use purpose-built privileged groups with explicit role,
membership, ownership, and lifecycle controls.

## 5. Lifecycle controls must be tested as operations

Configured expiration, extension, and renewal settings do not prove that the
operational workflow works. The project deliberately exercised extension before
expiry, automatic expiration, approval-gated renewal, and final removal.

**Future application:** test lifecycle events and reconcile the resulting
assignment state and audit record rather than relying on configuration alone.

## 6. Portal labels are not the complete control outcome

The completed access review remained labelled **Complete** after results were
applied. Because the only decision was approval and no identity was denied,
there was no assignment removal to perform. The decision counts and resulting
assignment state were more meaningful than expecting a different list label.

**Future application:** validate decisions, enforcement requirements, and final
access state together; do not infer success or failure from one UI label.

## 7. Functional checks require careful interpretation

A successful directory read during active Directory Readers membership was
useful supporting evidence but was not sufficient authorization proof because
ordinary members may already see limited directory information.

**Future application:** use assignment state, policy, audit, and a permission-
specific test when possible. Document ambiguity rather than overstating what a
functional observation proves.

## 8. Failed operations are valuable evidence

The first final-scenario removal-processing event failed. A later supported
portal retry completed successfully and removed active membership. Retaining
both events produced a stronger operational record than hiding the failure.

**Future application:** preserve failed privileged events, determine impact,
record the retry or remediation, and verify closure. A later success does not
erase the need to account for the original failure.

## 9. Deactivation is a required control step

Waiting for maximum duration would eventually close access, but manually
deactivating immediately after the task reduced the active attack window and
created an explicit closure event.

**Future application:** make early deactivation part of every privileged-access
runbook and validate that the active assignment disappears.

## 10. Alerts, audit, and access reviews answer different questions

PIM alerts identify selected control weaknesses, audit records show privileged
activity, and access reviews certify whether eligibility should continue. None
of these mechanisms replaces the others.

**Future application:** operate them as complementary preventive, detective,
and governance controls with defined owners and cadences.

## 11. Evidence quality matters as much as evidence quantity

Exploratory, duplicate, identity-bearing, and low-value screenshots increased
privacy and review risk without adding assurance. The final evidence set kept
only images tied to specific control claims and removed complete tenant
identifiers from publication copies.

**Future application:** define the required evidence before testing, use exact
filenames, retain original local evidence, and publish only privacy-safe copies
that demonstrate a unique control outcome.

## 12. Lab success is not production readiness

The controlled tenant demonstrated the design and operating process, but it did
not validate enterprise scale, centralized retention, SIEM integration,
automated reporting, workload identities, Azure resource roles, multi-tenant
administration, or production emergency credential custody.

**Future application:** convert the lab controls into formal ownership,
change-management, monitoring, retention, automation, licensing-continuity, and
recovery-testing requirements before production adoption.

## Final takeaway

Effective privileged-access governance is not a single PIM setting. It is a
continuous system combining least privilege, bounded eligibility, independent
approval, recovery access, monitoring, lifecycle management, periodic review,
transparent exception handling, evidence discipline, and accountable
operational ownership.

