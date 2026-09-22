# SEVEN-G community · issues and feature requests with votes

*Versión en español: [README.md](README.md).*

A public page where anyone can **submit an issue or a feature request** for SEVEN-G, SPHERES or SPAD, **see the existing ones and vote on them**, with no GitHub account, no email and no tracking. The rule is in plain sight: **only requests that gather a relevant number of community votes are taken on**; issues are fixed according to their severity.

> **Legal notice.** Provided “as is”, without warranty. Submitting or voting on a request does not oblige the author to address it and creates no service relationship. Each organisation that uses SEVEN-G is solely responsible for its own regulatory compliance.

## Why it matters

An open framework improves with those who use it, but asking for an email in order to give an opinion turns the opinion into lead collection. Here the person chooses an **identifier** (a nickname), which is stored only in their browser, is never asked for again and can be changed at any time. **Contact with the author is always the user's decision**, never the other way round.

## How it works

| Piece | What it does |
|---|---|
| `index.html` | Page (ES/EN, no dependencies or third-party resources): rules, identifier, list with filters and votes, and submission form. |
| `worker/worker.js` | Minimal intermediary (Cloudflare Worker, free plan). It keeps the GitHub token as a secret, creates the issues and records the votes **with the author's account**. A token can never live in a page: anyone could read it. |
| Public issues repository | `seachad/seven-g-feedback` by default. The author replies and closes cases there. Everything is public and auditable. |

- **Data.** The submitter's identifier and the list of voters live in the issue itself, in a hidden block at the end of the text (`<!-- seveng:{…} -->`), next to a visible count. There is no database.
- **Acknowledgement of contributions.** When an issue or request is incorporated into the methodology, the author credits the person who contributed it, by their identifier. It implies no ownership or co-authorship and does not alter the intellectual property, which remains with the author under the published licences. The page says so next to the form.
- **One vote per identifier** (case-insensitive), which can be withdrawn. The submitter counts as the first vote. Closed issues do not accept votes.
- **Which issues are shown.** Only those with the `comunidad` label (the intermediary sets it, together with `peticion` or `incidencia`). Any other label added by the author (for example `planned`) is shown as a badge. An issue closed as *not planned* appears as “Not planned”; other closures, as “Resolved”.
- **Protections.** Mentions (`@name`) are neutralised so that nobody can notify third parties with the author's account; HTML comments are not accepted in the text; honeypot field against bots; hourly limit of submissions and votes per address (the IP is only used hashed with SHA-256, for one hour at most, and is not stored); writes are only accepted from the configured origins.
- **Known limits (version 0.1).** The identifier is not an account: someone may use another person's identifier or vote with several. It is a deliberate trade-off for not asking for data; the author weighs votes accordingly and may close or edit abusive submissions on GitHub. If abuse grew, the next step is to add a tracking-free anti-bot check to the intermediary.

## Set-up (once, about 15 minutes)

Until these steps are completed the page works in **read-only** mode and says that submitting is not enabled. On the SEVEN-G site they are already done (in service since 21-09-2026); they are kept for anyone reusing the page and for renewing the token when it expires. It is advisable to turn off the Worker's *Logs*, which are on by default, so that no request metadata is stored.

1. **Repository.** Create the **public** GitHub repository `seachad/seven-g-feedback`, with *Issues* enabled. A short README linking to the community page is advisable.
2. **Token.** In GitHub → *Settings → Developer settings → Personal access tokens → Fine-grained tokens*: a token with access **only to that repository** and the **Issues: Read and write** permission. No other permission. Note the expiry date in order to renew it.
3. **Intermediary.** In Cloudflare (free account) → *Workers & Pages → Create → Worker*: paste the contents of `worker/worker.js` and deploy. In *Settings → Variables and Secrets*:
   - `GITHUB_TOKEN` (type **Secret**): the token from step 2.
   - `REPO`: `seachad/seven-g-feedback`
   - `ORIGENES`: `https://seachad.github.io,http://localhost:8765`
   - optional: `LIMITE_ENVIOS` (default 5 per hour) and `LIMITE_VOTOS` (default 60 per hour).
4. **Page.** In `index.html`, block `<script id="config">`: set `endpoint` to the Worker URL (for example `https://seven-g-comunidad.<account>.workers.dev`, no trailing slash) and, if it is to be shown, `umbralVotos` (vote threshold). Publish.
5. **Check.** Open the page, choose an identifier, submit a test request and vote on it; then close it on GitHub.

The token lives only in Cloudflare. It is **never** written in this repository or in the page; `verificar_coherencia.ps1` checks that none appears.

## Tests

With `pwsh -File SEVEN-G/build/servidor.ps1`:

- `/SEVEN-G/herramientas/comunidad/_pruebas/prueba_worker.html`: runs the intermediary in the browser against an in-memory simulated GitHub (validation, votes, cache, limits, mention neutralisation).
- `/SEVEN-G/herramientas/comunidad/_pruebas/prueba_pagina.html`: opens the real page connected to that simulated intermediary, with fictitious cases, to test submitting and voting without going out to the network.

The `_pruebas` folder is not published.

## Licence

Code MIT · texts CC BY 4.0 · © 2026 Fernando García Varela.
