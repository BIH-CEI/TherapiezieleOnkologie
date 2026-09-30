// Episodenart einer onkologischen Behandlungsepisode: die ART des
// Versorgungsabschnitts (EpisodeOfCare.type). Einige Episodenarten sind
// Behandlungslinien (therapeutisch), andere nicht (Diagnostik, Surveillance) —
// der Linienbegriff bleibt therapeutischen Abschnitten vorbehalten.
// Die Behandlungsmodalität (Chemo, Bestrahlung …) ist ein EIGENES Merkmal
// (Extension onko-modalitaet), nicht Teil der Episodenart.

CodeSystem: Episodenart
Id: episodenart
Title: "Episodenart"
Description: "Art einer onkologischen Behandlungsepisode. Offener Startsatz: systemische Therapielinie (EnLiST/LoT), lokoregionale Behandlungslinie (Chirurgie, Strahlentherapie, Ablation — nicht EnLiST), Diagnostiklinie, Active Surveillance und Watchful Waiting; entitätsspezifische Arten werden ergänzt, ohne das Framework zu ändern."
* insert Translation(^title, en, Episode type)
* insert Translation(^description, en, Type of an oncological care episode. Open starter set: systemic line of therapy — EnLiST/LoT; locoregional treatment line — surgery\, radiotherapy\, ablation\, not EnLiST; diagnostic line; active surveillance; watchful waiting. Entity-specific types may be added without changing the framework.)
* ^caseSensitive = true
* ^content = #complete
* #systemische-therapielinie "Systemische Therapielinie" "Abschnitt aktiver systemischer Therapie (Line of Therapy, LoT) — EnLiST-konform und in die LoT-Zählung aufgenommen."
* #lokoregionale-behandlungslinie "Lokoregionale Behandlungslinie" "Nicht-systemische Behandlungslinie: Chirurgie, Strahlentherapie, Ablation — von EnLiST nicht abgedeckt, nicht in der LoT-Zählung."
* #diagnostiklinie "Diagnostiklinie" "Abgegrenzter diagnostischer Abschnitt (Grading, Staging, molekulare Charakterisierung) als Grundlage einer Tumorboard-Empfehlung; nicht-therapeutisch."
* #active-surveillance "Active Surveillance" "Aktive Überwachung mit kurativer Rückfallebene — engmaschiges Monitoring statt sofortiger Therapie."
* #watchful-waiting "Watchful Waiting" "Abwartendes Beobachten — symptomorientiertes Vorgehen ohne kurative Rückfallebene."

ValueSet: EpisodenartVS
Id: episodenart
Title: "Episodenart (ValueSet)"
Description: "Alle Episodenarten des Startsatzes; die Bindung ist extensible — entitätsspezifische Arten dürfen ergänzt werden."
* insert Translation(^title, en, Episode type value set)
* insert Translation(^description, en, All starter-set episode types; the binding is extensible — entity-specific types may be added.)
* include codes from system Episodenart
