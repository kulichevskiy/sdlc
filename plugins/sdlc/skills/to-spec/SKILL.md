---
name: to-spec
description: "Turn an intent.md into a solution specification grounded in the codebase, with architecture, behavioral requirements, and verification decisions. Use for the design stage of the SDLC workflow."
---

Read and follow the [shared workflow contract](../setup/references/workflow.md), including its setup entry check. Resolve task artifacts from `docs/sdlc/project.md`.

# Write a specification

Read `intent.md` and inspect the relevant code, existing interfaces, domain vocabulary, architectural decisions, and documented standards. Produce a draft even if the intent is still draft, but identify unresolved upstream decisions and do not treat them as settled.

Describe the solution with enough precision to assess it before implementation:
- Requirements with stable IDs (`R1`, `R2`), each linked to intent outcomes.
- User-visible behavior, failure cases, and acceptance examples.
- Module responsibilities, interfaces, data/state changes, compatibility, and migration needs.
- Material alternatives and why the chosen architecture fits the constraints.
- Verification strategy: behavior, test interface, independent source of expected results, and substitutions for external dependencies. Reuse suitable test seams and test observable contracts rather than internal call structure. Derive expectations from requirements or worked examples, not the implementation being tested.
- Risks, open decisions, and out of scope.

Every intent outcome must be covered or explicitly identified as unresolved. Prefer established domain terms and contracts to speculative abstractions. Add file references when useful as current evidence; implementation paths and task ordering belong in tickets.

Save `spec.md` with the exact intent revision it derives from. Ask one material design question at a time, prioritizing contradictions and decisions that affect scope or architecture. Do not reopen accepted decisions or ask the user to supply facts available in the repository.

Show the solution and record acceptance against its revision. Completion requires an accepted spec with no implementation-blocking decisions; a draft does not authorize building. Stop at the requested stage.
