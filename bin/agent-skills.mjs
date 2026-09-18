#!/usr/bin/env node
// This is one of two implementations of one installer: install.sh is the other,
// and neither can be built on the other, since this one needs Node and that one
// exists precisely for machines without it. They must answer identically.
// test/parity.sh runs both over the same matrix and fails on any difference —
// change one side and run it.
import { appendFileSync, cpSync, existsSync, lstatSync, readdirSync, readFileSync, mkdirSync, rmSync } from 'node:fs'
import { homedir } from 'node:os'
import { dirname, join, relative, resolve } from 'node:path'
import { createInterface } from 'node:readline/promises'
import { fileURLToPath } from 'node:url'

const SOURCE = resolve(dirname(fileURLToPath(import.meta.url)), '..', 'skills')
const PLUGIN_SKILLS = resolve(SOURCE, '..', 'plugins', 'sdlc', 'skills')
const BUNDLES = new Map([
  ['sdlc', { entry: 'setup', summary: 'The complete ten-skill family; start with setup.' }],
  ['sdlc-ui', { entry: 'ui-kit', summary: 'Three standalone web UI skills; start with ui-kit.' }],
].map(([name, bundle]) => [name, { ...bundle,
  members: readFileSync(new URL(`../bundles/${name}.txt`, import.meta.url), 'utf8').trim().split(/\s+/),
}]))

// A skill is the same folder everywhere — SKILL.md plus its siblings. Only the
// directory the agent reads differs, so a target is just a pair of paths.
const TARGETS = [
  { name: 'claude', label: 'Claude Code', project: ['.claude', 'skills'], home: ['.claude', 'skills'], call: '/' },
  { name: 'cursor', label: 'Cursor', project: ['.cursor', 'skills'], home: ['.cursor', 'skills'], call: '/' },
  { name: 'codex', label: 'Codex', project: ['.agents', 'skills'], home: ['.agents', 'skills'], call: '$' },
  { name: 'copilot', label: 'GitHub Copilot', project: ['.github', 'skills'], home: ['.copilot', 'skills'], call: null },
]

function available() {
  return [SOURCE, PLUGIN_SKILLS].flatMap(source => existsSync(source) ? readdirSync(source, { withFileTypes: true })
    .filter((entry) => entry.isDirectory() && existsSync(join(source, entry.name, 'SKILL.md')))
    .map((entry) => ({ name: entry.name, path: join(source, entry.name), summary: summarize(join(source, entry.name, 'SKILL.md')) })) : [])
}

function summarize(skillFile) {
  const frontmatter = readFileSync(skillFile, 'utf8').split('---')[1] ?? ''
  const line = frontmatter.split('\n').find((it) => it.startsWith('description:'))
  if (!line) return ''
  const text = line.slice('description:'.length).trim()
  const lead = text.split(/(?<=[.:])\s|\s+[—–-]\s+/)[0]
  return lead.length > 110 ? `${lead.slice(0, 107)}...` : lead
}

function usage(skills) {
  console.log(`
Skills for Claude Code, Cursor, Codex and GitHub Copilot.

  npx github:kulichevskiy/sdlc <skill|sdlc|sdlc-ui>            interactive installation
  npx github:kulichevskiy/sdlc <skill|sdlc|sdlc-ui> --global   for every project

  --target=<${TARGETS.map((it) => it.name).join('|')}>   where to install, asked if omitted
  --scope=<project|user>   installation scope, asked if omitted
  --global            alias for --scope=user
  --lang=<language>   language the agent answers in, asked if omitted
  --force             overwrite an installed copy

Questions are skipped without terminal input and output, so the command
stays usable from a script: it installs into this project for Claude Code in English.

Available:

${[...BUNDLES].map(([name, bundle]) => `  ${name}\n    ${bundle.summary}`).join('\n\n')}
`)
  if (skills.length === 0) {
    console.log('  (nothing found — skills/ is empty)\n')
    return
  }
  for (const skill of skills) {
    if (BUNDLES.get('sdlc').members.includes(skill.name)) continue
    console.log(`  ${skill.name}`)
    if (skill.summary) console.log(`    ${skill.summary}`)
  }
  console.log('')
}

function fail(message) {
  console.error(`\n  ${message}\n`)
  process.exit(1)
}

// Ctrl-D closes the input without answering, and rl.question() never settles on
// its own after that. Pulling lines off the iterator instead settles either way:
// a buffered line still arrives, and a close with nothing behind it ends the
// iteration, so an unanswered question takes its default rather than hanging.
function reader() {
  const rl = createInterface({ input: process.stdin, output: process.stdout })
  const lines = rl[Symbol.asyncIterator]()
  return {
    async ask(query, fallback) {
      process.stdout.write(query)
      const { value, done } = await lines.next()
      if (done) process.stdout.write('\n')
      return done ? fallback : value.trim() || fallback
    },
    close: () => rl.close(),
  }
}

async function askTarget(io) {
  console.log('\n  Which agent reads these skills?\n')
  TARGETS.forEach((it, index) => console.log(`    ${index + 1}. ${it.label.padEnd(15)} ${it.project.join('/')}/`))
  const answer = (await io.ask('\n  Number or name [1]: ', '1')).toLowerCase()
  const picked = TARGETS[Number(answer) - 1] ?? TARGETS.find((it) => it.name === answer)
  if (!picked) fail(`Not one of the listed agents: "${answer}"`)
  return picked
}

