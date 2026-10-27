# Contributing

The SDLC plugin lives in `plugins/sdlc/`. Standalone skills live in `skills/`.

## Add or update a skill

Put SDLC skills in `plugins/sdlc/skills/<name>/` and standalone skills in `skills/<name>/`. Each directory needs a `SKILL.md` with YAML frontmatter:

```yaml
---
name: setup-env
description: Check, set up, or repair a project's development environment.
---
```

Use a short kebab-case name. Match it across the directory, frontmatter `name`, and `display_name` in `agents/openai.yaml`.

Write all skill text in English, including references, examples, titles, and UI metadata. Start titles and descriptions with an action. Use sentence case for titles. The default prompt follows this form:

```text
Use $<name> for this project and the task I describe.
```

Put supporting files beside `SKILL.md` and link them with relative paths. The installers copy the whole directory. Keep UI skill references within the three UI skills so `sdlc-ui` works on its own.

## Package the plugin

`bundles/sdlc.txt` lists all twelve SDLC skills. `bundles/sdlc-ui.txt` lists the UI subset. Update these lists when membership changes.

Codex, Claude Code, and Cursor each have a manifest inside `plugins/sdlc/` and a marketplace catalog at the repository root. All point to the same skill sources. Keep plugin versions aligned with `package.json`.

Validate native manifests and test installation in a temporary agent profile when changing plugin packaging.

## Check changes

Run:

```bash
npm test
```

The suite checks skill metadata, plugin catalogs, package contents, and both file installers. It tests all four agents, project and user scopes, response languages, conflicts, replacement, and installed links in temporary directories.

Python 3 enables the terminal prompt tests. The remaining tests run without it. No npm dependencies are required.

Keep `bin/agent-skills.mjs` and `install.sh` consistent. The shell installer supports machines without Node.

For changes to UI skill instructions, also run the relevant [UI evaluation scenarios](docs/ui-evaluation.md).
