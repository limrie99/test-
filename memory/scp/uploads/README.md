# memory/scp/uploads/ — Confidential

Drop SCP documents here during intake — **financials, customer-by-revenue,
cap table, equipment ages, environmental docs, org chart, etc.**

**This folder is gitignored.** Files placed here will not be committed; only this
README and `.gitkeep` are tracked so the folder stays in version control.

The `scp-ma-agent` skill reads from here when answering questions about SCP and
writes findings back to:
- `memory/scp/profile.md` — structured profile
- `memory/scp/add-backs.md` — EBITDA bridge
- `memory/scp/buyers.md` — outreach tracker
- `memory/scp/offers.md` — offer comparison
- `memory/scp/deal-log.md` — dated running log

**Confidentiality:** non-public M&A data. Never put real figures from these
documents in commit messages, PR descriptions, or anything pushed to the public
remote outside this gitignored folder. Flag the owner before committing real
financials anywhere.
