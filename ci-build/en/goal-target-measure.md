# Zielwerte und Messgrößen - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Zielwerte und Messgrößen

 
This page includes translations from the original source language in which the guide was authored. Information on these translations and instructions on how to provide feedback on the translations can be found [here](translationinfo.md). 

### Targets and measures (Goal.target)

A therapy goal becomes **measurable** through targets. FHIR `Goal.target` has three parts: **`target.measure`** (the tracked parameter, coded, e.g. LOINC/SNOMED), **`target.detail`** (the intended value/range) and **`target.due`** (the deadline). A goal may carry several targets.

### Mainly at the level of therapy episodes

This measurable `target` logic applies mainly to the **episode goals** of the individual therapy episodes (concrete parameters: disease status, staging, response …). The **overarching goal**, by contrast, usually carries **no measurable target** but the **strategic intent** (curative vs. palliative) — a clinical judgement depending on the cancer entity and the staging/grading threshold at which curative treatment (e.g. resectability) is no longer possible.

### Target ≠ outcome; trajectory lives in the observation

`Goal.target` is the **intended** value (and may be shared across goals); `Goal.outcomeReference` is the **observed** result — one per goal, empty until observed. `achievementStatus` uses **state codes only** (`in-progress`, `achieved`, `not-achieved`, `not-attainable`); the **trajectory** (response over time) lives in the outcome `Observation`s (RECIST, mCODE Cancer Disease Status), which are timestamped and define their own reference point.

### A modality is not an endpoint

Not every clinical procedure is a suitable target. A follow-up **mammography** is a **means of assessment**, **not an endpoint** — the endpoint is the disease/recurrence status; the mammography belongs in a `ServiceRequest`, not in `target.measure`.

### Typical measures (general)

These measures are **general**, not scenario-specific; some are **entity-specific** (e.g. ER/PR/HER2 in breast cancer), others general (TNM, stage group, disease status). Examples: tumour size (max. dimension, LOINC `33728-7`), residual-tumour status R0/R1/R2 (`84892-9`), leukocytes for leukopenia (`6690-2`), and tumour markers in monitoring — PSA (`2857-1`), CA-125 (ovarian, `10334-1`), CEA (`2039-6`), CA 15-3 (breast, `6875-9`). Tumour-marker use is **entity- and situation-dependent**: CA-125 is an established monitoring endpoint in ovarian cancer (GCIG criteria), whereas routine CA 15-3 in asymptomatic curative breast follow-up is not guideline-recommended.

