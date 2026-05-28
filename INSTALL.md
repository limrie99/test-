# Installing the SCP M&A Agent Skill

This page is for getting the `scp-ma-agent` skill into a *user's* Claude
installation (Claude Desktop or Claude Code) so it shows up as a skill they can
invoke. If you're working inside the repo itself, the skill is already
auto-discovered from `.claude/skills/scp-ma-agent/` — you don't need to install
anything.

> **Current version:** see `VERSION` (the canonical source). Bundles are built
> as `scp-ma-agent-v<VERSION>.tar.gz` / `.zip`.

---

## Option A — Build the bundle yourself (recommended)

From the repo root, run:

```bash
scripts/package.sh
```

Output appears in `dist/`:

```
dist/scp-ma-agent-v<VERSION>.tar.gz
dist/scp-ma-agent-v<VERSION>.zip        # if `zip` is installed
```

Send the archive that matches the recipient's platform (`.tar.gz` for
mac/Linux, `.zip` for Windows). Both contain the same files.

The script is reproducible: same `VERSION` + same skill files produce a
package with the same name.

## Option B — Use a pre-built bundle

If someone has already built and sent you the archive, skip Option A and go
straight to "Installing into Claude" below.

---

## Installing into Claude (the end user's machine)

### macOS / Linux

1. Quit Claude Desktop / Claude Code.
2. Extract the archive and from the extracted folder run:

   ```bash
   mkdir -p ~/.claude/skills ~/.claude/agents
   cp -R .claude/skills/scp-ma-agent ~/.claude/skills/
   cp .claude/agents/foundry-market-research.md ~/.claude/agents/
   ```

3. Reopen Claude.

### Windows

1. Quit Claude Desktop.
2. In File Explorer open `%USERPROFILE%\.claude\skills\` (create the
   `.claude\skills\` path if it doesn't exist) and replace any existing
   `scp-ma-agent` folder with the one from the archive.
3. Open `%USERPROFILE%\.claude\agents\` (create if missing) and copy
   `foundry-market-research.md` into it.
4. Reopen Claude.

---

## Verify the install

After reopening Claude, ask:

> *"What does scp-ma-agent SKILL.md section 5 say about research mode?"*

Expected first line of §5: **"only when the user explicitly asks."** If you
see anything more permissive than that, the install didn't take — re-do the
copy step.

---

## Notes

- The skill writes to `memory/scp/` in whatever working directory Claude is
  pointed at. If the user wants persistent memory across sessions, they should
  open Claude in a stable folder (e.g., the repo root) — not in a scratch dir.
- The skill is opinionated about confidentiality: source financials go in
  `memory/scp/uploads/`, which is gitignored. The skill will never push
  confidential figures to a public remote.
- Updates: re-run `scripts/package.sh` after pulling a new version, send the
  new archive, and re-run the copy step on the user's machine. Skill files are
  fully replaced, not merged — old experimental edits in
  `~/.claude/skills/scp-ma-agent/` get overwritten.
