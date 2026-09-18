---
name: to-tickets
description: "Turn an SDLC specification into a file-based implementation plan with small verifiable tickets and explicit dependencies. Use to prepare an accepted spec for execution."
---

Read and follow the [shared workflow contract](../setup/references/workflow.md), including its setup entry check. Resolve task artifacts from `docs/sdlc/project.md`.

# Plan implementation tickets

Read intent and spec, verify their revisions and acceptance, then inspect enough code to identify integration points and test commands. Drafting may proceed before acceptance; tickets stay draft until their prerequisites are accepted.

Write `plan.md` with the ordered approach, integration strategy, risks, and coverage map from every requirement ID to ticket IDs. Use the shared delivery boundary unless the user specified another.

Write one `tickets/TNN.md` per independently verifiable slice. Include:
- Stable ticket ID, title, status, and `blocked_by` IDs.
- Exact spec and plan revisions.
- Requirement IDs covered and concrete behavior to deliver.
- Acceptance criteria and tests/checks that prove them.
- Relevant current code locations, constraints, and expected ownership boundaries.

Prefer small vertical slices that fit a fresh session. Use sequential expand/migrate/contract steps for broad mechanical changes that cannot remain green as independent vertical slices. Add an integration ticket when combined behavior requires proof beyond individual tickets.

Check all dependency references exist, have no self-edges or cycles, and represent genuine prerequisites. Distinguish semantic dependencies from overlapping files: file overlap can require serialization even without a dependency edge. Verify every spec requirement has coverage.

Present the breakdown and material tradeoffs once. Apply existing approval if it covers this concrete plan; otherwise get acceptance of the breakdown. Mark accepted tickets ready and record their source revisions. Re-running this skill updates matching IDs rather than duplicating tickets; retain completed work and explicitly supersede obsolete tickets. Stop before executing the plan unless execution is already requested.
