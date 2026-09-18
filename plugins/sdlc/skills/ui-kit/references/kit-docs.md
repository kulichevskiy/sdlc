# UI Kit documentation guide

Adapt existing documentation before creating this default layout. Markdown is an index of accepted decisions and real source files, not a second implementation. Use relative links where practical and stable rule/component IDs.

The visual page follows the [technical showcase contract](showcase.md). Keep Colors, Typography, Icons, Sizing & spacing, Layout, Surfaces, Interaction & accessibility, and Components directly discoverable in the rendered reference. Together, the written rules and live specimens form a technical document for future screen authors; product mockups are not a deliverable. Link each documentation section to its corresponding showcase section and canonical source; documentation alone does not replace the rendered specimens.

## docs/ui-kit/index.md

Record:

- Kit name, foundation/component scope, product context, stack, and source roots.
- Revision; `draft`, `incomplete`, or `ready`; accepted decisions and their user approval.
- Section progress: planned, awaiting feedback, or accepted; the current section, pending feedback, and accepted choice. Update as the panel grows so a later session can resume the same loop. User acceptance of a section does not replace its technical verification or mark the whole kit ready.
- Links to rules, component catalog, tokens, and shared styles/components.
- Showcase launch command, route/URL, and prerequisites. The showcase is a page in the project or its existing component explorer, using the shared implementation.
- Verification snapshot (commit plus relevant dirty-file hashes/diff when needed), commands/results, rendered states/viewports, and evidence locations.
- Unresolved gaps and the next step. In brownfield, distinguish adopted scope from legacy screens awaiting separately agreed migration.

## docs/ui-kit/rules.md

Give each adopted rule a stable ID, statement, scope, and source/example pointer. Cover the agreed foundations: palette scales and semantic colors, fonts and typography, icons, sizes, spacing, responsive grids, surfaces/borders/elevation, and interaction/accessibility conventions. Link to actual token definitions rather than duplicating their values as another source of truth.

Map `primary`, `neutral`, `success`, `failure`, and `warning` to source palettes, including their tint/shade scales and semantic uses. Record whether `secondary` is included and why; document existing `error`/`danger` naming as an alias for `failure` where applicable. Record font sources, type scales and text-role definitions, icon imports and sizing, the actual spacing/sizing scale, desktop/mobile grid rules with concrete units and transition thresholds, and surface/interaction conventions. If a value is unsettled, label it as a gap. The visual page may display values derived from canonical sources; avoid a second manually maintained token registry in documentation.

Example shape (replace with project decisions, not prescribed values):

| Rule ID | Accepted rule and scope | Canonical source | Showcase example |
| --- | --- | --- | --- |
| VIS-001 | Explain which shared semantic token a particular role uses | Source file/export | Route/anchor |

## docs/ui-kit/components.md

For each adopted basic or compound component record:

- Stable component ID and purpose.
- Shared source path/export and a concise valid usage example.
- Approved variants, interaction states, responsive constraints, and relevant accessibility behavior.
- Showcase examples and limits of use; links to applicable rules.

Third-party library components can be canonical: record the actual package/import and agreed configuration. Do not introduce wrappers solely to satisfy a template. Screen-specific composition can stay in the screen; document it as a kit component only if an approved reusable interface or rule is added.

## Extensions

Record the concrete need, decision (reuse or extend), accepted changes, affected consumers, kit revision, updated source/example pointers, and verification. Carry existing accepted decisions forward. If source, showcase, or verification is incomplete, record that explicitly rather than presenting stale evidence as current.
