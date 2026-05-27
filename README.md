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

## Layout
```
.claude/skills/scp-ma-agent/   Skill: SKILL.md + assets/ (intake) + references/
.claude/agents/                foundry-market-research subagent (live data refresh)
memory/scp/                     Deal memory: profile.md + deal-log.md (source of truth)
CLAUDE.md                       How the agent is wired together
```

## Note
Reference data is an early-2026 snapshot from a research brief; the agent refreshes
decision-critical figures live. SCP financials kept in `memory/` are confidential
non-public M&A data — handle accordingly.
