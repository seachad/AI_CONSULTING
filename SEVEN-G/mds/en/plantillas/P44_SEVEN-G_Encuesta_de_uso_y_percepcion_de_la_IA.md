# AI use and perception survey

**Two questionnaires with a declared scale: the annual AI use survey, which brings to light unauthorised use and unmet needs, and the pulse survey, which measures how the people affected perceive a system.**

| | |
|---|---|
| Document | Template P44 · AI use and perception survey |
| Version | 0.1 (working draft) |
| Date | 19-09-2026 |
| Author | Fernando García Varela |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author accepts no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

> **Why it matters.** Technical logs show which tools are used, but not why or with what information; the annual use survey is the source that brings to light the needs that drive unauthorised use (31 §5.2). A system, for its part, may have high usage and low acceptance: the perception of the people affected is the early warning of rejection, oversight overload or loss of autonomy (23 §10.3; 50 §9). Without a stable questionnaire, with a declared scale and a calculation fixed in advance, the figures are not comparable between measurements and support no decision.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | **Annual use survey** (section 4): once a year, with results available for the annual review in C5. **Pulse survey** (section 5): in phase 5 (pilot), three months into production and at each Enterprise R6 (50 §9.2). |
| **Who completes it** | Annual: all employees and collaborators with access to company resources; the AI Office designs and analyses it. Pulse: the groups affected by the system (users, designated overseers and managers); the AI Product Owner prepares and analyses it with the people function. |
| **Who verifies it** | Annual: AI Auditor or internal audit, by sampling (document 38). Pulse: AI Office in Lite; AI Auditor in Enterprise, as part of P20. |
| **Who decides or approves** | Annual: the AI Committee receives the results and approves the actions (catalogue, training, regularisation). Pulse: the AI Sponsor approves the action plan; the *gate* body assesses the results at G5, R6 and G7. |
| **Stage, *gate* or moment** | Annual: C4 (T21 monitor) and C5. Pulse: G5, R6 and G7 of the initiative. |
| **Tool** | Annual: T21 · Corporate AI use monitor. Pulse: T20 · Adoption and capacity plan. |
| **Reference document** | Annual: 31 §5.2 to §5.5; 32 §9. Pulse: 23 §10; 50 §9 to §11; 41 (IND-ADO-15). |
| **Lite versus Enterprise** | Annual: mandatory in both implementation scopes (90 §2.1). Pulse: mandatory in Enterprise (23 §13.2); in Lite it should be applied in phase 5 and at three months when the system changes the work of a group. |

Completion rules:

- **Anonymity.** Responses are not linked to identified persons. The survey tool does not store identifiers or network addresses, or separates them from the responses before analysis.
- **Minimum group size.** The company sets a minimum size (50 §11); no result is broken down for a group with fewer valid responses and, if it is not reached, it is reported as *no data* (measurement rule 8).
- **Limited purpose.** The results are not used to evaluate or sanction people (23 §10.1, rule 3; 50 §9.2). What is declared in the use survey does not open individual proceedings.
- **Prior information.** Participants are informed of the purpose, of the voluntary and anonymous nature of the survey and of the processing of the data in accordance with the GDPR; where appropriate, workers' representatives are informed (P46).
- **Stable questionnaire.** The questions and the scale are not changed between measurements in the same series; a change opens a new series and is indicated in the report.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Survey type | | Annual use · Perception pulse. |
| Perimeter or initiative | | Company or perimeter (annual survey); code IA-AAAA-NNN and systems SIA-AAAA-NNN (pulse). |
| Moment | | Year (annual); phase 5 · three months · R6 (pulse). |
| Response period | | DD-MM-AAAA to DD-MM-AAAA. |
| Target population | | Number of people and groups. |
| Sample | | Census or random; size and selection method. |
| Valid responses and response rate | | Valid responses ÷ people invited. |
| Minimum group size | | Set by the company. |
| Questionnaire version | | |
| Owner | | AI Office (annual); AI Product Owner (pulse). |

---

## 3. Declared scale and common calculation

All closed rating questions use the same scale and are worded positively so that *favourable* always means the same:

