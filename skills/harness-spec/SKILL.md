---
name: harness-spec
description: Create or tighten the source-of-truth docs needed for harness engineering, including a behavior spec, architecture truthfulness updates, invariants, failure modes, and change-validation expectations.
---

# Harness Spec

Use this skill when a repo needs better source-of-truth documentation before AI
can safely make changes.

This skill is about reducing ambiguity.

## Goals

- Create a concise but authoritative behavior spec when one does not exist.
- Tighten architecture docs so they describe current reality.
- Document invariants, fallback order, failure handling, and non-goals.
- Make future AI changes safer by shrinking the space of acceptable guesses.

## Use This Skill For

- missing `docs/spec.md`
- stale architecture docs
- unclear runtime guarantees
- repeated regressions caused by undocumented behavior

## Required Outputs

Create or update some combination of:

- `docs/spec.md`
- `ARCHITECTURE.md`
- `docs/architecture.md`
- product-specific operational docs

## What A Good Harness Spec Includes

- purpose
- supported and unsupported environments
- normalized inputs and outputs
- important invariants
- core user flows
- fallback order where applicable
- failure handling rules
- duplicate or idempotency rules where needed
- internal observability expectations
- explicit non-goals

## Writing Rules

- Prefer concrete behavior over vague principles.
- Prefer "must" for invariants and safety rules.
- Prefer short sections with direct statements.
- Distinguish current implementation from desired future structure.
- Do not describe a file, workflow, or capability that the repo does not have.

## Architecture-Truthfulness Pass

When updating architecture docs:

1. Read the code first.
2. Mark what is current.
3. Mark what is planned only if it is clearly labeled as planned.
4. Remove or rewrite misleading statements.

If a doc currently mixes "what exists" with "what should exist," split those
concepts explicitly.

## Validation Rules

A spec update is not complete unless:

- the doc matches the code for current behavior
- risky flows are described with enough precision to test them
- missing files are not referenced as if they exist
- the repo’s normal doc linting or validation passes when available

When behavior docs are added or materially changed, recommend or add tests that
prove the most important rules.

## Companion Work

After writing or tightening the spec, the next likely skills are:

- `harness-validate` to align tests and CI with the new spec
- `harness-plan` to phase remaining implementation work
