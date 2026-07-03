---
description: Run the orchestrator — sequences subagents (product-owner, engineer, qa-engineer, peer-reviewer, ponytail-reviewer, pr-reviewer) with branch hygiene and <PROJECT>-OPS handover summaries
---

<!-- Adapted from an upstream production orchestrate command. -->

Launch the `orchestrator` subagent with the user's input below as the task.

The orchestrator picks which gates apply (spec → implementation → tests → defects → review → merge-readiness), enforces the project's integration branch and conventional naming, and ensures every delegated agent writes a handover summary to `<PROJECT>-OPS/comms/YYYY-MM-DD-<agent>-<scope>.md` before advancing. Docs (PRD/research/implementation-plan) go to `<PROJECT>-OPS` attached to their GitHub issue, registered in `<PROJECT>-OPS/INDEX.md` — never the app repo.

User input:

$ARGUMENTS
