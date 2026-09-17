# 02 — SPAD Agent-Ready Specification (Execution Order: SECOND)

> **Legal notice and disclaimer.** SPAD is a reference methodology provided "as is" and for information purposes only. It does not constitute legal, regulatory or professional advice, does not guarantee results or compliance with any law or standard, and is not a certification. Each organisation that uses it is solely responsible for validating its results, verifying the regulation that applies to it and certifying its own regulatory compliance. The author and SEACHAD accept no liability for its use.

This document defines machine-readable I/O contracts for all SPAD phases.

## Core Workflow Outputs

### PLAN Output (JSON)
```json
{
  "topic": "string (max 20 chars, snake_case)",
  "architecture": {
    "overview": "string",
    "design_decisions": ["string"],
    "patterns": ["string"]
  },
  "components": [
    {
      "name": "string",
      "responsibility": "string",
      "dependencies": ["string"],
      "interfaces": ["string"]
    }
  ],
  "flows": [
    {
      "name": "string",
      "trigger": "string",
      "steps": ["string"],
      "data_flow": "string"
    }
  ],
  "decisions": [
    {
      "decision": "string",
      "rationale": "string",
      "alternatives_considered": ["string"],
      "trade_offs": "string"
    }
  ],
  "risks": [
    {
      "risk": "string",
      "severity": "CRITICAL|HIGH|MEDIUM|LOW",
      "probability": "HIGH|MEDIUM|LOW",
      "mitigation": "string"
    }
  ]
}
```

### AUDIT_PLAN Output (JSON)
```json
{
  "topic": "string",
  "audit_date": "ISO-8601 datetime",
  "auditor_role": "string",
  "issues": [
    {
      "category": "COUPLING|COHESION|SCALABILITY|CONCURRENCY|SECURITY|OBSERVABILITY|OTHER",
      "severity": "CRITICAL|HIGH|MEDIUM|LOW",
      "description": "string",
      "location": "string (reference to PLAN section)",
      "impact": "string"
    }
  ],
  "recommendations": [
    {
      "issue_reference": "string",
      "recommendation": "string",
      "priority": "MUST_FIX|SHOULD_FIX|NICE_TO_HAVE"
    }
  ],
  "verdict": "GO|GO_WITH_CHANGES|NO_GO",
  "verdict_justification": "string",
  "next_steps": ["string"]
}
```

### CODE_PRIMER Output (JSON)
```json
{
  "topic": "string",
  "structure": {
    "directory_layout": "string (tree format)",
    "file_organization": "string",
    "module_structure": "string"
  },
  "rules": [
    {
      "category": "NAMING|STRUCTURE|ERROR_HANDLING|CONCURRENCY|TESTING|DOCUMENTATION|OTHER",
      "rule": "string",
      "examples": ["string"],
      "enforcement": "MANDATORY|RECOMMENDED"
    }
  ],
  "contracts": [
    {
      "contract_type": "API|INTERFACE|DATA_STRUCTURE|EVENT",
      "definition": "string",
      "validation_rules": ["string"]
    }
  ],
  "anti_patterns": [
    {
      "pattern": "string",
      "why_forbidden": "string",
      "correct_approach": "string"
    }
  ]
}
```

### TEST_STRATEGY Output (JSON)
```json
{
  "topic": "string",
  "coverage_requirements": {
    "minimum_total": "number (percentage)",
    "minimum_unit": "number (percentage)",
    "minimum_integration": "number (percentage)",
    "critical_paths": "100"
  },
  "test_layers": [
    {
      "layer": "UNIT|INTEGRATION|E2E|PERFORMANCE|SECURITY",
      "purpose": "string",
      "tools": ["string"],
      "scope": "string"
    }
  ],
  "test_cases": [
    {
      "id": "string",
      "name": "string",
      "type": "UNIT|INTEGRATION|E2E",
      "component": "string",
      "scenario": "string",
      "expected_outcome": "string",
      "priority": "CRITICAL|HIGH|MEDIUM|LOW"
    }
  ],
  "mocks_and_fixtures": [
    {
      "name": "string",
      "purpose": "string",
      "data_structure": "string"
    }
  ],
  "edge_cases": [
    {
      "case": "string",
      "test_approach": "string"
    }
  ]
}
```

