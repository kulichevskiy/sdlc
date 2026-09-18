---
name: ui-review
description: "Review web UI source and rendered screens against an adopted UI Kit. Produce an evidence-based conformity report with proposed fixes or kit extensions, without modifying the UI or kit."
---

Read and follow the [shared UI contract](../ui-kit/references/ui-workflow.md). This reports-only skill checks kit conformity, not general UX or aesthetics.

# Review UI Kit conformity

Resolve the adopted kit, task decisions, and requested routes/screens/components or change. Ask one focused question if scope or kit is ambiguous. Missing SDLC documents do not block review; missing adopted rules or source/render access are coverage gaps.

Pin the kit revision and source snapshot under review, including relevant uncommitted content. For a diff, record its base and inspect affected consumers as needed; unrelated pre-existing issues do not expand the review into a product-wide redesign. Check whether the kit's verification still describes the current sources.

Review both boundaries:

- **Source:** shared component/style reuse, valid imports and variants, permitted composition, tokens, overrides, state handling, and responsive rules. Detect duplicated implementations even if they look identical. Do not demand a new catalog entry for ordinary valid composition.
- **Rendered UI:** open the scoped UI with available authorized browser/runtime tools and exercise the agreed relevant states/viewports. Compare it to the accepted rules and real showcase. Capture screenshots or visual annotations where they explain a finding; annotations belong in report evidence, not the product. A screenshot alone does not establish correct source reuse.

Use existing project tools. If launching, accessing a state, or rendering requires unavailable tools or project changes, record the missing check and continue useful inspection within the contract's report/evidence-only boundary.

Write findings using the [report guide](references/report.md). Missing kit rules are gaps, not invented violations. Propose conformity fixes or kit extensions without applying them.

Write only the report/evidence in the task directory, or `docs/ui-reviews/<scope>/` when none exists. Distinguish snapshots on reruns. Full conformity requires both source and rendered coverage; unavailable required checks keep the verdict incomplete even when other checks pass or find violations.

Show the report and next steps. Applying recommendations requires a separate user instruction; leave the product, kit, and environment unchanged.
