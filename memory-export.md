# Hermes Memory Export — Bennie Williams / Digital Ethnicity

**Generated:** 2026-09-08 (UTC)
**From:** srv838555 (Hostinger VPS2 / 31.97.65.6)
**For:** New Hermes instance migration → ha.benniewilliams.com

---

## 1. User Profile (Ben)

**Name:** Bennie Williams — address as "Ben"
**Email:** bennie.williams36@gmail.com
**Phone:** 757-652-6922
**Website (personal brand):** benniewilliams.com (fractional CTO + AI coaching)
**Business:** Digital Ethnicity LLC — digital-ethnicity.com
**Wife:** Natasha Williams — nvwilliams36@gmail.com, M.S./SHRM-SCP, fractional CHRO. Her LinkedIn profile is the one we just wrote content gaps for. Brand site target: nvwilliams.com.
**Kids:** Father was absent; computers came via mother's legal-secretary job in 1984. That story (IBM PC, red/blue DOS/BASIC books) goes on the personal site.

**Background:** Navy vet (12 years, three carriers). Senior healthcare infra leader at Children's National Hospital. AI/ML consultant + Fractional CTO for SMBs. Knows LLM internals — peer-level, concise, expects pushback. Eastern timestamps, often active ~2 AM.

**Clients (Digital Ethnicity):**
- Derrick Burgess (DB Health / dbhealthx.com)
- Tricia Forchetti (Forchetti Eyewear)
- Sunki Ajewole (EWA Medspa / ewamedspa.com)

---

## 2. Email Rules (HARD)

