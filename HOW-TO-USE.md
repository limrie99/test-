# How to Use the SCP Sell-Side M&A Agent

A short, practical guide for using this repo as Southern Cast Products' sell-side
M&A advisor. The agent runs **inside Claude** — there's no separate app to launch.
You're the owner; it's the senior banker, exit-planning coach, and deal
quarterback rolled into one.

---

## 1. Starting a session

Open this repo in Claude Code (CLI, web, desktop app, or an IDE extension —
whichever you use). Then either:

- **Just ask in plain English** — "let's value SCP," "build the buyer list,"
  "what should I do to get sale-ready," "run the intake meeting." Claude will
  invoke the `scp-ma-agent` skill automatically when the request fits.
- **Or invoke it explicitly** — type `/scp-ma-agent` or say "use the
  scp-ma-agent skill."

On every session the agent will:
1. Read `memory/scp/profile.md` and `memory/scp/deal-log.md` to see where we left off.
2. Log "session opened" with today's date to `deal-log.md`.
3. Either pick up where we stopped, or — if the profile is still empty — ask
   you for uploads and start the intake meeting.

---

## 2. First-time intake — what to expect

The first session is a **meeting**, not a form. The agent will ask 1–3 related
questions at a time, listen, save what you said, and move on. You can spread
intake across several sessions; nothing has to happen at once.

It walks through seven areas:

