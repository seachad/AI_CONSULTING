# Literacy and training plan and record

**Plans AI literacy by profile each year and records, person by person, the training completed, its assessment and its validity, as evidence of the access and oversight conditions.**

| | |
|---|---|
| Document | Template P45 · Literacy and training plan and record |
| Version | 0.1 (working draft) |
| Date | 19-09-2026 |
| Author | Fernando García · SEACHAD |
| Status | Draft for review. |

---

> **Legal notice and disclaimer.** SEVEN-G is a reference methodological framework provided "as is" and for information purposes only. It does not constitute legal, regulatory, financial or professional advice, nor does it guarantee compliance with any law or standard. References to general regulation (such as the EU AI Act, the GDPR, DORA or NIS2), to technical standards and to regulation specific to each sector or jurisdiction may be incomplete, may not apply to a particular case or may become out of date as a result of regulatory changes, interpretations or supervisory positions after their consultation date. **Each organisation that uses SEVEN-G is solely responsible for identifying the regulation that applies to it, verifying that it is current and certifying its own regulatory compliance**, with the appropriate qualified advice. The author and SEACHAD accept no liability for any use made of this content or for any decisions taken on the basis of it. The data, figures, companies and cases in the examples are fictitious or illustrative.

> **Why it matters.** Without capable people there is no real human oversight, verification of outputs or detection of misuse (31 §6.1). The plan sets who must be trained, in what and when; the record shows that it has happened. Three controls depend on it: no one receives AI licences without F1, no one oversees a system in production without F3 and no one takes up an initiative role without F4 (31 §6.3). Without a record per person, the company cannot show at G5 that the overseers are trained (G5.14) or give the board the actual coverage.

## 1. Instructions for use

| Aspect | Guidance |
|---|---|
| **When it is used** | The plan is approved each year in C2 together with the policy (31 §6.3) and reviewed in C5. The record is living: it is updated with each training action, each assignment of a licence, oversight role or initiative role, and each expiry. |
| **Who completes it** | The AI Office with the people function prepares the plan and maintains the record. The AI Product Owner provides the specific training for each initiative (P20, section 5). |
| **Who verifies it** | AI Auditor or internal audit, by sampling (document 38); at each *gate*, the verifier checks the training of the people in that initiative. |
| **Who decides or approves** | The annual plan is approved by the AI Committee within the direction approved in C2; the budget, in the *adoption and training* cost category (document 42). |
| **Stage, *gate* or moment** | C2 (plan), C4 (monitoring in the T21 monitor and in the board dashboard), C5 (review). In the initiative: G0 (F4 of the roles), G5 (F3 of the overseers and user training, G5.14 and G5.19) and R6 (validity). |
| **Tool** | T20 · Adoption and capacity plan (training record). The indicators are shown in T21 and the record is linked to P03 for the roles (31 §6.3). |
| **Reference document** | 31 §6; 50 §5; 23 §8; 34 §3.5; 41 (IND-ADO-05, IND-ADO-10); 90 §9. |
| **Lite versus Enterprise** | The plan and the record are mandatory in both implementation scopes (90 §2.1). In a Lite scope, the fields marked **(Enterprise)** may be omitted; the F3 condition for oversight is not simplified. |

Completion rules:

- **Common profiles.** The eight profiles F1–F8 of 31 §6.2 are used; section 4 gives their correspondence with profiles PER-PA to PER-PF of 50 §5.2. A person may hold several profiles.
- **Indicative durations.** Those in 31 §6.2 are a starting point and are adjusted to the size of the company and the actual use of AI.
- **Effectiveness, not just attendance.** Each mandatory action has an assessment or practical exercise and an expiry date.
- **Data protection.** The record contains employees' personal data: access is restricted to the AI Office, the people function and the verifier; indicators are presented in aggregate.

---

## 2. Identification

| Field | Content | Guidance |
|---|---|---|
| Company or perimeter | | 90 §2.3. |
| Plan year | | |
| Version | | |
| Date of approval and body | | Reference to the minutes. |
| Owners | | AI Office and people function. |
| Approved budget | | Amount in the *adoption and training* category. |
| Reference acceptable use policy | | Version (document 31, section 4). |
| Obligated group | | Definition of who must hold each profile: denominator of the indicators in section 8. |
| Next review | | C5 or earlier if regulation or tools change or a relevant incident occurs. |

