#!/bin/sh
# Installs a skill on a machine with no Node on it — curl and tar are enough.
#
# This is the second of two implementations of one installer: bin/agent-skills.mjs
# is the other, and neither can be built on the other, since that one needs Node
# and this one exists precisely for machines without it. They must answer
# identically. test/parity.sh runs both over the same matrix and fails on any
# difference — change one side and run it.
set -eu

REPO="kulichevskiy/sdlc"
BRANCH="main"
TARBALL="https://codeload.github.com/$REPO/tar.gz/refs/heads/$BRANCH"
NAMES="claude cursor codex copilot"

fail() { printf '\n  %s\n\n' "$1" >&2; exit 1; }

# The device node exists even where there is no controlling terminal behind it,
# so opening it is the only honest test — a permission check passes and the
# first read then dies with ENXIO. Probe in a subshell: POSIX shells such as
# dash exit on a special builtin's redirection failure even inside an if.
if ( : < /dev/tty ) 2>/dev/null; then TTY=/dev/tty; else TTY=""; fi

# One target, four facts about it. Sets LABEL, PROJECT, HOMEDIR and CALL.
describe() {
  case "$1" in
    claude)  LABEL="Claude Code";    PROJECT=".claude/skills";  HOMEDIR=".claude/skills";  CALL="/" ;;
    cursor)  LABEL="Cursor";         PROJECT=".cursor/skills";  HOMEDIR=".cursor/skills";  CALL="/" ;;
    codex)   LABEL="Codex";          PROJECT=".agents/skills";  HOMEDIR=".agents/skills";  CALL='$' ;;
    copilot) LABEL="GitHub Copilot"; PROJECT=".github/skills";  HOMEDIR=".copilot/skills"; CALL="" ;;
    *) return 1 ;;
  esac
}

usage() {
  cat <<EOF

Skills for Claude Code, Cursor, Codex and GitHub Copilot.

  curl -fsSL https://raw.githubusercontent.com/$REPO/$BRANCH/install.sh | sh -s -- <skill|sdlc|sdlc-ui>
  ... | sh -s -- <skill|sdlc|sdlc-ui> --global     for every project, not just this one

  --target=$(printf '%s' "$NAMES" | tr ' ' '|')   where to install, asked if omitted
  --scope=<project|user>   installation scope, asked if omitted
  --global            alias for --scope=user
  --lang=<language>   language the agent answers in, asked if omitted
  --force             overwrite an installed copy

Questions are skipped where there is no terminal to ask on, so the command
stays usable from a script: it installs into this project for Claude Code in English.

Bundles:
  sdlc     — twelve skills; start with setup
  sdlc-ui  — three standalone web UI skills; start with ui-kit
EOF
}

# curl | sh leaves the script itself on stdin, so an answer has to come off the
# terminal directly. No terminal — a cron run, a Dockerfile — takes the default.
ask() {
  ANSWER="$2"
  [ -n "$TTY" ] || return 0
  printf '%s' "$1" > "$TTY"
  if IFS= read -r reply < "$TTY"; then
    if [ -n "$reply" ]; then ANSWER="$reply"; fi
  else
    # Ctrl-D answers every remaining question with its default, rather than
    # leaving the next one waiting on input that is not coming.
    printf '\n' > "$TTY"
    TTY=""
  fi
  return 0
}

fetch() {
  if command -v curl > /dev/null 2>&1; then curl -fsSL "$1"
  elif command -v wget > /dev/null 2>&1; then wget -qO- "$1"
  else fail "This needs curl or wget, and neither is installed."
  fi
}

SKILL=""; TARGET=""; SPEAK=""; EVERYWHERE=""; INSTALL_SCOPE=""; FORCE=""
for arg do
  case "$arg" in
    # A flag that takes a value and was given none is a slip, not a way to ask
    # the question anyway. These must precede their =* forms to match first.
    --target|--target=) fail "--target needs a value, as --target=<agent>." ;;
    --lang|--lang=)     fail "--lang needs a value, as --lang=<language>." ;;
    --scope|--scope=)   fail "--scope needs a value, as --scope=<project|user>." ;;
    --target=*) TARGET="${arg#--target=}" ;;
    --lang=*)   SPEAK="${arg#--lang=}" ;;
    --scope=*)  INSTALL_SCOPE="${arg#--scope=}"
                [ -n "$(printf '%s' "$INSTALL_SCOPE" | tr -d '[:space:]')" ] || fail '--scope needs a value.' ;;
    --global)   EVERYWHERE=1 ;;
    --force)    FORCE=1 ;;
    --help)     usage; exit 0 ;;
    --*)        fail "Unknown option: $arg" ;;
    *)          [ -z "$SKILL" ] || fail "Choose one skill or bundle."
                SKILL="$arg" ;;
  esac
