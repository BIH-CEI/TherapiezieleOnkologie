# Behandlungsepisoden (EpisodeOfCare) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Behandlungsepisoden (EpisodeOfCare)

 
This page includes translations from the original source language in which the guide was authored. Information on these translations and instructions on how to provide feedback on the translations can be found [here](translationinfo.md). 

An oncological course consists of **bounded phases of activity** — diagnostics, lines of therapy, surgery, surveillance, aftercare. Each is modelled as a **care episode** based on FHIR `EpisodeOfCare`: a bounded period of actively managed care with its own purpose (intent), period, status/history and responsible organisation.

### One profile, many types

Rather than one profile per phase type, there is **one general care-episode profile**; the **type** is coded on `EpisodeOfCare.type` (open/extensible): diagnostic line, systemic line of therapy, locoregional treatment line, active surveillance / watchful waiting, aftercare. The list is open (e.g. induction/consolidation/maintenance for haematological disease).

### Systemic line of therapy vs. locoregional treatment line

The umbrella term **treatment line** has two modality classes: the **systemic line of therapy** (LoT) follows the EnLiST consensus notation ([Saini et al., **Ann Oncol** 2026](https://doi.org/10.1016/j.annonc.2026.02.008)) and is **counted**; the **locoregional treatment line** (surgery, radiotherapy, ablation) is **not covered by EnLiST** and **not counted** — a separate modality track.

> **Note on EnLiST.** EnLiST standardises line designation for **solid tumours** and **systemic** therapy only; haematological disease uses a separate adaptation, and the framework is still in "road testing" (2026–2027). The LoT count is therefore **not a universal cross-entity score**; read the "counted?" column in the context of the entity.

### Episode ≠ procedure ≠ encounter

The surgery itself is a `Procedure`; the **perioperative journey** (planning, consent, the operation, post-op stay, rehabilitation, monitoring) spans several `Encounter`s and **is** the episode. Care episodes link to the treatment plan via the `workflow-episodeOfCare` extension; `Encounter` itself is out of scope of this guide.

