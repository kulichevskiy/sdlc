# Evaluate the UI skills

Use temporary projects to test how the UI skills interview users, build components, and review screens.

Install `sdlc-ui` from the local checkout into each test project. Set the target, scope, and response language explicitly. Give the agent the task, installed skill path, and project files. Keep the expected results below in the evaluator's notes.

Answer interview questions as the test user and save those answers. Let the agent ask about a missing component before approving an extension.

## Scenarios

| Task and project | Expected behavior |
|---|---|
| Create a signup kit in an empty web project | Propose a complete foundation, interview the user, and provide a technical reference with shared component specimens; do not build a signup screen |
| Ask for a new kit without color preferences, request a warmer palette after seeing it, then accept it | Ask whether to propose colors; render only Colors in the panel; request feedback; revise the palette at the same URL without starting Typography; after acceptance, ask about typography and add its specimens while keeping accepted colors visible |
| Resume with Colors accepted and Typography awaiting feedback | Preserve Colors, continue the pending typography feedback loop, and do not generate Icons or restart the color interview; distinguish section acceptance from kit readiness |
| Create a kit for a themed product's first scenario | Show primary, neutral, success, failure, warning, and optional secondary palettes, each with tints and shades; fonts/type scale and headings, paragraphs, lists, links; icons; spacing/sizing; neutral desktop/mobile grids; surfaces and interaction rules; then component specimens. Display values from shared sources. No themed product mockup, hero, or demo flow |
| Adopt a kit whose status tokens are called error and whose brand needs no secondary color | Preserve the source names, map error to failure, document the omitted secondary palette, and surface missing tint/shade steps for agreement |
| Extend an adopted kit with one approved icon size | Update that source, specimen, rule, and verification without rebuilding foundations or introducing a product screen |
| Adopt a kit in a React product with several button variants | Inspect existing code and screens, then ask which variants to adopt |
| Build a screen that needs a missing component variant | Discuss the variant, update the kit after agreement, and resume the screen |
| Review a cloned component, a local override, and an unsupported variant | Cite the kit rules and the code or rendered behavior that conflicts with them |
| Review a screen composed from approved components | Accept the composition without requiring a new kit component for ordinary page markup |
| Review a visual choice that the kit leaves undefined | Report the missing rule and ask how to resolve it |
| Review with the browser unavailable | Report source findings and identify the screens and states still to check |
| Run with and without an SDLC project profile | Follow an existing profile and allow independent UI work when there is none |

## Record results

Include a browser review when testing rendered behavior. Record the screens, states, and viewport sizes inspected. Compare product and kit file hashes before and after review to verify that the skill changed only its report and evidence files.

Save the skill revision, test project, user task and answers, agent actions, generated files, commands, and results. Record source inspection and browser checks separately.

For an independent evaluation, give another agent the original inputs and let it reach its own findings. Record who performed the evaluation. Fix demonstrated failures and rerun the affected scenarios.