### IMPLEMENT Output (JSON)
```json
{
  "topic": "string",
  "files_created": [
    {
      "path": "string",
      "purpose": "string",
      "key_functions": ["string"]
    }
  ],
  "files_modified": [
    {
      "path": "string",
      "changes": "string",
      "reason": "string"
    }
  ],
  "compliance": {
    "follows_primer": "boolean",
    "follows_plan": "boolean",
    "deviations": [
      {
        "deviation": "string",
        "justification": "string"
      }
    ]
  },
  "dependencies_added": ["string"],
  "next_step": "TEST_IMPLEMENTATION"
}
```

### TEST_IMPLEMENTATION Output (JSON)
```json
{
  "topic": "string",
  "tests_created": [
    {
      "test_file": "string",
      "test_cases": ["string"],
      "coverage": "number (percentage)",
      "test_type": "UNIT|INTEGRATION|E2E"
    }
  ],
  "fixtures_created": [
    {
      "fixture_file": "string",
      "purpose": "string",
      "data_samples": "number"
    }
  ],
  "mocks_created": [
    {
      "mock_file": "string",
      "mocked_component": "string",
      "behavior": "string"
    }
  ],
  "execution_instructions": {
    "command": "string",
    "environment_variables": ["string"],
    "prerequisites": ["string"]
  },
  "compliance": {
    "follows_strategy": "boolean",
    "deviations": [
      {
        "deviation": "string",
        "justification": "string"
      }
    ]
  }
}
```

### AUDIT_TESTS Output (JSON)
```json
{
  "topic": "string",
  "audit_date": "ISO-8601 datetime",
  "coverage_analysis": {
    "actual_total": "number (percentage)",
    "expected_total": "number (percentage)",
    "actual_unit": "number (percentage)",
    "expected_unit": "number (percentage)",
    "actual_integration": "number (percentage)",
    "expected_integration": "number (percentage)",
    "gaps": ["string"]
  },
  "quality_assessment": [
    {
      "aspect": "ASSERTIONS|EDGE_CASES|ERROR_PATHS|MOCKING|FIXTURES|CLARITY",
      "status": "EXCELLENT|GOOD|ADEQUATE|POOR",
      "findings": ["string"]
    }
  ],
  "test_case_review": [
    {
      "test_case_id": "string",
      "implemented": "boolean",
      "quality": "EXCELLENT|GOOD|ADEQUATE|POOR|MISSING",
      "issues": ["string"]
    }
  ],
  "verdict": "GO|NO_GO",
  "verdict_justification": "string",
  "required_fixes": [
    {
      "issue": "string",
      "severity": "CRITICAL|HIGH|MEDIUM|LOW",
      "recommendation": "string"
    }
  ]
}
```

### AUDIT_CODE Output (JSON)
```json
{
  "topic": "string",
  "audit_date": "ISO-8601 datetime",
  "auditor_role": "string",
  "fidelity_to_plan": {
    "score": "number (0-100)",
    "deviations": [
      {
        "deviation": "string",
        "justified": "boolean",
        "justification": "string"
      }
    ]
  },
  "primer_compliance": {
    "score": "number (0-100)",
    "violations": [
      {
        "rule_violated": "string",
        "location": "string",
        "severity": "CRITICAL|HIGH|MEDIUM|LOW"
      }
    ]
  },
  "technical_risks": [
    {
      "risk": "string",
      "category": "PERFORMANCE|SECURITY|RELIABILITY|MAINTAINABILITY|SCALABILITY",
      "severity": "CRITICAL|HIGH|MEDIUM|LOW",
      "evidence": "string",
      "mitigation": "string"
    }
  ],
  "technical_debt": [
    {
      "item": "string",
      "impact": "string",
      "recommendation": "string"
    }
  ],
  "status": "OK|ISSUES",
  "findings": [
    {
      "finding": "string",
      "severity": "CRITICAL|HIGH|MEDIUM|LOW",
      "location": "string",
      "recommendation": "string"
    }
  ],
  "next_step": "VERSION_MANAGEMENT|FIX_PRIMERS"
}
```

