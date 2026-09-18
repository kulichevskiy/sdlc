# Build the technical UI Kit reference

Build a technical reference for future screen authors, with specifications and live specimens from canonical shared sources. Use a documentation shell: title/scope, navigation, then the sections below. Open on the reference, never a product demo. Existing screens are evidence when adopting a kit, not its deliverable; exclude product mockups, marketing content, business flows, and decorative illustrations.

Translate headings while preserving technical identifiers. An existing component explorer may host linked sections. Every agreed foundation must be directly discoverable in the rendered reference, not only CSS or Markdown. Propose the complete foundation for a new kit and document agreed exclusions; extensions change only their agreed scope.

Follow the section feedback loop in [ui-kit](../SKILL.md): keep a stable URL/anchors, the current draft, and accepted sections visible. Navigation may list future sections as planned, without prefilling specimens or decisions. Show section acceptance separately from verification gaps. Collect feedback in conversation; no approval application is needed.

For each specification show its token/class/import, source-derived value with units, intended use, and specimen. Use neutral example text and labeled blocks; maintain no second token registry.

## 1. Colors

Provide palettes for `primary`, `neutral`, `success`, `failure`, and `warning`, plus `secondary` when it serves a distinct purpose. Explain an omitted secondary palette. Preserve adopted source naming: an existing `error` or `danger` token can map to the documented `failure` role without a rename or duplicate palette.

Every palette needs a coherent light-to-dark scale with tints and shades. Agree on a consistent scale (for example 50–950), identify the base step, and show every step's identifier, value, and swatch. One screen's existing colors do not define a complete palette.

Separate primitive palette values from semantic aliases for text, backgrounds/surfaces, borders, actions, focus, and status. Show intended foreground/background pairs, their measured contrast, and which roles suit each pair. Include default, hover, pressed, selected, disabled, and subtle status treatments where supported. A full palette does not imply that every shade is suitable for text or has to appear in a component. Status meaning also needs text or an icon.

In brownfield, map roles to adopted tokens and preserve source names/imports unless a migration is authorized. Identify missing palettes or scale steps and resolve them through the interview; do not silently adopt invented values. For supported themes, show their semantic mappings and pairings; do not add a theme without agreement.

## 2. Typography

Document font families, source/loading method, available weights/styles, fallbacks, and required language/glyph coverage. Provide the actual named size scale, with units and desktop/mobile values or fluid-sizing rules, then map it to text roles. For each role show its source token/class, family, size, weight, line-height, letter-spacing, intended use, and rendered specimen.

Include heading levels h1–h6, lead and body paragraphs, small/supporting text, labels/captions, ordered and unordered lists, and links. Demonstrate emphasis/strong text and inline code or quotes where supported. Explain semantic heading levels separately from visual size roles. Show paragraph/list spacing, indentation, link states, readable line length, and wrapping with realistic neutral text. Use the actual shared typography definitions, including prose/list/link styles.

## 3. Icons

Name the adopted icon family/library, package or asset source, import convention, and available style (such as outline or filled). Show a labeled specimen set with actual export/asset names, the size scale, stroke widths, alignment, and color inheritance. Use one coherent family unless an exception is agreed.

Specify icon-only control labels, decorative icon handling, icon-plus-text gaps, and the distinction between glyph size and interactive hit area. Render specimens from the same assets/components future screens will import. If no icon system exists, propose one during the interview rather than substituting emoji or ad hoc symbols.

## 4. Sizing & spacing

Show the spacing scale as named tokens, values/units, and measurable specimens. Map steps to inline gaps, control/container padding, section spacing, and page gutters; a rhythm alone is insufficient.

Document control heights/sizes, icon dimensions, touch/hit areas, and relevant width constraints. Distinguish spacing, visible control size, and hit area. Show responsive changes and examples from the shared sizing/spacing sources; avoid separate literal values in specimens.

## 5. Layout — desktop and mobile

Specify viewport breakpoints or container-query thresholds, container widths/max-widths, column counts, gutters, gaps, alignment, and vertical spacing. Explain fluid versus fixed behavior, stacking, reading order, and overflow at transitions. Document supported primitives such as container, stack, cluster/row, and grid, with usage/import examples.

Render annotated desktop/mobile specimens of the same grid or primitive using neutral numbered blocks. Label viewport width, columns, gutters, and gaps. Exclude business content, product navigation, and page compositions.

Use real shared layout primitives in sized live previews or an adjustable viewport. Embedded previews must respond to their own viewport/container; a scaled-down desktop diagram labeled “mobile” is insufficient. Verify the reference itself at desktop and mobile widths too. Keep the documentation shell separate from the layout rules being demonstrated.

## 6. Surfaces, borders, and elevation

Document radii, border widths/styles, surface levels, shadows/elevation, and overlay stacking conventions. Show named tokens, actual values, usage guidance, and isolated specimens. Include explicit flat/no-shadow choices when appropriate. Use semantic color aliases from the color section instead of inventing another surface palette.

## 7. Interaction & accessibility

Specify focus treatment, hover/pressed/selected/disabled conventions, validation/status messaging, keyboard behavior, and touch targets. Document motion duration/easing and reduced-motion behavior where motion is used; an explicit no-motion rule is also valid. Link color contrast rules and component-specific behavior to their specimens. Mark unsupported or undecided behavior as a gap.

## 8. Components and states

After foundations, show isolated components with neutral labels/data. Propose a practical base set: buttons, links, form controls with labels/help/errors, selection controls, badges, alerts, containers/dividers. Agree on navigation, overlays, tables, or domain-specific additions as needed; a complete foundation does not require an exhaustive widget library.

For each adopted component give source/import/API pointers, a valid usage example, supported variants/sizes, applicable rules, and state specimens. Show meaningful default, hover/focus/pressed, selected, disabled/loading, and validation states where supported. Label simulated visual states and verify actual interactive behavior when applicable. A small icon-with-label or field-with-help example may explain a component's API; do not assemble a signup screen or another product page to demonstrate reuse.

## Completion check

Verify every agreed requirement in sections 1–8 against canonical sources and rendered specimens, including documented exclusions. Check actual values, font rendering, contrast pairs, desktop/mobile previews, responsive behavior, and relevant keyboard/state behavior with available tools.

A future screen author must be able to choose foundations and components directly from this technical reference. A product demo does not qualify even if it imports shared components. Report unfinished decisions and unavailable checks; readiness requires accepted scope implemented, documented, rendered, and verified.
