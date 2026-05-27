# Transaction-Cost Model — Foundry / SCP

All-in sell-side costs for a mid-market foundry deal land at **~4–7% of EV**
(>$100M EV: ~2–4%; <$10M EV: ~8–12%). Build SCP's estimate from the buckets
below, scaled to the actual EV. **R&W and QoE pricing move — refresh when the
estimate is decision-critical** (SKILL §5).

## Cost buckets (illustrative ~$30M EV / ~$5M EBITDA foundry deal)

| Bucket | Range | Notes |
|---|---|---|
| **Sell-side advisor** | $700k–$1.0M (~2.5–3.5%) | Modified Lehman 3-3-2-1-1 + ~$20k/mo retainer (half credited); Double Lehman if smaller advisor; min $400–500k typical. See `advisors-and-fees.md`. |
| **Sell-side QoE** | $40–80k | Mid-market range. Tiering: <$3M EBITDA $15–25k; $3–10M $25–50k; $10M+ $50–75k+. |
| **Sell-side legal (M&A counsel)** | $300–600k | Industrial deal with environmental complexity. |
| **Tax structuring** (F-reorg / §338 / gift planning) | $40–100k | One-time; can save multiples of cost. See `tax-structuring.md`. |
| **Audit/review uplift** (if only tax-basis) | $25–75k | Single cycle; recurring annually after. |
| **Environmental** (Phase I + targeted Phase II) | $25–75k | Foundry-specific: air permits, NESHAP review, foundry sand. |
| **R&W insurance premium** | $75–100k | ~2.5–3.0% rate-on-line × ~10%-of-EV policy limit (~$3M policy on $30M EV). |
| **Other** (board, exit planning, retention bonuses) | $50–150k | Highly variable. |
| **TOTAL** | **~$1.25M–$2.2M (4–7% of EV)** | Plus **owner-level taxes** (15–37% federal on gain, structure-dependent). |

## How to use
1. Pull SCP's confirmed EV and EBITDA from `memory/scp/profile.md`.
2. Recompute the advisor fee tier-by-tier (don't just scale %).
3. Scale QoE by EBITDA band; scale legal/environmental by complexity.
4. R&W premium = rate-on-line × policy limit; default policy limit ~10% of EV.
5. Present total $ and % of EV, separate transaction costs from **owner-level
   taxes** (which depend on deal structure), and flag which costs are optional
   (e.g., R&W, audit uplift) vs. effectively required.
6. Save the estimate to `memory/scp/deal-log.md` with the date and assumptions.

## R&W market context (refresh before quoting)
~2.5–3.0% rate-on-line in 2025, **firming** (Marsh 2025: N.A. primary R&W rates
+16% YoY after −14% in 2024; was ~5% early 2022, ~2.5% mid-2024). Retention ~0.5%
of EV → ~0.4% after 12 mo. R&W now in ~75% of PE and ~64% of strategic deals.
Quote actual pricing from a broker (Marsh/Aon/WTW/CAC Specialty/Lockton) at bind.
