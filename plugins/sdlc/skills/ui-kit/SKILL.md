---
name: ui-kit
description: "Build a complete technical web UI Kit section by section in one live reference panel, iterating on user feedback before advancing. Use for new design foundations or adopting an existing kit, not product screen mockups."
---

Read and follow the [shared UI contract](references/ui-workflow.md). This standalone entry point requires no SDLC setup or document chain.

# Create or extend a UI Kit

Deliver accepted rules, canonical tokens/shared components, and a browsable technical reference with live specimens. Product context informs design; product screens and demo flows are outside this skill and belong to [ui-implement](../ui-implement/SKILL.md) when requested.

Inspect and reuse the project's stack, libraries, tokens, styles, showcase, and UI docs. Resolve ambiguous kit selection with the user. For a project without a stack, agree on one before implementation.

For an existing product, inspect representative screens and their sources. Show actual variants and differences, rendered where available, and interview the user to select the canonical set. Observed variants are candidates, not standards. Agree on extraction affecting existing callers; legacy migration is a separate scope.

For a new kit, outline the complete foundations in the [showcase contract](references/showcase.md), then start with Colors. Foundations must serve future screens, not only one scenario; domain-specific components need not be exhaustive. For an extension, preserve the foundations and run the section loop only for the agreed change.

## Build one section at a time

Use one persistent reference panel in this default order: Colors, Typography, Icons, Sizing & spacing, Layout, Surfaces, Interaction & accessibility, Components and states. Adapt to explicit preferences and already accepted sections.

For each section:

1. Reuse known preferences; otherwise ask whether the user has preferences or wants a proposal. Ask one material question at a time.
2. Build only this section's shared tokens, styles, or components and add its live specimens and specifications to the same panel. Serve it from the first section; keep accepted sections visible and unchanged. Permission to propose covers this draft only.
3. Check the section, share its URL/anchor, and request feedback on the rendered result. If rendering is unavailable, report the gap; visual review remains incomplete.
4. Revise and show this section until the user accepts the displayed result. Silence, permission to propose, and passing checks are not acceptance. Build no later sections while awaiting feedback.
5. Record acceptance and section status, then ask about the next section. On resume, continue pending feedback. Reopen accepted sections only at the user's request or for a concrete dependency; explain the impact and obtain feedback on the revised specimen.

## Implement and verify the reference

Within each loop, implement shared sources in the project's stack and render them in its existing showcase or a page served by project tools. The reference and any product consumers must use the same sources; a standalone HTML imitation is insufficient. Isolate unaccepted candidates from existing consumers using scoped previews/themes. No product screen is needed. Provide the panel's stable URL and launch command.

Read and apply the [showcase contract](references/showcase.md) before building. It defines the required sections, source-linked values, specimens, and desktop/mobile layout examples. Open on the technical index/foundations, with neutral component specimens rather than product mockups or promotional copy.

Record decisions using the [kit documentation guide](references/kit-docs.md). Run project checks and the showcase completion check, including source/value agreement and rendered desktop/mobile examples. Report checked states/viewports and unavailable checks. Mark ready only when the agreed scope is accepted, implemented, documented, shown, and verified.

For an extension, agree on the missing capability, proposed component/variant/rule, and affected consumers before changing sources; existing authorization counts. Update sources, showcase, catalog, rules, revision, and verification together. Record remaining gaps instead of relying on an old ready status. Resume the original screen task when unblocked.