done

INSTALL_SCOPE="$(printf '%s' "$INSTALL_SCOPE" | tr '[:upper:]' '[:lower:]' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"
case "$INSTALL_SCOPE" in
  ''|project|user) ;;
  *) fail "Unknown --scope \"$INSTALL_SCOPE\". Pick project or user." ;;
esac
if [ -n "$EVERYWHERE" ]; then
  [ "$INSTALL_SCOPE" != project ] || fail '--global conflicts with --scope=project.'
  INSTALL_SCOPE=user
fi

TMP="$(mktemp -d)"
# A bare `trap ... INT` runs the handler and then resumes where it left off, so
# Ctrl-C would carry on with the temporary tree already deleted. Exit instead.
trap 'rm -rf "$TMP"' EXIT
trap 'rm -rf "$TMP"; exit 130' INT
trap 'rm -rf "$TMP"; exit 143' TERM

if [ -n "${SKILLS_SOURCE:-}" ]; then
  # Test seam, so test/parity.sh can check a working copy rather than whatever
  # is published on the branch.
  cp -R "$SKILLS_SOURCE/skills" "$TMP/skills"
  cp -R "$SKILLS_SOURCE/plugins" "$TMP/plugins"
  cp -R "$SKILLS_SOURCE/bundles" "$TMP/bundles"
else
  command -v tar > /dev/null 2>&1 || fail "This needs tar, and it is not installed."
  # Downloading into a file rather than straight down a pipe: on the left of a
  # pipe, fetch runs in a subshell, where its exit takes the subshell only and
  # leaves the script running on with a misleading diagnosis.
  fetch "$TARBALL" > "$TMP/repo.tar.gz" || fail "Could not download $REPO. Check the network and try again."
  tar -xzf "$TMP/repo.tar.gz" -C "$TMP" --strip-components=1 || fail "Downloaded $REPO but could not unpack it."
fi
# Flatten the plugin's canonical skill sources only in this disposable tree.
[ -d "$TMP/plugins/sdlc/skills" ] || fail "Missing SDLC plugin skills."
cp -R "$TMP/plugins/sdlc/skills/." "$TMP/skills/"
[ -d "$TMP/skills" ] || fail "Found no skills to install."
[ -s "$TMP/bundles/sdlc.txt" ] || fail "Missing SDLC bundle manifest."
SDLC="$(cat "$TMP/bundles/sdlc.txt")"
[ -s "$TMP/bundles/sdlc-ui.txt" ] || fail "Missing SDLC UI bundle manifest."
SDLC_UI="$(cat "$TMP/bundles/sdlc-ui.txt")"

# A directory counts as a skill only if it holds a SKILL.md, matching bin/.
AVAILABLE=""
for dir in "$TMP"/skills/*/; do
  [ -f "$dir/SKILL.md" ] || continue
  name="${dir%/}"
  AVAILABLE="$AVAILABLE ${name##*/}"
done
AVAILABLE="${AVAILABLE# }"

if [ -z "$SKILL" ]; then
  usage
  printf '\nStandalone skills:\n\n'
  for name in $AVAILABLE; do
    case " $(printf '%s' "$SDLC" | tr '\n' ' ') " in *" $name "*) continue ;; esac
    printf '  %s\n' "$name"
  done
  printf '\n'
  exit 0
fi
case "$SKILL" in
  sdlc) SELECTED="$SDLC" ;;
  sdlc-ui) SELECTED="$SDLC_UI" ;;
  sdlc-*) fail "Install SDLC skills together: use sdlc, or sdlc-ui for only the UI skills." ;;
  *)
    # Match discovered names, not arbitrary filesystem paths.
    case " $AVAILABLE " in
      *" $SKILL "*) SELECTED="$SKILL" ;;
      *) fail "No skill named \"$SKILL\" here. Available: $AVAILABLE" ;;
    esac ;;
esac
for name in $SELECTED; do
  case "$name" in
    ''|*[!a-z0-9-]*|-*|*-|*--*) fail "Invalid bundled skill: $name" ;;
  esac
  [ -f "$TMP/skills/$name/SKILL.md" ] || fail "Missing bundled skill: $name"