### FIX_PRIMERS Output (JSON)
```json
{
  "topic": "string",
  "fixes": [
    {
      "fix_id": "string",
      "problem": "string",
      "file": "string",
      "location": "string (line numbers or function name)",
      "change": "string (description of change)",
      "justification": "string",
      "impact": "string",
      "risk_assessment": "LOW|MEDIUM|HIGH"
    }
  ],
  "files_modified": ["string"],
  "tests_updated": ["string"],
  "regression_risk": "LOW|MEDIUM|HIGH",
  "next_step": "AUDIT_CODE"
}
```

### VERSION_MANAGEMENT Output (JSON)
```json
{
  "topic": "string",
  "version": {
    "number": "string (semantic: MAJOR.MINOR.PATCH)",
    "type": "MAJOR|MINOR|PATCH",
    "justification": "string"
  },
  "changelog": [
    {
      "category": "ADDED|CHANGED|DEPRECATED|REMOVED|FIXED|SECURITY",
      "description": "string",
      "reference": "string (TOPIC or issue number)"
    }
  ],
  "breaking_changes": [
    {
      "change": "string",
      "impact": "string",
      "migration_path": "string"
    }
  ],
  "migration_instructions": {
    "required": "boolean",
    "steps": ["string"],
    "estimated_effort": "string"
  },
  "deployment_notes": {
    "prerequisites": ["string"],
    "rollback_plan": "string",
    "monitoring_requirements": ["string"]
  },
  "next_step": "PRODUCTION_READY"
}
```

---

## Extended Workflow Outputs

### DEBUG Output (RCA Report JSON)
```json
{
  "topic": "string",
  "incident_date": "ISO-8601 datetime",
  "mode": "STATIC_AUTOPSY|RUNTIME_ORCHESTRATION",
  "incident_description": "string",
  "environment": "DEV|STAGING|PRODUCTION",
  "evidence_analyzed": {
    "files_reviewed": ["string"],
    "commands_executed": ["string"],
    "logs_examined": ["string"],
    "stack_traces": ["string"]
  },
  "root_cause_analysis": {
    "summary": "string",
    "technical_explanation": "string",
    "root_cause_category": "LOGIC_ERROR|CONFIGURATION|RACE_CONDITION|RESOURCE_EXHAUSTION|DEPENDENCY|OTHER"
  },
  "verdict": "CODE|CONFIGURATION|INFRASTRUCTURE",
  "action_items": [
    {
      "action": "string",
      "priority": "CRITICAL|HIGH|MEDIUM|LOW",
      "next_phase": "PLAN|CONFIG_CHANGE|INFRA_COMMAND"
    }
  ]
}
```

### DOCUMENT_EXISTING Output (JSON)
```json
{
  "topic": "string",
  "code_location": "string",
  "behavior_documentation": {
    "purpose": "string",
    "main_functionality": ["string"],
    "inputs": ["string"],
    "outputs": ["string"],
    "side_effects": ["string"]
  },
  "components_identified": [
    {
      "name": "string",
      "type": "CLASS|FUNCTION|MODULE|SERVICE",
      "responsibility": "string",
      "dependencies": ["string"]
    }
  ],
  "dependencies": {
    "internal": ["string"],
    "external": ["string"]
  },
  "diagrams": [
    {
      "type": "FLOW|ARCHITECTURE|SEQUENCE",
      "file": "string (.mmd file)",
      "description": "string"
    }
  ],
  "technical_notes": ["string"],
  "risks_identified": ["string"]
}
```