---

## 3. Literacy obligation

Article 4 of the AI Act has applied since 2-2-2025. Under the wording of Regulation (EU) 2026/1744 (in force since 27-07-2026) it requires providers and deployers **to take measures to support the development of AI literacy** among their staff and other persons operating or using AI systems on their behalf, taking into account their knowledge, experience, training and context of use, without setting a specific level (31 §6.1; 34 §3.5). For high-risk systems, Article 26(2) requires human oversight to be assigned to persons who have the necessary competence, training and authority (34 §3.9).

Regardless of that minimum, **SEVEN-G requires** a programme by profile with a record of participation and an assessment of effectiveness (31 §6.1). The policy and the plan are the evidence of the measures taken (50 §5.1). This template does not constitute legal advice; the validity of these references is checked against document 34.

---

## 4. Profile correspondence

| Profile (31 §6.2) | Profile (50 §5.2) | Initiative audience (23 §8.2) |
|---|---|---|
| F1 · All employees and collaborators with AI tools | PER-PC · All employees | Affected people in the area |
| F2 · Power users and users of personal agents | PER-PC · All employees | Users |
| F3 · Human overseers of systems in production | PER-PD · Users and overseers of a system | Human overseers; users |
| F4 · Initiative roles | PER-PE · Teams that build and operate | Operations team |
| F5 · Technical construction | PER-PE · Teams that build and operate | — |
| F6 · Second and third line | PER-PF · Control and people functions | — |
| F7 · Board and senior management | PER-PA · Board and senior management | — |
| F8 · People, labour relations and workers' representatives | PER-PF · Control and people functions | — |
| No F profile of its own | PER-PB · Middle managers | Area managers |

Middle managers (PER-PB) receive F1 and, in addition, the content of 50 §5.2 applied to their area: effect assessment, human oversight, transition and communication.

---

## 5. Annual plan by profile

| Profile | Group and number of people | Content and version | Format and duration | Frequency | Access condition | Target date | Owner | Budget **(Enterprise)** | Evidence |
|---|---|---|---|---|---|---|---|---|---|
| F1 | | 31 §6.2 | Online, 60–90 minutes, with assessment | On joining and annually | Before receiving AI licences | | | | Completion and acceptance of the policy |
| F2 | | | Practical workshop, 3–4 hours | When the licence or permission is assigned; annually | — | | | | Record and exercise |
| F3 | | Per system | 2–8 hours, with practice | Before go-live; upon changes; annually | Before overseeing a system in production | | | | Record per system and practical test |
| F4 | | | 1 day plus support | On taking up the role | Before taking up an initiative role | | | | Record linked to P03 |
| F5 | | | 2–3 days | On joining; annually | — | | | | Record and exercises |
| F6 | | | 2 days and continuous training | Annually and upon regulatory changes | — | | | | Record; AI Auditor competence plan |
| F7 | | | 2–3 hour session | Annually and on joining the body | — | | | | Minutes or attendance record |
| F8 | | | 2–3 hour session | Annually | — | | | | Attendance record |
| PER-PB | | 50 §5.2 | | | — | | | | Training and participation in an effect assessment |
| *(illustrative example)* F1 | Staff with a licence for the corporate assistant · 1,200 | Basic module v2 | Online, 75 minutes, 10-question test | Annually | Before the licence | 31-12-2026 | AI Office | €18,000 | Training platform record |

---

## 6. Initiative-specific training

Summary of section 5 of P20 for each initiative, in order to consolidate the company's coverage.

| Initiative | System | Audience (23 §8.2) | Emphasis by technology (23 §8.3) | People | Planned date | Completed (Yes · No) |
|---|---|---|---|---|---|---|
| IA-AAAA-NNN | SIA-AAAA-NNN | | Predictive ML · Generative AI · Agents · Embedded third-party AI | | | |

---

## 7. Training record per person

