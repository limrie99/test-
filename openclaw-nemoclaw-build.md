# Fleet Build — NemoClaw (DGX) + OpenClaw (Mac) + Vault + Agents

**What this builds:** your two-tier agent fleet. The DGX runs NemoClaw (OpenClaw
sandboxed under NVIDIA OpenShell) as the governed hub near JobBoss and the vault;
the Mac runs plain OpenClaw as the always-on control plane with the Hermes bridge;
the Obsidian vault lives on the Synology NAS, reached over the tailnet with scoped
write access. All agents route models over the mesh.

> **Run on the machines, not from chat.** Paste sections into Claude Code on the
> relevant box, or run them in terminal. I can't reach your hardware.

> **Alpha caveat — read once:** NemoClaw is early-access alpha; NVIDIA says it's
> not production-ready. So this is a Stacy-pattern rollout: NemoClaw governs the
> DGX, the Mac stays on proven OpenClaw, and nothing load-bearing depends on
> NemoClaw until it's run clean for a few weeks. If OpenShell misbehaves, the Mac
> side keeps the fleet alive.

## Topology

```
   ┌─────────── DGX Spark (128GB, scp-ai-0326) ───────────┐
   │  NemoClaw → OpenShell sandbox + policy engine         │
   │    models: Nemotron Super 49B (swap off 120B default) │
   │            + Ornith-35B MoE / Qwen-Coder-14B (vLLM)   │
   │    agents: Hades · Scribe · Analyst   ← touch JobBoss/vault
   └───────────────────────┬───────────────────────────────┘
                           │  tailnet  (model + sessions)
   ┌───────────────────────┴──────── Mac (M1, 16GB) ───────┐
   │  OpenClaw gateway (control plane)                      │
   │    model: Ornith-1.0-9B (Ollama)                       │
   │    agents: Nexus · Warden · Loki · Scrapy             │
   │    Hermes (self-improving specialist, bridged)         │
   └───────────────────────┬───────────────────────────────┘
                           │  tailnet (read-all / write RAW+Staging)
              Synology NAS  →  /scp-vault  (Obsidian, git-tracked)
```

**Why the split:** the agents that touch JobBoss and the canonical vault sit
inside OpenShell's kernel-level sandbox on the DGX, where your governance rules
are enforced as policy, not prompt. The control plane and outward-facing agents
stay on the Mac, which has no NVIDIA hardware and doesn't need the sandbox.

## Phase 1 — DGX: NemoClaw + OpenShell

```bash
# on the DGX (Ubuntu / DGX OS, ARM64)
# 1. install NemoClaw (single-command installer per the NVIDIA/NemoClaw repo)
#    follow the official repo README for the exact current command — it changes during alpha
# 2. swap the default model off Nemotron 120B (won't fit alongside your other services)
#    target Nemotron Super 49B (~24GB) so it co-exists with vLLM + Ornith
```

Verify after install:

```bash
openclaw nemoclaw status        # NemoClaw registers commands under the openclaw CLI
openclaw doctor                 # base health + DM policy check
```

NemoClaw is the packaging; OpenShell is the security primitive (Landlock +
seccomp + network namespaces, out-of-process policy). Everything below in Phase 4
is the policy you actually write.

## Phase 2 — Mac: OpenClaw + Ornith + Hermes bridge

This is the Mac mix you already have. Condensed:

```bash
brew install node git ollama && npm i -g pnpm
brew services start ollama
ollama run hf.co/deepreinforce-ai/Ornith-1.0-9B-GGUF
launchctl setenv OLLAMA_HOST "0.0.0.0:11434" && brew services restart ollama
npm install -g openclaw && openclaw onboard --install-daemon
openclaw gateway && openclaw doctor
```

Hermes bridge (self-improving specialist, pointed at the same Ornith brain):

```bash
# install Hermes per nousresearch/hermes-agent, then:
hermes model            # choose: custom OpenAI-compatible endpoint
                        # base URL → http://localhost:11434/v1  (local Ornith)
                        #            or http://scp-ai-0326:30083/v1 (DGX, heavy)
hermes config set       # ENABLE persistent memory + skill_generation (off by default!)
hermes gateway          # exposes Hermes; OpenClaw routes to it as one backend
```

Hermes earns its keep on one narrow, repeating AnyWay workflow where its
skill-learning compounds. Don't spread it across everything — that's a second
runtime to babysit. Its self-learning only works if you turn memory +
skill_generation on; it's off by default.

## Phase 3 — The vault (NAS over tailnet)

