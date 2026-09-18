# Project SDLC profile

Status: draft
Policy acceptance: Pending; record the user's accepted decisions
Verification profile: Pending — Basic or Strict, with explicit overrides
Artifact root: docs/
Change-directory pattern: feat-{slug}
Slug: proposed by capture-intent
Task source of truth: Git files
Delivery: one integration branch and PR per change, unless agreed otherwise
Delegation: sequential unless supported and authorized

Set status using setup's acceptance, verification, and gap-closure criteria; preserve accepted answers on resume.

## Standards sources

Link repository instructions, adopted coding standards, architecture decisions, and domain vocabulary. Identify proposed rules separately until adopted.

## Verification

For each gate record `required`, `not required`, or `not applicable`, with rationale from the adopted profile and overrides. Missing tools are setup gaps, not non-applicability.

Replace `Pending` with a usable command/result or the adopted rationale for a non-required/non-applicable gate. Unresolved required cells block setup; optional gates need no tooling.

| Gate | Requirement and rationale | Command | Scope | Pass condition | Evidence/result | Enforcement |
| --- | --- | --- | --- | --- | --- | --- |
| Lint | Pending | Pending | Pending | Adopted lint policy | Pending | Unverified |
| Typecheck | Pending | Pending | Pending | Adopted type policy | Pending | Unverified |
| Unit tests | Pending | Pending | Pending | All required tests pass | Pending | Unverified |
| E2E | Pending | Pending | User-agreed key scenarios | Required scenarios pass | Pending | Unverified |
| CRAP | Pending; Strict proposes required | Pending | User decision if required | Strict proposes every in-scope function < 30 | Fresh per-function report if required | Unverified |
| Mutation | Pending; Strict proposes required | Pending | User decision if required | User-agreed failing threshold if required | Mutation report if required | Unverified |

Fast feedback commands: record a small useful subset.
Pre-merge commands: record the complete required suite.
Prerequisites: record allowed runtime/services setup and relevant browser restrictions.
CRAP method, if required: complexity and coverage definitions, adapters and versions, function mapping, exclusions, and baseline if applicable.
Mutation policy, if required: tool/version, scope, threshold, cache invalidation, and equivalent-mutant disposition.
Not-applicable policy: enumerate justified cases; no silent skip for missing tooling.

## PR gates

Remote repository and target branch: Pending
Required CI check names and agreed enforcement expectations/evidence: Pending
Reviewer and accepted completion signal: Pending
Review-trigger communication authorization: Per user instruction
Blocking finding/thread policy: Pending
Merge method: Pending
Merge authorization: Per user instruction, recorded for the specific run

## Setup gaps

Record missing commands, undecided policy, and gaps against the agreed enforcement expectations. Each entry needs an implementation proposal, authorization status, and next action. Remove a gap only after verification. Explicitly record `None` once resolved.

Original task to resume, if setup was invoked by another skill: record the stage and task; clear once resumed.