| Person | Area | Profiles | Action and version | Date | Format | Assessment | Acceptance of the policy | Valid until | Systems overseen or role | Status |
|---|---|---|---|---|---|---|---|---|---|---|
| Employee identifier | | F1–F8 | | DD-MM-AAAA | | Passed · Not passed · Practical validated | Date | DD-MM-AAAA | SIA-AAAA-NNN · role in IA-AAAA-NNN | Current · Expired · Pending |
| *(illustrative example)* E-00417 | Complaints | F1, F3 | Oversight of the complaints classifier v1.1 | 12-01-2027 | Classroom with cases | Practical validated | 03-11-2026 | 12-01-2028 | SIA-2026-021 | Current |
| | | | | | | | | | | |

---

## 8. Indicators

| Indicator | Formula | Source | Indicative reference | Result | Frequency |
|---|---|---|---|---|---|
| F1 coverage | People with current F1 ÷ people with access to AI tools | 31 §6.4 | Close to 100 % | | Monthly |
| Overseer coverage | Overseers with current F3 ÷ overseers assigned to systems in production | 31 §6.4 | 100 % | | Monthly |
| Role coverage | People with an initiative role and F4 ÷ people with a role | 31 §6.4 | 100 % | | Quarterly |
| Expired training | People with expired mandatory training | 31 §6.4 | Monthly alert | | Monthly |
| Pass rate | Assessments passed ÷ assessments taken, by profile | 31 §6.4 | To be set by the company | | Quarterly |
| Incidents due to misuse | Incidents and nonconformities with root cause "lack of awareness of the policy" | 31 §6.4; T08 | Trend | | Quarterly |
| IND-ADO-05 · AI literacy | People trained ÷ people in the obligated group | 41; PER-02 | 100 % of the obligated group (41); PER-PC ≥ 90 %, PER-PA and PER-PD 100 % (50 §11) | | Quarterly |
| IND-ADO-10 · Qualified overseers | A1–A3 systems in production whose overseers have PER-PD training recorded ÷ A1–A3 systems in production | 41; PER-03 | 100 % | | Quarterly |
| AI literacy (implementation) | Staff who use or oversee AI trained ÷ total | 90 §9 | Programme approved at 90 days; target set in C2 at 12 months | | Quarterly |

---

## 9. Programme effectiveness and review

| Field | Content | Guidance |
|---|---|---|
| Assessment results by profile | | Pass rate and questions with the most errors. |
| Signals from other sources | | Detections of unauthorised use (T21), results of the annual survey (P44, questions U10 to U12), verifications of outputs by sampling. |
| Content changes decided | | Due to changes in regulation, tools or incidents (31 §6.3). |
| Suppliers and collaborators **(Enterprise)** | | Contracts that require training equivalent to the profile (31 §6.3). |

---

## 10. Quality criteria

| # | Check | Status |
|---|---|---|
| 1 | There is an approved literacy programme with target audiences, content and timetable (question D5.03 of document 11). | Met · Not met · Not applicable · Pending |
| 2 | All staff who use or oversee AI systems have training appropriate to their function, with a record (question D5.05). | |
| 3 | People with SEVEN-G roles have F4 or a plan to obtain it before G0 (question D5.06; 31 §8). | |
| 4 | No designated overseer acts without recorded F3 (criterion G5.14 of document 21; 50 §5.3). | |
| 5 | The users of each system are trained before access (criterion G5.19 of document 21). | |
| 6 | Each mandatory training has an assessment and an expiry date, and expired training generates an alert. | |
| 7 | The indicators are calculated on the obligated group defined in section 2. | |

---

## 11. Approval and verification

| Function | Role in SEVEN-G | Name and position | Date | Signature or reference |
|---|---|---|---|---|
| Prepares the plan and maintains the record | AI Office and people function | | | |
| Provides the initiative training | AI Product Owner | | | |
| Approves the plan | AI Committee | | | |
| Verifies | AI Auditor or internal audit | | | |

Segregation of duties: whoever delivers or manages a training action does not validate on their own the assessment of its effectiveness.

---

## 12. Version control

**Completed document**

| Version | Date | Author | Changes |
|---|---|---|---|
| | | | |

**Template**

| Version | Date | Changes |
|---|---|---|
| 0.1 | 19-09-2026 | First version. Annual plan by profiles F1–F8 (31 §6) with their correspondence with PER-PA to PER-PF (50 §5.2) and with the audiences of 23 §8.2, literacy obligation as described in 31 §6.1 and 34 §3.5, training record per person and indicators of 31 §6.4, 41 and 90 §9. |
