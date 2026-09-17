# 01 — SPAD Prompt Pack (Execution Order: FIRST)

> **Legal notice and disclaimer.** SPAD is a reference methodology provided "as is" and for information purposes only. It does not constitute legal, regulatory or professional advice, does not guarantee results or compliance with any law or standard, and is not a certification. Each organisation that uses it is solely responsible for validating its results, verifying the regulation that applies to it and certifying its own regulatory compliance. The author and SEACHAD accept no liability for its use.

This document must be used first after activating the SPAD skill.

## Core Workflow Prompts

### PLAN Prompt
Design the system architecture WITHOUT writing code.
Explicitly define components, data flows, decisions, and risks.

### AUDIT_PLAN Prompt
Audit the PLAN and return a GO / GO_WITH_CHANGES / NO_GO verdict.
Evaluate: coupling, cohesion, scalability, concurrency, security, observability.

### CODE_PRIMER Prompt
Define strict implementation rules. No new design decisions allowed.
Include: structure, naming conventions, contracts, anti-patterns.

### TEST_STRATEGY Prompt
Define the testing approach before implementation.
Include: test cases, minimum coverage threshold, testing layers, mocks/fixtures.

### IMPLEMENT Prompt
Generate code strictly following CODE_PRIMER and TEST_STRATEGY.
No design decisions allowed during implementation.

### TEST_IMPLEMENTATION Prompt
Implement all tests defined in TEST_STRATEGY.
Include: unit tests, integration tests, fixtures, and mocks.

### AUDIT_TESTS Prompt
Validate tests against TEST_STRATEGY.
Check: actual vs expected coverage, test quality, edge cases coverage.

### AUDIT_CODE Prompt
Validate code against PLAN and PRIMER.
Check: fidelity to plan, compliance with rules, technical risks.

### FIX_PRIMERS Prompt
Apply minimal, justified corrections.
Each fix must state: problem, change, justification, impact.

### VERSION_MANAGEMENT Prompt
Define version number and changelog.
Include: semantic versioning, breaking changes, migration instructions.

---

## Extended Workflow Prompts

### DEBUG Prompt
Root Cause Analysis for incidents.
Modes: STATIC AUTOPSY (code analysis) or RUNTIME ORCHESTRATION (execution traces).
Output: RCA Report with verdict (CODE/CONFIGURATION/INFRASTRUCTURE).

### DOCUMENT_EXISTING Prompt
Document legacy code before modification.
Output: behavior documentation, flow diagrams, components, dependencies.

### DISCOVERY_LEGACY Prompt
Analyze impact of changes to legacy code.
Output: affected areas, modification risks, related tests, edge cases.

### SECURITY_AUDIT Prompt
Specialized security review for sensitive code.
Output: vulnerabilities classified (CRITICAL/HIGH/MEDIUM/LOW), OWASP compliance.

### HOTFIX Prompt
Accelerated workflow for P1/P2 emergencies.
Includes: rapid PLAN, accelerated AUDIT, minimal tests, immediate deployment, post-mortem.

---

## Context Requirements (Mandatory)

### GLOBAL_CONTEXT
Load universal rules before any prompt:
- Artifact location and format
- Naming conventions
- Testing requirements
- Version management rules
- Global prohibitions

### PROJECT_CONTEXT
Load project-specific rules:
- Language and frameworks
- Architecture constraints
- Compliance requirements
- Business rules
- SPAD overrides (justified)

---

## TOPIC Management

Every workflow must establish a TOPIC:
- Max 20 characters
- snake_case format
- Represents feature/bug/initiative
- Groups all artifacts in documentation/{{TOPIC}}/

---

## Validation Policy

Invalid responses must be discarded:
- Phase violation (wrong actions for current phase)
- Missing mandatory artifacts
- Off-plan decisions
- Self-approval by AI

**Rule:** Workflow compliance > apparent quality

---

## Skills (Composed Workflows)

### skill: new_feature
PLAN → AUDIT_PLAN → TEST_STRATEGY → IMPLEMENT → TEST_IMPL → AUDIT_TESTS → AUDIT_CODE → VERSION

### skill: hotfix
DEBUG → HOTFIX_PLAN → HOTFIX_AUDIT → HOTFIX_IMPL → DEPLOY → MONITOR → POST_MORTEM

### skill: document_legacy
DOCUMENT_EXISTING → [DISCOVERY] → [continue with new_feature]

### skill: security_review
SECURITY_AUDIT → FIX_CRITICAL → FIX_HIGH → DOCUMENT_RISKS