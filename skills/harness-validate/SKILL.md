---
name: harness-validate
description: Strengthen repository validation for harness engineering by adding high-signal tests, failure-mode coverage, doc truthfulness checks, observability checks, and CI enforcement that make AI changes safer to land.
---

# Harness Validate

Use this skill when the repo needs stronger validation so AI changes can be
made and reviewed safely.

This skill focuses on signal quality, not just increasing the number of tests.

## Goals

- Make regressions easier to catch quickly.
- Add coverage around risky flows and ugly edge cases.
- Keep docs, policy, and runtime behavior aligned.
- Improve the trustworthiness of CI.

## Validation Surfaces To Improve

### 1. Unit Tests

Target:

- extracted pure helpers
- invariant enforcement
- data sanitization
- fallback decision logic
- duplicate/idempotency gates

### 2. Integration Tests

Target:

- runtime entrypoint behavior
- messaging failures
- storage corruption
- retries or delayed delivery
- fallback order

### 3. Doc And Policy Checks

Target:

- docs referenced by the repo actually exist
- product docs stay aligned with code-sensitive files
- deployment or manifest changes require doc updates

### 4. Observability Checks

Target:

- internal logs are emitted for important decisions
- error paths are visible in tests
- reason codes are stable enough to assert

### 5. CI Signal

Target:

- intended tests only
- no duplicate discovery
- required checks run by default
- strict path exists for release-sensitive changes

## Workflow

1. Find the highest-risk behavior in the repo.
2. Check whether it is covered by tests.
3. If not, add the smallest high-signal test that would catch a real bad
   change.
4. Repeat for doc truthfulness or policy checks when the repo’s risk warrants
   them.
5. Ensure CI runs the right validation path.

## Validation Design Rules

- Prefer one targeted test over a broad brittle suite.
- Prefer asserting reason codes or structured events for risky branches.
- Prefer checks that make bad assumptions impossible to merge.
- Exclude generated, temporary, or agent-worktree files from normal discovery.

## Good Outcomes

- corrupt storage becomes safe empty state
- malformed persisted records are sanitized or dropped
- fallback order is stable and asserted
- failed messaging produces a visible, tested reason
- docs cannot quietly drift from sensitive runtime configuration

## Done Criteria

This skill is successful when:

- the repo’s highest-risk flows are tested
- docs/policy checks protect sensitive drift
- CI is high signal
- the validation story is simple enough that future agents will actually use it

## Companion Skills

- Use `harness-spec` first if the expected behavior is not yet written down.
- Use `harness-audit` first if you do not yet know where the risky gaps are.
