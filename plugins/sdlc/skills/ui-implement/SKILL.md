---
name: ui-implement
description: "Build production web screens from an adopted UI Kit in the project's stack. Use when creating or changing UI from shared components, with user agreement before extending the kit."
---

Read and follow the [shared UI contract](../ui-kit/references/ui-workflow.md). This standalone entry point requires no full SDLC chain.

# Build web screens

Inspect the application, kit, shared components, routing, data interfaces, and task decisions. Resolve screen requirements one material question at a time: purpose, users, actions, data, navigation, loading/empty/error states, and responsive behavior. Agree on scope before building; reuse accepted answers and authorization.

If the relevant kit scope is absent, unadopted, or unusable, follow [ui-kit](../ui-kit/SKILL.md) to prepare what this task needs, then resume it with existing decisions. Avoid placeholder SDLC documents or an unrelated library.

Map the screen to approved components, tokens, variants, and composition rules. Implement ordinary valid composition directly. For a missing capability, present reuse versus extension before dependent work; continue independent work while awaiting the decision. Do not substitute clones or arbitrary styling.

Apply approved extensions through ui-kit before dependent UI work. Explain effects on existing consumers; legacy migration remains a separate scope.

Implement working UI in the application's existing stack and structure, including routes, interactions, and agreed data integration. In React, use the actual shared React components; a standalone mockup is not the result. Do not invent backend contracts. If an API or dependency is unavailable, report it and agree on the integration boundary; clearly label fixtures and unfinished behavior.

Run relevant project checks and inspect the rendered screen in the agreed states and viewports. Verify both reuse in source and the actual appearance/behavior; common imports alone do not prove conformity. If rendering or a required check is unavailable, report incomplete verification. Record changed artifacts, kit revision/source snapshot, checks, and remaining gaps in the task directory.

Finish with [ui-review](../ui-review/SKILL.md) on the implemented scope. Use a read-only independent pass when permitted and useful, otherwise disclose self-review. Present its report; this review step does not authorize applying its recommendations. User-requested follow-up fixes are a separate scope, while ordinary implementation failures found before the report can be corrected within the original task.
