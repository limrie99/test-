#!/usr/bin/env bash
# Build a versioned, installable bundle of the scp-ma-agent skill.
# Outputs into dist/: a .tar.gz, a .zip, and an INSTALL.txt with the staged contents.
# Reproducible: same VERSION + same skill files => same bundle name.

set -euo pipefail

# Resolve repo root (the parent of this script's directory).
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$REPO_ROOT"

VERSION="$(tr -d '[:space:]' < VERSION)"
COMMIT="$(git rev-parse --short HEAD 2>/dev/null || echo nogit)"
DATE="$(date -u +%Y-%m-%d)"

NAME="scp-ma-agent-v${VERSION}"
STAGE="$(mktemp -d -t scp-ma-agent-pkg.XXXXXX)"
OUT_DIR="$REPO_ROOT/dist"
mkdir -p "$OUT_DIR"

echo "==> Packaging scp-ma-agent v${VERSION} (commit ${COMMIT}, ${DATE})"

# Stage payload: the skill and its companion subagent.
mkdir -p "$STAGE/.claude/skills" "$STAGE/.claude/agents"
cp -R .claude/skills/scp-ma-agent "$STAGE/.claude/skills/"
cp .claude/agents/foundry-market-research.md "$STAGE/.claude/agents/"

# INSTALL.txt embedded in the bundle.
cat > "$STAGE/INSTALL.txt" <<EOF
SCP M&A Agent — Skill Package v${VERSION}
Built ${DATE} from commit ${COMMIT}.

WHAT'S IN HERE
  .claude/skills/scp-ma-agent/                 The skill (SKILL.md + assets + references)
  .claude/agents/foundry-market-research.md    Companion research subagent

INSTALL — macOS / Linux
  1. Quit Claude Desktop / Claude Code.
  2. From this extracted folder, run:
       mkdir -p ~/.claude/skills ~/.claude/agents
       cp -R .claude/skills/scp-ma-agent ~/.claude/skills/
       cp .claude/agents/foundry-market-research.md ~/.claude/agents/
  3. Reopen Claude. The next invocation of scp-ma-agent uses this version.

INSTALL — Windows
  1. Quit Claude Desktop.
  2. In File Explorer, open  %USERPROFILE%\.claude\skills\
     (create the .claude\skills\ path if it doesn't exist) and replace any
     existing scp-ma-agent folder with the one from this archive.
  3. Open  %USERPROFILE%\.claude\agents\  (create if missing) and copy
     foundry-market-research.md into it.
  4. Reopen Claude.

VERIFY
  Ask Claude:  "what does scp-ma-agent SKILL.md section 5 say about research mode?"
  The new version starts with:  "only when the user explicitly asks"
  and explicitly forbids browser-automation tools that open Chrome.
EOF

# Build tar.gz (universal) and zip (Windows-friendly).
TARBALL="$OUT_DIR/${NAME}.tar.gz"
ZIPFILE="$OUT_DIR/${NAME}.zip"

tar -C "$STAGE" -czf "$TARBALL" .claude INSTALL.txt
echo "    wrote $TARBALL"

if command -v zip >/dev/null 2>&1; then
  ( cd "$STAGE" && zip -qr "$ZIPFILE" .claude INSTALL.txt )
  echo "    wrote $ZIPFILE"
else
  echo "    skipped .zip (zip not installed)"
fi

rm -rf "$STAGE"

# Summary.
echo
echo "==> Done"
ls -la "$OUT_DIR" | grep "${NAME}" || true
