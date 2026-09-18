# Install SDLC

Install the `sdlc` plugin through an agent's plugin manager, or copy its skills with npx or the shell installer. The plugin contains all ten SDLC skills. The file installers also offer `sdlc-ui` for just `ui-kit`, `ui-implement`, and `ui-review`.

## Native plugin

### Claude Code

```bash
claude plugin marketplace add kulichevskiy/sdlc
claude plugin install sdlc@kulichevskiy --scope project
```

Use `--scope user` to install across projects. Start with `/sdlc:setup`, or `/sdlc:ui-kit` for UI work. See the [Claude plugin reference](https://code.claude.com/docs/en/plugins-reference).

### Codex

```bash
codex plugin marketplace add kulichevskiy/sdlc
codex plugin add sdlc@kulichevskiy
```

Select `setup` or `ui-kit` from the SDLC plugin.

For a project-local plugin, copy `plugins/sdlc` into your repository, register it in `.agents/plugins/marketplace.json`, and enable it in `.codex/config.toml`. The [Codex local-plugin guide](https://developers.openai.com/plugins/build/plugins#install-a-local-plugin-manually) describes the configuration. The npx and shell routes below provide a project/user choice for skill files.

Set the response language in your agent or project instructions when using a native plugin.

### Cursor and GitHub Copilot

Use the file installer below with `--target=cursor` or `--target=copilot`.

## With Node

Requires Node 18 or newer. Run from your project:

```bash
npx github:kulichevskiy/sdlc sdlc
```

The installer asks for the agent, installation scope, and response language. Choose `project` for the current repository or `user` for all your projects. The menu shows both destination paths.

To choose without prompts:

```bash
npx github:kulichevskiy/sdlc sdlc --target=codex --scope=project --lang=English
```

Replace `sdlc` with `sdlc-ui` for the three UI skills. Run without a skill name to list available bundles and standalone skills.

## Without Node

Requires `sh`, `curl`, and `tar`:

```bash
curl -fsSL https://raw.githubusercontent.com/kulichevskiy/sdlc/main/install.sh | sh -s -- sdlc
```

The shell installer accepts the same options:

```bash
curl -fsSL https://raw.githubusercontent.com/kulichevskiy/sdlc/main/install.sh | sh -s -- sdlc --target=codex --scope=user --lang=English
```

On Windows, run these commands in WSL.

## Options and locations

| Option | Values | Default without a terminal |
|---|---|---|
| `--target` | `claude`, `codex`, `cursor`, `copilot` | `claude` |
| `--scope` | `project`, `user` | `project` |
| `--lang` | Response language, such as `English` or `Russian` | `English` |
| `--global` | Alias for `--scope=user` | |
| `--force` | Replace existing destination skills | |

Press Enter at a prompt to accept its default. `--global` and `--scope=project` conflict.

| Target | Project directory | User directory |
|---|---|---|
| `claude` | `.claude/skills/` | `~/.claude/skills/` |
| `cursor` | `.cursor/skills/` | `~/.cursor/skills/` |
| `codex` | `.agents/skills/` | `~/.agents/skills/` |
| `copilot` | `.github/skills/` | `~/.copilot/skills/` |

Commit project skills to share them with your team. Restart the agent if newly installed skills do not appear.

`--lang` adds a response-language instruction to the installed files. Skill names, descriptions, and titles stay in English.

## Update or remove

For native plugins, use the agent's plugin manager.

For skill files, repeat the install command with `--force`. This replaces each selected skill directory, including local edits, and removes stale files. Without `--force`, an existing destination stops the installation before any bundle member changes.

To uninstall skill files, delete the directories listed in [bundles/sdlc.txt](../bundles/sdlc.txt) or [bundles/sdlc-ui.txt](../bundles/sdlc-ui.txt) from the chosen installation directory. Both bundles use the same UI skill directories.

## Migrate from prefixed names

Install the new plugin or short-named files, compare any local edits, then remove the old `sdlc-*` skill directories. Check `.codex/skills/` as well if you used an older Codex installer. Keep one installation of each skill to avoid duplicate entries.

File installations use names such as `setup`, `implement`, and `code-review`. If another installed skill has the same name, choose the native plugin or resolve the conflict before installing. The native plugin uses the `sdlc` namespace. Existing project documents keep their paths.

## Manual installation

Copy the directories listed in [bundles/sdlc.txt](../bundles/sdlc.txt) from `plugins/sdlc/skills/` into the destination from the table above. Include each skill's `agents/` and reference files. For UI only, use [bundles/sdlc-ui.txt](../bundles/sdlc-ui.txt).

Keep each bundle's skills together so their relative references resolve. For updates, use an installer with `--force` to remove stale files.

## Install from a local checkout

Run the file installer from the target project:

```bash
node /path/to/sdlc/bin/agent-skills.mjs sdlc --target=codex --scope=project --lang=English
```

For native plugins, replace `kulichevskiy/sdlc` in the marketplace command with the absolute path to the checkout. Then run the same plugin install command.