1. The business & casting capabilities (process, alloys, value-add, certifications).
2. Financials & the add-back schedule (the EBITDA bridge).
3. Customers & end markets (concentration is the big lever).
4. Operations & capex (furnaces, molding lines, deferred capex).
5. Environmental & regulatory (foundry-specific diligence flashpoint).
6. People & owner-dependence (the credible #2 question).
7. **Your personal and financial goals and timeline** — most important. Most
   owners who later regret a sale regret it at this step. Plan to spend real
   time here.

---

## 3. Uploading documents

Drop SCP documents into **`memory/scp/uploads/`**. That folder is
**gitignored** — files placed there will not be committed to the repo, so they
stay local to your machine / session.

Send when you can (no order required):

- 3 years + TTM P&L and balance sheet (or tax returns if no review/audit).
- Add-back support — owner comp, family payroll, related-party rent, one-time items.
- Customer-by-revenue (top 10–20), end-market mix, contract vs. PO.
- Cap table / entity docs (**entity type drives everything tax-related**).
- Equipment list with ages — furnaces, molding lines, coremaking, capex history.
- Environmental — air permits, any NOVs, foundry-sand, NESHAP, Phase I/II.
- Org chart, key-person roster, union status, headcount, turnover.
- Any prior valuation, QoE, exit-plan work, or inbound buyer interest.

You can also paste figures into the chat. The agent will mark anything not
backed by a document as `(assumption — confirm)` until paper shows up.

---

## 4. What you can ask the agent to do

Each capability draws on a reference file with the foundry / M&A judgment baked in.

| Ask for… | Agent will… | Example prompt |
|---|---|---|
| **Sale-readiness assessment** | Score SCP on Value Builder's 8 drivers + EPI's 4 C's + a foundry overlay; return a value gap and 90-day-sprint action items | "Score readiness and tell me the biggest value gaps" |
| **Valuation** | Build a "valuation football" — GF Data foundry comps, DCF/WACC, public comps, LBO floor — with a defensible EV range and the add-back bridge | "What's SCP worth?" / "Run the valuation" |
| **Buyer universe** | Produce a tiered A/B/C list of named strategics + PE platforms, sequenced to SCP's alloy mix, with who-to-call-first | "Build the buyer list" / "Who would buy SCP?" |
| **CIM / teaser** | Draft a 60–100pp CIM from your profile + add-backs, and a 1-page anonymized teaser | "Start a draft CIM" / "Give me a teaser" |
| **Process plan** | Lay out the 7-phase sell-side timeline with tasks, durations, and what to prepare when | "Plan the sale process" |
| **Offer / LOI evaluation** | Score each IOI/LOI on price + certainty of close + non-price fit; recommend a counter | "Compare these LOIs" / "Should I take this offer?" |
| **Advisor selection** | Recommend tier/firm, model fees (Modified vs. Double Lehman, retainer, tail), and run a beauty-contest scorecard | "Help me pick a banker" |
| **Transaction-cost model** | All-in cost estimate (advisor, QoE, legal, tax, environmental, R&W) as % of EV | "What will this sale cost me?" |
| **Tax & structure** | Compare asset / stock / §338(h)(10) / F-reorg net-to-seller; recommend a path | "What structure should we use?" / "How much do I keep?" |
| **Owner readiness ('three legs')** | Track business value, personal goals, and financial readiness quarterly; surface regret triggers | "How am I doing personally on readiness?" |
| **Industry context** | Foundry market snapshot, NAICS 3315 data, AFS outlook, tariff backdrop | "What's the foundry market doing?" |
| **Glossary** | Define any M&A term in plain English | "What's an F-reorg?" / "Explain R&W insurance" |

You can also chain them: "*value SCP and build the buyer list*" — the agent
runs them in sequence and ties the answer together.

---

## 5. Asking for the newest data

The reference files were built from a research brief dated early 2026 —
multiples, R&W insurance rates, cost-of-capital inputs, and recent deals all
move. **When a number matters, ask for the latest:**

- "**Use the newest data**" — the agent will refresh decision-critical figures
  via web search before answering.
- "**Refresh everything**" — the agent will spawn the `foundry-market-research`
  subagent to do a sweep (R&W rates, GF Data foundry multiples, recent
  consolidator activity, AFS outlook, etc.) and return a dated, sourced summary.

Refreshed figures are date-stamped, cited, and saved back into the reference
files and `deal-log.md` so they persist.

---

## 6. Where your data lives

Everything the agent learns goes into **`memory/scp/`**:

| File | What's in it |
|---|---|
| `profile.md` | Structured company profile (financials, casting/alloys, customers, ops, environmental, people, owner goals) |
| `add-backs.md` | Live EBITDA bridge (reported → adjusted), with QoE-survival risk per line |
| `buyers.md` | Tiered A/B/C outreach tracker — status, dates, contacts |
| `offers.md` | IOI/LOI comparison rubric (price + certainty + non-price fit) |
| `owner-readiness.md` | Your personal & financial readiness over time |
| `tax-model.md` | Net-to-seller comparison across deal structures |
| `advisor-shortlist.md` | Banker beauty-contest scorecard (Phase 0) |
| `deal-log.md` | Dated running log of every meeting, decision, and analysis |
| `uploads/` | Source documents — **gitignored** (stays local) |

Open any of these to see what the agent has captured. You can edit them
directly too; the agent will pick up your edits next session.

---

## 7. Coming back to it next time

Just start a new session in the repo. The agent reads memory first, then
greets you with a one-line status (e.g., *"Picking up SCP — last we had
revenue $X, adj. EBITDA $Y, targeting exit in Z. What do you want to work
on?"*) and asks what you want to do. No re-intake — it picks up where you
stopped.

If you've changed something between sessions (a new contract signed, a new
customer added, a piece of equipment installed), tell the agent and it'll
update the profile, log the change in `deal-log.md` with the date, and note
the old value so nothing gets silently overwritten.

---

## 8. Confidentiality

This is non-public M&A data. The agent treats it that way:

- Real financials and customer names **never go in commit messages, PR
  descriptions, or anything pushed publicly** — only into the memory files.
- Source documents stay in **`memory/scp/uploads/`** (gitignored).
- In any buyer-facing material (CIM, teaser), customer names are **% only**
  unless you specifically authorize naming them.
- The agent will flag with you before committing anything that contains real
  figures, even to the memory files themselves.

---

## 9. Customizing the agent

If you want to tune how the agent thinks (e.g., your view on which add-backs
should survive QoE, or a buyer to add/exclude permanently), edit the relevant
file in **`.claude/skills/scp-ma-agent/references/`** — that's where the
foundry/M&A judgment lives:

- `valuation.md` — multiples, DCF inputs, LBO floor, add-back categories
- `buyer-universe.md` — the named strategic + PE buyer list
- `readiness-assessment.md` — the scorecard drivers and overlay
- `process-playbook.md` — the 7-phase timeline
- `advisors-and-fees.md` — Lehman variants, advisor shortlist
- `transaction-costs.md` — the all-in cost model
- `tax-structuring.md` — structure options
- `industry-snapshot.md` — foundry market context
- `glossary.md` — owner-facing definitions

The agent will use your edits the next time it runs.

---

## 10. Common questions

**"Do I need to run the full intake before getting a valuation?"**
No. Ask for a quick valuation and the agent will run it on assumptions — every
unconfirmed figure is marked `(assumption — confirm)`. The intake just makes
the answer sharper.

**"Can I delete or rewrite something the agent saved?"**
Yes — `memory/scp/` is yours. The files are plain markdown. Just keep
`profile.md` headings intact so the agent can find sections next session.

**"What if my numbers change between sessions?"**
Tell the agent. It'll update `profile.md`, note the old value and the reason
in `deal-log.md` with today's date, and re-run anything downstream that
depends on the change (valuation, cost estimate, etc.).

**"How long should the readiness work take?"**
The brief's planning horizon is **2–5 years** before a target exit. The
readiness scorecard plus 90-day sprints is built around that horizon. Even
6–12 months can move the multiple — but the personal/financial-readiness work
should never be rushed.

**"What if I want to stop the sale process partway?"**
That's a legitimate outcome — the agent supports "get sale-ready" and "pass to
a successor" as alternative endings, not just "sell." Tell it your intent has
changed and it'll re-orient the work.

---

## TL;DR

1. Open the repo in Claude. Just talk to it.
2. First session: it asks for uploads (drop them in `memory/scp/uploads/`) and
   runs a meeting-style intake.
3. Ask for valuations, buyer lists, readiness scores, CIM drafts, offer
   comparisons, advisor picks, cost estimates — in plain English.
4. Say "use the newest data" when a figure matters.
5. Everything is saved in `memory/scp/`. Next session, it picks up where you stopped.
