---
name: harness-audit
description: Audit any repository for harness-engineering readiness by checking specs, architecture truthfulness, modular boundaries, invariants, failure handling, observability, tests, CI, and AI-facing workflow guidance, then report completed, partial, and missing items with evidence.
---

# Harness Audit

Use this skill when the user wants a repo review focused on whether the
codebase is a good target for AI development under harness engineering.

This is a review skill, not an implementation skill.

## Goals

- Determine how ready the repo is for harness engineering.
- Ground every conclusion in concrete evidence from the repo.
- Distinguish between product maturity and harness maturity.

## Audit Checklist

Check each item and mark it `completed`, `partial`, or `missing`.

### 1. Spec And Truthfulness

- Is there a product or behavior spec?
- Is it current?
- Do docs describe what the code actually does?
- Are there docs that overclaim or reference missing files?

### 2. Architecture Boundaries

- Are the main entry points obvious?
- Is safety-critical logic separated from wiring code?
- Are side effects isolated from pure logic where possible?
- Do module names and file boundaries reflect responsibilities well?

### 3. Data Contracts And Invariants

- Are important data structures typed?
- Is untrusted input validated or sanitized?
- Are invariants documented and enforced in code?
- Is stored or external data treated as unsafe by default?

### 4. Failure Handling

- Are expected failure modes enumerated?
- Does the repo fail safely rather than crash or silently corrupt state?
- Are retries, gating, or duplicate protections present where needed?
- Are dangerous `catch` blocks justified?

### 5. Validation And Tests

- Does test coverage hit risky behavior, not just easy helpers?
- Are regression-prone flows tested?
- Is test discovery high signal?
- Does CI run the right checks?

### 6. Observability

- Are important decisions and failures logged?
- Is there enough information to debug a bad AI change quickly?
- Are logs structured or at least consistent?
- Are runtime decision points visible in tests?

### 7. AI Workflow Support

- Does the repo explain how agents should work here?
- Are required checks obvious?
- Are code-review expectations explicit?
- Is there a small number of trustworthy entry docs?

## Review Method

1. Start with docs.
2. Read the runtime entrypoints.
3. Read the shared helpers that hold important logic.
4. Read the tests for the risky flows.
5. Read CI and local validation config.
6. Compare docs against code.
7. Report only what the repo supports with evidence.

## Output Requirements

The audit should include:

- repo summary
- completed items
- partial items
- missing items
- top risks
- top 3 next actions

When pointing out a gap, say why it matters for harness engineering.

## Validation For This Audit

Before finalizing:

- verify the claimed docs exist
- verify the claimed tests exist
- verify the claimed CI checks exist
- verify the claimed runtime logic exists
- avoid attributing orchestration requirements to repos that do not need them

## Common Mistakes To Avoid

- confusing "good product engineering" with "good harness engineering"
- demanding orchestration features from ordinary app repos
- treating a missing spec as acceptable just because the code works today
- treating test quantity as more important than test relevance
