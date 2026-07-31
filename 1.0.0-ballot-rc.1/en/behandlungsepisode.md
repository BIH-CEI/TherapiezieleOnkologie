# Behandlungsepisoden (EpisodeOfCare) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.1

## Behandlungsepisoden (EpisodeOfCare)

 
This page includes translations from the original source language in which the guide was authored. Information on these translations and instructions on how to provide feedback on the translations can be found [here](translationinfo.md). 

An oncological course consists of **bounded phases of activity** — diagnostics, lines of therapy, surgery, surveillance, aftercare. Each is modelled as a **care episode** based on FHIR `EpisodeOfCare`: a bounded period of actively managed care with its own purpose (intent), period, status/history and responsible organisation.

### One profile, many types

Rather than one profile per phase type, there is **one general care-episode profile**; the **type** is coded on `EpisodeOfCare.type` (open/extensible): diagnostic line, systemic line of therapy, locoregional treatment line, active surveillance / watchful waiting, aftercare. The list is open (e.g. induction/consolidation/maintenance for haematological disease).

### Systemic line of therapy vs. locoregional treatment line

The umbrella term **treatment line** has two modality classes: the **systemic line of therapy** (LoT) follows the EnLiST consensus notation ([Saini et al., **Ann Oncol** 2026](https://doi.org/10.1016/j.annonc.2026.02.008)) and is **counted**; the **locoregional treatment line** (surgery, radiotherapy, ablation) is **not covered by EnLiST** and **not counted** — a separate modality track.

> **Note on EnLiST.** EnLiST standardises line designation for **solid tumours** and **systemic** therapy only; haematological disease uses a separate adaptation, and the framework is still in "road testing" (2026–2027). The LoT count is therefore **not a universal cross-entity score**; read the "counted?" column in the context of the entity.

### Line change ≠ goal change

EnLiST designates lines as **X.Y per setting axis** (eLoT early · aLoT advanced · iLoT investigational, counted separately): X counts **new LoTs** (only on progression or lack of adequate response), Y counts **modified LoTs** (non-progression-related changes); **same LoTs** (prospectively planned changes including maintenance) leave the designation unchanged. These events live on the **measures axis** — they never trigger a goal operation automatically:

| | | | |
| :--- | :--- | :--- | :--- |
| **Same LoT**(X.Y unchanged) | prospectively planned: dose, pause, maintenance | unchanged —**or**`successor`when a phase goal is achieved | unchanged |
| **Modified LoT**(Y+1) | intolerance, agent switch without progression | **unchanged**(only the measure changes) | unchanged |
| **New LoT**(X+1) | progression / lack of response | usually new — previous goal closed, often`not-achieved` | unchanged while the intent holds |
| **New LoT + strategy change**(often eLoT→aLoT) | progression invalidates the intent | new | **`replacement`** |

Evidence in both directions: in the [mCRC scenario](szenario-crc.md) the overarching goal outlives several palliative lines; induction → maintenance is a **goal change without a line change** (maintenance = **same LoT**); an agent switch for intolerance (`eLoT 1.0 → 1.1`) changes **no goal at all**. EnLiST also explicitly decouples setting and intent.

### Episode ≠ procedure ≠ encounter

The surgery itself is a `Procedure`; the **perioperative journey** (planning, consent, the operation, post-op stay, rehabilitation, monitoring) spans several `Encounter`s and **is** the episode. Care episodes link to the treatment plan via the `workflow-episodeOfCare` extension; `Encounter` itself is out of scope of this guide.

