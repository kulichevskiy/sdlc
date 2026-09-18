---
name: setup
description: "Set up a repository before using the SDLC workflow: inspect the project, agree on a verification profile, and record standards and delivery policy. Use for first-time setup or to repair incomplete configuration."
---

# Set up a project

Read [the workflow contract](references/workflow.md) without recursively applying its setup entry check. Retain any task routed here.

Inspect repository instructions, standards/ADRs, manifests, test tooling, CI, and any `docs/sdlc/project.md`, respecting access restrictions and reading only non-secret configuration. Apply the contract's profile-reuse rules; reopen a ready profile only on user request or evidence it is unusable.

## Agree on the project profile

Ask one consequential question at a time, recommend an evidence-based answer, and wait. Look up facts yourself. Resolve:

- Artifact locations and standards sources, using the contract's defaults unless existing conventions differ.
- Verification profile and overrides. **Basic** proposes stack-appropriate lint, typecheck, unit tests, and key-scenario E2E. **Strict** adds CRAP strictly below 30 and mutation testing with a user-agreed failing threshold. Existing policy and explicit gate decisions govern, not the profile name. Confirm key E2E scenarios and check scopes. Distinguish justified non-applicability, missing tooling, and gates the user chose not to require.
- Fast feedback/pre-merge commands, prerequisites, and enforcement expectations; prefer existing tools.
- Delivery boundary, target branch, reviewer, acceptance signal, blocking findings, merge method, and delegation availability. Default to sequential work when delegation is unavailable. Per-run delivery permissions belong in execution receipts.

Use [the project template](references/project-template.md) to update `docs/sdlc/project.md`, preserving applicable content. Mark conventions as observations until adopted; link authoritative standards. Present the concrete profile for acceptance unless those decisions are already accepted.

## Close setup gaps

Setup authorizes inspection, interview, and profile writing. Dependencies, scripts, or CI changes require a concrete implementation plan and authorization; existing authorization counts, choosing a profile alone does not. If deferred, save the accepted policy as `Status: incomplete` with each gap's next action and the original task pending. Documentation-only requests end there.

When authorized, make minimal changes, preserve workflows and gate strength, and propagate failures as nonzero exits. Hooks provide feedback; required CI and protections enforce merge gates. Verify remote enforcement where relevant and accessible; a workflow file is insufficient evidence. Prepare changes before requesting any remaining remote-settings approval.

For required CRAP, record complexity/coverage definitions, function mapping, adapter/tool versions, scope, exclusions, and applicable baseline; use fresh coverage. For required mutation, record tool/version, scope, agreed failing threshold, cache invalidation, and equivalent-mutant treatment. Empty scope or missing coverage fails configuration unless adopted policy justifies non-applicability. Basic requires neither tool unless explicitly selected.

Validate selected commands where permitted. Distinguish passing, failing, missing, and non-applicable checks, and local results from remote enforcement. Use `draft` for unaccepted decisions, `incomplete` for accepted policy with gaps, and `ready` only after acceptance, verification, and gap closure. Unavailable tools cannot pass. Once ready, resume a routed task under existing authorization; direct setup ends here.
