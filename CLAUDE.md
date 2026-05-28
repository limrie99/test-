# Project: SCP Sell-Side M&A Agent

This repo is a Claude agent for **Southern Cast Products (SCP)** — a ~130-person
Bentonville, AR metal-casting foundry (NAICS 3315) preparing to sell, get
sale-ready, or pass to a successor. The "agent" is a Claude skill + supporting
references + persistent deal memory (it runs inside Claude — there is no separate
app to launch).

## How it works
- **Skill:** `.claude/skills/scp-ma-agent/` — the orchestration brain (`SKILL.md`),
  a meeting-style intake script (`assets/intake-meeting.md`), CIM/teaser templates
  (`assets/cim-outline.md`, `assets/teaser-template.md`), worked-example outputs
  (`assets/examples/`), and reference files encoding the foundry/M&A judgment
  (`references/`: valuation, buyer universe, readiness, process, advisors & fees,
  transaction costs, tax, industry).
- **Research subagent:** `.claude/agents/foundry-market-research.md` — refreshes
  the newest market data (multiples, R&W rates, cost of capital, recent deals)
  via web search when asked.
- **Memory (deal source of truth):** `memory/scp/profile.md` (company profile),
  `memory/scp/add-backs.md` (live EBITDA bridge), `memory/scp/buyers.md` (outreach
  tracker), `memory/scp/offers.md` (offer comparison), `memory/scp/deal-log.md`
  (dated running log), and `memory/scp/uploads/` (confidential source documents,
  **gitignored**). The agent writes here as it learns.
- **Permissions:** `.claude/settings.json` pre-allows reads on `memory/**` and
  `.claude/**` plus common git/ls commands so the agent isn't blocked on prompts.

## Using it
Invoke the **`scp-ma-agent`** skill (or just ask to value SCP, assess readiness,
build a buyer list, plan the process, etc.). On first use it asks for uploads and
runs an intake meeting, saving answers to `memory/scp/`. Ask for "the newest data"
to trigger live research.

## Conventions
- Memory in `memory/scp/` is the source of truth; keep `profile.md` structured and
  `deal-log.md` reverse-chronological and dated. Mark unconfirmed figures
  `(assumption — confirm)`.
- **Confidential:** SCP financials are non-public M&A data. Source documents go in
  `memory/scp/uploads/` (gitignored). Don't put real figures in commit messages
  or PR descriptions; flag before committing real financials anywhere else.
- Reference files are an early-2026 snapshot — refresh decision-critical figures
  live and update the file + deal log when they move.
