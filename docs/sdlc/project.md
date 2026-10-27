# Project SDLC profile

Status: ready
Policy acceptance: Agent acceptance under the user's explicit full-send delegation on 2026-10-27; derived from CONTRIBUTING.md, package.json, and .github/workflows/test.yml.
Verification profile: Basic adapted to a skill/installer package; preserve the existing suite without adding unrelated tools.
Artifact root: docs/
Change-directory pattern: feat-{slug}
Task source of truth: Git files and accepted user decisions
Delivery: one integration branch/PR per change
Delegation: independent read-only review passes where available; implementation sequential unless separately useful and authorized

## Standards

[CONTRIBUTING.md](../../CONTRIBUTING.md) governs English skill sources, metadata, packaging, and verification. [The shared workflow](../../plugins/sdlc/skills/setup/references/workflow.md) governs task receipts and delegated acceptance. Keep package and all three plugin manifest versions aligned.

## Verification

| Gate | Requirement | Command/scope | Pass condition |
| --- | --- | --- | --- |
| Installer, integration, packaging, metadata | Required | `npm test`; all tests including interactive shell cases | Every test passes, no skipped required checks |
| CI compatibility | Required | Existing Installer tests matrix: Ubuntu/macOS, Node 18/22 | All four jobs pass on the PR head or its CI merge candidate |
| Whitespace | Required | `git diff --check` for the task diff | No errors |
| Skill behavior | Required for workflow changes | Read-only scenario evaluation against accepted requirements | No blocking behavioral gaps |
| Lint/typecheck | Not applicable to this change | No lint or TypeScript configuration exists; metadata and installer assertions remain required | No new unrelated tooling |
| Browser/UI E2E | Not applicable to this package change | No product UI/runtime change | Installer end-to-end paths remain covered by npm test |
| CRAP/mutation | Not required | Existing Basic policy has no such tooling or thresholds; no production algorithm changed | Do not claim these checks ran |

Fast feedback: `node --test test/skill-metadata.test.mjs` and `git diff --check`.
Pre-merge: `npm test`, current remote CI, local review passes, and configured remote reviewer.
Prerequisites: Node >=18, Python 3 for interactive terminal tests, tar/curl and a usable temporary terminal; installer tests isolate their home/directories. Use host-approved execution when sandbox restrictions prevent /dev/tty access.

## PR gates

Remote: kulichevskiy/sdlc; target: main.
Reviewer: Codex requested with `@codex review` on every pushed head; a completed current-head "no major issues" result (or explicit equivalent completion) with no blocking findings. An acknowledgement/eyes reaction alone is not completion.
Review communication: authorized by this run's explicit full-send request; future runs follow their own authorization.
Blocking findings: resolve defects minimally; document invalid/out-of-scope findings with evidence. Do not treat unresolved scope disputes as approval.
Merge: squash through the normal GitHub path with expected-head guard; all matrix jobs and review gates above must pass.
Merge authorization: per run, recorded in execution.md; never inferred merely from installing skills.
Remote enforcement observed 2026-10-27: main unprotected, no applicable branch rules; these are checked delivery gates, not claims of enforced branch protection. Do not change remote settings as part of this task.

## Setup gaps

None. The existing suite passed 142/142 in this session before version/profile changes; validate the final commit and remote matrix before merge.
