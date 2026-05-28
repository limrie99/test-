# SCP Net-to-Seller Tax Model

> Worksheet maintained by the `scp-ma-agent` skill. Compares **after-tax
> proceeds** across deal structures so offers in `memory/scp/offers.md` can be
> ranked on what the owner actually keeps. **Not tax advice** — confirm with the
> owner's CPA / a firm experienced in S-corp F-reorgs (see
> `references/tax-structuring.md`).

_Last updated: —  |  Updated by: —_

---

## Inputs (fill from intake + LOI)
- Entity type: _S-corp / C-corp / LLC_ — **confirm**
- Owner federal long-term capital-gains rate (incl. NIIT): _TBD (typ. 20% + 3.8% NIIT = 23.8%)_
- Owner ordinary-income rate (federal): _TBD (typ. 37% + 3.8% NIIT)_
- Arkansas state rate (capital gains / ordinary): _TBD_
- Headline EV (gross deal price): $_TBD_
- Working capital target / debt-like / cash at close: $_TBD_ each
- Estimated equity basis: $_TBD_
- Depreciation taken (PP&E) — recapture base: $_TBD_
- Goodwill / intangibles allocated (asset sale): $_TBD_
- Real estate inside vs. outside the entity: _TBD_

---

## Structure comparison — net-to-seller

Fill each column; the model picks the highest after-tax outcome subject to the buyer accepting the structure.

| Item | (A) Stock sale | (B) Asset sale | (C) §338(h)(10) | (D) F-reorg + asset-treatment |
|---|---|---|---|---|
| Buyer eligibility | Any | Any | Corporate buyer; 80%+ stock; S-corp or consolidated C-sub | Any (incl. PE LP) |
| Buyer step-up | No | Yes | Yes | Yes |
| Seller treatment | Capital gains | Mix: ordinary recapture + cap gains | Mix (taxed as asset) | Mix (taxed as asset) |
| Rollover-equity tax deferral | Possible | Hard | Limited (~20% pre-tax) | **Tax-deferred** |
| Depreciation recapture (ordinary) | $0 | $_TBD_ | $_TBD_ | $_TBD_ |
| Capital-gain portion | $_TBD_ | $_TBD_ | $_TBD_ | $_TBD_ |
| Federal tax (recapture × ord) | $0 | $_TBD_ | $_TBD_ | $_TBD_ |
| Federal tax (gain × LTCG) | $_TBD_ | $_TBD_ | $_TBD_ | $_TBD_ |
| State tax (AR) | $_TBD_ | $_TBD_ | $_TBD_ | $_TBD_ |
| Transaction costs (allocated) | $_TBD_ | $_TBD_ | $_TBD_ | $_TBD_ |
| **Net cash to seller** | $_TBD_ | $_TBD_ | $_TBD_ | $_TBD_ |
| Net as % of EV | _x%_ | _x%_ | _x%_ | _x%_ |

## Notes / judgment
- For an S-corp foundry with a PE buyer, an **F-reorg** is typically the default
  — it works with any buyer structure (incl. PE LPs), allows **tax-deferred
  rollover**, and is treated as an asset purchase for tax. ~70% of PE
  acquisitions of S-corps use some form of F-reorg.
- A buyer that's a **corporation** can usually agree to §338(h)(10) — but
  rollover is capped (~20% pre-tax). Compare to F-reorg.
- **Real estate owned outside the entity** is sold separately; model it as a
  parallel cap-gains transaction and add its net to total proceeds.
- **Earnouts** are taxed when received; discount expected earnout to
  probability-weighted PV when comparing offers (see `offers.md`).
- **§1202 QSBS** can exclude up to $10M / 10× basis of gain for qualifying
  C-corp stock held 5+ years — plan years ahead, not at LOI.
- **Pre-sale mitigation** (gifting, CRT, QOZ, installment) is owner-level work
  done with the CPA — track in `owner-readiness.md`.

## Decision log
- — : worksheet initialized.
