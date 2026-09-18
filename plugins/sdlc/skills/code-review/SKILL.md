---
name: code-review
description: "Review an SDLC change against its original intent, accepted specification, and documented engineering standards. Use for independent review of a ticket, change, or PR."
---

Read and follow the [shared workflow contract](../setup/references/workflow.md), including its setup entry check. Resolve task artifacts from `docs/sdlc/project.md`.

# Review code

Pin the reviewed base and head to commit SHAs. For a PR, resolve its actual target branch and merge base. For uncommitted work, record the tracked diff and intended untracked files as the review snapshot. Review that snapshot, not a moving branch name.

Read intent, spec, plan, relevant tickets, project standards, and verification evidence. For a standalone PR without these files, recover the task from its issue/user request and report missing sources explicitly. Do not manufacture requirements or give a Spec pass when no task source is available.

Run separate review passes. Use independent read-only subagents when permitted; otherwise make separate passes and disclose that independence was limited.

1. **Intent and Spec:** Does behavior meet the original outcomes as well as detailed requirements? Look for missing/partial outcomes, wrong edge-case behavior, contradictions, and scope expansion. Map findings to outcome/requirement IDs and code evidence. Verify tests exercise the claimed behavior through suitable interfaces, with expected results independent of the implementation. Flag tests that repeat its algorithm or share an incorrect assumption with it; passing coverage or mutation gates alone does not prove the requirement.
2. **Standards and correctness:** Read applicable written standards and ADRs. Look for logic errors, regressions, security defects, and violated architectural contracts. Cite the rule for a documented violation. Treat complexity, duplication, naming, and other general design heuristics as explained judgments, not invented project policy. Do not repeat findings already enforced by tooling.

For a ticket review, assess that ticket's promised slice and detect damage to neighboring behavior; do not flag later planned tickets as missing work. For a whole-change review, cover every requirement.

Write `review.md` with reviewed snapshot, source revisions, evidence references, separate verdicts for each pass, and findings. Each finding has severity, location, triggering condition, consequence, and its supporting rule or requirement. Distinguish blockers, suggestions, and unavailable evidence. Missing required checks prevent a ready verdict; tests alone do not establish intent fulfillment.

This skill reports findings and does not fix code or approve its own implementation. A clean result is scoped to the reviewed snapshot. After code changes, refresh the affected review and verification; never reuse an old clean verdict as approval of a new head.
