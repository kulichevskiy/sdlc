---
name: ui-kit
description: "Build a complete technical web UI Kit section by section in one live reference panel, iterating on user feedback before advancing. Use for new design foundations or adopting an existing kit, not product screen mockups."
---

Read the [shared UI contract](references/ui-workflow.md). This skill is a standalone entry point in the SDLC family; it does not require SDLC setup or an intent/spec/ticket chain. Respect existing project policy and accepted task decisions.

# Create or extend a UI Kit

The deliverable is a technical reference for subsequent design and implementation: accepted rules, canonical tokens/shared components, and a browsable reference page with live specimens. Do not create product screen mockups, landing pages, dashboards, or demo application flows as part of this skill. A product name or scenario provides design context, not a request to build that product. Screen implementation belongs to [ui-implement](../ui-implement/SKILL.md) when separately requested.

Inspect the project's stack, component libraries, tokens, styles, existing showcases, and UI documentation before choosing new files or tools. Reuse the established kit and stack. If several kits could apply, resolve the task's scope with the user. For a new project without a stack, propose and agree on one before implementation.

For an existing product, inspect representative screens and their source implementations first. Show the user the actual variants and differences, with rendered examples where available. Observed variants are candidates, not automatically the standard. Interview the user to select the canonical set. Do not migrate old screens as a side effect; agree on any narrow extraction that must change existing callers.

For a new kit, briefly outline the complete foundation scope in the [showcase contract](references/showcase.md), then start with Colors. Do not interview about every section upfront or generate the whole kit before showing it. Product context informs visual direction and component selection; it must not reduce the foundations to the handful of values used by one screen. A complete foundation does not require an exhaustive library of domain-specific components. For a scoped extension, preserve the existing foundation and run the same loop only for the accepted change.

## Build one section at a time

Use one persistent reference panel. The default order is Colors, Typography, Icons, Sizing & spacing, Layout, Surfaces, Interaction & accessibility, then Components and states. Adapt the order to explicit user preferences and existing accepted sections.

For each section:

1. Ask whether the user has ideas/preferences or would like a proposal. For Colors: “Do you have colors in mind, or would you like me to propose a palette?” For Typography: “Do you have fonts or a typographic direction in mind, or should I propose one?” Reuse answers already given; ask one material question at a time.
2. Use those preferences, or develop a concrete recommendation when invited. Create/update only this section's actual tokens, styles, or components and add its live specimens and specifications to the panel. A request to propose authorizes a draft for review, not its adoption or later sections. Keep earlier accepted sections visible and unchanged. Create and serve the panel with the first section; do not wait until the interview is complete.
3. Check the updated section, give its URL/anchor, and ask whether the user likes it or what should change. The user reviews a rendered result, not just a verbal description. If rendering is unavailable, state the obstacle and do not imply the visual review happened.
4. Apply feedback to this same section in the same panel and show it again. Stay on this section until the user accepts the displayed result. Silence, permission to propose, and a successful technical check are not acceptance. Do not build later sections while waiting for feedback.
5. Record the accepted decision and section status, then start the next section's preference question. Preserve accepted sections as the panel grows. On resume, return to the pending section and feedback instead of restarting the interview. Reopen an earlier decision only when requested or when a concrete dependency requires a change; explain the impact and get feedback on the changed specimen.

For example: colors preference → palette rendered in the panel → feedback and palette revisions → colors accepted → typography preference → text specimens added beside the accepted colors → feedback and revisions → typography accepted → icons. Repeat through the agreed scope. Do not switch to an upfront questionnaire followed by a single final reveal.

## Implement and verify the reference

Within each section's loop, create or adapt the actual shared implementation in the project's stack. The reference and any product consumers must import/use those same components and style sources; no product screen is required to establish reuse. Keep unaccepted candidates from changing existing product consumers, using the project's scoped preview/theme mechanism where needed. A standalone HTML imitation of React or other framework components does not meet this contract. Use the existing showcase when suitable; otherwise create a page served by the project's tools. Give the user its URL and launch command and reuse that panel throughout the interview.

Read and apply the [showcase contract](references/showcase.md) before building the reference page. Dedicated Colors, Typography, Icons, Sizing & spacing, Layout, Surfaces, and Interaction & accessibility sections accompany isolated component/state specimens. Each section supplies technical identifiers, actual values, usage rules, source pointers, and visual examples. Layout specimens are annotated grids and neutral blocks at desktop/mobile widths, never product screen mockups. The reference page opens on its index/foundations, not on a product demo. Brand personality may inform tokens, but cannot replace technical labels with themed names or promotional copy.

Record decisions and source pointers using the [kit documentation guide](references/kit-docs.md), adapting it to existing conventions. Verify the shared implementation and rendered showcase using project checks and available browser tools. Inspect every required reference section, its token/value agreement with source, and actual desktop/mobile layout examples; a successful build or attractive screen alone does not establish completeness. Report which states and viewports were checked and any unavailable checks. Mark the kit ready only when the agreed scope is implemented, documented, shown, and verified.

For an extension, explain the missing capability, proposed component/variant/rule, and known affected consumers before changing the kit. Reuse existing authorization for that exact change. Then update shared sources, showcase, catalog, rules, revision, and relevant verification together. If a check or implementation step fails, record the remaining gap; an old ready status is not evidence for changed code. Return to the original screen task when this skill was invoked to unblock it.