| Value | Label | Treatment |
|---|---|---|
| 1 | Strongly disagree | Unfavourable |
| 2 | Disagree | Unfavourable |
| 3 | Neither agree nor disagree | Neutral |
| 4 | Agree | Favourable |
| 5 | Strongly agree | Favourable |
| — | Don't know or not applicable | Not a valid response |

**Valid responses** = responses with a value from 1 to 5. **Percentage favourable** = responses 4 or 5 ÷ valid responses. The mean may be reported as complementary data, never instead of the percentage favourable.

---

## 4. Annual AI use survey

### 4.1 Questionnaire

| # | Question | Response type |
|---|---|---|
| U1 | In the last 12 months, have you used any AI tool for your work? | Yes · No (if No, go to U10) |
| U2 | Which tools have you used? | Catalogue list (P43) plus "Others: please specify" |
| U3 | With which account? | Corporate · Personal · Both · Don't know |
| U4 | How often? | Daily · Weekly · Monthly · Occasionally |
| U5 | For which tasks? | Drafting · Summarising · Data analysis · Code · Translation · Customer service · Other |
| U6 | What type of information have you entered? | [Public] · [Internal] · [Confidential] · [Restricted] · Personal data · None of these · Prefer not to answer |
| U7 | Have you installed extensions or enabled AI functions in work software? | Yes · No · Don't know |
| U8 | Do you use any tool that acts on your behalf (sends emails, fills in forms, executes actions)? | Yes · No |
| U9 | Which need in your work is not met by the authorised tools? | Free text |
| U10 | I know which AI tools I may use and with what information. | Scale 1–5 |
| U11 | I know how to report an error or an incident related to AI. | Scale 1–5 |
| U12 | The training I have received enables me to use AI safely. | Scale 1–5 |
| U13 | Area and group | Closed list, for aggregation only |

### 4.2 Calculation of results

| Result | Formula | Threshold |
|---|---|---|
| Declared use of AI | Yes responses to U1 ÷ valid responses | Informative |
| Use outside the catalogue | People who cite in U2 any tool that is not authorised or not catalogued, or *Personal* in U3 ÷ people with Yes in U1 | To be set by the company |
| Exposure of sensitive information | People with use outside the catalogue who mark [Confidential], [Restricted] or personal data in U6 ÷ people with use outside the catalogue | To be set by the company |
| Declared personal agents | Yes responses to U8 ÷ people with Yes in U1 | Informative |
| Knowledge of the policy | Percentage favourable in U10, U11 and U12, separately | To be set by the company |
| Unmet needs | List of U9 needs grouped by topic and number of mentions | — |

### 4.3 Treatment

| Finding | Treatment |
|---|---|
| Uncatalogued tool cited | Registration in T02 as unauthorised use, by tool and scope, without identifying people (31 §5.3; 32 §2.1), and regularisation (31 §5.5). |
| Recurrent unmet need | Assessment as a request (P43, section 4) or as an opportunity in the initiative register (T01). |
| Low knowledge of the policy or of the channel | Reinforcement of F1 training (P45) and of communication. |
| Unauthorised personal agents | Review of authorisation by autonomy level (31 §4.7). |

---

## 5. Perception pulse survey

### 5.1 Dimensions

Document 23 (indicator 8) measures **usefulness, workload and trust**; document 50 and the catalogue (PER-15, IND-ADO-15) measure **support, workload and autonomy**. This template measures the **five dimensions** with two questions each, so that both indicators are calculated from the same questionnaire.

| # | Dimension | Question | Scale |
|---|---|---|---|
| P1 | Usefulness | The system helps me do my work better. | 1–5 |
| P2 | Usefulness | The system saves me time on the tasks it is intended for. | 1–5 |
| P3 | Trust | I trust the system's outputs in the cases it is intended for. | 1–5 |
| P4 | Trust | I know in which cases I should not rely on the system's output. | 1–5 |
| P5 | Support | I have received the training needed to use or oversee the system. | 1–5 |
| P6 | Support | I know whom to turn to when I have a question or a problem with the system. | 1–5 |
| P7 | Workload | My workload since I started using the system is reasonable. | 1–5 |
| P8 | Workload | The volume of reviews I am asked to carry out allows me to review carefully. | 1–5 |
| P9 | Autonomy | I can depart from the system's proposal when I consider it necessary. | 1–5 |
| P10 | Autonomy | My professional judgement continues to be taken into account in decisions. | 1–5 |
| P11 | Open | What would you change about the system or its use? | Free text |
| P12 | Open | Are you concerned about anything regarding the system's effect on your work? | Free text |
| P13 | Context | Group and function (user · overseer · manager) | Closed list, for aggregation only |