done

case "$SKILL" in
  sdlc|sdlc-ui) ;;
  *) case " $(printf '%s' "$SDLC" | tr '\n' ' ') " in
       *" $SKILL "*) fail 'Install SDLC skills together: use sdlc, or sdlc-ui for only the UI skills.' ;;
     esac ;;
esac

if [ -z "$TARGET" ] && [ -n "$TTY" ]; then
  printf '\n  Which agent reads these skills?\n\n' > "$TTY"
  index=1
  for name in $NAMES; do
    describe "$name"
    printf '    %d. %-15s %s/\n' "$index" "$LABEL" "$PROJECT" > "$TTY"
    index=$((index + 1))
  done
  ask '
  Number or name [1]: ' claude
  # Numbers are what the menu offers, so they are answers to it — not something
  # --target accepts, where bin/ would reject them too.
  case "$ANSWER" in
    1) TARGET=claude ;; 2) TARGET=cursor ;; 3) TARGET=codex ;; 4) TARGET=copilot ;;
    *) TARGET="$ANSWER" ;;
  esac
fi
TARGET="$(printf '%s' "${TARGET:-claude}" | tr '[:upper:]' '[:lower:]')"
describe "$TARGET" || fail "Unknown target \"$TARGET\". Pick one of: $(printf '%s' "$NAMES" | tr ' ' ',' | sed 's/,/, /g')"

if [ -z "$INSTALL_SCOPE" ]; then
  if [ -n "$TTY" ]; then
    printf '\n  Where should these skills be installed?\n\n    1. Project (this repository)  %s/%s\n    2. User (all projects)       %s/%s\n' "$PWD" "$PROJECT" "$HOME" "$HOMEDIR" > "$TTY"
  fi
  ask '
  Number or scope [1]: ' project
  ANSWER="$(printf '%s' "$ANSWER" | tr '[:upper:]' '[:lower:]' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"
  case "$ANSWER" in
    ''|1|project) INSTALL_SCOPE=project ;;
    2|user) INSTALL_SCOPE=user ;;
    *) fail "Not one of the listed scopes: \"$ANSWER\"" ;;
  esac
fi
if [ "$INSTALL_SCOPE" = user ]; then EVERYWHERE=1; fi

if [ -z "$SPEAK" ]; then
  ask '
  Language the agent should answer you in [English]: ' English
  SPEAK="$ANSWER"
fi

if [ -n "$EVERYWHERE" ]; then ROOT="$HOME"; INTO="$HOMEDIR"; else ROOT="$PWD"; INTO="$PROJECT"; fi
for name in $SELECTED; do
  DEST="$ROOT/$INTO/$name"
  if { [ -e "$DEST" ] || [ -L "$DEST" ]; } && [ -z "$FORCE" ]; then
    fail "Already installed at $DEST
  Add --force to overwrite it."
  fi
done

mkdir -p "$ROOT/$INTO"
SPOKEN=""
COUNT=0
for name in $SELECTED; do
  DEST="$ROOT/$INTO/$name"
  rm -rf "$DEST"
  cp -R "$TMP/skills/$name" "$DEST"
  COUNT=$((COUNT + 1))

  # Localize installed copies only; --force replaces rather than appends.
  case "$(printf '%s' "$SPEAK" | tr '[:upper:]' '[:lower:]')" in
    english|en) ;;
    *) printf '\n## Language\n\nAnswer the user in %s. Commands, file paths and code stay as written.\n' \
         "$SPEAK" >> "$DEST/SKILL.md"
       SPOKEN="
  It answers you in $SPEAK." ;;
  esac
done

ENTRY="$SKILL"
case "$SKILL" in
  sdlc) ENTRY=setup; DEST="$ROOT/$INTO" ;;
  sdlc-ui) ENTRY=ui-kit; DEST="$ROOT/$INTO" ;;
esac
if [ -n "$CALL" ]; then INVOKE="call it as $CALL$ENTRY"; else INVOKE="ask the agent to use $ENTRY"; fi
if [ -n "$EVERYWHERE" ]; then SCOPE="in every project"; else SCOPE="in this project"; fi
printf '\n  Installed %s skill(s) at %s\n  Available to %s %s — %s.%s\n\n' \
  "$COUNT" "$DEST" "$LABEL" "$SCOPE" "$INVOKE" "$SPOKEN"
