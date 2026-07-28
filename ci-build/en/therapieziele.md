# Therapieziele (Goals) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Therapieziele (Goals)

 
This page includes translations from the original source language in which the guide was authored. Information on these translations and instructions on how to provide feedback on the translations can be found [here](translationinfo.md). 

### Therapy goals — what this guide is about

A **therapy goal** is the intended state that patient and care team agree on for an oncological treatment. It is the central subject of this guide, represented as a FHIR `Goal` in the [`OnkoTherapyGoal`](StructureDefinition-onko-therapy-goal.md) profile. A goal answers **what should be achieved**, not **what is done** (the latter being requests such as `ServiceRequest`/`MedicationRequest`). The goal type is coded from [OnkoTherapyGoalType](CodeSystem-onko-therapy-goal-type.md) (cure, life prolongation, symptom control, quality of life, preservation of function, study participation).

### The goal is primary — the plan follows

A `Goal` is a standalone resource that **precedes** the care plan: the goal is set first (shared decision / tumor board), then the `CarePlan` is formulated to pursue it. `CarePlan.goal` is therefore a **pursuit reference**, not ownership.

### Two layers, and a strategy change replaces the goal

Goals occur on two layers: exactly **one active overarching goal** carrying the strategic intent (**curative vs. palliative**), plus optional **episode goals** for individual treatment phases. On a strategy change (curative → palliative on progression) the overarching goal is **not mutated** but **closed and replaced** by a new one (linked via `replacement`); a **successfully completed** goal, by contrast, hands off to its follow-up goal via `predecessor`/`successor`.

### The intent is set at the point of recommendation

The strategic intent is fixed where therapy is **recommended** — typically the interdisciplinary **tumor board**. This is why **recommendation** and **actual treatment** are distinct objects; see [Recommendation and treatment plan](empfehlung-behandlung.md).

### Beyond oncology

The listed goal types and the curative/palliative intents are **not exhaustive**; other entities carry further specialised intents/phases (e.g. induction/consolidation/ maintenance in haematological disease). The structure is disease-agnostic; dedicated pages for further conditions (diabetes, asthma, IBD, chronic kidney disease/dialysis) are envisaged.

