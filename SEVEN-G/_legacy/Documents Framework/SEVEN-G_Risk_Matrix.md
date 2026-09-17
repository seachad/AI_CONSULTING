# SEVEN-G Risk Matrix

**Document Type:** Risk Management Framework  
**Framework Phase:** All Phases (Continuous Risk Management)  
**Classification:** Internal / Risk Governance  
**Version:** 2.1  
**Last Updated:** February 11, 2026

---

## 1. Introduction

### 1.1 Purpose

The SEVEN-G Risk Matrix provides a standardized framework for identifying, assessing, prioritizing, and managing risks across AI initiatives. This framework enables:

**🎯 Consistent Risk Assessment**
- Uniform methodology across all AI projects and initiatives
- Comparable risk scoring enabling portfolio-level risk management
- Clear communication of risk levels to stakeholders

**🎯 Informed Decision-Making**
- Data-driven risk evaluation supporting GO/NO-GO decisions
- Balanced view of opportunity vs risk
- Prioritization of risk mitigation investments

**🎯 Proactive Risk Management**
- Early identification of potential issues
- Structured mitigation planning
- Continuous monitoring and adaptation

**🎯 Stakeholder Alignment**
- Common risk language across organization
- Clear accountability and ownership
- Transparent risk reporting

### 1.2 Scope

**Applicable To:**
- ✅ All AI/ML initiatives regardless of size or phase
- ✅ Strategic AI programs and portfolios
- ✅ Vendor and partner managed AI projects
- ✅ AI infrastructure and platform investments
- ✅ AI governance and policy decisions

**Risk Domains Covered:**
- Strategic and business alignment risks
- Operational and process risks
- Technical and technology risks
- Financial and budget risks
- Compliance, legal, and regulatory risks
- Reputational and stakeholder risks
- Security, privacy, and data risks

**Out of Scope:**
- General business risks unrelated to AI initiatives
- Detailed technical risk assessment (covered in technical reviews)
- Project management risks (tracked in project plans)

### 1.3 Risk Management Framework

**SEVEN-G Risk Management Approach:**

```
┌───────────────────────────────────────────────────────────────┐
│                  CONTINUOUS RISK MANAGEMENT CYCLE              │
├───────────────────────────────────────────────────────────────┤
│                                                                │
│   1. IDENTIFY                                                  │
│      ↓ Discover risks through assessment, brainstorming       │
│      ↓ Document in Risk Register                              │
│                                                                │
│   2. ANALYZE                                                   │
│      ↓ Assess probability and impact using Risk Matrix        │
│      ↓ Calculate risk score and determine risk level          │
│                                                                │
│   3. PRIORITIZE                                                │
│      ↓ Rank risks by score and strategic importance           │
│      ↓ Focus on Critical and High risks first                 │
│                                                                │
│   4. PLAN                                                      │
│      ↓ Select response strategy (Avoid/Mitigate/Transfer)     │
│      ↓ Develop detailed mitigation plans                      │
│      ↓ Assign owners and resources                            │
│                                                                │
│   5. EXECUTE                                                   │
│      ↓ Implement mitigation actions                           │
│      ↓ Track progress and effectiveness                       │
│                                                                │
│   6. MONITOR                                                   │
│      ↓ Continuous monitoring of risk indicators               │
│      ↓ Re-assess risk scores as situation evolves             │
│      ↓ Identify new emerging risks                            │
│                                                                │
│   7. REPORT                                                    │
│      ↓ Regular risk reporting to stakeholders                 │
│      ↓ Escalate critical and high risks                       │
│      ↓ Communicate mitigation progress                        │
│                                                                │
│      ← Loop back to IDENTIFY (continuous improvement) ←       │
│                                                                │
└───────────────────────────────────────────────────────────────┘
```

**Risk Management Principles:**

1. **Proactive not Reactive** - Identify and address risks early
2. **Risk-Aware not Risk-Averse** - Balance risk and opportunity
3. **Transparent and Honest** - Open communication about risks
4. **Ownership and Accountability** - Clear risk owners assigned
5. **Continuous not Point-in-Time** - Ongoing risk management
6. **Data-Driven** - Objective assessment backed by evidence
7. **Pragmatic** - Proportionate response based on risk level

---

## 2. Risk Rating Methodology

### 2.1 Probability Scale

**Definition:** Likelihood that the risk event will occur within the project/initiative timeframe.

| Level | Label | Probability Range | Description | Criteria |
|-------|-------|------------------|-------------|----------|
| **5** | **Very High** | **> 80%** | Almost certain to occur | Strong indicators present; has occurred on similar projects; no effective preventive controls |
| **4** | **High** | **60-80%** | Likely to occur | Multiple indicators present; occurred occasionally on similar projects; weak preventive controls |
| **3** | **Medium** | **40-60%** | Possible to occur | Some indicators present; could happen; moderate preventive controls in place |
| **2** | **Low** | **20-40%** | Unlikely to occur | Few indicators; rarely happens; strong preventive controls in place |
| **1** | **Very Low** | **< 20%** | Rare occurrence | No significant indicators; has never occurred; very strong preventive controls |

**Probability Assessment Guidelines:**

