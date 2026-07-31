An oncological course consists of **bounded phases of activity** — diagnostics, lines of
therapy, surgery, surveillance, aftercare. Each is modelled as a **care episode** based on
FHIR `EpisodeOfCare`: a bounded period of actively managed care with its own purpose
(intent), period, status/history and responsible organisation.

### One profile, many types

Rather than one profile per phase type, there is **one general care-episode profile**; the
**type** is coded on `EpisodeOfCare.type` (open/extensible): diagnostic line, systemic line
of therapy, locoregional treatment line, active surveillance / watchful waiting, aftercare.
The list is open (e.g. induction/consolidation/maintenance for haematological disease).

{% include konzept-behandlungsepisoden.svg %}

### Systemic line of therapy vs. locoregional treatment line

The umbrella term **treatment line** has two modality classes: the **systemic line of
therapy** (LoT) follows the EnLiST consensus notation
([Saini et al., *Ann Oncol* 2026](https://doi.org/10.1016/j.annonc.2026.02.008)) and is
**counted**; the **locoregional treatment line** (surgery, radiotherapy, ablation) is **not
covered by EnLiST** and **not counted** — a separate modality track.

> **Note on EnLiST.** EnLiST standardises line designation for **solid tumours** and
> **systemic** therapy only; haematological disease uses a separate adaptation, and the
> framework is still in "road testing" (2026–2027). The LoT count is therefore **not a
> universal cross-entity score**; read the "counted?" column in the context of the entity.

### Line change ≠ goal change

EnLiST designates lines as **X.Y per setting axis** (eLoT early · aLoT advanced ·
iLoT investigational, counted separately): X counts **new LoTs** (only on
progression or lack of adequate response), Y counts **modified LoTs**
(non-progression-related changes); **same LoTs** (prospectively planned changes
including maintenance) leave the designation unchanged. These events live on the
**measures axis** — they never trigger a goal operation automatically:

| EnLiST event | Trigger | Episode goal | Overarching goal |
|---|---|---|---|
| **Same LoT** (X.Y unchanged) | prospectively planned: dose, pause, maintenance | unchanged — *or* `successor` when a phase goal is achieved | unchanged |
| **Modified LoT** (Y+1) | intolerance, agent switch without progression | **unchanged** (only the measure changes) | unchanged |
| **New LoT** (X+1) | progression / lack of response | usually new — previous goal closed, often `not-achieved` | unchanged while the intent holds |
| **New LoT + strategy change** (often eLoT→aLoT) | progression invalidates the intent | new | **`replacement`** |

Evidence in both directions: in the [mCRC scenario](szenario-crc.html) the
overarching goal outlives several palliative lines; induction → maintenance is a
**goal change without a line change** (maintenance = *same LoT*); an agent switch
for intolerance (`eLoT 1.0 → 1.1`) changes **no goal at all**. EnLiST also
explicitly decouples setting and intent.

### One line across organisations — leadership and execution

`EpisodeOfCare` is **bound to an organisation**. A line of therapy that runs
across sectors (inpatient neoadjuvant systemic therapy → ambulatory adjuvant
pembrolizumab) therefore splits into several episodes — without losing its
identity: the **leading episode** (main contributor, typically the coordinating
tumor centre) carries the EnLiST designation (`enlist-lot`) with a shared
`lineId` — **exactly once per line**; **executing organisations** document their
own episodes autonomously and mark them as segments (`enlist-line-segment`) with
the same `lineId`, without a designation of their own. With the same site and
sector, leadership and execution coincide in a single episode (the normal case);
the documenting party chooses the form — **no automatism**. Counting stays
trivial: only carriers of `enlist-lot` are counted.

### Connecting encounters (ISiK/KBV) and MII procedures

If the proposed line-of-therapy modelling meets approval, it becomes the docking
point in both directions: **encounters** from hospital care (**ISiK**) and
ambulatory care (**KBV**) attach via the standard element
`Encounter.episodeOfCare`; the **MII procedures** with `performedPeriod` —
systemic therapy, radiotherapy and surgery — remain unchanged and are wired via
the standard extension `workflow-episodeOfCare`, or, in an MII-only path,
carry `enlist-lot`/`enlist-line-segment` directly. This yields the continuous
chain **encounter → segment/episode → line (LoT) → goal**.

### Episode ≠ procedure ≠ encounter

The surgery itself is a `Procedure`; the **perioperative journey** (planning, consent, the
operation, post-op stay, rehabilitation, monitoring) spans several `Encounter`s and *is* the
episode. Care episodes link to the treatment plan via the `workflow-episodeOfCare` extension;
`Encounter` itself is out of scope of this guide.