### DISCOVERY_LEGACY Output (JSON)
```json
{
  "topic": "string",
  "change_objective": "string",
  "areas_affected": [
    {
      "component": "string",
      "impact_level": "CRITICAL|HIGH|MEDIUM|LOW",
      "reason": "string"
    }
  ],
  "modification_risks": [
    {
      "risk": "string",
      "severity": "CRITICAL|HIGH|MEDIUM|LOW",
      "mitigation": "string"
    }
  ],
  "tests_related": {
    "existing_tests": ["string"],
    "coverage": "number (percentage)",
    "gaps": ["string"]
  },
  "edge_cases": [
    {
      "case": "string",
      "current_behavior": "string",
      "test_existence": "boolean"
    }
  ],
  "recommendations": ["string"],
  "next_step": "PLAN"
}
```

### SECURITY_AUDIT Output (JSON)
```json
{
  "topic": "string",
  "audit_date": "ISO-8601 datetime",
  "scope": {
    "files_audited": ["string"],
    "components_audited": ["string"]
  },
  "vulnerabilities": [
    {
      "id": "string",
      "severity": "CRITICAL|HIGH|MEDIUM|LOW",
      "category": "INJECTION|XSS|AUTHENTICATION|AUTHORIZATION|CRYPTO|SECRETS|INPUT_VALIDATION|OTHER",
      "owasp_reference": "string (OWASP Top 10 reference)",
      "description": "string",
      "location": "string",
      "exploit_scenario": "string",
      "remediation": "string",
      "cvss_score": "number (0-10)"
    }
  ],
  "compliance_check": [
    {
      "standard": "OWASP|PCI_DSS|HIPAA|GDPR|OTHER",
      "requirement": "string",
      "status": "COMPLIANT|NON_COMPLIANT|PARTIAL",
      "evidence": "string"
    }
  ],
  "secrets_management": {
    "hardcoded_secrets_found": "boolean",
    "locations": ["string"],
    "recommendation": "string"
  },
  "deployment_decision": {
    "critical_count": "number",
    "high_count": "number",
    "medium_count": "number",
    "low_count": "number",
    "blocks_deployment": "boolean",
    "justification": "string"
  },
  "residual_risks": [
    {
      "risk": "string",
      "severity": "MEDIUM|LOW",
      "accepted": "boolean",
      "acceptance_justification": "string"
    }
  ]
}
```

### HOTFIX Output (JSON)
```json
{
  "topic": "string",
  "incident_priority": "P1|P2",
  "fix_type": "TEMPORARY|DEFINITIVE",
  "rca_summary": "string",
  "implementation": {
    "files_modified": ["string"],
    "changes_made": "string",
    "tests_executed": ["string"]
  },
  "deployment": {
    "deployed_at": "ISO-8601 datetime",
    "deployment_method": "string",
    "rollback_plan": "string"
  },
  "monitoring": {
    "duration_minutes": "number",
    "metrics_monitored": ["string"],
    "status": "STABLE|UNSTABLE|ROLLED_BACK"
  },
  "post_mortem": {
    "incident_timeline": ["string"],
    "root_cause": "string",
    "fix_effectiveness": "SOLVED|MITIGATED|INEFFECTIVE",
    "lessons_learned": ["string"],
    "action_items": [
      {
        "action": "string",
        "owner": "string",
        "deadline": "string"
      }
    ]
  },
  "future_plan": {
    "requires_definitive_solution": "boolean",
    "topic_for_definitive_plan": "string"
  }
}
```

---

## Context Files (Not JSON, but structured)

### GLOBAL_CONTEXT Format
```markdown
# GLOBAL_CONTEXT

## Artifact Management
- <rules>

## Testing Requirements
- <rules>

## Security Baseline
- <rules>

## Version Management
- <rules>

## Prohibitions
- <rules>
```

### PROJECT_CONTEXT Format
```markdown
# PROJECT_CONTEXT

## Technology Stack
- <specifications>

## Architecture Constraints
- <rules>

## Domain Rules
- <rules>

## Compliance
- <requirements>

## SPAD Overrides
- <justified exceptions>
```

---

**Status:** Official SPAD I/O Specification  
**Owner:** Seachad (FGV)  
**Relationship:** Independent methodology, related to SEVEN-G and referenced from its document 53 (building solutions with AI)  
**Generated with assistance from GitHub Copilot**
