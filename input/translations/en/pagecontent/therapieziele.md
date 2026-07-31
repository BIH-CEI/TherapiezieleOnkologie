### Therapy goals — what this guide is about

A **therapy goal** is the intended state that patient and care team agree on for an
oncological treatment. It is the central subject of this guide, represented as a FHIR
`Goal` in the [`OnkoTherapyGoal`](StructureDefinition-onko-therapy-goal.html) profile. A
goal answers *what should be achieved*, not *what is done* (the latter being requests
such as `ServiceRequest`/`MedicationRequest`). The goal type is coded from
[OnkoTherapyGoalType](CodeSystem-onko-therapy-goal-type.html) (cure, life prolongation,
symptom control, quality of life, preservation of function). Study participation is deliberately not a goal type — it is a means (investigational line of therapy, iLoT per EnLiST), not a patient-side target state.

### Goal type is not therapy intent — two axes

The **goal type** (`Goal.category`) and the **therapy intent**
([OnkoTherapyIntent](StructureDefinition-onko-therapy-intent.html), SNOMED hierarchy
`362961001 | Procedure by intent`) answer different questions and must not be conflated:

| | Therapy intent | Goal type |
|---|---|---|
| **Question** | *With what orientation is treatment given?* | *What state should be achieved?* |
| **Perspective** | Procedure / line of therapy | Patient / outcome |
| **Values** | curative, palliative, neoadjuvant, adjuvant, supportive | cure, life prolongation, symptom control, quality of life, preservation of function |
| **Location** | extension on episode (required), plan, goal | `Goal.category` |

The axes **correlate but are not redundant**: in the [mCRC scenario](szenario-crc.html)
the intent stays `palliative` while the goal type shifts between life prolongation and
maintenance; in the [breast cancer scenario](szenario-mamma.html) the *neoadjuvant* line
carries the *curative* overall goal. Neither axis alone could express this.

For the patient-centered goal types: **the category follows the level of assessment,
not the instrument.** Symptom-level assessment (scale or elicited symptom burden) →
symptom control; a concrete, nameable function or structure → preservation of function;
globally patient-reported — via standardized PROM *or* structured interview (e.g.
SEIQoL-DW, goals-of-care conversation) → quality of life. For a given `target` exactly
one category is correct; combining categories on one goal remains possible where
several target states are genuinely pursued (e.g. cure **and** breast conservation).

**Preservation of function** is a patient-prioritized goal that can steer the choice of
measures in *both* directions — de-escalating surgery (continence or larynx
preservation) as well as intensifying prior therapy (neoadjuvant systemic therapy that
enables breast conservation in the first place) — and its achievement is tracked
independently: it can fail (`not-achieved`) while the curative goal is still pursued.

The semantic anchoring of the goal types in SNOMED CT (target-state concepts, not
intent qualifiers) is documented in the ConceptMap
[Goal types → SNOMED CT](ConceptMap-ConceptMapOnkoTherapyGoalTypeSct.html).

### The goal is primary — the plan follows

A `Goal` is a standalone resource that **precedes** the care plan: the goal is set first
(shared decision / tumor board), then the `CarePlan` is formulated to pursue it.
`CarePlan.goal` is therefore a *pursuit reference*, not ownership.

### Two layers, and a strategy change replaces the goal

Goals occur on two layers: exactly **one active overarching goal** carrying the strategic
intent (**curative vs. palliative**), plus optional **episode goals** for individual
treatment phases. On a strategy change (curative → palliative on progression) the
overarching goal is **not mutated** but **closed and replaced** by a new one (linked via
`replacement`); a *successfully completed* goal, by contrast, hands off to its follow-up
goal via `predecessor`/`successor`.

### The intent is set at the point of recommendation

The strategic intent is fixed where therapy is **recommended** — typically the
interdisciplinary **tumor board**. This is why *recommendation* and *actual treatment*
are distinct objects; see [Recommendation and treatment plan](empfehlung-behandlung.html).

### Beyond oncology

The listed goal types and the curative/palliative intents are **not exhaustive**; other
entities carry further specialised intents/phases (e.g. induction/consolidation/
maintenance in haematological disease). The structure is disease-agnostic; dedicated pages
for further conditions (diabetes, asthma, IBD, chronic kidney disease/dialysis) are
envisaged.
