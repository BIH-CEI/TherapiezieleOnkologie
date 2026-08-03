Die drei Kernkonzepte dieses Leitfadens bilden ein **Dreieck**: die
**Behandlungsepisode** (*wer* behandelt, in welchem Rahmen), das
**Therapieziel** (*was* erreicht werden soll) und der **Versorgungsplan**
(*welche Maßnahmen* geplant sind). Der Plan **verfolgt** das Ziel
(`CarePlan.goal` — Verfolgung, kein Besitz) und **gehört zu** seiner Episode
(Standard-Extension `workflow-episodeOfCare`); Ziel und Episode sind **nur
implizit über den Plan** verknüpft. In der Mitte steht die Patientin als
gemeinsames `subject` aller drei.

{% include therapieziel-dreieck.svg %}

### Formalisierung als logisches Modell

Das Dreieck ist als ressourcenneutrales **logisches Modell**
[TherapiezielDreieck](StructureDefinition-TherapiezielDreieck.html)
formalisiert: die drei Konzepte als Strukturbaum mit deutschen
Elementnamen — und im Reiter **„Mappings“** die Abbildung jedes Elements auf
FHIR R4 bzw. die Profile dieses Leitfadens (`Goal.target.measure`,
`EpisodeOfCare.type`, `CarePlan.goal`, …).

### Vertiefung je Ecke

- **Ziel:** [Therapieziele (Goal)](therapieziele.html) und
  [Zielwerte & Messgrößen](goal-target-measure.html)
- **Plan:** [Empfehlungs- und Behandlungsplan (CarePlan)](empfehlung-behandlung.html)
- **Episode:** [Behandlungsepisoden (EpisodeOfCare)](behandlungsepisode.html)