Mount the NAS vault on whichever box runs the vault agents (DGX for
Scribe/Analyst). Keep your existing structure: `RAW/` `Daily/` `Staging/` `Wiki/`
`Reports/` `People/` `Patterns/` `data/` `.claude/commands/`.

The non-negotiable rule, enforced two ways:

- Agents read everywhere, write only to `RAW/` and `Staging/`. **Never `Wiki/`.**
  Canonical judgment is human-graduated via `/graduate` — unchanged from your spec.
- On the DGX this is enforced by OpenShell filesystem policy (Phase 4), not trust.
  On the Mac it's enforced by the agent's workspace scope.
- Hermes's learned skills write to its own `~/.hermes/` skill store, not the
  vault — keep self-learning out of your knowledge base.

## Phase 4 — OpenShell policy starter (the JobBoss-touching agents)

This is the heart of the "more secure" win. A declarative YAML policy for Hades —
read-only DB, vault write scoped, no outbound network except the tailnet model
endpoints. Representative — align keys to the OpenShell schema in your installed
version:

```yaml
# openshell/policies/hades.yaml
agent: hades
sandbox:
  filesystem:
    read:  ["/scp-vault/**"]
    write: ["/scp-vault/RAW/**", "/scp-vault/Staging/**"]   # never Wiki/
    deny:  ["/scp-vault/Wiki/**"]
  network:
    allow:
      - "scp-ai-0326:30083"     # local model (vLLM)
      - "127.0.0.1:1433"        # JobBoss SQL — READ path only (see db)
    deny: ["*"]                 # no other egress; no internet
  database:
    jobboss:
      mode: read-only           # write-back stays blocked, by policy not habit
  process:
    exec: deny                  # Hades reasons + queries; it doesn't run shell
```

Apply the same shape to Scribe (write RAW+Staging, no DB, model only) and Analyst
(read `data/`, write data-pages, DuckDB local). The pattern: least privilege per
agent, enforced in the kernel.

This is exactly why NemoClaw is the right call for the ERP-adjacent box: your
write-access policy and human-in-the-loop gates stop being conventions and become
things an agent literally cannot violate.

## Phase 5 — The agent roster (who to actually build)

Build in this order. Each gets a `SOUL.md` identity; the DGX ones also get an
OpenShell policy.

### Tier 1 — build first (real SCP data, highest value)

| Agent | Runs on | Job | Guardrail |
|-------|---------|-----|-----------|
| Nexus | Mac | Chief of staff / router. The front door. | none — orchestrates only |
| Hades | DGX (sandboxed) | JobBoss NL→SQL | read-only DB, no write-back |
| Warden | Mac | Fleet sentinel — wraps `openclaw doctor`, watches sessions | observe + alert only |

### Tier 2 — the vault agents (your earlier persona spec, now real)

| Agent | Runs on | Job | Guardrail |
|-------|---------|-----|-----------|
| Scribe | DGX (sandboxed) | Overnight RAW→Staging compile (Nemotron/Qwen) | write RAW+Staging only |
| Analyst | DGX (sandboxed) | DuckDB live-data pages (work-center load, AP pulse) | auto data-pages only |

### Tier 3 — outward-facing (AnyWay + ambient)

| Agent | Runs on | Job | Guardrail |
|-------|---------|-----|-----------|
| Loki | Mac | AnyWay-facing, vault-read for context | no SCP write paths |
| Scrapy | Mac | Recon feeding Loki | sanctioned APIs only — no raw scraping of X/Reddit |

**Hold — don't build empty agents:** Ivan, Lex — you've never pinned their jobs.
A vague persona just dilutes Nexus's routing. Name them when they have a real lane.

**One coding-agent note:** you don't need standalone Hermes and a separate coding
harness. OpenClaw + Ornith covers "build me software." Use Hermes only for the one
compounding AnyWay workflow; use the native `openclaw-code-agent` plugin if you
later want dedicated coding sessions.

## Order of operations

1. **DGX:** NemoClaw install + swap to 49B (Phase 1) → write Hades/Scribe/Analyst
   policies (Phase 4).
2. **Mac:** OpenClaw + Ornith + Hermes bridge (Phase 2).
3. **Vault:** mount NAS, scope write access (Phase 3).
4. **Agents:** Nexus → Hades → Warden, then Scribe + Analyst, then Loki + Scrapy
   (Phase 5).

**Tonight:** still just finish Tailscale on every box — that's the only thing that
must happen at the machines before you fly. Everything here you can run from
Colorado over the tailnet.

## Flagged-unverified spots (don't paste blind)

NemoClaw's exact install command, the OpenShell YAML key names, and the Hermes
install line all move during alpha — confirm each against its current repo README.
I marked these rather than guess.
