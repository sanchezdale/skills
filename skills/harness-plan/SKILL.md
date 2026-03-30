---
name: harness-plan
description: Build a phased plan to instrument any repository for harness engineering by auditing the repo, identifying missing control points, prioritizing gaps, and producing an implementation roadmap with concrete validation gates.
---

# Harness Plan

Use this skill when the user wants to make an existing repository more suitable
for AI development under harness engineering.

This skill is the top-level planner. It does not assume the repo is an
orchestrator, agent runtime, or workflow system. It works for any product repo.

## Goals

- Understand the repo as it exists today.
- Identify which harness-engineering properties already exist.
- Identify what is missing for safe, reviewable AI development.
- Produce a phased plan with concrete deliverables and validation for each
  phase.

## Use This Skill For

- "Make this repo ready for harness engineering."
- "What is missing for AI-safe development here?"
- "Design a roadmap to instrument this repo for harness engineering."
- "Turn this codebase into a better target for autonomous coding."

## Core Harness-Engineering Properties

Assess the repo against these properties:

- Product spec or behavior spec exists and is current.
- Architecture boundaries are explicit and match the code.
- Safety-critical logic is isolated into reviewable modules.
- Data contracts and invariants are typed or validated.
- Failure modes are explicit and handled safely.
- Validation is strong enough to catch regressions quickly.
- Observability exists for important runtime decisions and failures.
- Repo docs are truthful and operationally useful.
- CI produces a high-signal pass/fail result.
- AI-facing guidance exists for how changes should be made and validated.

## Required Workflow

1. Read the top-level docs first.
   - Read `README.md`, `ARCHITECTURE.md`, `AGENTS.md`, and product-specific
     docs.
2. Inspect the main runtime entry points and validation setup.
   - Read the main app entrypoints, tests, build config, and CI config.
3. Separate the repo into three views:
   - current implementation
   - documented intent
   - desired harness-engineering state
4. Identify completed properties, partial properties, and missing properties.
5. Group missing work into phases.
   - Prefer phases that are reviewable and independently valuable.
6. For each phase, define:
   - purpose
   - files or areas likely to change
   - concrete outputs
   - validation required before calling it done
7. End with a short "next 3 tasks" recommendation.

## Output Format

Produce:

- a short repo summary
- a completed / partial / missing matrix
- a phased roadmap
- a next-steps shortlist

Keep the roadmap ordered by dependency, not by convenience.

## Phase Design Rules

- Prefer the smallest step that materially improves AI safety or reviewability.
- Land docs/spec truthfulness before adding new process complexity.
- Prefer extracting pure helpers before adding more top-level runtime logic.
- Prefer validation improvements that make future refactors safer.
- Do not invent orchestration features unless the repo actually needs them.

## Validation Rules

Each phase must include at least one validation gate.

Good validation gates include:

- targeted unit tests for a newly extracted module
- integration tests for a risky runtime flow
- docs updated in the same change as behavior changes
- `pnpm check`, `make test`, or the repo’s equivalent
- artifact or policy checks when permissions, manifests, or deployment behavior
  change

Bad validation gates:

- "looks good"
- "manual spot check only" for risky flows
- broad claims without a runnable check

## Stop Conditions

Pause and say so when:

- the repo docs and code conflict in ways that hide the current truth
- the user needs to choose between materially different product behaviors
- the required validation path is missing and must be designed before coding

## Companion Skills

Use these skills as needed:

- `harness-audit` for a detailed gap assessment
- `harness-spec` when the repo is missing a reliable source of truth
- `harness-validate` when improving test, CI, logging, or policy checks
