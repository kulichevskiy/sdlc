# Shared web UI workflow

## Entry and scope

Install the independently callable `ui-kit`, `ui-implement`, and `ui-review` side by side with their resources. Resolve links relative to the skill file and siblings within this SDLC installation. Use the host's SDLC namespace/invocation mechanism, or read the linked SKILL.md; never substitute an unrelated same-named skill. No particular agent, framework, connector, or subagent API is required.

Follow repository instructions and existing project policy (`docs/sdlc/project.md`) and accepted task documents for scope, verification, and permissions. Missing documents require no setup, document chain, or quality-tool installation. Record decisions/results in the existing feature directory or a small standalone task directory under repo conventions, without a parallel status system.

Support web interfaces using the existing stack and authorized tools, not an imposed library or screenshot engine. Report unavailable tools/source/rendering and preserve useful partial results; source inspection alone cannot complete a rendered check.

## What is canonical

Discover the adopted kit: docs, tokens, shared components, permitted third-party configuration, and showcase. Prefer existing locations; otherwise use `docs/ui-kit/index.md` with neighboring rules/catalog and code in the project's native structure. Resolve ambiguous kit selection with the user.

The kit combines accepted rules, shared implementations, and technical foundation/component specimens. Product mockups and demo flows are outside its scope. The reference and any product consumers use the same components/styles; no product screen is required. Docs point to canonical sources, without competing token definitions or imitation HTML/CSS. Shared changes must appear in the showcase and existing consumers.

Give rules/catalog entries stable IDs and record agreed variants, states, composition, responsive behavior, and accessibility/interactions. Visual similarity does not excuse copied components; shared imports do not excuse overrides or unsupported use.

Ordinary approved composition needs no new component. New public components, variants, tokens, or visual rules require discussion, never bypassed with clones, arbitrary CSS, or unregistered variants. Undefined rules are gaps, not binding standards.

## Agreement and change

Inspect project facts, then ask one material decision at a time. Reuse existing scope approval. At a gap, present reuse versus extension and affected consumers; extension approval covers only that scope.

A requested control or visual treatment alone does not authorize changing the shared kit. Resolve reuse versus extension before that change unless the user already chose extension.

Use [ui-kit](../SKILL.md) for kits and [ui-implement](../../ui-implement/SKILL.md) for screens. An inferred kit becomes canonical after agreement. Explain and agree on extraction or changes to shared consumers; legacy migration is separate.

Record revision, accepted scope, and approval of the concrete change. Increment revision for material rule/public-component changes; update sources, examples, and verification. States: `draft` (unaccepted), `incomplete` (agreed with implementation/showcase/check gaps), `ready` (agreed, implemented, checked). Verification identifies the actual snapshot, including relevant dirty content; HEAD/revision alone is insufficient. Source changes invalidate affected evidence despite any old ready label.

## Review boundary

[ui-review](../../ui-review/SKILL.md) checks source and rendered UI against the adopted kit. It is not a general UX or aesthetic audit. Report violations, gaps in the kit, and unavailable evidence separately. An inaccessible route or untested required state prevents a full conformity claim.

Review may create only its report and evidence. It does not change product code, the kit, dependencies, CI, visual baselines, or acceptance status. Use available authorized runtime/browser facilities; if inspection needs project changes, report the obstacle. In interactive flows use approved test data and environments; a request for review does not authorize business mutations on live systems. Applying recommendations requires a separate user request.

At completion state the scope, artifacts, checks, and remaining gaps. Commit, publish, message others, and merge only within the user's delivery authorization. Installing or invoking these skills grants no additional external permissions.
