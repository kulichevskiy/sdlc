# SDLC for AI-assisted product development

SDLC is a plugin with ten skills for AI-assisted product development. It helps your coding agent clarify tasks, write specifications, implement changes, review code, and build web UI from shared components. Decisions and progress stay in your repository so you can continue the work in another session or agent.

Works with Claude Code, Codex, Cursor, and GitHub Copilot.

## Install

### As a plugin

For Codex:

```bash
codex plugin marketplace add kulichevskiy/sdlc
codex plugin add sdlc@kulichevskiy
```

For Claude Code:

```bash
claude plugin marketplace add kulichevskiy/sdlc
claude plugin install sdlc@kulichevskiy --scope project
```

Use `--scope user` in the Claude command to install across projects. See the [installation guide](docs/installation.md#native-plugin) for Codex project configuration.

### As skill files

With Node 18 or newer:

```bash
npx github:kulichevskiy/sdlc sdlc
```

The installer asks which agent you use, whether to install in the current project or for your user, and which language the agent should answer in. To set these options directly:

```bash
npx github:kulichevskiy/sdlc sdlc --target=codex --scope=project --lang=English
```

Targets are `claude`, `codex`, `cursor`, and `copilot`. Use `--scope=user` to install across projects. `--global` does the same thing.

See the [installation guide](docs/installation.md) for the shell installer, destination paths, updates, and manual installation.

## Get started

Run `setup` once in your project:

| Agent | Plugin | Skill files |
|---|---|---|
| Claude Code | `/sdlc:setup` | `/setup` |
| Codex | Select `setup` from SDLC | `$setup` |
| Cursor | | `/setup` |
| GitHub Copilot | | Ask the agent to use `setup` |

The agent inspects the project and asks about document locations, engineering standards, verification commands, and pull request requirements. It saves your choices in `docs/sdlc/project.md`.

Then use `capture-intent` to describe a task. For example, with Codex skill files:

```text
$capture-intent
Let customers export their order history as a CSV file.
```

The agent asks about the problem, scope, and success criteria, then saves `intent.md`. Use `to-spec` to design the solution and `to-tickets` to plan the work.

For web UI work, start with `ui-kit`. You can use the three UI skills independently of the core workflow.

## How it works

| Skill | What it does | Output |
|---|---|---|
| [setup](plugins/sdlc/skills/setup/SKILL.md) | Configure the workflow for a project | `docs/sdlc/project.md` |
| [capture-intent](plugins/sdlc/skills/capture-intent/SKILL.md) | Clarify the task and success criteria | `intent.md` |
| [to-spec](plugins/sdlc/skills/to-spec/SKILL.md) | Design the solution against the codebase | `spec.md` |
| [to-tickets](plugins/sdlc/skills/to-tickets/SKILL.md) | Split the specification into tickets with dependencies | `plan.md` and ticket files |
| [implement](plugins/sdlc/skills/implement/SKILL.md) | Implement a ticket or an accepted plan | Code, tests, and `execution.md` |
| [code-review](plugins/sdlc/skills/code-review/SKILL.md) | Check the change against intent, specification, and standards | `review.md` |
| [babysit](plugins/sdlc/skills/babysit/SKILL.md) | Resolve CI failures and review feedback, then merge when requested | A checked pull request and delivery record |

Task documents live in `docs/feat-{slug}/` by default. Each stage reads the earlier decisions and records its results there.

## Build web UI with a shared UI Kit

| Skill | What it does | Output |
|---|---|---|
| [ui-kit](plugins/sdlc/skills/ui-kit/SKILL.md) | Create or extend a kit through an interview | Shared components, tokens, and a technical reference page |
| [ui-implement](plugins/sdlc/skills/ui-implement/SKILL.md) | Build screens from the kit in the project's stack | Working UI using shared components |
| [ui-review](plugins/sdlc/skills/ui-review/SKILL.md) | Compare code and rendered screens with the kit | Findings and proposed fixes for your review |

The reference page documents semantic colors, typography, sizes, spacing, desktop and mobile layouts, and component states. It runs inside the project and uses the same components as the product. For an existing product, `ui-kit` first inspects its screens and components.

Use `ui-implement` to build a screen, then `ui-review` to check it. Missing components prompt a discussion about extending the kit. Review produces a report; you decide which changes to apply.

All three skills are included in `sdlc`. To install only the UI skills as files:

```bash
npx github:kulichevskiy/sdlc sdlc-ui --target=codex
```

Start with `$ui-kit` in Codex or `/ui-kit` in Claude Code and Cursor. In the Claude plugin, use `/sdlc:ui-kit`. In Copilot, ask the agent to use `ui-kit`.

## Adapt it to your project

During setup, choose a verification profile and adjust its requirements:

| Profile | Checks |
|---|---|
| Basic | Lint, typecheck, unit tests, and end-to-end tests for key scenarios |
| Strict | Basic plus CRAP below 30 and a mutation testing threshold you choose |

CRAP combines code complexity and test coverage. Mutation testing checks whether tests catch deliberate changes to the code.

Setup also records document locations and delivery requirements. See the [project profile template](plugins/sdlc/skills/setup/references/project-template.md) and [workflow contract](plugins/sdlc/skills/setup/references/workflow.md).

## Other skills

[setup-env](skills/setup-env/SKILL.md) checks, installs, and verifies a project's development tools:

```bash
npx github:kulichevskiy/sdlc setup-env
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for the repository layout, skill format, and checks.

## License

[MIT](LICENSE)
