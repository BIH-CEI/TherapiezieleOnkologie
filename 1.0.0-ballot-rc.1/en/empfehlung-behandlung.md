# Empfehlungs- und Behandlungsplan - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.1

## Empfehlungs- und Behandlungsplan

 
This page includes translations from the original source language in which the guide was authored. Information on these translations and instructions on how to provide feedback on the translations can be found [here](translationinfo.md). 

The therapy intent arises at the **recommendation** (tumor board). It follows that **what is recommended** and **what is actually delivered** are distinct objects.

### Two CarePlan roles

* **Recommendation care plan** — the tumor board's synthesised list of recommendations (proposed `TumorboardServiceRequest`/`TumorboardMedicationRequest`, `intent = proposal`); carries the **overarching goal**.
* **Treatment care plan** — the episode-specific plan of **actually delivered** care; carries the respective **episode goal**.

### Different level of detail, decoupled in time and organisation

The recommendation is coarse-grained ("which strategy, which modalities, which goal"); the treatment plan is fine-grained ("which substance/dose/schedule, which procedure, at which site"). For example, the recommendation may specify a **drug class** ("platinum-based chemotherapy + checkpoint inhibitor"), while the treatment plan sets the **concrete substances** and may link to **pharmacy/ordering** and **appointment-booking** systems. Recommendation and delivery are decoupled in **time** and across **organisations** (each treatment plan has its own `custodian`).

### basedOn, not partOf

The treatment plan **fulfils** the recommendation via `CarePlan.basedOn` (not `partOf`, which would imply central steering that does not exist in German intersectoral care).

### Reference to established protocols

A treatment plan often references an established **protocol** (guideline, study protocol, SOP) via `instantiatesCanonical` (computable `PlanDefinition`) or `instantiatesUri`. Two template levels work together: **CPG guidelines** as **recommendation templates** and a **protocol catalogue** as **treatment templates**. A normative catalogue for systemic protocols does not yet exist; one is expected from the **PHOENIX initiative from Q4 2026** (European Common Cancer Model). It will initially cover systemic chemo-/targeted protocols; non-chemo systemic therapies, surgery, pre-/aftercare and radiotherapy are not yet covered.