async function askLanguage(io) {
  return io.ask('\n  Language the agent should answer you in [English]: ', 'English')
}

async function askScope(io, target) {
  console.log(`\n  Where should these skills be installed?\n\n    1. Project (this repository)  ${join(process.cwd(), ...target.project)}\n    2. User (all projects)       ${join(homedir(), ...target.home)}`)
  const answer = (await io.ask('\n  Number or scope [1]: ', '1')).toLowerCase()
  if (answer === '1' || answer === 'project') return 'project'
  if (answer === '2' || answer === 'user') return 'user'
  fail(`Not one of the listed scopes: "${answer}"`)
}

// The skill in the repository stays English; only the installed copy is told to
// answer in another language, so --force keeps overwriting cleanly.
function localize(skillFile, language) {
  if (/^en(glish)?$/i.test(language)) return false
  appendFileSync(skillFile, `\n## Language\n\nAnswer the user in ${language}. Commands, file paths and code stay as written.\n`)
  return true
}

const KNOWN = ['target', 'scope', 'lang', 'global', 'force', 'help']
const args = process.argv.slice(2)
const flags = new Map()
for (const arg of args.filter((it) => it.startsWith('--'))) {
  const separator = arg.indexOf('=')
  const key = arg.slice(2, separator === -1 ? undefined : separator)
  const value = separator === -1 ? true : arg.slice(separator + 1)
  if (!KNOWN.includes(key)) fail(`Unknown option: ${arg}`)
  if (['global', 'force', 'help'].includes(key) && value !== true) fail(`--${key} does not take a value.`)
  flags.set(key, value)
}
const positional = args.filter((it) => !it.startsWith('--'))
if (positional.length > 1) fail('Choose one skill or bundle.')
const [requested] = positional
const skills = available()

// Listing what is available is a documented way to run this, not a misuse.
if (!requested || flags.has('help')) {
  usage(skills)
  process.exit(0)
}

const bundle = BUNDLES.get(requested)
if (!bundle && (requested.startsWith('sdlc-') || BUNDLES.get('sdlc').members.includes(requested))) fail('Install SDLC skills together: use sdlc, or sdlc-ui for only the UI skills.')
const selected = bundle ? bundle.members : [requested]
if (!bundle && !skills.some((it) => it.name === requested)) {
  fail(`No skill named "${requested}" here. Available: ${skills.map((it) => it.name).join(', ') || '(none)'}`)
}
for (const name of selected) {
  if (!/^[a-z0-9]+(?:-[a-z0-9]+)*$/.test(name) || !skills.some((it) => it.name === name)) {
    fail(`Missing or invalid bundled skill: ${name}`)
  }
}

// A flag that takes a value and was given none is a slip, not a way to ask the
// question anyway — say so rather than guessing which was meant.
function valued(flag) {
  if (!flags.has(flag)) return null
  const value = flags.get(flag)
  if (value === true || !String(value).trim()) fail(`--${flag} needs a value, as --${flag}=<value>.`)
  return String(value).trim()
}

const named = valued('target')
if (named && !TARGETS.some((it) => it.name === named.toLowerCase())) {
  fail(`Unknown --target "${named}". Pick one of: ${TARGETS.map((it) => it.name).join(', ')}`)
}
let target = named ? TARGETS.find((it) => it.name === named.toLowerCase()) : null
let language = valued('lang')
let installScope = valued('scope')?.toLowerCase()
if (installScope && !['project', 'user'].includes(installScope)) fail(`Unknown --scope "${installScope}". Pick project or user.`)
if (flags.has('global')) {
  if (installScope === 'project') fail('--global conflicts with --scope=project.')
  installScope = 'user'
}

if ((!target || !installScope || !language) && process.stdin.isTTY && process.stdout.isTTY) {
  const io = reader()
  try {
    target ??= await askTarget(io)
    installScope ??= await askScope(io, target)
    language ??= await askLanguage(io)
  } finally {
    io.close()
  }
}
target ??= TARGETS[0]
language ??= 'English'
installScope ??= 'project'

const everywhere = installScope === 'user'
const directory = join(everywhere ? homedir() : process.cwd(), ...(everywhere ? target.home : target.project))
// Check every destination before writing any member of a bundle. lstat also
// detects dangling symlinks, which must not be silently replaced.
for (const name of selected) {
  const destination = join(directory, name)
  if (lstatSync(destination, { throwIfNoEntry: false }) && !flags.has('force')) {
    fail(`Already installed at ${destination}\n  Add --force to overwrite it.`)
  }
}

mkdirSync(directory, { recursive: true })
// Copying over the old copy would merge, leaving behind files the skill has
// since dropped. --force means replace, so clear it first.
for (const name of selected) {
  const destination = join(directory, name)
  rmSync(destination, { recursive: true, force: true })
  cpSync(skills.find(skill => skill.name === name).path, destination, { recursive: true })
  localize(join(destination, 'SKILL.md'), language)
}
const destination = bundle ? directory : join(directory, requested)
const shown = everywhere ? destination : relative(process.cwd(), destination) || destination
const scope = everywhere ? 'in every project' : 'in this project'
const entry = bundle ? bundle.entry : requested
const invocation = target.call ? `call it as ${target.call}${entry}` : `ask the agent to use ${entry}`

console.log(`
  Installed ${selected.length} skill(s) at ${shown}
  Available to ${target.label} ${scope} — ${invocation}.${!/^en(glish)?$/i.test(language) ? `\n  It answers you in ${language}.` : ''}
`)
