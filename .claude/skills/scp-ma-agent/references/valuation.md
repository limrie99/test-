# Valuation Reference — Foundry / SCP

Goal: a **defensible EV range** presented as a "valuation football" — four methods
shown as bars, with a recommended range. Anchor to the foundry comp segment, not
the broad middle market. Snapshot data is early-2026; **refresh live when the
user wants the newest figures** (see SKILL §5).

---

## 0. Always start from Adjusted EBITDA (the add-back bridge)

Valuation is `Multiple × Adjusted EBITDA` (or `× Revenue`). Build the bridge
first. Standard add-back categories (each must survive a sell-side QoE):

| Category | Direction | Notes / what survives |
|---|---|---|
| Owner compensation vs. market replacement | + (usually) | Add back excess over a market GM/CEO salary; subtract if under-paid |
| Family on payroll above market | + | Only the above-market / no-show portion |
| Related-party rent vs. market | +/- | Add back if above market; **subtract** if real estate leased below market (buyer must pay market) |
| One-time legal / litigation / consulting | + | Truly non-recurring only |
| ERC / COVID distortions | +/- | Document carefully; QoE scrutinizes |
| Personal expenses run through business | + | Vehicles, travel, memberships — needs support |
| Non-recurring repairs vs. maintenance capex | + | Distinguish from normal upkeep |
| Run-rate adjustments | +/- | Annualize won/lost contracts, new customers, price changes |
| Growth vs. maintenance capex | context | Not an EBITDA add-back, but frames the multiple |

Output an explicit bridge: Reported EBITDA → each adjustment → **Adjusted EBITDA**,
with support noted per line. Flag aggressive add-backs that a buyer's QoE will cut.

---

## 1. Method A — Precedent / comparable transactions (PRIMARY for foundries)

Source: **Porter White & Co. Q1 2025 Foundry & Metal Casting M&A Industry Report**,
citing **GF Data, NAICS 3315**. Pick the row matching SCP's alloy mix and EV bracket.

**Foundry EV/EBITDA by segment and EV bracket:**

| Segment | $10–25M EV | $25–50M EV |
|---|---|---|
| Foundries overall | **5.4x** | **5.7x** |
| Iron foundries | **6.2x** | **5.4x** |
| Steel investment foundries | **5.6x** | — |
| Nonferrous (incl. aluminum) | **5.3x** | — |

**Aggregate foundry profile (benchmark):** TEV ~$47.4M · Revenue ~$48.5M ·
EBITDA margin **16.6%** · **EV/EBITDA 5.6x** · **EV/Revenue 0.9x**.

**Adjacent segments (for cross-checks / value-add machining narrative):**

| Segment | $10–25M | $25–50M |
|---|---|---|
| Primary Metal Manufacturing | 5.6x | 5.4x |
| Machine Shops | 4.8x | 5.9x (larger shops command up toward ~9.5x) |
| Forging & Stamping | 4.8x | 5.8x |

**Broad middle market for context (NOT the foundry anchor):** Capstone Partners'
Middle Market M&A Valuations Index ~**9.4x (2024)**, ~**9.8x (2025)**. Foundries
sit ~3–4 turns below this — capital intensity, cyclicality, environmental exposure.

### Premium/discount adjustments (turns of EBITDA) — SCP-specific judgment

Start from the segment base, then adjust. These are the levers the best advisors
work; quantify them in the CIM narrative.

- **Aerospace/defense end-market mix** — *the single biggest lever.* +0.5 to +1.5
  turns for meaningful, certified (AS9100/Nadcap) aero/defense content.
- **Customer concentration** — top-5 < 50% and top-1 < 25%: neutral-to-+0.25;
  top-1 > 30–40%: −0.5 to −1.0.
- **Value-add machining/finishing** — +0.25 to +0.75 vs. raw castings only.
- **Clean environmental posture** — current permits, no open NOVs, sand reuse
  program: protects the multiple; open NOVs / contamination: −0.5 to −1.0 or a
  carve-out/escrow.