**Consider:**
- Historical data from similar projects (Did this risk occur before?)
- Environmental and contextual factors (What conditions increase likelihood?)
- Preventive controls in place (What's stopping this from happening?)
- Expert judgment and stakeholder input
- Leading indicators and early warning signs

**Example Probability Assessments:**

| Risk | Probability | Rating | Justification |
|------|------------|--------|---------------|
| Data quality issues delay project | 70% | 4 (High) | Historical data shows quality issues in 60% of systems; limited data governance |
| Key data scientist leaves team | 25% | 2 (Low) | Good retention, competitive compensation, job satisfaction high |
| Regulatory change impacts solution | 15% | 1 (Very Low) | No pending legislation; industry stable; legal monitoring in place |
| Model performance below target | 45% | 3 (Medium) | PoC showed mixed results; some uncertainty in production data |
| Budget overrun due to scope creep | 65% | 4 (High) | History of scope changes; requirements not fully defined |

### 2.2 Impact Scale

**Definition:** Magnitude of consequence if the risk event occurs, considering multiple impact dimensions.

| Level | Label | Financial Impact | Schedule Impact | Quality/Performance | Strategic Impact |
|-------|-------|-----------------|-----------------|---------------------|------------------|
| **5** | **Critical** | **> $1M** or **>50% budget** | **>6 months** delay | Project failure; <50% of objectives met | Major strategic setback; competitive disadvantage |
| **4** | **High** | **$500K-$1M** or **25-50% budget** | **3-6 months** delay | Major degradation; 50-70% of objectives met | Significant impact on strategic goals |
| **3** | **Medium** | **$100K-$500K** or **10-25% budget** | **1-3 months** delay | Moderate issues; 70-85% of objectives met | Moderate strategic impact; recoverable |
| **2** | **Low** | **$25K-$100K** or **5-10% budget** | **2-4 weeks** delay | Minor issues; 85-95% of objectives met | Limited strategic impact |
| **1** | **Very Low** | **< $25K** or **<5% budget** | **< 2 weeks** delay | Negligible issues; >95% of objectives met | No strategic impact |

**Additional Impact Dimensions to Consider:**

**Reputational Impact:**
- Critical: Major brand damage, customer trust lost, media attention
- High: Significant reputation impact, customer complaints
- Medium: Limited reputation concern, internal only
- Low: Minimal reputation impact
- Very Low: No reputation impact

**Compliance/Legal Impact:**
- Critical: Regulatory fines, legal action, license revocation
- High: Compliance violation, regulatory scrutiny
- Medium: Potential compliance issue, corrective action needed
- Low: Minor compliance concern
- Very Low: No compliance impact

**Safety/Security Impact:**
- Critical: Life safety risk, major security breach
- High: Significant security vulnerability, data exposure
- Medium: Moderate security concern, limited exposure
- Low: Minor security issue, contained
- Very Low: No safety/security impact

**Impact Assessment Approach:**

1. Evaluate impact across ALL relevant dimensions
2. Use the HIGHEST impact across any dimension for overall rating
3. Document specific impacts in each dimension
4. Consider both direct and indirect/cascading impacts

**Example Impact Assessments:**

| Risk | Financial | Schedule | Quality | Strategic | Reputation | Overall Rating |
|------|-----------|----------|---------|-----------|------------|----------------|
| Model bias causes discrimination | $50K | 1 month | High | Medium | Critical | **5 (Critical)** ← Reputation |
| Data breach exposes customer PII | $200K | Minimal | Minimal | High | Critical | **5 (Critical)** ← Reputation + Legal |
| Integration fails with CRM | $150K | 2 months | Medium | Low | Minimal | **3 (Medium)** ← Financial/Schedule |
| Key vendor goes out of business | $400K | 4 months | High | High | Low | **4 (High)** ← Multiple dimensions |
| Model accuracy 5% below target | $80K | Minimal | Medium | Low | Minimal | **3 (Medium)** ← Financial/Quality |

### 2.3 Risk Score Calculation

**Formula:**

```
Risk Score = Probability (1-5) × Impact (1-5)
```

**Risk Score Range:** 1 to 25

**Example Calculations:**

| Risk Description | Probability | Impact | Calculation | Score | Level |
|-----------------|------------|--------|-------------|-------|-------|
| Data quality issues | 4 (High) | 4 (High) | 4 × 4 | **16** | High |
| User adoption below 50% | 3 (Medium) | 5 (Critical) | 3 × 5 | **15** | High |
| Budget overrun by 20% | 4 (High) | 3 (Medium) | 4 × 3 | **12** | High |
| Key personnel departure | 2 (Low) | 4 (High) | 2 × 4 | **8** | Medium |
| Minor documentation gaps | 3 (Medium) | 1 (Very Low) | 3 × 1 | **3** | Low |

**Scoring Guidelines:**

- Always round to whole numbers (no decimals)
- When uncertain, round UP (conservative approach)
- Document rationale for probability and impact ratings
- Re-assess scores as situation evolves (risks are dynamic)
- Consider both inherent risk (before mitigation) and residual risk (after mitigation)

---

## 3. Risk Matrix

### 3.1 Standard 5×5 Risk Matrix

**Visual Risk Heat Map:**

```
                        IMPACT →
              │   1      2      3       4       5    
              │  Very   Low   Medium  High  Critical
              │  Low                                  
   ═══════════╪═══════════════════════════════════════
P              │
R   5  Very   │   5      10     15      20      25   
O      High   │ [MED]  [HIGH] [HIGH]  [CRIT]  [CRIT] 
B              │                                      
A   4  High   │   4      8      12      16      20   
B              │ [LOW]  [MED]  [HIGH] [HIGH]  [CRIT] 
I              │                                      
L   3  Medium │   3      6      9       12      15   
I              │ [LOW]  [MED]  [MED]  [HIGH]  [HIGH] 
T              │                                      
Y   2  Low    │   2      4      6       8       10   
               │ [LOW]  [LOW]  [MED]  [MED]  [HIGH]  
↓              │                                      
    1  Very   │   1      2      3       4       5    
       Low    │ [LOW]  [LOW]  [LOW]  [LOW]   [MED]   
              │                                      
```

**Color Coding:**
- 🔴 **RED (Critical):** Scores 20-25
- 🟠 **ORANGE (High):** Scores 12-19
- 🟡 **YELLOW (Medium):** Scores 5-11
- 🟢 **GREEN (Low):** Scores 1-4

### 3.2 Risk Level Definitions

**🔴 CRITICAL RISK (Score 20-25)**

**Definition:** Risks with potentially catastrophic consequences that threaten project viability or organizational objectives.

**Characteristics:**
- High/Very High probability AND Critical impact
- Could cause project failure or cancellation
- Significant financial, strategic, or reputational consequences
- May violate regulatory requirements or legal obligations
- Could result in safety, security, or privacy incidents

**Management Requirements:**
- ⚠️ **IMMEDIATE ESCALATION** to executive leadership
- ⚠️ **URGENT ACTION REQUIRED** within 24-48 hours
- ⚠️ **DAILY MONITORING** until risk reduced
- ⚠️ May require **GO/NO-GO DECISION** or project pause
- ⚠️ **DEDICATED RESOURCES** allocated to mitigation
- ⚠️ **EXECUTIVE SPONSOR NOTIFICATION** mandatory

**Example Critical Risks:**
- AI model exhibits discriminatory bias (Prob: High, Impact: Critical, Score: 20)
- Data breach exposes 100K+ customer records (Prob: High, Impact: Critical, Score: 20)
- Regulatory compliance violation risks $5M+ fine (Prob: High, Impact: Critical, Score: 20)
- Solution fundamentally infeasible due to technical constraints (Prob: Very High, Impact: Critical, Score: 25)

---

**🟠 HIGH RISK (Score 12-19)**

**Definition:** Risks with significant consequences requiring senior management attention and formal mitigation plans.

**Characteristics:**
- Medium-High probability AND High+ impact, OR High probability AND Medium+ impact
- Could cause major delays, cost overruns, or quality issues
- Significant impact on project objectives
- May affect strategic goals or competitive position
- Requires significant mitigation investment

**Management Requirements:**
- 📋 **ESCALATION** to steering committee or senior management
- 📋 **FORMAL MITIGATION PLAN** developed within 1 week
- 📋 **WEEKLY MONITORING** and reporting
- 📋 **RISK OWNER** assigned at senior level (Director+)
- 📋 **BUDGET AND RESOURCES** allocated for mitigation
- 📋 **CONTINGENCY PLANS** developed

**Example High Risks:**
- Data quality issues delay project by 3 months (Prob: High, Impact: High, Score: 16)
- Key AI talent leaves; no succession plan (Prob: Medium, Impact: High, Score: 12)
- Integration complexity causes 6-month delay (Prob: Medium, Impact: High, Score: 12)
- Budget overrun by 40% due to scope changes (Prob: High, Impact: Medium, Score: 12)
- Model performance 20% below requirements (Prob: Medium, Impact: Critical, Score: 15)

---

**🟡 MEDIUM RISK (Score 5-11)**

**Definition:** Risks with moderate consequences that require monitoring and proactive management.

**Characteristics:**
- Various probability/impact combinations in medium range
- Could cause delays, cost increases, or quality concerns
- Impact on project execution but not catastrophic
- May require course correction or additional resources
- Manageable with standard risk management practices

**Management Requirements:**
- 📊 **ROUTINE MONITORING** (bi-weekly or monthly)
- 📊 **MITIGATION STRATEGIES** identified and documented
- 📊 **RISK OWNER** assigned (Manager or Team Lead level)
- 📊 **REPORTED** in standard project status updates
- 📊 **CONTINGENCY** plans considered
- 📊 **ESCALATION TRIGGER** defined (when to escalate to High)

**Example Medium Risks:**
- Third-party vendor delays delivery by 4 weeks (Prob: Medium, Impact: Low, Score: 6)
- Minor data quality issues require cleanup (Prob: High, Impact: Low, Score: 8)
- Team skill gaps require additional training (Prob: Medium, Impact: Medium, Score: 9)
- Minor security vulnerabilities identified (Prob: Low, Impact: High, Score: 8)
- Documentation quality below standards (Prob: Very High, Impact: Very Low, Score: 5)

---

**🟢 LOW RISK (Score 1-4)**

**Definition:** Risks with minimal consequences that are accepted as part of normal project execution.

**Characteristics:**
- Low probability AND/OR Low impact
- Minimal effect on project objectives, timeline, or budget
- Can be managed through routine processes
- May not require specific mitigation actions
- Often accepted as "cost of doing business"

**Management Requirements:**
- ✅ **PASSIVE MONITORING** (monthly or quarterly)
- ✅ **DOCUMENT AND TRACK** in risk register
- ✅ **STANDARD PRACTICES** sufficient for management
- ✅ **NO ESCALATION** required (unless becomes higher risk)
- ✅ **TEAM-LEVEL OWNERSHIP** adequate
- ✅ **REPORTED** in aggregate (summary statistics)

**Example Low Risks:**
- Minor UI changes requested post-launch (Prob: High, Impact: Very Low, Score: 4)
- Temporary cloud service slowdown (Prob: Low, Impact: Low, Score: 4)
- One team member takes vacation during non-critical phase (Prob: Very High, Impact: Very Low, Score: 5 → Medium)
- Competitor announces similar feature (Prob: Medium, Impact: Very Low, Score: 3)
- Documentation formatting inconsistencies (Prob: Low, Impact: Very Low, Score: 1)

---

## 4. Risk Levels and Response

### 4.1 Response Framework by Risk Level

| Risk Level | Score | Response Timeline | Approval Authority | Budget Authority | Review Frequency |
|------------|-------|------------------|-------------------|------------------|------------------|
| **Critical** | 20-25 | Immediate (24-48 hrs) | Executive Sponsor / CXO | Up to $500K | Daily |
| **High** | 12-19 | 1 week max | Steering Committee / VP | Up to $200K | Weekly |
| **Medium** | 5-11 | 2-4 weeks | Project Manager / Director | Up to $50K | Bi-weekly |
| **Low** | 1-4 | As needed | Team Lead | Up to $10K | Monthly |

### 4.2 Risk Response Decision Tree

```
                    ┌─────────────────┐
                    │  Risk Identified │
                    └────────┬─────────┘
                             │
                     ┌───────▼────────┐
                     │  Calculate      │
                     │  Risk Score     │
                     └───────┬─────────┘
                             │
          ┌──────────────────┼──────────────────┐
          │                  │                  │
    ┌─────▼─────┐      ┌────▼────┐      ┌─────▼─────┐
    │ Critical   │      │  High   │      │ Med / Low │
    │ (20-25)    │      │ (12-19) │      │  (1-11)   │
    └─────┬──────┘      └────┬────┘      └─────┬─────┘
          │                  │                  │
    ┌─────▼─────┐      ┌────▼────┐      ┌─────▼─────┐
    │ ESCALATE  │      │ MITIGATE│      │  MONITOR  │
    │ Immediate │      │ or AVOID│      │ or ACCEPT │
    │ Action    │      │ Formal  │      │ Standard  │
    │           │      │ Plan    │      │ Process   │
    └─────┬─────┘      └────┬────┘      └─────┬─────┘
          │                  │                  │
    ┌─────▼──────────────────▼─────────────────▼─────┐
    │         Can risk be eliminated?                 │
    │  YES → AVOID    NO → Continue ↓                │
    └────────────────────────┬─────────────────────────┘
                             │
    ┌────────────────────────▼────────────────────────┐
    │         Can risk be reduced?                    │
    │  YES → MITIGATE   NO → Continue ↓              │
    └────────────────────────┬─────────────────────────┘
                             │
    ┌────────────────────────▼────────────────────────┐
    │         Can risk be transferred?                │
    │  YES → TRANSFER   NO → Continue ↓              │
    └────────────────────────┬─────────────────────────┘
                             │
                      ┌──────▼──────┐
                      │   ACCEPT    │
                      │ (with plan) │
                      └─────────────┘
```

---

## 5. Risk Categories

### 5.1 Strategic Risks

**Definition:** Risks related to strategic alignment, market positioning, competitive dynamics, and long-term organizational objectives.

#### Common Strategic Risks in AI Initiatives:

**Risk S1: Strategic Misalignment**
- **Description:** AI initiative not aligned with organizational strategy or creates strategic conflicts
- **Example:** Investing in customer service chatbot when strategy is to differentiate through human touch
- **Typical Probability:** Low to Medium (2-3)
- **Typical Impact:** High to Critical (4-5)
- **Indicators:** Lack of executive sponsorship, competing priorities, strategy documents don't mention AI
- **Mitigation:** Strategy review, business case validation, alignment workshops

**Risk S2: Market Timing / Competitive Disadvantage**
- **Description:** Delay causes competitive disadvantage; OR premature investment in immature technology
- **Example:** Competitors launch AI-powered features first, capturing market share
- **Typical Probability:** Medium (3)
- **Typical Impact:** Medium to High (3-4)
- **Indicators:** Competitor announcements, changing customer expectations, analyst reports
- **Mitigation:** Market monitoring, agile development, partnerships for speed

**Risk S3: Unclear Value Proposition**
- **Description:** Business value not well-defined or quantified; ROI uncertain
- **Example:** AI investment justified by "must have AI" rather than concrete business impact
- **Typical Probability:** Medium to High (3-4)
- **Typical Impact:** Medium to High (3-4)
- **Indicators:** Vague success criteria, no baseline metrics, benefits not quantified
- **Mitigation:** Rigorous business case, pilot validation, value tracking

**Risk S4: Technology Bet on Wrong Solution**
- **Description:** Investing in technology approach that becomes obsolete or proves infeasible
- **Example:** Building custom ML platform when mature cloud solutions emerge
- **Typical Probability:** Low to Medium (2-3)
- **Typical Impact:** High (4)
- **Indicators:** Rapidly changing technology landscape, lack of industry standards
- **Mitigation:** Technology watch, flexible architecture, iterative approach

**Risk S5: Strategic Pivot / Priority Change**
- **Description:** Organizational priorities shift, AI initiative loses sponsorship or funding
- **Example:** New CEO changes strategy, AI projects deprioritized
- **Typical Probability:** Low (2)
- **Typical Impact:** Critical (5)
- **Indicators:** Leadership change, financial challenges, strategy review underway
- **Mitigation:** Strong business case, demonstrate quick wins, flexible roadmap

---

### 5.2 Operational Risks

**Definition:** Risks related to execution, processes, resources, and day-to-day operations.

#### Common Operational Risks:

**Risk O1: Resource Availability / Constraints**
- **Description:** Key resources (people, budget, infrastructure) unavailable when needed
- **Example:** Data scientists allocated to other projects, can't staff AI initiative
- **Typical Probability:** Medium to High (3-4)
- **Typical Impact:** Medium to High (3-4)
- **Indicators:** Competing projects, budget cuts, limited talent pool
- **Mitigation:** Early resource commitment, cross-training, vendor partnerships

**Risk O2: Vendor / Partner Dependency**
- **Description:** Critical dependency on external vendor; vendor fails to deliver or exits market
- **Example:** Implementation partner goes out of business mid-project
- **Typical Probability:** Low (2)
- **Typical Impact:** High (4)
- **Indicators:** Small vendor, financial instability, no backup options
- **Mitigation:** Vendor due diligence, knowledge transfer, escape clauses in contracts

**Risk O3: Integration Complexity**
- **Description:** Integration with existing systems more complex than anticipated
- **Example:** CRM API limitations prevent real-time integration; requires batch processing
- **Typical Probability:** Medium to High (3-4)
- **Typical Impact:** Medium (3)
- **Indicators:** Legacy systems, poor documentation, tight coupling
- **Mitigation:** Integration assessment, PoC integration, API layer design

**Risk O4: Change Management / User Adoption**
- **Description:** Users resist change; adoption below targets impacting value realization
- **Example:** Sales team continues using manual process instead of AI recommendations
- **Typical Probability:** Medium to High (3-4)
- **Typical Impact:** High to Critical (4-5)
- **Indicators:** History of resistance, job impact concerns, inadequate training
- **Mitigation:** Change management program, user involvement, training, incentives

**Risk O5: Operational Support / Sustainability**
- **Description:** Inability to support and maintain AI solution post-deployment
- **Example:** Model monitoring fails; performance degrades undetected for months
- **Typical Probability:** Medium (3)
- **Typical Impact:** High (4)
- **Indicators:** No MLOps capability, limited internal expertise, no runbook
- **Mitigation:** Build MLOps capability, documentation, training, vendor support

---

### 5.3 Technical Risks

**Definition:** Risks related to technology feasibility, architecture, data, models, and technical implementation.

#### Common Technical Risks:

**Risk T1: Data Quality / Availability**
- **Description:** Data insufficient in quality, quantity, or timeliness for AI model
- **Example:** Training data 70% incomplete; model accuracy suffers
- **Typical Probability:** High (4)
- **Typical Impact:** High (4)
- **Indicators:** No data quality baseline, poor data governance, legacy systems
- **Mitigation:** Data assessment, remediation projects, data governance

**Risk T2: Model Performance Below Requirements**
- **Description:** ML model fails to achieve target accuracy, precision, recall, or other performance metrics
- **Example:** Churn prediction model 68% accurate vs 80% target; insufficient for business use
- **Typical Probability:** Medium (3)
- **Typical Impact:** High to Critical (4-5)
- **Indicators:** Weak PoC results, difficult problem, limited training data
- **Mitigation:** PoC validation, alternative algorithms, feature engineering, adjust targets

**Risk T3: Scalability / Performance Issues**
- **Description:** Solution doesn't scale to production volumes; performance unacceptable
- **Example:** Inference time 5 seconds vs 200ms requirement; user experience poor
- **Typical Probability:** Low to Medium (2-3)
- **Typical Impact:** High (4)
- **Indicators:** Not tested at scale, complex model architecture, inadequate infrastructure
- **Mitigation:** Performance testing, architecture optimization, caching, infrastructure scaling

**Risk T4: Technology Maturity / Stability**
- **Description:** Technology choice immature, unstable, or lacks community/vendor support
- **Example:** Selecting cutting-edge framework with limited documentation and frequent breaking changes
- **Typical Probability:** Low to Medium (2-3)
- **Typical Impact:** Medium to High (3-4)
- **Indicators:** New technology, small community, rapid version changes
- **Mitigation:** Technology due diligence, prefer mature technologies, vendor support contracts

**Risk T5: Technical Debt Accumulation**
- **Description:** Shortcuts and quick fixes accumulate, increasing maintenance burden
- **Example:** Hardcoded rules instead of configurable parameters; model retraining manual
- **Typical Probability:** High (4)
- **Typical Impact:** Medium (3)
- **Indicators:** Aggressive timelines, prototype to production without refactoring
- **Mitigation:** Refactoring sprints, code reviews, technical standards, time allocation

**Risk T6: Model Drift / Degradation**
- **Description:** Model performance degrades over time as data patterns change
- **Example:** Fraud detection model trained on pre-pandemic data; ineffective for new fraud patterns
- **Typical Probability:** Medium to High (3-4)
- **Typical Impact:** High (4)
- **Indicators:** Dynamic environment, concept drift expected, no monitoring
- **Mitigation:** Model monitoring, automated retraining, drift detection, alerting

---

### 5.4 Financial Risks

**Definition:** Risks related to budget, costs, ROI, and financial outcomes.

#### Common Financial Risks:

**Risk F1: Budget Overrun**
- **Description:** Project costs exceed approved budget
- **Example:** Implementation costs 40% over budget due to scope expansion
- **Typical Probability:** Medium to High (3-4)
- **Typical Impact:** Medium to High (3-4)
- **Indicators:** Unclear requirements, aggressive estimates, no contingency
- **Mitigation:** Detailed estimation, contingency budget (15-20%), change control

**Risk F2: ROI Not Achieved**
- **Description:** Expected business value not realized; negative ROI
- **Example:** Projected $2M savings; actual $800K due to lower adoption and smaller impact
- **Typical Probability:** Medium (3)
- **Typical Impact:** High (4)
- **Indicators:** Optimistic assumptions, benefits not validated, external dependencies
- **Mitigation:** Conservative estimates, pilot validation, sensitivity analysis, value tracking

**Risk F3: Total Cost of Ownership (TCO) Underestimated**
- **Description:** Ongoing operational costs higher than expected
- **Example:** Cloud compute costs 3x estimate due to inefficient architecture
- **Typical Probability:** Medium (3)
- **Typical Impact:** Medium (3)
- **Indicators:** Focus on implementation only, limited operational analysis
- **Mitigation:** TCO modeling, operational cost analysis, pilot measurement

**Risk F4: Funding Withdrawn / Budget Cut**
- **Description:** Budget reduced or eliminated mid-project
- **Example:** Economic downturn; all discretionary AI projects defunded
- **Typical Probability:** Low (2)
- **Typical Impact:** Critical (5)
- **Indicators:** Economic uncertainty, financial challenges, cost-cutting initiatives
- **Mitigation:** Strong business case, quick wins, phased funding, diversified funding sources

**Risk F5: Hidden Costs Emerge**
- **Description:** Unanticipated costs discovered during implementation
- **Example:** Legacy system upgrade required ($300K) to enable integration
- **Typical Probability:** Medium (3)
- **Typical Impact:** Medium (3)
- **Indicators:** Complex environment, dependencies not fully understood
- **Mitigation:** Discovery phase, technical due diligence, contingency buffer

---

### 5.5 Compliance and Legal Risks

**Definition:** Risks related to regulations, legal requirements, privacy laws, and compliance obligations.

#### Common Compliance/Legal Risks:

**Risk C1: Privacy / Data Protection Violation**
- **Description:** Solution violates privacy regulations (GDPR, CCPA, etc.)
- **Example:** Using customer data for model training without proper consent
- **Typical Probability:** Low to Medium (2-3)
- **Typical Impact:** Critical (5)
- **Indicators:** Cross-border data, personal data use, unclear consent
- **Mitigation:** Privacy impact assessment, legal review, data anonymization, consent management

**Risk C2: Regulatory Non-Compliance**
- **Description:** AI solution violates industry-specific regulations
- **Example:** Healthcare AI tool not HIPAA compliant; patient data exposed risk
- **Typical Probability:** Low (2)
- **Typical Impact:** Critical (5)
- **Indicators:** Regulated industry, new AI application, unclear guidance
- **Mitigation:** Compliance assessment, regulatory engagement, certification pursuit

**Risk C3: Intellectual Property Infringement**
- **Description:** Solution infringes patents, copyrights, or licenses
- **Example:** Training data includes copyrighted content without license
- **Typical Probability:** Low (2)
- **Typical Impact:** High (4)
- **Indicators:** Third-party data, open-source with restrictive licenses
- **Mitigation:** IP review, license audits, legal counsel, indemnification clauses

**Risk C4: Contractual Violations**
- **Description:** AI solution violates terms of existing contracts or agreements
- **Example:** SaaS vendor TOS prohibits scraping data for ML model training
- **Typical Probability:** Low to Medium (2-3)
- **Typical Impact:** Medium to High (3-4)
- **Indicators:** Multiple vendor relationships, complex licensing terms
- **Mitigation:** Contract review, legal approval, vendor communication

**Risk C5: Future Regulatory Changes**
- **Description:** Pending or anticipated regulations impact solution viability
- **Example:** EU AI Act classifies solution as "high-risk," requiring certification
- **Typical Probability:** Low to Medium (2-3)
- **Typical Impact:** High to Critical (4-5)
- **Indicators:** Active regulatory discussions, industry scrutiny, pilot regulations
- **Mitigation:** Monitor regulatory landscape, flexible design, engage with regulators

---

### 5.6 Reputational Risks

**Definition:** Risks that could damage organizational reputation, brand, stakeholder trust, or public perception.

#### Common Reputational Risks:

**Risk R1: AI Bias / Discrimination**
- **Description:** AI model exhibits discriminatory bias based on protected characteristics
- **Example:** Hiring AI tool discriminates against female candidates
- **Typical Probability:** Low to Medium (2-3)
- **Typical Impact:** Critical (5)
- **Indicators:** Imbalanced training data, no bias testing, sensitive decision area
- **Mitigation:** Bias testing, diverse data, fairness metrics, human oversight, explainability

**Risk R2: AI Failure / Error Impact**
- **Description:** High-profile AI failure causes customer harm or public embarrassment
- **Example:** Product recommendation engine recommends offensive items; social media backlash
- **Typical Probability:** Low to Medium (2-3)
- **Typical Impact:** High to Critical (4-5)
- **Indicators:** Customer-facing AI, limited testing, no guardrails
- **Mitigation:** Rigorous testing, human review for edge cases, content filters, incident response plan

**Risk R3: Job Displacement Backlash**
- **Description:** AI implementation causes job losses; negative publicity and employee morale impact
- **Example:** "Company replaces 200 workers with AI" headline; PR crisis
- **Typical Probability:** Low to Medium (2-3)
- **Typical Impact:** High (4)
- **Indicators:** Automation of jobs, lack of reskilling plan, poor communication
- **Mitigation:** Augmentation > replacement framing, reskilling programs, transparent communication

**Risk R4: Transparency / "Black Box" Concerns**
- **Description:** Stakeholders distrust opaque AI decisions; demand explainability
- **Example:** Loan denial by "AI algorithm"; customers demand explanation; cannot be provided
- **Typical Probability:** Medium (3)
- **Typical Impact:** Medium to High (3-4)
- **Indicators:** Complex models, high-stakes decisions, regulatory scrutiny
- **Mitigation:** Explainable AI techniques (SHAP, LIME), decision transparency, human oversight

**Risk R5: Media / Public Scrutiny**
- **Description:** Negative media coverage of AI initiative or outcomes
- **Example:** "Tech Company's Facial Recognition Falsely Identifies Innocent Person"
- **Typical Probability:** Low (2)
- **Typical Impact:** High to Critical (4-5)
- **Indicators:** Controversial application, prior incidents in industry, activist attention
- **Mitigation:** Communications strategy, ethics review, proactive transparency, crisis management plan

---

### 5.7 Security and Privacy Risks

**Definition:** Risks related to cybersecurity, data security, privacy, and adversarial attacks.

#### Common Security/Privacy Risks:

**Risk SP1: Data Breach / Unauthorized Access**
- **Description:** Sensitive training data or model outputs exposed through security breach
- **Example:** Hacker accesses database containing 500K customer records used for model training
- **Typical Probability:** Low to Medium (2-3)
- **Typical Impact:** Critical (5)
- **Indicators:** Valuable data, cloud storage, external access points
- **Mitigation:** Encryption, access controls, security audits, penetration testing, incident response

**Risk SP2: Model Theft / IP Loss**
- **Description:** Proprietary models or algorithms stolen by competitors or bad actors
- **Example:** Model extracted through API calls; competitor replicates capability
- **Typical Probability:** Low (2)
- **Typical Impact:** High (4)
- **Indicators:** Public API, valuable IP, nation-state threats
- **Mitigation:** Model protection techniques, rate limiting, watermarking, legal protections

**Risk SP3: Adversarial Attacks / Model Poisoning**
- **Description:** Malicious actors manipulate input data or training data to compromise model
- **Example:** Spammers generate adversarial examples to evade spam detection
- **Typical Probability:** Low (2)
- **Typical Impact:** High to Critical (4-5)
- **Indicators:** Adversarial environment, public-facing model, valuable to compromise
- **Mitigation:** Input validation, adversarial training, anomaly detection, human review

**Risk SP4: Privacy Leakage / Model Inversion**
- **Description:** Model inadvertently reveals sensitive information about training data
- **Example:** Membership inference attack determines if specific individual's data used in training
- **Typical Probability:** Low (2)
- **Typical Impact:** Critical (5)
- **Indicators:** Sensitive data, complex model, public access
- **Mitigation:** Differential privacy, data minimization, access controls

**Risk SP5: Insider Threat**
- **Description:** Internal employee/contractor misuses access to data or models
- **Example:** Data scientist exfiltrates training data when leaving company
- **Typical Probability:** Low (2)
- **Typical Impact:** High to Critical (4-5)
- **Indicators:** Broad access, valuable data/models, limited monitoring
- **Mitigation:** Least privilege access, audit logging, DLP tools, background checks

---

## 6. Risk Response Strategies

### 6.1 AVOID

**Strategy:** Eliminate the risk by changing approach, scope, or methodology.

**When to Use:**
- Risk is Critical (score 20-25) with no acceptable mitigation
- Cost of mitigation exceeds value of opportunity
- Risk threatens project viability
- Stakeholder risk tolerance exceeded

**Implementation Approaches:**

**✅ Change Scope**
- Remove risky features or functionality
- Focus on lower-risk use cases
- **Example:** Planned real-time fraud detection too risky; switch to batch processing (daily)

**✅ Change Technology**
- Select different technology with lower risk profile
- Use proven solutions instead of cutting-edge
- **Example:** Avoid building custom ML platform; use AWS SageMaker instead

**✅ Change Approach**
- Modify methodology or process
- Implement in phases vs big bang
- **Example:** Avoid full-scale deployment; pilot in 1 department first

**✅ Cancel / Don't Proceed**
- Ultimate avoidance: don't do the project
- Make GO/NO-GO decision to not proceed
- **Example:** Data quality so poor that cleaning costs exceed benefits; NO-GO decision

**Examples of Risk Avoidance:**

| Original Risk | Avoidance Action | Outcome |
|---------------|------------------|---------|
| Model explainability insufficient for regulatory requirements (Score: 20) | Avoid complex deep learning; use interpretable decision trees instead | Risk eliminated; simpler model but compliant |
| Privacy violation risk from cross-border data transfer (Score: 25) | Avoid international data transfer; region-specific models | Risk eliminated; additional complexity but compliant |
| Critical dependency on single vendor (Score: 16) | Avoid vendor lock-in; use open-source platform | Risk reduced to low; more control |

---

### 6.2 MITIGATE

**Strategy:** Reduce probability or impact of risk to acceptable level through proactive actions.

**When to Use:**
- Risk is High or Medium (5-19) requiring management
- Complete avoidance not feasible or desirable
- Mitigation cost reasonable relative to risk reduction
- Most common risk response strategy

**Mitigation Approaches:**

#### Reduce Probability (Make Risk Less Likely)

**🛡️ Preventive Controls**
- Design and process improvements
- Quality assurance and testing
- Training and capability building
- **Example:** Data quality issues → Implement data validation rules, automated quality checks

**🛡️ Redundancy and Backup**
- Backup resources, systems, or plans
- Multiple vendors or options
- **Example:** Key person risk → Cross-train team members, document knowledge

**🛡️ Early Detection**
- Monitoring and alerting
- Leading indicators tracking
- **Example:** Model drift → Implement automated performance monitoring, weekly reviews

#### Reduce Impact (Minimize Consequences)

**🛡️ Containment Strategies**
- Limit scope of impact
- Blast radius reduction
- **Example:** Security breach → Segment data, limit access, encrypt

**🛡️ Quick Response Capabilities**
- Incident response plans
- Rollback procedures
- **Example:** Model failure → Automated rollback to previous version, manual fallback process

**🛡️ Graceful Degradation**
- Fallback mechanisms
- Reduced functionality vs complete failure
- **Example:** AI service down → Fall back to rule-based system

**Example Mitigation Plans:**

**Risk: Data Quality Issues (Prob 4, Impact 4, Score 16 → Target Score 6)**

| Mitigation Action | Type | Investment | Probability Reduction | Impact Reduction | Timeline |
|------------------|------|------------|----------------------|--------------------|----------|
| Implement data quality framework | Preventive | $150K | 4 → 2 | - | Q2 2026 |
| Deploy Great Expectations for validation | Preventive | $50K | - | 4 → 3 | Q2 2026 |
| Launch data remediation for top 5 datasets | Corrective | $200K | - | - | Q2-Q3 2026 |
| Automated quality monitoring and alerts | Detective | $30K | - | 4 → 3 | Q3 2026 |
| **Total** | | **$430K** | **4 → 2** | **4 → 3** | **6 months** |
| **Residual Risk Score** | | | **2 × 3 = 6** | **Medium** | |

---

**Risk: User Adoption Below Target (Prob 3, Impact 5, Score 15 → Target Score 6)**

| Mitigation Action | Type | Investment | Effect | Timeline |
|------------------|------|------------|---------|----------|
| Comprehensive change management program | Preventive | $100K | Prob 3→2 | Q2-Q3 2026 |
| Early user involvement in design | Preventive | $20K | Prob 3→2 | Q2 2026 |
| Training program (40 hours developed) | Preventive | $60K | Impact 5→3 | Q3 2026 |
| Executive sponsorship and communication | Preventive | $10K | Prob 3→2 | Ongoing |
| Support hotline and super-users network | Responsive | $40K | Impact 5→3 | Q3-Q4 2026 |
| **Total** | | **$230K** | **Prob 3→2, Impact 5→3** | **6 months** |
| **Residual Risk Score** | | | **2 × 3 = 6 (Medium)** | |

---

### 6.3 TRANSFER

**Strategy:** Shift risk ownership or financial impact to third party.

**When to Use:**
- Risk outside organizational expertise
- Insurance or indemnification available
- Third party better positioned to manage risk
- Cost of transfer < cost of mitigation

**Transfer Mechanisms:**

**📄 Insurance**
- Cyber insurance for security/privacy risks
- Errors & omissions insurance
- **Example:** $5M cyber insurance policy covers data breach costs

**📄 Contractual Indemnification**
- Vendor assumes liability for failures
- SLAs with penalties for non-performance
- **Example:** Cloud provider SLA guarantees 99.9% uptime; credits for violations

**📄 Outsourcing / Vendor Management**
- Transfer technical execution risk to implementation partner
- Fixed-price contracts shift cost overrun risk
- **Example:** $1.2M fixed-price contract with implementation partner; overrun risk transferred

**📄 Joint Ventures / Partnerships**
- Share risk with partners
- Co-development agreements
- **Example:** Partner with university for research; share IP and technical risk

**📄 Warranty / Guarantees**
- Vendor warrants performance or functionality
- Remediation at vendor cost
- **Example:** SaaS vendor guarantees 85% model accuracy; remediation included

**Transfer Examples:**

| Risk | Transfer Mechanism | Cost | Residual Risk |
|------|-------------------|------|---------------|
| Cybersecurity breach (Score: 20) | $5M cyber insurance policy | $80K/year | Impact reduced (financial impact covered) |
| Vendor implementation failure (Score: 16) | Fixed-price contract + performance bond | Included in contract | Risk transferred to vendor |
| Cloud infrastructure downtime (Score: 12) | AWS SLA with service credits | Included | Financial impact partially offset |
| Legal compliance liability (Score: 15) | Vendor indemnification clause | Negotiated | Liability transferred to vendor |

---

### 6.4 ACCEPT

**Strategy:** Acknowledge risk and choose not to take specific action; monitor and manage if it occurs.

**When to Use:**
- Risk is Low (score 1-4) and acceptable
- Mitigation cost exceeds risk impact
- No viable mitigation options
- Risk is inherent to initiative (calculated risk)

**Acceptance Approaches:**

**✅ Active Acceptance**
- Acknowledge risk explicitly
- Allocate contingency budget/time
- Develop contingency plans (if-then)
- Monitor actively
- **Example:** Minor UI tweaks likely post-launch (Score 4); $50K contingency budgeted

**✅ Passive Acceptance**
- Acknowledge and document
- No specific action planned
- Routine monitoring sufficient
- **Example:** Competitor might announce similar feature (Score 3); monitor but no action

**Acceptance Decision Criteria:**

| Criterion | GO/NO-GO |
|-----------|----------|
| Risk score ≤ 4 | ✅ Usually acceptable |
| Mitigation cost > 2x risk impact | ✅ Consider acceptance |
| Stakeholder agreement on acceptance | ✅ Required |
| Contingency plan in place (for active acceptance) | ✅ Required for scores 3-4 |
| Risk within organizational risk appetite | ✅ Required |

**Acceptance Examples:**

| Risk | Score | Acceptance Rationale | Contingency |
|------|-------|---------------------|-------------|
| Documentation formatting inconsistencies | 1 | Negligible impact; cosmetic only | None needed |
| Competitor announces similar feature | 3 | Can't control; differentiators exist | Marketing response prepared |
| One team member vacation during project | 4 | Normal operations; non-critical phase | Cross-training completed |
| Minor cloud latency fluctuations | 2 | Rare; impact minimal; monitoring in place | None |

---

## 7. Risk Review and Update Process

### 7.1 Review Frequency

**Risk reviews must occur regularly with frequency based on risk level and project phase:**

| Risk Level | Review Frequency | Owner | Reported To |
|------------|-----------------|-------|-------------|
| **Critical (20-25)** | **Daily** until < 20 | Executive Sponsor / CXO | Steering Committee Daily |
| **High (12-19)** | **Weekly** | Risk Owner (Director/VP) | Steering Committee Weekly |
| **Medium (5-11)** | **Bi-weekly** | Risk Owner (Manager) | Project Status Monthly |
| **Low (1-4)** | **Monthly** | Team Lead | Aggregate Reporting Quarterly |

**Project Phase-Based Reviews:**

| Phase | Review Frequency | Focus |
|-------|-----------------|-------|
| **Strategy** | Weekly | Identify and assess initial risks |
| **Exploration (PoC)** | Weekly | Technical feasibility risks, data quality |
| **Validation (Pilot)** | Weekly | Performance, integration, user adoption |
| **Execution (Build)** | Bi-weekly | Schedule, budget, resource, quality |
| **Navigation (Deploy)** | Weekly | Deployment, operational, support |
| **Governance (Operate)** | Monthly | Model drift, business value, sustainability |

**Mandatory Review Triggers:**

Immediate risk review required when:
- ⚠️ New risk identified with potential score ≥12
- ⚠️ Existing risk score increases by ≥5 points
- ⚠️ Risk materializes (moves from potential to actual issue)
- ⚠️ Major project change (scope, timeline, budget, team)
- ⚠️ External event impacts risk profile (regulatory change, competitor move, etc.)
- ⚠️ Milestone or decision gate approaching

### 7.2 Responsibilities

**Risk Management Roles and Responsibilities:**

**Executive Sponsor**
- Own Critical risks (score 20-25)
- Approve High risk mitigation plans
- Allocate budget and resources for risk mitigation
- Executive-level escalation decisions
- Review risk dashboard monthly

**Steering Committee**
- Review and prioritize High and Critical risks
- Approve risk response strategies
- Monitor mitigation progress
- Escalate to executive leadership as needed
- Monthly risk review meetings

**Project Manager / Initiative Lead**
- Overall risk management process ownership
- Facilitate risk identification and assessment
- Maintain Risk Register and Risk Matrix
- Coordinate mitigation activities
- Weekly risk review and reporting
- Escalate High/Critical risks

**Risk Owners (Individual Risks)**
- Own specific assigned risks
- Develop and execute mitigation plans
- Monitor risk indicators and triggers
- Report status regularly
- Escalate when risk increases

**Team Members**
- Identify and report risks (bottom-up)
- Participate in risk assessments
- Execute mitigation actions
- Provide risk status updates

**Risk Management Office (if exists)**
- Set enterprise risk management standards
- Provide risk assessment tools and training
- Review risk management practices
- Aggregate portfolio-level risk view
- Support projects with risk expertise

### 7.3 Escalation Procedures

**Escalation Matrix:**

| Situation | From | To | Timeframe |
|-----------|------|-----|-----------|
| Risk score ≥20 identified | Project Manager | Executive Sponsor + Steering Committee | Immediate (same day) |
| Risk score increases by 5+ points | Risk Owner | Project Manager | 24 hours |
| Risk score 12-19 (High) | Risk Owner | Steering Committee | Next meeting (within 1 week) |
| Mitigation plan not on track | Risk Owner | Project Manager | Weekly |
| Risk materializes | Risk Owner | Project Manager + Steering Committee | Immediate |
| Budget needed for mitigation | Project Manager | Steering Committee / Executive Sponsor | Next approval cycle or emergency |

**Escalation Communication Template:**

```
TO: [Executive Sponsor / Steering Committee]
FROM: [Project Manager / Risk Owner]
DATE: [Date]
SUBJECT: URGENT - Risk Escalation: [Risk Name]

RISK OVERVIEW:
- Risk ID: [ID from Risk Register]
- Description: [Brief description]
- Current Score: [Score] (Probability [X] × Impact [Y])
- Risk Level: [Critical/High]

SITUATION:
[What happened? What changed? Why is this being escalated?]

IMPACT:
[What is the impact if this risk materializes? Timeline, budget, quality, strategic?]

MITIGATION STATUS:
[What has been tried? What is the current status of mitigation efforts?]

REQUEST:
[What decision or resource is needed? What is being asked of the escalation recipient?]

RECOMMENDED ACTION:
[What is the recommended path forward?]

TIMELINE:
[When is a decision needed? What is the urgency?]
```

---

## 8. Risk Reporting

### 8.1 Dashboard and Visualizations

**Risk Dashboard Components:**

**Component 1: Risk Heat Map**

```
               AI Initiative Risk Heat Map
               (As of February 11, 2026)
                        
                        IMPACT →
              │   1      2      3       4       5    
              │  Very   Low   Medium  High  Critical
              │  Low                                  
   ═══════════╪═══════════════════════════════════════
P              │
R   5  Very   │        R12            R03      R01   
O      High   │       [10]           [20]     [25]
B              │                               🔴      
A   4  High   │         R08    R05    R02            
B              │        [8]    [12]   [16]            
I              │                🟠     🟠              
L   3  Medium │   R15   R09    R06    R04            
I              │   [3]   [6]    [9]   [12]            
T              │   🟢   🟡    🟡    🟠              
Y   2  Low    │   R11         R07    R10            
               │   [2]         [6]    [8]            
↓              │   🟢          🟡    🟡              
    1  Very   │   R13   R14                          
       Low    │   [1]   [2]                          
              │   🟢   🟢                            

Legend:
🔴 Critical (20-25): 2 risks
🟠 High (12-19): 4 risks  
🟡 Medium (5-11): 5 risks
🟢 Low (1-4): 4 risks
```

**Component 2: Risk Distribution**

```
Risk Count by Level:

Critical (20-25): ██ 2 (13%)
High (12-19):     ████ 4 (27%)
Medium (5-11):    █████ 5 (33%)
Low (1-4):        ████ 4 (27%)
                  ────────────
Total:            15 risks
```

**Component 3: Top 5 Risks Table**

| Rank | Risk ID | Risk Name | Category | Prob | Impact | Score | Trend | Owner | Status |
|------|---------|-----------|----------|------|--------|-------|-------|-------|--------|
| 1 | R01 | Model bias discrimination | Reputational | 5 | 5 | 25 | ↗ | CTO | Mitigation in progress |
| 2 | R03 | Data breach - PII exposure | Security | 4 | 5 | 20 | → | CISO | Active monitoring |
| 3 | R02 | User adoption < 50% | Operational | 4 | 4 | 16 | ↘ | PM | Change mgmt underway |
| 4 | R05 | Data quality issues | Technical | 3 | 4 | 12 | ↘ | Data Lead | Remediation Q2-Q3 |
| 5 | R04 | Budget overrun 30%+ | Financial | 3 | 4 | 12 | → | PM | Contingency allocated |

**Component 4: Risk Trend Analysis**

```
Risk Score Trending (Last 8 Weeks):

Week:     W1   W2   W3   W4   W5   W6   W7   W8
Critical: 3    3    2    2    2    2    2    2   ↘ Improving
High:     5    5    6    5    4    4    4    4   ↘ Stable
Medium:   4    4    4    5    5    5    5    5   → Stable  
Low:      3    3    3    3    4    4    4    4   ↗ Slightly increasing

Overall Risk Trajectory: ↘ IMPROVING
```

**Component 5: Mitigation Progress**

```
Mitigation Actions Status:

██████████████░░░░░░ 70% Complete

Completed:    ████████████████ 16 actions
In Progress:  ██████           6 actions  
Not Started:  ░░               2 actions
Overdue:      ██               2 actions ⚠️

On-Track Mitigations: 80%
At-Risk Mitigations:  20% (requires attention)
```

### 8.2 Regular Reports

**Weekly Risk Report (for Active Projects)**

**Distribution:** Project team, Steering Committee  
**Format:** 1-2 page summary + full risk register attachment

**Contents:**
1. **Executive Summary** (3-5 bullets)
   - Overall risk status (improving/stable/deteriorating)
   - Critical and High risks count
   - Key changes from last week
   - Actions required

2. **Top 5 Risks** (table with details)
   - Current score, trend, mitigation status

3. **New Risks Identified** (this week)
   - Description, initial assessment

4. **Risks Closed** (this week)
   - Which risks were resolved and how

5. **Mitigation Progress**
   - Actions completed this week
   - Actions planned next week
   - Overdue actions (with plan)

6. **Escalations and Decisions Needed**
   - What requires steering committee attention

---

**Monthly Risk Summary (for Executive Leadership)**

**Distribution:** Executive Sponsor, C-Suite, Board (quarterly)  
**Format:** Executive presentation (5-7 slides)

**Contents:**

**Slide 1: Risk Overview**
- Risk heat map
- Distribution by level
- Overall trend

**Slide 2: Top Risks**
- Top 5 risks with details
- Mitigation status

**Slide 3: Risk Trends**
- Month-over-month comparison
- Risk trajectory analysis

**Slide 4: Mitigation Investment**
- Budget spent on risk mitigation
- ROI of mitigation (value protected)

**Slide 5: Looking Ahead**
- Emerging risks on horizon
- Planned mitigation activities
- Resources needed

---

**Quarterly Risk Deep Dive (for Board / Strategy Reviews)**

**Distribution:** Board, Executive Leadership  
**Format:** Comprehensive report (10-15 pages) + presentation

**Contents:**
- Comprehensive risk landscape
- Portfolio-level risk aggregation
- Risk management maturity assessment
- Lessons learned and improvements
- Risk appetite and tolerance review

### 8.3 Stakeholder Communication

**Communication Plan by Stakeholder:**

| Stakeholder | What | When | Format | Purpose |
|-------------|------|------|--------|---------|
| **Executive Sponsor** | Top 5 risks, escalations | Weekly | Email + Dashboard | Decision-making, oversight |
| **Steering Committee** | Full risk review | Monthly | Meeting + Deck | Governance, prioritization |
| **Project Team** | All risks, detailed status | Weekly | Meeting + Register | Execution, awareness |
| **Risk Owners** | Assigned risks | As needed | 1:1 + Dashboard | Accountability, support |
| **Board of Directors** | Strategic risks, portfolio view | Quarterly | Presentation | Strategic oversight |
| **Business Stakeholders** | Risks affecting their area | Monthly | Email summary | Awareness, support |

**Communication Principles:**

1. **Transparency** - Honest, complete communication of risks
2. **Timeliness** - Communicate risks as soon as identified
3. **Clarity** - Use clear language, avoid jargon
4. **Actionable** - Include what stakeholders need to do
5. **Balanced** - Communicate both risks AND opportunities
6. **Consistent** - Regular cadence, standard format

---

## Appendices

### Appendix A: Risk Assessment Questionnaire

**Strategic Risks Checklist:**
- [ ] Is there clear executive sponsorship?
- [ ] Does initiative align with corporate strategy?
- [ ] Is business value well-defined and quantified?
- [ ] Are success criteria clear and measurable?
- [ ] Is market timing appropriate?

**Operational Risks Checklist:**
- [ ] Are required resources (people, budget) committed?
- [ ] Are key dependencies identified and managed?
- [ ] Is change management plan adequate?
- [ ] Are integration points understood?
- [ ] Is operational support model defined?

**Technical Risks Checklist:**
- [ ] Is data quality and availability sufficient?
- [ ] Has PoC validated technical feasibility?
- [ ] Is architecture scalable and maintainable?
- [ ] Are technology choices mature and supported?
- [ ] Is MLOps capability in place or planned?

**Financial Risks Checklist:**
- [ ] Is budget realistic with contingency?
- [ ] Are ROI assumptions validated?
- [ ] Is TCO (total cost of ownership) understood?
- [ ] Are hidden costs explored?
- [ ] Is funding secure for full lifecycle?

**Compliance/Legal Risks Checklist:**
- [ ] Has legal/compliance reviewed approach?
- [ ] Is privacy impact assessment complete?
- [ ] Are regulatory requirements understood?
- [ ] Are IP and licensing clear?
- [ ] Is contractual compliance verified?

**Reputational Risks Checklist:**
- [ ] Has bias testing been performed?
- [ ] Are model errors and failures managed?
- [ ] Is explainability sufficient?
- [ ] Is job impact addressed sensitively?
- [ ] Is PR/communications strategy in place?

**Security/Privacy Risks Checklist:**
- [ ] Has security assessment been conducted?
- [ ] Are data protection controls in place?
- [ ] Is access properly restricted?
- [ ] Are adversarial attacks considered?
- [ ] Is incident response plan ready?

### Appendix B: Risk Register Template

[See SEVEN-G_Risk_Register.md for detailed Risk Register]

### Appendix C: Risk Response Plan Template

**Risk Response Plan**

**Risk ID:** [R01]  
**Risk Name:** [Brief descriptive name]  
**Risk Owner:** [Name, Title]

**Risk Description:**
[Detailed description of the risk event and its potential consequences]

**Current Assessment:**
- Probability: [1-5] ([Label])
- Impact: [1-5] ([Label])
- Score: [1-25]
- Level: [Critical/High/Medium/Low]

**Response Strategy:** [Avoid / Mitigate / Transfer / Accept]

**Mitigation Actions:**

| Action | Type | Owner | Investment | Timeline | Success Metric |
|--------|------|-------|------------|----------|----------------|
| 1. [Action description] | Preventive | [Name] | $[Amount] | [Date range] | [Metric] |
| 2. [Action description] | Detective | [Name] | $[Amount] | [Date range] | [Metric] |
| 3. [Action description] | Corrective | [Name] | $[Amount] | [Date range] | [Metric] |

**Target Risk After Mitigation:**
- Target Probability: [1-5]
- Target Impact: [1-5]
- Target Score: [1-25]
- Target Level: [Level]

**Monitoring Plan:**
- Leading Indicators: [What signals risk is increasing?]
- Monitoring Frequency: [Daily/Weekly/Monthly]
- Escalation Trigger: [When to escalate?]

**Contingency Plan (If Risk Materializes):**
1. [Immediate action step 1]
2. [Immediate action step 2]
3. [Recovery action step 3]

---

**END OF RISK MATRIX DOCUMENT**

**Document Owner:** Risk Management / PMO  
**Next Review:** March 11, 2026 (Monthly)  
**Contact:** risk.management@company.com
