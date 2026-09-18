# UI Kit documentation guide

Adapt existing documentation before creating this default layout. Markdown is an index of accepted decisions and real source files, not a second implementation. Use relative links where practical and stable rule/component IDs.

The [showcase contract](showcase.md) defines the required rendered sections and specimens. Link each documentation section to its showcase section and canonical source; Markdown does not replace the live reference.

## docs/ui-kit/index.md

Record:

- Kit name, foundation/component scope, product context, stack, and source roots.
- Revision; `draft`, `incomplete`, or `ready`; accepted decisions and their user approval.
- Section progress: planned, awaiting feedback, or accepted; current section, pending feedback, and accepted choice. Keep this resumable and separate from technical verification and whole-kit readiness.
- Links to rules, component catalog, tokens, and shared styles/components.
- Showcase launch command, route/URL, and prerequisites.
- Verification snapshot (commit plus relevant dirty-file hashes/diff when needed), commands/results, rendered states/viewports, and evidence locations.
- Unresolved gaps and the next step. In brownfield, distinguish adopted scope from legacy screens awaiting separately agreed migration.

## docs/ui-kit/rules.md

Give each adopted rule a stable ID, statement, scope, and source/example pointer. Cover all agreed foundations in the showcase contract, including semantic-role mappings, existing naming aliases, scales, responsive thresholds, and agreed exclusions with rationale. Label unsettled values as gaps. Link canonical definitions; displayed values must derive from source, not a second manually maintained token registry.

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

Record the need, reuse/extend decision, accepted changes, affected consumers, kit revision, updated source/example pointers, and verification gaps. Preserve prior accepted decisions; distinguish current evidence from stale results.
