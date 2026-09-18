# Account UI kit conformity review

## Scope and snapshot

Reviewed Account `/`: idle Save and Cancel controls and their layout at 390 × 844 and 1280 × 900. Compared the live `/showcase.html` at both sizes with adopted Account kit revision 1 (`docs/ui-kit`), accepted 2026-09-18, marked ready.

This directory has no Git repository, so no commit or dirty diff is available. [SHA-256 snapshot](evidence/source-sha256.txt) pins all ten relevant source, runtime and kit documentation files. Hashes were verified unchanged after inspection. No project policy or additional task documents were present in the supplied file inventory. Inspected `app.js`, `index.html`, `kit/button.js`, `kit/tokens.css`, `showcase.html`, kit rules/catalog/index, package scripts, and server.

Launched `npm run dev`, which printed `http://127.0.0.1:52825`. Used Playwright browser navigation, resizing and read-only page evaluation in Chrome 153 (reported user agent) against local static fixture data. No Save/Cancel business actions were invoked; only idle states are adopted and requested. `npm run check` passed.

The kit index claims prior showcase verification at 390 and 1280 but records no source hash or commit, so its ready label cannot establish freshness. This review independently checks the current hashed source and both live routes; it does not change acceptance status.

## Verdict and coverage

**Verified deviations: COLOR-1 and REUSE-1.** Source and live rendered styles/geometry were checked for both requested routes and widths. The approved row composition conforms. Pixel screenshots could not be saved within the authorized task directory because the Playwright screenshot tool permits only its host workspace roots. Accordingly, this is a source plus rendered-DOM review, with pixel-level visual inspection unavailable; it is not a claim of full visual conformity.

| Route | Viewport | Captured evidence |
| --- | --- | --- |
| Account `/` | 390 × 844 | [Computed styles and geometry](evidence/account-390.txt) |
| Account `/` | 1280 × 900 | [Computed styles and geometry](evidence/account-1280.txt) |
| Showcase `/showcase.html` | 390 × 844 | [Computed styles and geometry](evidence/showcase-390.txt) |
| Showcase `/showcase.html` | 1280 × 900 | [Computed styles and geometry](evidence/showcase-1280.txt) |

At both widths, the Account row computes to `display:flex`, `flex-wrap:wrap`, `gap:16px`, matching the showcase and canonical CSS. Save and Cancel are 43 px tall, share y=83.4375, and have an actual 16 px horizontal gap. Their rightmost edge is x=188.84375, within both row widths (342 and 1232 px). Document width equals viewport width. Both labels fit on one row at these widths; no forced wrapping test or arbitrary breakpoint requirement was introduced. Ordinary `.stack` composition needs no separate catalog entry under LAYOUT-1.

## Verified findings

### UI-1 — Save overrides the adopted action background

Location: `app.js:2`, Account Save, idle, both viewports. Rule: [COLOR-1](../review-kit/rules.md), component [BTN-1](../review-kit/components.md).

Expected: shared button background uses `--action` (#1d4ed8) and text uses `--on-action` (#fff), without per-screen color overrides. Actual: `save.style.background='#c026d3'`. Browser evaluation confirms Save renders as `rgb(192, 38, 211)` while the actual showcase renders as `rgb(29, 78, 216)` at both widths. White text matches. Save therefore presents an unadopted treatment despite using the correct factory.

Evidence: `app.js:2`, `kit/tokens.css:1`, and all four rendered evidence files above. Proposed fix: remove the inline background assignment so the canonical token governs Save. No kit extension is needed.

### UI-2 — Cancel duplicates shared button construction

Location: `app.js:3`, Account Cancel, idle, both viewports. Rule: [REUSE-1](../review-kit/rules.md), component [BTN-1](../review-kit/components.md).

Expected: action buttons use the shared `button(label)` export from `kit/button.js`. Actual: Cancel is constructed locally using `document.createElement('button')` followed by class, type and text assignments. This duplicates `kit/button.js:1`. It currently renders the same blue and white colors and 43 px height as the adopted specimen, but bypasses the shared factory and would miss future shared behavior or structure changes. Visual similarity does not establish component reuse.

Evidence: `app.js:1-4` compared with `kit/button.js:1`; [390 rendered evidence](evidence/account-390.txt) and [1280 rendered evidence](evidence/account-1280.txt). Proposed fix: construct Cancel with `button('Cancel')`, retaining the approved `.stack` composition. No new variant or catalog component is needed.

## Gaps and next actions

- Screenshot capture failed with `File access denied` for the requested evidence paths: the browser tool allows only `/Users/ak/Code/sdlc` and its `.playwright-mcp` directory. No workaround writes were made outside this fixture. Rendered styles/geometry were returned by the browser and saved as text evidence inside the task directory. Pixel screenshot review requires an authorized browser output location for this directory.
- Prior kit verification cannot be tied to a source snapshot. Fresh evidence for this run is pinned above; historical freshness remains unknown.
- Support-text typography is expressly undecided and outside adopted scope. The italic support paragraph is neither a verified violation nor a reason to extend this review.
- Hover, focus, disabled, loading, click outcomes, and other widths are outside this idle-state review.

Next action: separately authorize the two proposed implementation fixes, then repeat the scoped checks. This run changed only report/evidence files, with no product, kit, dependency, acceptance-status, or environment configuration changes. No commits or installations were performed.
