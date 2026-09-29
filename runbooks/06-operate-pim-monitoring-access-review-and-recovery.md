# Operate PIM Monitoring, Access Review, and Recovery

## Preconditions

- Use a least-privileged administrative identity and activate Global
  Administrator only when the portal operation requires it.
- Use a separate authorized reviewer for the access-review decision.
- Open the Microsoft Entra admin center at <https://entra.microsoft.com/>.

## 1. Review PIM alerts

1. Open **Identity governance > Privileged Identity Management > Microsoft
   Entra roles > Alerts**.
2. Select **Scan** when a current evaluation is required.
3. Record each alert, affected role, severity, expected owner, and disposition.
4. Treat **No results** as a point-in-time result, not a permanent guarantee.

## 2. Reconcile privileged activity

1. Open **Resource audit** for Microsoft Entra roles.
2. Set an appropriate time span and filter by the controlled identity or role.
3. Reconcile requests, approvals, assignments, activations, deactivations,
   renewals, expirations, and removals against authorized activity.
4. Escalate unexplained events using the policy severity table.

## 3. Perform a periodic access review

1. Create a review for the selected Microsoft Entra role and assignment type.
2. Set an authorized independent reviewer, business description, start and end
   dates, and require a reason for approval.
3. The reviewer opens **Review access**, selects the subject, records the reason,
   and approves or denies continued access.
4. Stop the review early only after all expected decisions are present.
5. Apply the results. A review with approved decisions and no denied identities
   can remain labelled **Complete** because no assignment removal is required.
6. Validate the decision summary and the post-review assignment inventory.

## 4. Validate recovery access

1. Open **Assignments > Active assignments** and filter for Global
   Administrator.
2. Confirm the two designated emergency-access identities remain direct,
   permanent, active assignments.
3. Do not modify or use the accounts during a presence check.
4. Escalate immediately if an account is missing, disabled unexpectedly, or
   shows unexplained use.

## 5. Close the administrative session

1. Return to **My roles > Active assignments**.
2. Deactivate the temporary Global Administrator session used for the operation.
3. Confirm it is no longer active.
4. Retain only approved, privacy-safe evidence and record open findings.

## Expected outcome

Alerts and privileged activity are reviewed, continued access receives an
explicit decision, eligible access remains bounded, recovery assignments remain
available, and temporary administrative elevation is closed.