- **Modern capex profile** — recent furnace/molding investment: +; large deferred
  capex: −0.5 to −1.0 (buyer prices in the catch-up spend).
- **Management depth / credible #2** — reduces owner-dependence: +0.25 to +0.5.
- **Margin vs. 16.6% benchmark** — above-segment margins support the high end.

Caveat (cite it): individual foundry deal multiples are largely reported "NA" in
GF Data/PW&Co; these are **segment aggregates**. A bespoke comp set from PW&Co,
BGL, or Lincoln International is needed for a final defensible number.

---

## 2. Method B — DCF / income approach

Build WACC from the **Kroll Cost of Capital Navigator** framework:

- Risk-free rate: 20-yr Treasury (~4–5% early 2026 — refresh).
- Equity risk premium: **Kroll U.S. ERP 5.0%** (Sep 2, 2025 update, reaffirmed
  Jan 30, 2026; was temporarily 5.5% in Apr 2025 on trade-war risk; the 5.5–6.0%
  range is the **Eurozone** ERP, not U.S.).
- Beta: from guideline public foundry/metals comps (Damodaran + Bloomberg/FactSet).
- Size premium: by market-cap decile (SCP is micro — meaningful premium).
- **Company-specific risk premium:** customer concentration, key-person,
  cyclicality, environmental — typically **+200–500 bps** for a foundry.
- **Defensible SCP WACC ≈ 16–22%.**

Terminal value: Gordon growth (long-term growth **1.5–3%**) **or** exit multiple
(**5–6x** foundry EBITDA). Cross-check the two. Discount the explicit forecast +
TV; reconcile the implied EV to the comp range — don't let DCF run away from comps.

---

## 3. Method C — Public-company comparables (limited applicability)

Foundries are mostly private; use as a sanity bound, then apply a **20–30%
private-company discount** (illiquidity / size / control). Reference tickers:
Mueller Industries (MLI), Olympic Steel (ZEUS), Park-Ohio (PKOH); note context:
Haynes International (acq. Acerinox 2024), CIRCOR (acq. KKR Dec 2023, ~$1.6B,
~$56/share), Precision Castparts (Berkshire, no longer public). Thin and noisy —
weight lightly.

---

## 4. Method D — LBO / PE affordability floor

Back into the price a financial buyer can pay and still hit target returns:

- Capital structure: **50–60% senior debt** (SOFR + 450–600, ~1–1.5% commitment),
  **10–15% mezz/sub** (11–13%), **25–40% equity**.
- Leverage available ~**4.5–5.5x EBITDA** (Bain/GF Data middle-market debt levels).
- 5-year hold, **20–25% target IRR**, exit at same or **1 turn lower** multiple.
- Solve for entry EV that clears the IRR hurdle → that's the **PE floor**. A
  strategic with synergies can usually pay above it; use the gap to argue for
  strategics first.

---

## 5. Putting it together — the football + recommendation

- Plot the four method ranges as bars; recommend a range (usually centered on the
  comp method, bounded by LBO floor and a synergy-adjusted strategic high).
- Express both **EV/EBITDA** and **EV/Revenue (~0.9x benchmark)** as a cross-check.
- State the **base** (segment multiple × adjusted EBITDA) and the **upside**
  ("fix concentration + tell the aero story + reset capex → 5.5x to ~7.0x").
- List the 3–5 assumptions that most move the number and what would tighten them.
- Save the run (date, inputs, output range) to `memory/scp/deal-log.md`.

### Illustrative only (replace with SCP's confirmed figures)
~$5M adjusted EBITDA × 5.4–6.2x ≈ **$27–31M EV** base; with a credible
aero/low-concentration/clean-environmental story, **6.5–7.0x ≈ $32–35M**.
EV/Revenue cross-check at 0.9x on ~$30M revenue ≈ ~$27M. These are placeholders —
confirm SCP's real revenue, adjusted EBITDA, and alloy mix in intake first.
