# Delivery specification

revision: 1
status: accepted
accepted_revision: 1
Source: intent.md revision 1
Acceptance: Agent acceptance under the user's full-send delegation, 2026-10-27; follows the accepted conversation decisions.

- R1 (O1): Add two short delivery entry skills using a single shared unattended procedure. Explicit invocation activates the mode; discussion/installation alone does not.
- R2 (O1): Mode precedence replaces stage questions, acceptance prompts, and stage-end stops; agent acceptance of downstream planning is recorded separately from user acceptance and independent code review.
- R3 (O2): Enforce distinct merge/readiness endpoints and actual remote state; preserve all verification/review/protection gates and production/data restrictions. No questions or waiting for an absent user at a genuine blocker.
- R4 (O3): Rename directory, frontmatter, discovery metadata, bundle membership, current references, and installer expectations to babysit-pr. Document stale file-installation migration without deleting unrelated skills.
- R5 (O3, O4): Review current head after each push, deduplicate pending requests, wait through ordinary pending CI/review, fix valid findings minimally, and explicitly distinguish review loops/scope creep from a clean verdict.
- R6 (O4): Include both modes in the full bundle while keeping the UI-only bundle self-contained. Update docs and aligned version metadata to 0.4.0 for the expanded skill surface and rename.

Validation: full npm test suite, native catalog/package/install-route assertions, whitespace check, independent read-only standards/spec passes and behavioral scenarios, fresh Codex review and four remote CI jobs before merge.
