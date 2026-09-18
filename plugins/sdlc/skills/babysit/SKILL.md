---
name: babysit
description: "Drive an SDLC pull request through CI, review feedback, fixes, and merge when authorized. Use when asked to babysit a PR or carry it through to merge."
---

Read and follow the [shared workflow contract](../setup/references/workflow.md), including its setup entry check. Resolve task artifacts from `docs/sdlc/project.md`.

# Babysit a pull request

Resolve the PR, target branch, current head, intended scope, accepted artifacts, required checks, review policy, and merge authorization. A request to take this PR through merge authorizes merge once the agreed gates pass. A request only to fix or review it does not. Preserve existing authorization; do not ask again after it is given.

Inspect the PR body/diff, check runs, review decisions, issue comments, review comments, unresolved threads, and mergeability. Use the actual remote state; local success and old bot reactions do not establish current readiness. Preserve unrelated work using an isolated worktree where needed.

Repeat until the requested endpoint:
1. Classify failed checks and findings. Reproduce actionable findings; fix the smallest correct layer. For an invalid finding, record evidence and use the repository's resolution process. Do not weaken a test, quality threshold, or review policy to clear the gate.
2. Run the relevant local checks, update execution evidence, commit and push the scoped fix. Resolve threads only after their disposition is supported. Refresh required review for the new head using the configured reviewer. Post review-trigger comments only when the user has authorized this communication; otherwise complete local review and expose that specific remaining gate.
3. Poll current checks, threads, review results, and merge state with a moderate cadence (30-60 seconds unless otherwise requested). Keep the user informed. A pending check stays pending; skipped/neutral results count only when the agreed policy explicitly permits them.
4. Handle upstream conflicts by inspecting both sides and preserving the accepted behavior. Re-run checks and review after integration; do not blindly choose either side.
5. Immediately before merge, verify the current head matches the checked and reviewed head, required checks and approvals pass, blocking threads are resolved, and the accepted scope remains intact. Merge through the repository's normal protected path with an expected-head guard when available. Never bypass gates.

After merge, verify the remote PR reports merged and its merge commit is on the target branch. Handle squash/rebase semantics without requiring the original branch commit to be an ancestor. Report PR URL and merge commit. Verify deployment only if deployment was included in the request.

If merge is not authorized, stop at a concrete ready-to-merge result and ask only for that final action. If an external gate is unavailable, a new material decision is needed, or the same failure persists after three distinct attempted fixes, save the current head, evidence, blocker, and next action in `execution.md`; report the obstacle rather than looping indefinitely. Ordinary pending CI is not a failed fix attempt. Resume by refreshing remote state and these receipts, not replaying prior actions.
