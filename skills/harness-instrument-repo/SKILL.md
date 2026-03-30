---
name: harness-instrument-repo
description: "Instrument any repository for harness engineering by running a full workflow: audit the repo, produce a phased plan, tighten or create source-of-truth specs, and strengthen validation so the codebase becomes safer and more effective for AI development."
---

# Harness Instrument Repo

Use this skill when the user wants to improve a repository so AI can work in it
more safely, predictably, and reviewably under harness engineering.

This is the top-level orchestration skill. It coordinates the harness workflow
across planning, documentation, architecture truthfulness, and validation.

## Goals

- Turn a normal repository into a better target for AI development.
- Reduce ambiguity, unsafe edit surfaces, and weak validation.
- Produce a staged, reviewable transformation rather than a vague checklist.

## Use This Skill For

- "Instrument this repo for harness engineering."
- "Make this repo AI-ready."
- "Create a harness-engineering roadmap for this codebase."
- "Upgrade this repo so autonomous coding is safer here."

## What This Skill Accomplishes

This skill should drive four outcomes:

1. A grounded audit of the repo’s current harness readiness.
2. A phased implementation plan with validation gates.
3. Source-of-truth docs that reduce ambiguity for future AI changes.
4. Stronger validation so regressions and unsafe assumptions are easier to
   catch.

## Required Sequence

Run the work in this order unless there is a clear reason to stop early.

### Phase 1. Audit

Use `harness-audit`.

Deliver:

- completed / partial / missing assessment
- top risks
- evidence-backed findings

Validation:

- every major claim is tied to an actual file, test, config, or runtime path
- avoid forcing orchestration-specific requirements onto an ordinary app repo

### Phase 2. Plan

Use `harness-plan`.

Deliver:

- phased roadmap
- dependency-aware ordering
- concrete outputs for each phase
- explicit validation for each phase

Validation:

- each phase is independently reviewable
- each phase improves AI safety, reviewability, or signal quality
- roadmap is ordered by dependency, not convenience

### Phase 3. Spec And Truthfulness

Use `harness-spec`.

Deliver:

- behavior spec, architecture updates, or both
- explicit invariants
- explicit failure handling
- explicit non-goals

Validation:

- docs match the current implementation
- missing files are not referenced as real
- risky flows are described clearly enough to test

### Phase 4. Validation Hardening

Use `harness-validate`.

Deliver:

- targeted tests for risky flows
- doc or policy checks where appropriate
- observability assertions where helpful
- CI or local validation improvements

Validation:

- high-risk flows are covered
- test discovery is high signal
- CI or local validation paths are simple and trustworthy

## Output Contract

When using this skill, produce the following in order:

1. Short repo summary
2. Current harness-readiness matrix
3. Phased roadmap
4. Completed work, if implementation is requested
5. Remaining work
6. Next 3 recommended tasks

If the user asks only for planning, stop after phases 1 and 2.

If the user asks for implementation, continue through phases 3 and 4 as needed.

## Decision Rules

- Do not assume every repo needs workflow orchestration features.
- Do assume every repo benefits from clearer specs, boundaries, invariants, and
  validation.
- Prefer improving truthfulness before adding more process.
- Prefer extracting risky logic into reviewable modules before broad refactors.
- Prefer validation that future agents will actually run.

## Stop Conditions

Pause and say so when:

- the repo’s current behavior is too unclear to specify honestly
- the user must choose between materially different product behaviors
- validation is too weak to safely continue implementation
- the repo contains conflicting docs that hide the current truth

## Done Criteria

This skill is successful when the repo has:

- a trustworthy audit
- a phased harness roadmap
- a clear source of truth for important behavior
- stronger tests or checks around risky flows
- a clearer path for future AI changes

## Companion Skills

This skill depends on:

- `harness-audit`
- `harness-plan`
- `harness-spec`
- `harness-validate`

Use them directly when the user asks for only one slice of the work.
