# SCP Sell-Side M&A Agent

A Claude agent that acts as the **sell-side M&A advisor for Southern Cast Products
(SCP)** — a ~130-person metal-casting foundry in Bentonville, AR (NAICS 3315) that
is getting ready to sell, maximize value before a sale, or pass to a successor.

It runs **inside Claude** (a skill + references + persistent deal memory) — there
is no separate web app to install or launch.

## What it does
- **Intake like a meeting** — on first use it asks for document uploads and walks
  the owner through a structured intake (business, financials, customers, ops,
  environmental, people, and the owner's personal/financial goals), saving every
  answer to deal memory.
- **Sale-readiness scoring** — Value Builder 8 drivers + EPI 4 C's + a foundry
  overlay → a value gap and 90-day-sprint action items.
- **Valuation** — a "valuation football" anchored to GF Data foundry-segment
  multiples (~5.3–6.2x EBITDA), plus DCF/WACC, public comps, and an LBO/PE floor.
- **Buyer universe** — a tiered A/B/C list of named foundry consolidators and PE
  platforms, sequenced to SCP's alloy mix.
- **Process, advisors & fees, transaction costs, and tax structure** — the full
  sell-side playbook with foundry-specific judgment.
- **Live research** — refreshes the newest multiples, R&W rates, cost-of-capital
  inputs, and recent deals on request.

## How to use it
Ask Claude to run the **`scp-ma-agent`** skill — or just ask it to value SCP,
assess readiness, build a buyer list, plan the process, or "use the newest data."

- **[OWNER-GUIDE.md](./OWNER-GUIDE.md)** — owner's one-page quick start (read this first).
- **[HOW-TO-USE.md](./HOW-TO-USE.md)** — full usage guide with examples, capabilities, and customization.
- **[INSTALL.md](./INSTALL.md)** — installing the skill into someone else's Claude (Desktop / Code); build a distributable bundle with `scripts/package.sh`.

## Layout
```
.claude/skills/scp-ma-agent/
  SKILL.md                       Orchestration brain
  assets/intake-meeting.md       Meeting-style owner-intake script
  assets/cim-outline.md          60–100pp CIM section template
  assets/teaser-template.md      1-page anonymized teaser
  assets/examples/               Worked sample outputs (valuation football, scorecard)
  references/                    Foundry/M&A judgment (9 files, incl. owner-facing glossary)
.claude/agents/                  foundry-market-research subagent
.claude/settings.json            Pre-allowed reads + safe bash commands
memory/scp/
  profile.md                     Structured company profile
  add-backs.md                   Live EBITDA bridge
  buyers.md                      Buyer outreach tracker (A/B/C)
  offers.md                      Offer / LOI comparison rubric
  owner-readiness.md             Owner's personal & financial readiness (three legs)
  tax-model.md                   Net-to-seller comparison across deal structures
  advisor-shortlist.md           Banker beauty-contest scorecard
  deal-log.md                    Dated running log
  uploads/                       Confidential source docs (GITIGNORED)
CLAUDE.md                        How the agent is wired together
.gitignore                       Keeps uploads out of the repo
```

## Note
Reference data is an early-2026 snapshot from a research brief; the agent refreshes
decision-critical figures live. SCP financials kept in `memory/` are confidential
non-public M&A data — handle accordingly.
