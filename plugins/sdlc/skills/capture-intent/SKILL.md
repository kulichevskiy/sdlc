---
name: capture-intent
description: "Capture a task through a focused interview and save intent.md. Use to clarify a problem, desired outcome, scope, or success criteria before designing a solution."
---

Read and follow the [shared workflow contract](../setup/references/workflow.md), including its setup entry check. Resolve task artifacts from `docs/sdlc/project.md`.

# Capture intent

Interview about the task, one consequential question at a time. Recommend an answer when you have grounds for it; wait for the user's response. Look up repository facts yourself. Reuse decisions already made in the conversation.

Explore who has the problem, what happens today, what should become possible, why it matters, observable success, constraints, exclusions, and unresolved assumptions. Follow dependencies between these questions. Stop when the task is concrete enough to design; do not exhaust an arbitrary questionnaire.

Treat suggested technologies and architecture as proposals unless the user makes them constraints. Keep implementation choices for `to-spec`.

Once the task is concrete enough to name, propose a descriptive lowercase kebab-case slug using the shared directory convention. Include the slug and path in the intent summary so acceptance covers them together. Preserve a user-supplied name or path; no separate naming approval is needed.

Create or update `intent.md` in that change directory while discussing. Record the slug in the intent so later stages reuse it. Give outcomes stable IDs (`O1`, `O2`) so later artifacts can trace back to them. Include:
- Problem and affected users.
- Desired outcomes and observable success criteria.
- Constraints and out of scope.
- Open questions; proposed solutions if relevant.

Show the concise intent and unresolved decisions. Record acceptance under the shared revision rules; capturing an idea alone authorizes a draft. If questions remain, save the draft and ask the next question. End at intent, without starting implementation.
