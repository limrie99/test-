# Tax & Deal-Structure Reference — Foundry / SCP

Not tax advice — a framework to shape the deal and brief SCP's CPA/attorney.
**First confirm SCP's entity type** (S-corp? C-corp? LLC?) in intake — it drives
everything. Many closely-held foundries are S-corps, which points to an F-reorg.

## Asset vs. stock sale — the core tension
- **Asset sale:** buyer gets a **step-up in basis** (good for buyer depreciation);
  seller faces **ordinary income on depreciation recapture** (bad for seller).
- **Stock sale:** seller gets **capital-gains** treatment (good for seller); buyer
  gets **no step-up** (bad for buyer). Buyers strongly prefer assets/step-up.

## Bridges between the two

- **§338(h)(10) election** — legally a stock sale, taxed as an asset sale. Needs a
  **corporate buyer + 80%+ stock purchase + S-corp (or consolidated C-sub) target**.
  Cons: irrevocable; ordinary-income recapture; rollover limited to ~20% pre-tax.
- **F-reorganization** — *the increasingly preferred PE structure for S-corp
  sellers.* Form NewCo HoldCo; original S-corp becomes a **QSub** (disregarded),
  converts to single-member LLC; buyer acquires LLC interests **treated as an
  asset purchase**. Pros: works with **any** buyer structure (incl. PE LPs), **no
  80% threshold**, **tax-deferred rollover**, preserves regulatory licenses, can
  support post-close QSBS. **~70% of PE acquisitions of S-corps use some form of
  F-reorg.** Likely SCP's path if it's an S-corp.

## Owner-level mitigation tools (plan early)
- **§1202 QSBS** — up to **$10M or 10× basis** gain exclusion for C-corp stock
  held 5+ years (issued when corp assets <$50M). Plan years ahead if relevant.
- **Installment sale** — defer gain via seller note (credit-risk tradeoff).
- **Charitable remainder trust (CRT)** — defer/reduce tax + income stream.
- **Qualified Opportunity Zones** — defer/reduce via QOZ reinvestment.
- **Gift / estate freeze** — move pre-sale appreciation to heirs at lower values.

## Structure considerations specific to SCP
- **Real estate:** if the owner owns the foundry real estate personally, decide
  whether to **sell or lease-back** to the buyer (and normalize rent to market in
  the EBITDA bridge — see `valuation.md`).
- **Rollover equity:** PE deals often want **10–25% rollover** — model the
  "second bite" and after-tax treatment under an F-reorg.
- **Net-to-seller:** always translate headline EV into **after-tax proceeds**
  under each structure when comparing offers (`process-playbook.md` rubric).

## What to do for SCP, early
- Get an **entity-type confirmation** and an **F-reorg feasibility memo** done
  early ($25–50k) — well before LOIs. Coordinate with the owner's CPA / a firm
  experienced in S-corp F-reorgs (e.g., RSM, Plante Moran, or a Bentonville-area
  CPA). Save the chosen structure and rationale to `memory/scp/profile.md`.
