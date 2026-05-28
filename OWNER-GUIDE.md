# SCP Sale Agent — Owner's Quick Start

A senior banker, exit-planning coach, and deal quarterback rolled into one,
pre-loaded with foundry-specific M&A judgment for SCP. Talk to it in plain
English — it runs inside Claude, with no app to install.

---

## How to start (60 seconds)

1. **Open Claude** with this repo loaded (the Claude desktop app, the Claude
   Code CLI, or the web at claude.ai/code — whichever you already use).
2. **Just type what you want** — for example:
   - *"Let's run the SCP intake."*
   - *"What's SCP worth?"*
   - *"Who would buy SCP?"*
   - *"What do I need to do to be ready to sell in 24 months?"*
3. **The first session is a meeting**, not a form. The agent will introduce
   itself, ask you to send a few documents when you can, and walk you through
   about seven topics — one at a time. You can spread it across several
   sessions; nothing has to happen at once.

---

## What you can ask it to do

You don't need to memorize commands — say it in plain English. These all work:

- **Value the business** — "What's SCP worth?" / "Run a quick valuation."
- **Build the buyer list** — "Who would buy SCP? Who do I call first?"
- **Score readiness** — "What's keeping us from a better multiple?" /
  "What should I fix in the next 12 months?"
- **Start a CIM or teaser** — "Draft a teaser." / "Outline the CIM."
- **Compare offers** — "Here are two LOIs. Which is better, and why?"
- **Pick a banker** — "Help me shortlist sell-side advisors."
- **Estimate the all-in cost** — "What will this sale actually cost me?"
- **Tax structure** — "How much do I keep after tax under each structure?"
- **My own readiness** — "How am I doing on personal and financial readiness?"
- **Define anything** — "What's an F-reorg?" / "Explain R&W insurance."

If a question spans several of these, just ask both — *"Value SCP and tell me
who'd buy it"* — the agent will do them in sequence and tie it together.

---

## What to send when you have a minute

Drop these into the **`memory/scp/uploads/`** folder. That folder is private
to your machine — files placed there do **not** get committed to the repo.

- 3 years + last twelve months P&L and balance sheet (tax returns are fine if
  you don't have a review/audit).
- A top 10–20 customer list with revenue and end-market mix.
- Cap table / ownership docs — including the entity type (S-corp / C-corp / LLC).
- An equipment list with ages (furnaces, molding lines), and your recent capex.
- Air permits, any EPA/state notices, foundry-sand handling, Phase I/II if any.
- Org chart, key-person roster, headcount, union status.
- Anything previous: prior valuation, QoE, inbound buyer letters.

Nothing's blocking. If you don't have a document yet, just tell the agent the
number — it'll mark it `(assumption — confirm)` until paper arrives.

---

## Want today's market data?

The agent has a snapshot of foundry valuations, R&W insurance rates,
cost-of-capital inputs, and recent deals. **For numbers that matter, ask:**

> *"Use the newest data."*

The agent will refresh from public sources, date-stamp the answer, and save
the update so you don't have to re-ask next session.

---

## Where your information lives

Everything the agent learns lives in **`memory/scp/`**:

- `profile.md` — the business and your goals
- `add-backs.md` — your EBITDA story
- `buyers.md` — who's been approached and where they stand
- `offers.md` — offers stacked against each other
- `owner-readiness.md` — your personal & financial readiness
- `tax-model.md` — net-to-seller by deal structure
- `advisor-shortlist.md` — banker comparison
- `deal-log.md` — a dated running log of every conversation and decision
- `uploads/` — your source documents (private)

Open any file to see what's been captured. Edit anything directly if you want
to correct or add something — the agent will pick up your edits next session.

---

## Confidentiality

This is non-public M&A information about your company.

- Real financials and customer names stay in `memory/` only. Nothing goes into
  commit messages, public posts, or anywhere outside the repo.
- Source documents in `uploads/` are gitignored — they never leave your machine.
- In any buyer-facing document (CIM, teaser), customers are referred to as
  percentages, not names, unless you authorize naming them.
- The agent will check with you before committing anything containing real
  financial figures.

---

## If you change your mind

The point of this isn't "sell soon at any price." You can use it to:

- **Sell now** — engage a banker, run the auction, close.
- **Get ready to sell later** — 1–5 years of multiple-expansion work.
- **Pass to a successor** — internal sale, family transition, or ESOP.
- **Decide not to sell** — leave the readiness work in place, optionality
  preserved.

Tell the agent if your intent changes. It'll re-orient.

---

## TL;DR

1. Open Claude in this repo.
2. Say what you want, in plain English.
3. Send documents when you can.
4. Ask for "the newest data" when a figure matters.
5. Everything is saved. Next session, it picks up where you stopped.

If you need more depth, see `HOW-TO-USE.md`. If you want to look at the
foundry/M&A judgment the agent uses, browse
`.claude/skills/scp-ma-agent/references/`.
