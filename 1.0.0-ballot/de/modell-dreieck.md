# Das Therapieziel-Dreieck - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Das Therapieziel-Dreieck

Die drei Kernkonzepte dieses Leitfadens bilden ein **Dreieck**: die **Behandlungsepisode** (**wer** behandelt, in welchem Rahmen), das **Therapieziel** (**was** erreicht werden soll) und der **Versorgungsplan** (**welche Maßnahmen** geplant sind). Der Plan **verfolgt** das Ziel (`CarePlan.goal` — Verfolgung, kein Besitz) und **gehört zu** seiner Episode (Standard-Extension `workflow-episodeOfCare`); Ziel und Episode sind **nur implizit über den Plan** verknüpft. In der Mitte steht die Patientin als gemeinsames `subject` aller drei.

### Formalisierung als logisches Modell

Das Dreieck ist als ressourcenneutrales **logisches Modell** [TherapiezielDreieck](StructureDefinition-TherapiezielDreieck.md) formalisiert: die drei Konzepte als Strukturbaum mit deutschen Elementnamen — und im Reiter **„Mappings“** die Abbildung jedes Elements auf FHIR R4 bzw. die Profile dieses Leitfadens (`Goal.target.measure`, `EpisodeOfCare.type`, `CarePlan.goal`, …).

### Vertiefung je Ecke

* **Ziel:** [Therapieziele (Goal)](therapieziele.md) und [Zielwerte & Messgrößen](goal-target-measure.md)
* **Plan:** [Empfehlungs- und Behandlungsplan (CarePlan)](empfehlung-behandlung.md)
* **Episode:** [Behandlungsepisoden (EpisodeOfCare)](behandlungsepisode.md)