P4 and P9 guard against automation bias: high trust with a low P4 is a signal of overconfidence, not of success.

### 5.2 Calculation

| Result | Formula | Use |
|---|---|---|
| Percentage favourable by dimension | Responses 4–5 to the two questions of the dimension ÷ valid responses to those questions | Main reading. |
| PER-15 · IND-ADO-15 | Favourable responses to P5 to P10 (support, workload and autonomy) ÷ valid responses to P5 to P10 | Documents 41 and 50; R6. |
| Indicator 8 of document 23 | Favourable responses to P1 to P4, P7 and P8 (usefulness, trust and workload) ÷ valid responses to those questions | G5 in Augment (23 §11.2). |
| Overall perception | Favourable responses to P1 to P10 ÷ valid responses to P1 to P10 | Summary for the AI Committee. |
| Change | Current result − result of the previous measurement, in percentage points | Trend. |

**Thresholds.** Documents 50 and 41 set as the reference the **trend, with action if it worsens**; there is no common minimum value. The minimum threshold and the fall that triggers action are set in P20 in phase 4, before measuring (23 §10.4): **to be set by the company**.

### 5.3 Results

| Dimension | Valid responses | Favourable | % favourable | Previous measurement | Change | Triggers action? |
|---|---|---|---|---|---|---|
| Usefulness | | | | | | |
| Trust | | | | | | |
| Support | | | | | | |
| Workload | | | | | | |
| Autonomy | | | | | | |
| *(illustrative example)* Workload | 38 | 17 | 45 % | 71 % | −26 | Yes |

### 5.4 Action plan

| Finding | Reading (23 §10.3) | Action | Owner | Date | Linked risk (P12) |
|---|---|---|---|---|---|
| *(illustrative example)* Fall in workload with stable use | Compulsory use without acceptance; possible oversight overload | Review the volume of reviews per person in P17 and reinforce support | AI Product Owner | 30-11-2026 | RT-ORG-09 |
| | | | | | |

The aggregated results are communicated to the groups that responded, together with the actions decided (50 §10.1).

---

## 6. Quality criteria

| # | Check | Status |
|---|---|---|
| 1 | The questionnaire, the scale and the calculation were fixed before the survey was opened and have not been changed within the series. | Met · Not met · Not applicable · Pending |
| 2 | Participants were informed and anonymity was guaranteed; no result is broken down below the minimum group size. | |
| 3 | The results distinguish valid, favourable and *no data* responses. | |
| 4 | Detected uncatalogued uses have been registered in T02 and have a regularisation under way (31 §5.3). | |
| 5 | The pulse has been carried out at the moments in 50 §9.2 and is presented at G5 and R6 (criteria G5.08 and R6.14 of document 21). | |
| 6 | Each dimension that triggers action has an owner and a date, and the organisational risks are in P12. | |

---

## 7. Approval and verification

| Function | Role in SEVEN-G | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Designs and analyses the annual survey | AI Office | | | |
| Designs and analyses the pulse | AI Product Owner, with the people function | | | |
| Data protection clearance | Second line | | | |
| Verifies | AI Office (Lite) · AI Auditor (Enterprise) or internal audit | | | |
| Approves the actions | AI Committee (annual) · AI Sponsor (pulse) | | | |

Segregation of duties: whoever analyses the pulse does not verify its results, and no one with responsibility for the performance of the respondents has access to non-aggregated responses.

---

## 8. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 19-09-2026 | First version. Annual use survey (31 §5.2) and pulse survey (23 §10.2; 50 §9–10) with a common five-point scale. The pulse measures five dimensions (usefulness, trust, support, workload and autonomy) in order to calculate indicator 8 of document 23 and PER-15 · IND-ADO-15 from the same questionnaire. |
