# Shared web UI workflow

## Entry and scope

The three UI skills are independently callable members of the SDLC family. Install `ui-kit`, `ui-implement`, and `ui-review` side by side, including their resources. Resolve links relative to the skill file. References to sibling skills mean the skills in this SDLC installation. In plugin mode use the host-provided SDLC namespace; if another installed skill has the same short name, follow the linked sibling file rather than the unrelated skill. Invoke a sibling with the host's skill mechanism, or read its linked SKILL.md and follow it in the current session. No particular agent, framework, connector, or subagent API is required.

Read repository instructions, an existing `docs/sdlc/project.md`, and accepted task documents when present. They continue to govern scope, verification, and permissions. Missing SDLC documents do not trigger mandatory setup, intent/spec/ticket generation, or installation of quality tooling. Keep brief task decisions/results in the existing feature directory; for standalone work, choose a small task directory using repository conventions. Do not create a parallel status system.

Support web interfaces only. Use the existing stack and authorized project tools. These skills do not install their own universal UI library or screenshot engine. When necessary tools, source access, or rendering are unavailable, name the gap and preserve useful partial results. Do not claim a completed check from source inspection alone.

## What is canonical

Discover the adopted kit before creating one: documentation, tokens, reusable source components, permitted third-party library configuration, and showcase. Prefer existing locations. If none exists, use `docs/ui-kit/index.md` as the entry point, with rules and component catalog beside it; keep production code in the project's native source structure. Resolve ambiguity between multiple kits with the user.

The kit combines accepted visual rules with actual shared implementations and a technical reference of foundation/component specimens. It does not include product screen mockups or demo application flows. Existing or subsequently built product screens and the reference use the same components and styles; creating a kit does not require creating a product screen. Documentation points to canonical source values instead of maintaining a competing set of token definitions or imitation HTML/CSS. Changes to shared components must be visible in the showcase and any existing product consumers.

Rules and catalog entries have stable identifiers so review can cite a specific agreement. Record supported variants, states, composition, responsive behavior, and accessibility/interaction decisions for the agreed scope. A copied component remains a reuse violation even if it looks correct. A shared import can still violate the kit through local overrides or unsupported use.

Ordinary composition of approved elements is not automatically a new reusable component. A new public component, variant, token, or visual rule requires discussion. Do not bypass that discussion with a private clone, arbitrary CSS value, or unregistered variant. Missing rules are gaps to resolve, not permission to invent a binding standard.

## Agreement and change

Ask one material decision at a time after inspecting facts available in the project. Existing approval for the concrete scope remains valid; do not ask again just to satisfy a ceremony. At a gap, present using the existing kit versus extending it, with the known affected consumers. User approval of an extension authorizes its agreed scope, not unrelated redesign or migration.

A screen request mentioning a new control or visual treatment is not by itself a choice to change the shared kit. Present reuse versus extension before making that shared change, unless the user has already explicitly chosen the kit extension. Reuse that choice once made.

Use [ui-kit](../SKILL.md) to create or extend the kit; use [ui-implement](../../ui-implement/SKILL.md) to build screens. A kit inferred from an existing product becomes canonical only after agreement. Migration of old screens is a separate scope; necessary extraction or changes to shared consumers must be explained and agreed.

Record a kit revision and the accepted scope. Increment the revision for material rule or public component changes and keep source pointers, examples, and verification current. States are `draft` (unaccepted decisions), `incomplete` (agreed but implementation/showcase/checks have gaps), and `ready` (agreed scope implemented and checked). Record approval against the change, not just a generic status. Capture the actual source snapshot used by verification, including relevant uncommitted content; a revision or Git HEAD alone cannot attest to a dirty tree. Source changes invalidate affected verification even if documentation still says ready.

## Review boundary

[ui-review](../../ui-review/SKILL.md) checks source and rendered UI against the adopted kit. It is not a general UX or aesthetic audit. Report violations, gaps in the kit, and unavailable evidence separately. An inaccessible route or untested required state prevents a full conformity claim.

Review may create only its report and evidence. It does not change product code, the kit, dependencies, CI, visual baselines, or acceptance status. Use available authorized runtime/browser facilities; if inspection needs project changes, report the obstacle. In interactive flows use approved test data and environments; a request for review does not authorize business mutations on live systems. Applying recommendations requires a separate user request.

At completion state the scope, artifacts, checks, and remaining gaps. Commit, publish, message others, and merge only within the user's delivery authorization. Installing or invoking these skills grants no additional external permissions.
