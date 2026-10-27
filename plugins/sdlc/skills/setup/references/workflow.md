# Shared workflow contract — v4

## Mandatory setup entry check

This entry check governs the seven core skills: setup, capture-intent, to-spec, to-tickets, implement, code-review, and babysit-pr. The two delivery modes, full-send and full-stop, also use this contract. The three standalone UI skills follow the [UI contract](../../ui-kit/references/ui-workflow.md), without mandatory setup or the full document chain; existing project policy still applies.

Before any core SDLC stage except setup itself, read `docs/sdlc/project.md`. If it is absent, draft, incomplete, or demonstrably unusable, follow [setup](../SKILL.md) first. Remember the original requested stage and task. Resume it after the profile is ready, retaining the user's existing task authorization. An unfinished setup leaves the original task pending with a concrete gap report; do not silently fall back to assumptions.

Reuse accepted answers. A ready profile does not trigger another interview on each invocation. An older profile without these status names can be reused if it records accepted policy, usable commands, and closed setup gaps; normalize the status without reopening settled decisions. If it is unclear whether the old profile meets those conditions, repair only the missing information. Read-only requests remain read-only: if setup needs writes or decisions outside the allowed scope, report that specific blocker.

## Unattended delivery modes

When the user explicitly requests `full-send` or `full-stop` for a task, follow the [unattended delivery procedure](delivery.md) across all remaining stages. The user is away: its delegated acceptance, no-question behavior, verification permissions, and endpoint rules take precedence over interactive prompts and stage-end stops in this contract and individual stage skills. Accept downstream planning revisions within already accepted decisions, recording agent acceptance under that delegation. Outside these modes, the ordinary acceptance and permission rules below apply. Discussing or installing a mode does not activate it.

## Agent capabilities

Install the full `sdlc` bundle (seven core skills, two delivery modes, and three UI skills) side by side, including references. The `sdlc-ui` bundle contains only the three UI skills and their self-contained shared resources. Resolve linked files relative to the skill file, not the repository working directory. References to sibling skills mean the skills in this SDLC installation. In plugin mode use the host-provided SDLC namespace; if another installed skill has the same short name, follow the linked sibling file rather than the unrelated skill. Use the host's skill invocation mechanism when available; otherwise read the linked `SKILL.md` and follow it in the same session. No particular connector, CLI, or subagent API is required by the package. Use available authorized equivalents for Git and remote PR operations. If a required capability is unavailable, record the concrete blocker instead of inventing a tool or a successful result.

Delegate only when allowed by the host, user, and project. Otherwise execute sequentially. Reviews without independent subagents use separate passes and disclose their limited independence; do not claim independent approval of your own implementation. Installing skills does not install development tools or grant execution permissions.

## Sources of truth

The target Git repository owns work artifacts. Skills are reusable procedures; project policy lives in `docs/sdlc/project.md`. Follow that profile's artifact root (default `docs/`) and change-directory pattern (default `feat-{slug}`). `capture-intent` proposes the task slug; all later stages reuse it. The default layout is:

```
docs/feat-{slug}/
  intent.md
  spec.md
  plan.md
  tickets/T01.md
  execution.md
  review.md
```

Use a short descriptive lowercase kebab-case slug. Reuse an existing directory when continuing the same task; for a different task with a colliding slug, propose a distinct slug before writing. Preserve a user-supplied directory override and existing artifact locations unless migration is requested. Project-wide configuration stays in `docs/sdlc/project.md`, outside any single feature.

Create files when their stage needs them. Ticket files are the canonical task status; execution.md holds ownership, integrated commits, verification receipts, PR linkage, and the next action. Do not maintain a second task-status board. Default to a single integration branch/PR per change; ticket done means integrated and verified, not merged to main.

## Revision and acceptance

Give intent, spec, and plan an integer `revision`, `status: draft | accepted | superseded`, and `accepted_revision` (empty until accepted). Record a short acceptance note identifying the user's decision. References to upstream artifacts include path and revision. Increment revisions for material content changes; formatting and receipt updates do not create a new design revision. Never mark a revision accepted just because a prior version was accepted.

The user's accepted decisions in the current conversation count; avoid duplicate approval prompts. Stage skills can save drafts immediately. Implementation requires accepted intent/spec/plan applicable to its scope. A single explicit acceptance can cover several concrete artifacts shown together. Broader permission to implement does not resolve a contradictory product requirement.

If an upstream revision changes, assess downstream impact before dependent work proceeds. Preserve completed work and receipts. Affected artifacts become draft until reconciled; unaffected downstream artifacts may reference the new revision with a recorded reason. Changes to scope, public contracts, or acceptance criteria require the user's decision unless already covered by authorization. Routine implementation adjustments within an accepted spec can be recorded in plan notes without restarting design approval.

## Ticket state

Use `draft`, `ready`, `running`, `blocked`, `done`, or `superseded` in each ticket. `blocked_by` is a list of stable ticket IDs. Ready means the ticket is accepted for execution; scheduling additionally requires every blocker done and integrated into the worker's base. Missing references and cycles are errors.

Only the coordinator writes shared status and planning artifacts during parallel execution. A ticket becomes done after its criteria pass and its result is integrated and checked. A blocked ticket records the concrete obstacle and next action; independent ready work can continue. On resume, reconcile statuses with actual code, commits, workers, and evidence before dispatching.

## Verification receipts

Record check name, command, scope, baseline where relevant, tool/policy version, tested commit or tree snapshot, result, and evidence path or CI URL. Logs must follow repository data-handling rules. Distinguish pass, fail, pending, unavailable, and explicitly justified not-applicable. Skipping a required check is not passing it.

Local evidence may describe an uncommitted tree; final PR gates must attest to the current remote head or its CI merge candidate. New code/tests/check configuration invalidate affected evidence. A receipt-only commit may retain evidence only when the checked input tree is demonstrably unchanged and repository policy permits this; remote required checks still govern the current PR head. Do not endlessly rewrite committed receipts solely to mention their own commit SHA.

The accepted project profile defines all mandatory gates and exact scopes, including Basic/Strict overrides and justified non-applicable checks. Follow the setup entry check before starting a stage. Once setup is ready, later failing project checks are task verification failures, not a reason to repeat onboarding or renegotiate thresholds. No skill may lower thresholds, widen exclusions, or remove requirements to make its own work pass.

## Standards and scope

Repository instructions and adopted standards govern. Distinguish documented rules, observed conventions, and general review judgments. A reviewer cites the rule or explains the concrete failure scenario. Review task fulfillment against both intent outcomes and spec requirements.

Each invocation performs the requested stage/scope. Follow established authorization for local changes, commits, publishing, communication, and merge. Installing skills grants no external permissions. An explicit request for unattended delivery grants only the permissions defined in that mode; other invocations retain the ordinary task authorization boundary. Continue authorized delivery without asking for the same permission again. Preserve repository-specific browser and secret-handling restrictions.
