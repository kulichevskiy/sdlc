# Skill text pruning and test-quality guidance

## Scope

User approved shortening the existing SDLC instructions without changing the workflow, and accepted only the test-quality proposal from the earlier comparison. No new router, diagnostic workflow, domain-modeling process, architectural exploration, or UI-prototyping stage was added. After local verification, the user authorized committing and pushing this change and its verification record.

Baseline: repository commit `7e42dc96098e1f8e3132629c2522af18b78fb147`. The existing untracked bundle/readme/research documents were left untouched. Evaluation fixtures are isolated under `/private/tmp/sdlc-pruning-pzwap8ao/`.

## Changes

- Replaced six repeated core entry paragraphs with an explicit mandatory workflow/setup-check pointer. The shared core workflow itself is unchanged.
- Shortened UI Kit's section loop while retaining rendered feedback, acceptance before advancing, stable panel, and resume behavior.
- Removed repeated foundation inventories and report fields where an explicitly linked reference already defines them.
- Shortened setup/profile and shared UI wording while retaining policy, permission, source reuse, evidence, and review boundaries.
- Added test-quality guidance to spec, implement, and code-review: suitable observable interfaces; independent expected results derived from requirements/examples; appropriate external substitutions; regression evidence; detection of implementation-mirroring tests. Existing verification strategy covers routine tests without renewed approvals.
- Preserved all names, discovery metadata, invocation policies, bundle membership, package versions, and installers.

Word counts use whitespace-separated words across all ten SKILL.md files and six Markdown references, including frontmatter. This is source volume, not a claim about model-specific token savings or which references every run loads.

| Scope | Before | After | Reduction |
| --- | ---: | ---: | ---: |
| Ten entrypoints | 5,078 | 4,094 | 19.4% |
| Six references | 4,668 | 3,915 | 16.1% |
| Total, including added test guidance | 9,746 | 8,009 | 17.8% |
| UI Kit entrypoint and its references | 3,827 | 2,689 | 29.7% |

Per-file [baseline](evidence/baseline-counts.json), [candidate counts](evidence/candidate-counts.json), and [candidate source hashes](evidence/candidate-sha256.json) are retained.

## Verification

- `npm test`: 140 passed, zero failed/skipped. The initial sandboxed run could not access `/dev/tty` for terminal installer scenarios. The authorized unsandboxed rerun passed the full suite; no test or installer was changed. [Log](evidence/npm-test.log).
- Official `quick_validate.py`: all ten skills valid. System Python lacked PyYAML; reran using the existing `/private/tmp/skills-plugin-validation-env/bin/python` with PyYAML 6.0.3, without installing dependencies. [Log](evidence/quick-validate.log).
- Local Markdown links resolve; `git diff --check` passes. Installed fixture skill sources match the candidate (allowing the installer's language suffix).
- Independent source-contract review found no lost mandatory behavior. Its template-link portability concern was fixed by removing links that would become invalid if copied into a generated project profile. Final review has no open findings. [Report](evidence/contract-review.md).

## Forward executions

Independent agents received installed candidate skills, isolated raw project inputs, and ordinary user requests. They were not given baseline instructions, expected findings, or the parent's analysis. The coordinator supplied the simulated user replies recorded below.

| Scenario | Observed behavior | Evidence |
| --- | --- | --- |
| New technical kit, no palette preference | Created Colors only, served a technical reference, left later sections planned, checked desktop/mobile and requested acceptance | [Kit execution](evidence/kit-forward-log.md) |
| Palette feedback | Simulated user requested warmer neutrals and teal primary; revised the same panel, rechecked it, and awaited acceptance without building Typography | Same receipt |
| Accept Colors | Simulated user accepted the displayed revision; recorded acceptance, preserved palette values, and asked about Typography preferences | Same receipt |
| Resume in a fresh agent session | Read saved state, preserved the accepted Colors source hash, added only the requested Typography proposal, checked desktop/mobile and keyboard behavior, and awaited Typography feedback | [Execution](evidence/kit-resume-forward-log.md), [accepted palette hash](evidence/accepted-colors.sha256) |
| Missing secondary button variant | Asked reuse versus extension before changing sources. Simulated user chose existing primary Cancel; built only Preferences with local feedback, preserved all original Account/kit files, and reported incomplete rendering without browser access | [Execution](evidence/extension-forward-log.md), [self-review](evidence/extension-review.md) |
| UI conformity review | Detected Save's color override and visually matching Cancel clone; accepted ordinary row composition; did not invent typography rules | [Execution](evidence/review-forward-log.md), [report](evidence/ui-review/ui-review.md) |
| Test-quality review | Existing test passed while exporting an internal field; reviewer found both the requirement violation and the mirrored expected-value algorithm, then confirmed failure with an independent assertion | [Execution](evidence/test-quality-forward-log.md), [report](evidence/test-quality-review.md) |

UI review inspected live Account and showcase routes at 390 and 1280 pixels. Browser output-path restrictions prevented screenshot saving; computed styles and geometry were retained, and the reviewer disclosed the pixel-inspection gap. Hash comparison confirmed all original product/kit/runtime files unchanged. Browser tooling automatically produced host logs; these were moved from `.playwright-mcp/` into the temporary evaluation directory.

Archived report links to kit rules were adjusted to the neighboring evidence copy; findings and verdicts are unchanged. Test-quality command logs are retained beside its report.

The first preview process did not survive to the fresh session. The resume evaluator restored the same URL/port with the existing Python HTTP server after an authorized retry for the sandbox bind restriction. This was fixture runtime recovery; it changed neither the skill nor the accepted palette.

## Limits

These are scoped source review and forward executions, not a statistical A/B benchmark or proof of equivalence for every possible request. Full foundation completion, every brownfield adoption case, and every approved extension type were not rerun. No production systems or remote delivery were involved.
