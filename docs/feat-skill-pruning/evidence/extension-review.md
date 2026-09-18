# Preferences UI review — 2026-09-18

## Scope and snapshot

Self-review using the installed ui-review skill; independent agents are prohibited for this task. Scoped route: `/preferences.html`, added with `preferences.js`. Adopted kit: `docs/ui-kit/`, revision 1, unchanged. The accepted decision is to reuse the primary button for both Save and Cancel and provide local feedback only. The user explicitly declined the outlined variant and any kit change. Existing Account is excluded and remains unchanged.

This is a file-based source snapshot, pinned by SHA-256 rather than a commit:

| File | SHA-256 |
| --- | --- |
| preferences.html | `758f11a81ea51383f2702aa3011ed26c64c3b7716aa52b43625b637ab91ed713` |
| preferences.js | `5f9e88b6b672d294a6265bbee384e098a70a8f02e5f065295e7afb74ae8d8f87` |
| kit/button.js | `5ddc6c478f43887aa125c8b3a2c7637bdcb0aa096bae78c4c702a82263b5b590` |
| kit/tokens.css | `b939f556666b32b48b0907e47422062d88b87e1da22e8b6ff0dd566bbe666b61` |
| showcase.html | `b1d26dd15bfb3947ed353001410216ea5badf347b0e071a04b2948469131d25b` |
| docs/ui-kit/index.md | `690fbf7a228ae769923658512c713dd31f5d2dab90e29932e9db336fb054c079` |
| docs/ui-kit/rules.md | `03dbc700b9f82227242310dfb2a2d3645ae41489f68c37997744a9be7499b4b6` |
| docs/ui-kit/components.md | `4252d29b090a48d9b26844bdd7e40a5ef509526ee6e2623333dba3dc2327b5fa` |

Launch command, for a later authorized verification: `npm run dev`; append `/preferences.html` or `/showcase.html` to its printed URL. No server was started. No browser, runtime interaction, screenshot, or viewport inspection was available or attempted. No test data or backend is required.

## Verdict and coverage

**Incomplete verification; no verified source violations in the scoped change.** This is not a full conformity claim.

- REUSE-1 / BTN-1: `preferences.js:1-5` imports and calls the canonical `button(label)` for both actions. No cloned button, unsupported variant, or local button styling.
- COLOR-1: `preferences.html:7` uses canonical styles. Neither new file overrides the adopted button colors.
- LAYOUT-1: `preferences.html:13` uses the approved wrapping `.stack` composition without inventing a new component or catalog entry.
- Local feedback: `preferences.js:7-12` changes only the status element's `textContent`. Source contains no storage, network, navigation, or backend operation. `preferences.html:14` exposes a polite status region; actual announcements remain untested.
- `npm run check` passed (existing app and button JavaScript syntax); `node --check preferences.js` passed. These checks do not establish runtime behavior.
- Account `app.js` and `index.html`, shared source, showcase, and kit docs retained identical before/after hashes.

## Findings and gaps

Verified violations: none in the scoped new page.

Kit gap: support-text typography is explicitly undecided in [the adopted rules](review-kit/rules.md). The page uses ordinary paragraph markup with inherited styling. No additional typography rule was invented, and this gap is not treated as a violation or a reason to change the kit.

Unavailable evidence: actual route/module loading, idle appearance, Save/Cancel clicks, keyboard focus and activation, live-region announcements, and wrapping at 390px and 1280px. Prior kit verification remains documented for its unchanged sources but does not verify this new screen.

## Next actions

When browser/runtime access is available, inspect the page and showcase at 390px and 1280px and exercise both actions and keyboard focus. Record any deviations against the current kit snapshot. Keep support-text typography outside this adopted scope unless a separate kit decision is requested.

The review pass changed only this report/evidence. It applied no recommendations and made no product, kit, dependency, environment, or acceptance-status changes.
