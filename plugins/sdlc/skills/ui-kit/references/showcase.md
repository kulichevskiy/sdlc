# Build the technical UI Kit reference

The UI Kit is a technical document for a person or another agent building future screens. Its visual reference contains specifications and live specimens derived from canonical shared sources. Use a simple documentation shell: title/scope, section navigation, then the sections below. Open on this reference, never a demo application. Do not build product mockups, marketing heroes, dashboards, business flows, or decorative product illustrations. Inspect existing product screens as evidence when adopting a kit; they are not the kit deliverable.

Adapt headings to the user's language while preserving technical identifiers. An existing component explorer can host linked sections instead of one long page. In the completed kit, every agreed foundation below must be directly discoverable in the rendered reference, not hidden in CSS or only mentioned in Markdown. Propose this complete foundation for a new kit; document explicitly agreed exclusions instead of silently shrinking it to one screen's needs. Extend an adopted kit within the agreed scope without rebuilding unrelated sections.

Build this reference incrementally in one persistent panel using the section feedback loop in [ui-kit](../SKILL.md). Show the current draft and all accepted sections together. Navigation may list upcoming sections as planned, but do not prefill them with invented decisions or specimens. Mark the current section as awaiting feedback and accepted sections as accepted; keep technical verification gaps separate from visual acceptance. Add the next section only after acceptance of the current rendered result. Keep a stable URL and section anchors across iterations; feedback can happen in conversation without building a separate approval application.

For each specification expose its token/class/import, actual value with units where relevant, intended use, and a specimen. Derive displayed values from the canonical sources instead of maintaining a second token registry. Neutral example text and labeled blocks keep attention on reusable rules.

## 1. Colors

Provide palettes for `primary`, `neutral`, `success`, `failure`, and `warning`, plus `secondary` when it serves a distinct purpose. Explain an omitted secondary palette. Preserve adopted source naming: an existing `error` or `danger` token can map to the documented `failure` role without a rename or duplicate palette.

Every included palette needs a coherent light-to-dark scale with both tints and shades, not just a base swatch or the colors currently used by one screen. Propose a consistent numbered scale (for example 50–950), identify the base step, and show every step with its identifier, actual value, and swatch. Agree on the scale rather than hardcoding the example numbering for every project.

Separate primitive palette values from semantic aliases for text, backgrounds/surfaces, borders, actions, focus, and status. Show intended foreground/background pairs, their measured contrast, and which roles suit each pair. Include default, hover, pressed, selected, disabled, and subtle status treatments where supported. A full palette does not imply that every shade is suitable for text or has to appear in a component. Status meaning also needs text or an icon.

In brownfield, map roles to adopted tokens and preserve source names/imports unless a migration is authorized. Identify missing palettes or scale steps and resolve them through the interview; do not silently adopt invented values. For supported themes, show their semantic mappings and pairings; do not add a theme without agreement.

## 2. Typography

Document font families, source/loading method, available weights/styles, fallbacks, and required language/glyph coverage. Provide the actual named size scale, with units and desktop/mobile values or fluid-sizing rules, then map it to text roles. For each role show its source token/class, family, size, weight, line-height, letter-spacing, intended use, and rendered specimen.

Include heading levels h1–h6, lead and body paragraphs, small/supporting text, labels/captions, ordered and unordered lists, and links. Demonstrate emphasis/strong text and inline code or quotes where supported. Explain semantic heading levels separately from visual size roles. Show paragraph/list spacing, indentation, link states, readable line length, and wrapping with realistic neutral text. Use the actual shared typography definitions, including prose/list/link styles.

A font name, a decorative heading, and a single body sample do not establish a type system.

## 3. Icons

Name the adopted icon family/library, package or asset source, import convention, and available style (such as outline or filled). Show a labeled specimen set with actual export/asset names, the size scale, stroke widths, alignment, and color inheritance. Use one coherent family unless an exception is agreed.

Specify icon-only control labels, decorative icon handling, icon-plus-text gaps, and the distinction between glyph size and interactive hit area. Render specimens from the same assets/components future screens will import. If no icon system exists, propose one during the interview rather than substituting emoji or ad hoc symbols.

## 4. Sizing & spacing

Show the spacing scale as named tokens with numeric values/units and measurable visual specimens. Map steps to inline gaps, control padding, container padding, section spacing, and page gutters. A claim such as “4px rhythm” without an actual scale and usage rules is insufficient.

Document control heights/sizes, icon dimensions, touch/hit areas, and relevant width constraints. Distinguish spacing, visible control size, and hit area. Show responsive changes and examples from the shared sizing/spacing sources; avoid separate literal values in specimens.

## 5. Layout — desktop and mobile

Specify viewport breakpoints or container-query thresholds, container widths/max-widths, column counts, gutters, gaps, alignment, and vertical spacing. Explain fluid versus fixed behavior, stacking, reading order, and overflow at transitions. Document supported primitives such as container, stack, cluster/row, and grid, with usage/import examples.

Render annotated desktop and mobile specimens of the same grid or primitive using neutral numbered blocks. Label viewport width, columns, gutters, and gaps. These are layout specifications, not miniature product screens: no business content, product navigation, cards of invented records, or complete page compositions.

Use real shared layout primitives in sized live previews or an adjustable viewport. Embedded previews must respond to their own viewport/container; a scaled-down desktop diagram labeled “mobile” is insufficient. Verify the reference itself at desktop and mobile widths too. Keep the documentation shell separate from the layout rules being demonstrated.

## 6. Surfaces, borders, and elevation

Document radii, border widths/styles, surface levels, shadows/elevation, and overlay stacking conventions. Show named tokens, actual values, usage guidance, and isolated specimens. Include explicit flat/no-shadow choices when appropriate. Use semantic color aliases from the color section instead of inventing another surface palette.

## 7. Interaction & accessibility

Specify focus treatment, hover/pressed/selected/disabled conventions, validation/status messaging, keyboard behavior, and touch targets. Document motion duration/easing and reduced-motion behavior where motion is used; an explicit no-motion rule is also valid. Link color contrast rules and component-specific behavior to their specimens. Mark unsupported or undecided behavior as a gap.

## 8. Components and states

After the foundations, show isolated reusable components in a catalog with neutral labels and sample data. Propose a practical base set such as buttons, text links, form controls and labels/help/error messages, selection controls, badges, alerts, and containers/dividers; agree on additional navigation, overlays, tables, or domain-specific components as needed. Do not turn a request for a complete foundation into an exhaustive widget library.

For each adopted component give source/import/API pointers, a valid usage example, supported variants/sizes, applicable rules, and state specimens. Show meaningful default, hover/focus/pressed, selected, disabled/loading, and validation states where supported. Label simulated visual states and verify actual interactive behavior when applicable. A small icon-with-label or field-with-help example may explain a component's API; do not assemble a signup screen or another product page to demonstrate reuse.

## Completion check

Verify each section against canonical sources: all required palettes with tints and shades, the secondary decision, semantic mappings, font/type specifications and text specimens, icon system, spacing/sizing scales, desktop/mobile grid rules and neutral previews, surface/elevation tokens, interaction rules, and the agreed component/state catalog. Check actual values, font rendering, contrast pairs, responsive behavior, and relevant keyboard/state behavior with available tools.

Reject a product mockup or demo flow as the kit result even if it imports shared components. A future screen author must be able to choose tokens, text styles, icons, dimensions, layouts, and components from the reference without reverse-engineering a product screen. Report unfinished decisions and unavailable checks; only mark the accepted scope ready once implemented, documented, rendered, and verified.