- Client / third-party mail = **drafts only**. Ben sends. Agents create Gmail drafts in his account, never send.
- Agents MAY email Ben directly (bennie.williams36@gmail.com) for status/change reports. 12-hour cadence per USER.md.
- Natasha (Ben's wife) = same draft-only rule. She approves blog posts via email reply.

---

## 3. Deployment Convention

**Always deploy via Dokploy + GitHub.** Push code to GitHub, then Dokploy. Never direct `docker compose` on the host.

**VPS map:**
- **VPS1** = `2.24.97.204` (srv838555, Hostinger KVM, 15GB RAM, 4 cores). Wildcard DNS: `*.planlure.com`. New Dokploy installed but empty.
- **VPS2** = `31.97.65.6` (Dokploy, all client sites + this VPS workload). Wildcard DNS: `*.bawai.org`.

**Dokploy API key for VPS2:** `cSUpiQmdaSFqbqeBKJkZnPDxIVOglLkaZlUSLBbVoQYKZDJcBqySSbmlOXYdJtoO`
Dokploy URL: `http://31.97.65.6:3000`

**Dokploy apps (live):**
- `app-hack-primary-system-an9vbl` → benniewilliams.com (original, Astro)
- `app-connect-primary-application-sl775l` → ???
- `app-hack-cross-platform-sensor-ncw1m4` → ???
- `app-hack-primary-system-an9vbl` is the Astro/static site deployed pre-Dokploy, now served via Dokploy Swarm.

**Domain-routing convention:**
- `*.bawai.org` → VPS2 (Traefik + Dokploy)
- `*.planlure.com` → VPS1 (Traefik + Dokploy)
- `benniewilliams.com` → Cloudflare proxy → VPS1 (current)

---

## 4. Existing Sites & Architecture

### Personal / Client
| Domain | Stack | Deploy | Notes |
|---|---|---|---|
| benniewilliams.com | Astro static | VPS1 (Dokploy) | Real site. Recently rebranded to "Fractional CTO". Story: father→mother/1984 IBM PC. **No fake testimonials.** |
| digital-ethnicity.com | ? | VPS2 (Dokploy) | Business brand. |
| nvwilliams.com | WordPress | VPS2 (Dokploy) | Natasha's site. Bot drafter targets this. |
| dbhealthx.com | WordPress | VPS2 | Derrick Burgess client. |
| ewamedspa.com | WordPress | VPS2 | Sunki Ajewole client. |

### Internal / Infra
| Domain | Stack | Notes |
|---|---|---|
| hermes.bawai.org | nginx proxy → hermes-dashboard | Hermes dashboard, basic auth (admin) |
| hermesmain.bawai.org | nginx proxy → hermes-peer-proxy | Peer-mode gateway (port 8377) |
| dj.bawai.org | Django 4.2 + Gunicorn + WhiteNoise | Ben's Django playground / personal site rewrite. |
| tr.bawai.org | (planned) | tenramenmd.com redesign target — bot-walled, could not scrape. |
| d.bawai.org | (planned) | EWA redesign target. |
| db1.bawai.org | (planned) | DB Health redesign target. |

### Redirects / Legacy
- `benniewilliams.bawai.org` → **retired** (was a WordPress experiment, deleted)
- `dev.benniewilliams.com` → **retired**
- `dj.benniewilliams.com` → **planned redirect target** (after we deploy to Dokploy)

---

## 5. Bot Team (Digital Ethnicity)

5 Hermes profiles under `~/.hermes/profiles/`:

| Profile | Role |
|---|---|
| `chief-of-staff` | Orchestrator, escalations, Bennie updates |
| `ops-manager` | Inbox, calendar, invoices, follow-ups |
| `client-ops` | Onboarding, client status, draft outreach |
| `research` | Competitors, local prospects, cited leads |
| `delivery` | Active redesigns, scope, timelines, blockers |

All share:
- Draft-only email rule (NEVER send, only create Gmail drafts)
- Hospital/Children's National work = out of scope unless Ben asks
- benniewilliams.com = separate from Digital Ethnicity work
- Hagerstown / Frederick MD corridor preference

Bot profiles live in **desktop app** (OpenCowork → Bots tab) group chat. Telegram default profile = Ben's direct line (this agent).

---

## 6. Gateway / Runtime

**Gateway start:** `hermes gateway start` (NOT `hermes --gateway` — that flag was removed; old systemd units still have it and break.)

**Stale systemd unit:** `/root/.config/systemd/user/hermes-gateway.service` had `gateway run` without `--profile`. Fix: add `--profile default` to ExecStart.

**Two gateways:**
- `hermes-gateway.service` (default, Ben's Telegram)
- `hermes-gateway-chief-of-staff.service` (bot team)

---

## 7. Skills Inventory

Major skills in `~/.hermes/skills/`:

**Devops:** `wp-cli`, `h5p-wordpress-deploy`, `dokploy`, `static-site-deploy`, `vps-site-deploy`, `hermes-agent`, `hermes-bot-teams`, `hermes-peer-setup`
**Productivity:** `nvwilliams-blog-drafter` (NEW — see below), `email/*`, `note-taking/*`, `weekly-review-planning`, `google-workspace`
**Outreach:** `prospect-outreach`, `client-request-reconciliation`, `prospect-site-recon`
**Software:** `test-driven-development`, `systematic-debugging`, `plan`, `inspecting-hermes-desktop-dom`, `github/*`
**Reference / Learning:** computer-networking-bible, data-center-handbook, multi-cloud-architecture, fullstack-go, django-cookbook, mlops/*, llm-wiki, more

`nvwilliams-blog-drafter` (created today):
- Every 6h cron drafts LinkedIn-targeted blog post for nvwilliams.com
- Topic pool = 10 LinkedIn gap criteria (from Natasha's resume analysis)
- Drafts Gmail email to Natasha (to) + Ben (cc) — Ben sends
- Approval parsing: `approve` → publish via WordPress REST, `reject` → archive, `edit:` → regenerate
- 800-1200 words, no em dashes, no invented stats
- Posts via PATCH (draft → publish) not POST status=publish

---

## 8. LinkedIn Gap Criteria (Natasha Williams topic pool)

1. Headline reads as credential stack, not value proposition
2. Impact section uses HR-internal language, no business outcomes (revenue, velocity, risk)
3. Industry context (federally funded cancer lab, healthcare adjacent) is buried
4. No quantified technology or systems narrative (HRIS, automation, deprecated)
5. Credentials list buries SHRM-SCP + dual Master's behind filler honors
6. No thought-leadership content surfaced
7. Featured section is empty
8. Recommendations / Endorsements count is zero
9. About summary is generic, no measurable anchor
10. No volunteer / board / community work visible

Rotation: FIFO, no repeats within 10 posts.

---

## 9. Key Infrastructure Details

### Local Wiki
Path: `~/wiki/`. Karpathy LLM Wiki pattern. Schemas in `~/wiki/SCHEMA.md`, index in `~/wiki/index.md`, log in `~/wiki/log.md`.

### Google Workspace Auth
GAPI script: `/root/.hermes/venv/bin/python ~/.hermes/skills/productivity/google-workspace/scripts/google_api.py`
Token: `~/.hermes/google_token.json`

### Python Environment
Python 3.12.3, no pip module. Use `python3` not `python`. PEP 668 = use venv or uv.
Venv at `/root/.hermes/venv`.

### Memory Files
- `/root/.hermes/memories/USER.md` — user profile
- `/root/.hermes/memories/MEMORY.md` — environment/system facts
- Session memory = my conversation context (transient)

---

## 10. Workflow Conventions

- **Address as "Ben"** — peer-level, concise, no filler.
- **Pushback preferred** — "rather corrected than agreed with."
- **Destructive actions need explicit go-ahead** — restart gateway, deploy, delete.
- **No fabricated metrics / employers / credentials** — Ben calls this out.
- **Educational products need substantial content** — 10 questions per worksheet minimum.
- **Interactive SaaS > static downloads** when building tools.
- **WordPress via REST API, never direct SQL** — causes UTF-8 emoji corruption.

---

## 11. Active / Pending Projects

- **nvwilliams.com bot drafter**: skill created, needs env vars + WordPress App Password + 2 cron jobs registered.
- **Django site at `dj.benniewilliams.com`**: deployed direct at `dj.bawai.org` first (works). Should be moved to Dokploy + GitHub at `MDsniper/bw-django` repo (already created, code not pushed).
- **tenramenmd.com redesign → `tr.bawai.org`**: bot-walled, can't scrape. Need Ben to confirm site type.
- **EWA redesign → `d.bawai.org`**
- **DB Health redesign → `db1.bawai.org`**

---

## 12. Migration Checklist for New Instance

1. Install Hermes Agent on new host.
2. Copy `~/.hermes/memories/USER.md` and `~/.hermes/memories/MEMORY.md`.
3. Copy `~/.hermes/skills/` (entire tree) — skills are portable.
4. Copy Dokploy API key + VPS access.
5. Copy Google Workspace token at `~/.hermes/google_token.json`.
6. Copy this `memory-export.md` for Ben's reference.
7. Create the `nvwilliams-blog-drafter` cron jobs (skill body has the schedule).
8. Register gateway systemd units: `/root/.config/systemd/user/hermes-gateway.service` with `--profile default` flag (lesson learned).

---

## 13. Bedrock Knowledge (don't lose this)

- **Fractional CTO market positioning**: $500/mo Advisor, $1,250/mo Retainer (Most Popular), $2,500/mo Priority. Healthcare-adjacent specialty. Hagerstown MD → DC metro service area.
- **Ben's origin story**: 1984, mother's legal-secretary job, IBM PC with red (DOS) and blue (BASIC) books. NOT his father.
- **Natasha is real, resume is real** — Frederick National Lab for Cancer Research (HR Business Partner), M.S. HR Law (Northeastern), M.S. Mgmt (UMGC), SHRM-SCP.
- **The benniewilliams.com Django template** = dark navy (#0f172a) + amber accent (#f59e0b), Inter font, system-ui stack. Fixed nav with mobile hamburger. All pages 100% content controlled — no theme overrides needed.
- **WordPress site discipline**: use REST API + Application Passwords. Never direct SQL. Container PHP needs `upload_max_filesize=64M` in Dockerfile or media uploads silently fail.
- **H5P**: installed content types via `h5p_library-install` AJAX endpoint (not CLI). H5P API download endpoints return 404 from CLI; admin AJAX works.

---

## 14. Specific Lessons Learned (hard-won)

- **WordPress Astra's `button-radius` MUST be a string**, not an array. Arrays crash the CSS generator, return 500 with no visible error to curl.
- **Cloudflare proxy**: `cf-cache-status: DYNAMIC` means it cached anyway until purge. Direct file edits to containers need Cloudflare API purge.
- **VPS1 SSH access lost**: VPS1 was blown away and rebuilt without Ben's SSH key. Use Dokploy API only for management.
- **Hermes sandbox stability**: PDF reads and long file operations sometimes timeout. Tell user what's happening, ask for content in-line if needed.
- **GitHub auth on this box**: `gh` CLI installed and authenticated as MDsniper via `~/.config/gh/hosts.yml`.
- **H5P, Django, WordPress templates, services** all documented in detail in session_search history.

---

## 15. Emergency Procedures

- **Hermes gateway down**: `systemctl --user restart hermes-gateway` from outside Telegram. Don't try from inside the gateway process.
- **VPS unreachable**: check Dokploy Traefik container, restart if needed.
- **WordPress locked out**: reset via `wp user application-password create` (generates new app password).
- **Backup location**: `~/.hermes/backup/`

---

**End of export.**
