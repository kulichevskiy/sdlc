---
name: implement
description: "Implement a ticket or execute an accepted SDLC ticket plan, coordinating dependencies and isolated subagents when requested. Use for execution of the file-based SDLC workflow."
---

Read and follow the [shared workflow contract](../setup/references/workflow.md), including its setup entry check. Resolve task artifacts from `docs/sdlc/project.md`.

# Implement tickets

Resolve the requested ticket or plan; verify accepted source revisions, dependencies, standards, and project verification commands. Select one requested ticket by default. When the user requests the whole plan, continue through its ready frontier until the plan is complete or progress is blocked.

Before edits, inspect branch ownership and worktree changes. Isolate the task when unrelated work would mix into the result. A ready ticket starts only after all its blockers are done and their commits are present in the working branch. Claim it in `execution.md`; after interruption, inspect worktrees, commits, and active workers before reclaiming it.

Implement the acceptance criteria with a feedback loop. For a bug, reproduce the faulty behavior before fixing it, preferably with a regression test. Run focused checks during edits and the ticket's full required verification before completion. Preserve verification strength; a needed change to a test's contract must be justified against the spec.

Follow the spec's test interfaces and independent expectations; no renewed approval is needed for tests within that strategy. Exercise real behavior, substituting external dependencies where appropriate. Avoid assertions coupled to internal calls or computed by the production algorithm: for CSV export, assert a known expected header from the requirement rather than generating it from the production column list. Verify that a regression test catches the reported symptom before the fix.

For whole-plan execution, delegate independent ready tickets to subagents when the environment permits delegation and useful coordinator work can continue alongside them. Respect any user restriction on delegation; use sequential execution for a single ticket or tightly coupled work. Each worker receives the ticket, accepted source revisions, repository instructions, owned paths, verification contract, base commit, and output expectations. Give each concurrent writer its own worktree. If isolation or delegation is unavailable, execute sequentially. Workers update only their owned code and return commits plus evidence; the coordinator owns shared planning/status files.

Independent tickets may run together when both their dependencies and write boundaries permit it. Start with at most two concurrent workers unless configured otherwise. Integrate each returned result on the coordinator branch, inspect the delta, and run the relevant integration checks. Only then mark the ticket done and release its dependents. A worker's success message alone never clears an edge.

If code reveals a material spec conflict, record it and ask the user to resolve that decision while continuing independent work. Routine implementation detail stays with the implementer. Update plan notes when execution legitimately changes, applying the shared revision rules.

At the requested scope's end, run the configured verification suite on the combined code, then use `code-review`. Fix validated blocking findings and revalidate changed code. Commit only intended files when committing is within the requested execution scope. Record evidence and remaining blockers in `execution.md`. Report completion only for the scope actually delivered. Push, PR creation, and babysitting follow the user's requested delivery scope; implementing one ticket does not authorize publishing unrelated work.
