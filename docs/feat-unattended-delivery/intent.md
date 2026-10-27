# Unattended SDLC delivery

revision: 1
status: accepted
accepted_revision: 1
Acceptance: User accepted the approach in this conversation and explicitly authorized full-send through merge on 2026-10-27. This document recovers those decisions; no new product scope is added.
Slug: unattended-delivery
Path: docs/feat-unattended-delivery/

- O1: Resume from an agreed intent, spec, tickets, implementation, or PR and complete the remaining stages autonomously. The user is absent; ask no questions.
- O2: Full-send reaches verified merge; full-stop leaves the PR ready but unmerged, with automatic merging disabled. Unresolvable blockers produce an honest saved continuation point.
- O3: Rename babysit to babysit-pr. After every push request fresh @codex review and continue until the current head is clean, or an evidence-backed review loop/scope dispute prevents progress.
- O4: Make minimal reviewer fixes, push back on invalid/out-of-scope requests, and integrate the modes with existing SDLC skills and installers.

Out of scope: production operations, paid services, unrelated source changes, new product UI, changing remote protection, or updating the user's installed plugin cache.
