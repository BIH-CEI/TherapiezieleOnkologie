# Therapieziele Onkologie

Fachliches Glossar (ubiquitäre Sprache) für die FHIR-Modellierung onkologischer
Behandlungsziele. Deutsch ist die Leitsprache; der englische Begriff ist als
Synonym (_EN_) deklariert. Rein begrifflich — keine Implementierungsdetails.

## Ziele (Goal)

**Prinzip — das Ziel ist primär.** Ein `Goal` ist eine eigenständige Ressource,
die dem `CarePlan` **vorausgeht**: erst wird (per Shared Decision / Tumorboard)
das Ziel festgelegt, dann folgt der Plan zu seiner Erfüllung. `CarePlan.goal` ist
eine *Verfolgungs-Referenz*, **kein** Besitz; ein Plan „besitzt" ein Ziel nicht,
und dasselbe Ziel kann von mehreren Plänen verfolgt werden. In FHIR läuft die
Referenz nur `CarePlan.goal → Goal` (es gibt keine `Goal → CarePlan`-Referenz).

**Übergeordnetes Behandlungsziel**
_EN_: overarching goal
Genau ein zu jedem Zeitpunkt aktives `OnkoTherapyGoal`, das die strategische
Therapieintention (kurativ vs. palliativ) der aktuellen Intentions-Ära abbildet.
Bei einem strategischen Wechsel (z. B. kurativ → palliativ bei Progress) wird es
abgeschlossen und durch ein **neues** übergeordnetes Ziel ersetzt (nicht in-place
geändert); die beiden werden als Vorgänger/Nachfolger bzw. Ersetzung verknüpft.
_Vermeiden_: Gesamtziel, Hauptziel

**Episodenziel**
_EN_: episode goal
Ein spezifischeres `OnkoTherapyGoal` auf unterer Ebene, das einem konkret
geplanten Behandlungsabschnitt ([[Therapielinie]]) zugeordnet ist. Optional; es
kann mehrere geben oder keines.
_Vermeiden_: Teilziel, Unterziel

## Versorgungspläne (CarePlan)

**EmpfehlungsCarePlan**  ·  FHIR: `CarePlan` (intent `proposal`/`plan`)
_EN_: recommendation care plan
**Entscheidung:** die vom Tumorboard nach abgeschlossener [[Diagnostiklinie]]
synthetisierte **Empfehlungsliste**. Enthält die empfohlenen Tumorboard-
`ServiceRequest`/`MedicationRequest` (intent `proposal`); kann von anderen
Behandler:innen umgesetzt werden — oder nicht. Verfolgt (via `CarePlan.goal`) das
strategische [[Übergeordnetes Behandlungsziel]] — das dem Plan vorausgeht und
eigenständig ist. Pro Board-Entscheidung (auch bei
Rezidiv erneut) ein eigener; eine Intentions-Pivotierung geschieht an einem neuen
Board → neuer EmpfehlungsCarePlan + neues übergeordnetes Ziel.

**BehandlungsCarePlan**  ·  FHIR: `CarePlan` (intent `plan`/`order`)
_EN_: treatment care plan
**Entscheidung:** der [[Behandlungsepisode]]-spezifische Plan **tatsächlich
erbrachter** Versorgung, `basedOn` → EmpfehlungsCarePlan (CarePlan→CarePlan, in R4
zulässig). Verfolgt (via `CarePlan.goal`) das [[Episodenziel]]. Die Umsetzung *einzelner* Empfehlungen wird
auf **Request-Ebene** verknüpft: ausgeführte `ServiceRequest`/`MedicationRequest`
tragen `.basedOn` → Empfehlungs-Request (nicht über `CarePlan.basedOn`, das in R4
nur `Reference(CarePlan)` ist). Die Verknüpfung zur [[Behandlungsepisode]] läuft
über die Standard-Extension **`workflow-episodeOfCare`** (direkt am CarePlan,
`Reference(EpisodeOfCare)`), **nicht** über `CarePlan.encounter` (= nur der
*erstellende* Encounter). `Encounter` ist bewusst **außerhalb des Scopes** (in DE
via MII Fall / ISIK definiert, aber für die Plan↔Episode↔Ziel-Verknüpfung nicht
nötig).
_Vermeiden_: `CarePlan.partOf` / Umbrella-Plan. `partOf` unterstellt eine
**zentrale Steuerung**, die in der deutschen **intersektoralen** Versorgung nicht
existiert — autonome Leistungserbringer planen eigenständig und *erfüllen* die
Empfehlung (`basedOn`), statt einem Masterplan untergeordnet zu sein.

