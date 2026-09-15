# PIM Baseline Control Requirements

## Purpose

Define the privileged-access controls against which the observed PIM baseline is assessed. These are target requirements, not claims that every control was enforced during Milestone 1.

## Requirements

| Control ID | Requirement | Rationale |
| --- | --- | --- |
| PIM-01 | Maintain an inventory of Microsoft Entra privileged-role assignments. | Unknown standing access cannot be governed effectively. |
| PIM-02 | Prefer eligible, time-bound assignments over permanent active assignments. | Reduces the period during which privileged permissions are available. |
| PIM-03 | Require MFA for privileged-role activation. | Adds verification at the point of elevation. |
| PIM-04 | Require activation justification for privileged roles. | Creates decision context and audit evidence. |
| PIM-05 | Require approval for selected high-impact roles. | Separates the request from the authorization decision. |
| PIM-06 | Limit activation duration according to role impact. | Constrains the window of elevated privilege. |
| PIM-07 | Retain only approved emergency-access exceptions as permanent active Global Administrators. | Preserves recovery access while limiting routine standing privilege. |
| PIM-08 | Review PIM security alerts and audit activity on a defined schedule. | Detects unsafe configuration and unexpected privileged activity. |
| PIM-09 | Record baseline evidence before remediation and post-change evidence afterward. | Supports traceability and control-effectiveness testing. |
| PIM-10 | Exclude tenant-specific identity data from repository evidence unless safely redacted. | Prevents unnecessary information disclosure. |

## Exception handling

An exception must identify:

- The role and assignment requiring the exception.
- The operational reason.
- The owner and review date.
- Compensating authentication and monitoring controls.
- The removal or renewal condition.

Emergency-access accounts require separate governance and must not be used for routine administration.

## Validation expectation

Control implementation is not complete merely because a portal setting is enabled. Later testing must confirm the request, MFA, justification, approval, activation, expiration or deactivation, audit, and alert outcomes relevant to the role.

## Reference

[Plan a Privileged Identity Management deployment](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-deployment-plan)

