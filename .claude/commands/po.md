---
description: Invoke the Product Owner (story authoring / QA gate / inbound triage)
---

<!-- Adapted from an upstream production product-owner command. -->

Launch the `product-owner` subagent with the user's input below as the task.

The agent picks a mode (Story Authoring / QA Gate / Inbound Triage) based on what was passed.

Any doc it produces (PRD/research for EPICs, implementation-plan for stories) goes to `<PROJECT>-OPS` attached to the GitHub issue and registered in `<PROJECT>-OPS/INDEX.md` — never the app repo.

User input:

$ARGUMENTS