**Zielbeziehungen** (goal-relationship)  ·  FHIR: R4 `goal-relationship-type`
_EN_: goal relationships
**Entscheidung:** Goal↔Goal-Verknüpfungen nur mit *ehrlichen* Codes: `predecessor`/
`successor` für die tatsächliche zeitliche Journey-Sequenz, `replacement` für die
Intentions-Pivotierung des [[Übergeordnetes Behandlungsziel]]. Die **Hierarchie**
Episodenziel ↔ übergeordnetes Ziel bleibt **implizit** über den Plan-/`basedOn`-
Graphen (welcher Plan welches Ziel verfolgt). R4 kennt nur predecessor, successor,
replacement, milestone, other — **kein** part-of; `milestone` wird *nicht* für die
Hierarchie zweckentfremdet (allenfalls für echte Zwischen-Meilensteine wie „pCR").
_Vermeiden_: eigener part-of-Code; `milestone` als Hierarchie-Ersatz.

**Zielwert vs. Ergebnis** (target vs. outcome)  ·  FHIR: `Goal.target` / `Goal.outcomeReference`
_EN_: target vs. outcome
**Entscheidung:** `target` (der *angestrebte* Messwert, z. B. Krankheitsstatus
„kein Anhalt für Tumor") **darf** über mehrere Ziele **gleich** sein — Behandlungs-
und Nachsorgeziel verfolgen denselben Zielwert, weil die Absicht über Heilung →
Surveillance durchläuft. `outcomeReference` (die *evidenzierende* Observation) ist
dagegen **pro Ziel eigen** und phasengerecht; **leer**, solange kein Ergebnis
beobachtet wurde. Dieselbe Observation für mehrere Ziele zu verwenden vermischt
verschiedene Fragen („diagnostiziert?" / „geheilt?" / „rezidiviert?").
_Vermeiden_: geteilte `outcomeReference` „aus Bequemlichkeit".

**Status-Konvention** (lifecycle × achievement)  ·  FHIR: `Goal.lifecycleStatus` / `Goal.achievementStatus`
_EN_: status convention
**Entscheidung:** `lifecycleStatus` = *warum* die Zielverfolgung endet,
`achievementStatus` = *erreichter Grad*. `achievementStatus` nur bei
`lifecycleStatus ∈ {active, on-hold, completed}`; `proposed`/`planned` trägt noch
keinen. **`completed` nur bei Erfolg** (CR/pCR → `completed`+`achieved`); Aufgabe/
Pivot ist `cancelled`+`not-achieved`/`not-attainable` **mit `replacement`-Nachfolger**
(= die Intentions-Pivotierung, s. [[Übergeordnetes Behandlungsziel]]). Partielle
Remission ist **nicht** `completed`: entweder `active`+`in-progress` (weiter kurativ)
oder `cancelled`+Replacement (Palliativ-Pivot).
**Nur die Zustands-Codes** verwenden: `in-progress`, `achieved`, `not-achieved`,
`not-attainable`. Die **Trajektorie**-Leaves (`improving`, `worsening`, `no-change`,
`sustaining`, `no-progress`) werden **vermieden** — `Goal.achievementStatus` ist
`0..1` ohne Historie, und die Codes definieren keinen Bezugspunkt (Baseline/Nadir/
Vorwert). Verlauf/Ansprechen liegt in den Ergebnis-Observations (RECIST / mCODE
CancerDiseaseStatus), die zeitgestempelt sind und ihren Bezug selbst definieren.
_Vermeiden_: Trajektorie-Codes in `achievementStatus`; `completed` bei Abbruch/Pivot.

## Behandlungsverlauf

**Behandlungsphase**
_EN_: care phase
Ein abgegrenzter, klinisch definierter Abschnitt des Versorgungsverlaufs mit
eigener Intention und (optional) eigenem [[Episodenziel]], typischerweise durch
einen eigenen `CarePlan` repräsentiert. Die **Art** der Phase ist ein offenes,
codiertes Merkmal (extensible ValueSet) — nicht auf eine feste Liste festgelegt.
Der Leitfaden liefert nur einen Startsatz häufiger Phasen (z. B. Diagnostik/
Staging, systemische [[Therapielinie]], Operation, Active Surveillance, Watchful
Waiting, Induktion/Konsolidierung/Erhaltung, Nachsorge); entitätsspezifische
Phasen (Prostata, hämatologische Erkrankungen …) werden ergänzt, ohne das
Framework zu ändern. Struktureller Invariant, nicht die Phasenliste, ist stabil:
Layer 1 = ein aktives [[Übergeordnetes Behandlungsziel]], Layer 2 = optionale
Phasenziele.
_Vermeiden_: Behandlungsschritt, Stufe

**Behandlungsepisode**  ·  FHIR: `EpisodeOfCare`
_EN_: care episode
**Entscheidung:** ein **einziges** generelles `EpisodeOfCare`-Profil (nicht je ein
Profil pro Art). Die Art steht in `EpisodeOfCare.type` (offen/extensible:
[[Therapielinie]], [[Diagnostiklinie]], Active Surveillance, Watchful Waiting …);
die [[Intention]] ist gemeinsames Element; art-spezifische Angaben liegen in einer
je-Art-Extension. Ersetzt das frühere, auf aktive Therapie verengte
`OnkoTherapyLine`. Mehrere/eskalierende Episoden derselben Art sind normal.
_Vermeiden_: Versorgungsepisode, Behandlungslinie (zu eng)

**Behandlungslinie**
_EN_: treatment line
Oberbegriff für einen **therapeutischen** Linien-Abschnitt. Zwei Modalitätsklassen:
die **systemische** [[Therapielinie]] (LoT, EnLiST-gezählt) und die
[[Lokoregionale Behandlungslinie]] (Chirurgie, Strahlentherapie, Ablation —
**nicht** EnLiST, nicht in die LoT-Zählung). Beide sind [[Behandlungsepisode]]n.
Diagnostik- und Surveillance-Abschnitte sind *keine* Behandlungslinien.

**Therapielinie**
_EN_: line of therapy (LoT)
Die **systemische** [[Behandlungslinie]]: ein Abschnitt **aktiver systemischer**
Therapie mit definierter Intention und Tumorerkrankung, beendet durch ein
klinisches Ereignis (Progress, Toxizität, Patientenwunsch, Studienende, geplanter
Wechsel). **EnLiST-konform und in die LoT-Zählung aufgenommen.** Realisiert als
[[Behandlungsepisode]] mit der Therapielinie-Extension (kein eigenes
EpisodeOfCare-Profil).

**Lokoregionale Behandlungslinie**
_EN_: locoregional treatment line
Die **nicht-systemische** [[Behandlungslinie]]: Chirurgie, Strahlentherapie,
Ablation. **Von EnLiST nicht abgedeckt**, daher **nicht in die LoT-Zählung** —
eigene Modalitätsspur. Realisiert als [[Behandlungsepisode]]. Für die Chirurgie
gilt: die perisurgische Reise ist die Episode, die OP selbst ein `Procedure` darin
(siehe [[Perioperative Behandlungsepisode]]).

**Multimodale Orchestrierung**  ·  FHIR: `RequestGroup` (R4) / `RequestOrchestration` (R6)
_EN_: multimodal orchestration
Ein **zusammen gedachter** Plan, der systemische [[Therapielinie]]n und
[[Lokoregionale Behandlungslinie]]n verschränkt — **sequenziell** (neoadjuvant →
OP → adjuvant) oder **gleichzeitig** (Radiochemotherapie). Ausgedrückt über
`RequestGroup.action.relatedAction` (`before-start`/`after-end` für Sequenz,
`concurrent` für Gleichzeitigkeit) + `offset` für Abstände; `action.resource` →
einzelne Requests; `instantiatesCanonical` → `PlanDefinition` (CPG-Primärpfad).
Vom [[EmpfehlungsCarePlan]] referenziert (Request-Stufe der Definition→Request→
Event-Triade).

**Perioperative Behandlungsepisode**  ·  FHIR: `EpisodeOfCare`
_EN_: perioperative care episode
Die chirurgische Ausprägung der [[Lokoregionale Behandlungslinie]]: die
**perisurgische Reise** — Planung, Aufklärung/Consent (chirurgisch +
anästhesiologisch), Operation, postoperativer stationärer Aufenthalt,
Rehabilitation, postoperatives Monitoring — über mehrere `Encounter` hinweg.
**Abgrenzung:** die Operation selbst ist ein `Procedure` (Ereignis *innerhalb* der
Episode), **keine** Episode. Es *ist* eine Behandlungslinie, aber eine
**lokoregionale** — keine systemische [[Therapielinie]] (LoT), daher **nicht** in
die EnLiST-Zählung.

**Diagnostiklinie**
_EN_: diagnostic line
*Eine Ausprägung* der [[Behandlungsepisode]]: ein abgegrenzter **diagnostischer**
Abschnitt (Grading, Staging, molekulare Charakterisierung) als Grundlage einer
Tumorboard-Empfehlung. Nicht-therapeutisch. Tritt typischerweise an drei Stellen
auf: (1) Erstdiagnose, (2) Differenzial-/Re-Diagnostik nach Remission bzw. bei
Rezidiv, (3) spezialisierte Diagnostik (z. B. molekulares Tumorboard). Realisiert
als Behandlungsepisode mit Diagnostiklinie-Extension.

**Intention** (einer Behandlungsepisode)
_EN_: intent
Der **Zweck** einer [[Behandlungsepisode]] — für *jede* Episodenart bestimmbar
und daher gemeinsames Element der Basis: eine [[Therapielinie]] ist kurativ /
neoadjuvant / adjuvant / palliativ / supportiv; eine [[Diagnostiklinie]] hat den
Zweck, die zur Fortsetzung oder Verbesserung der Behandlung nötige Information zu
gewinnen; Active Surveillance / Watchful Waiting überwacht bzw. verschiebt
Therapie. Abzugrenzen vom **Anlass** einer Diagnostiklinie (Erstdiagnose /
Re-Diagnostik / spezialisiert) — das ist der Auslöser, nicht der Zweck.
_Vermeiden_: (für den Auslöser) „Intention" — dafür gilt „Anlass".
