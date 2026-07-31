// =====================================================================
// Logisches Modell des Therapieziel-Dreiecks:
// Behandlungsepisode (wer behandelt) – Therapieziel (was soll erreicht
// werden) – Versorgungsplan (was ist geplant). Ressourcenneutral
// formuliert; die Abbildung auf FHIR R4 bzw. die Profile dieses
// Leitfadens steht im Mapping am Dateiende.
// =====================================================================

Logical: TherapiezielDreieck
Id: TherapiezielDreieck
Title: "Therapieziel-Dreieck (logisches Modell)"
Description: """
Logisches Modell der drei Kernkonzepte des Leitfadens und ihrer Beziehungen:

- **Behandlungsepisode** — *wer* behandelt, in welchem Rahmen (Art, Intention,
  Zeitraum, verantwortliche Organisation),
- **Therapieziel** — *was* erreicht werden soll (Zielart, messbarer Zielwert,
  Erreichungsgrad),
- **Versorgungsplan** — *welche Maßnahmen* geplant sind (Tumorboard-Empfehlung
  bzw. Behandlungsplan mit den geplanten Anforderungen).

Das Ziel geht dem Plan voraus; der Plan **verfolgt** das Ziel (`verfolgtesZiel`)
und ist seiner **Episode zugeordnet** (`episode`). Zwischen Ziel und Episode gibt
es **keine direkte Referenz** — die Zuordnung ergibt sich implizit über den Plan
(siehe schematische Darstellung).
"""
* insert Translation(^title, en, Therapy-goal triangle – logical model)
* insert Translation(^description, en, Logical model of the three core concepts and their relations: care episode – who treats; therapy goal – what is to be achieved; care plan – which measures are planned. The goal precedes the plan; the plan tracks the goal and is assigned to its episode. Goal and episode are linked only implicitly via the plan.)

* patient 1..1 Reference "Patientin/Patient" "Person, auf die sich Episoden, Ziele und Pläne beziehen (subject aller Ressourcen)."

* behandlungsepisode 0..* BackboneElement "Behandlungsepisode — wer behandelt" "Abgegrenzter Versorgungsabschnitt mit eigener Intention: Therapielinie, Diagnostiklinie, Active Surveillance, Watchful Waiting u. a."
* behandlungsepisode.art 1..1 CodeableConcept "Art der Episode" "Therapielinie (systemisch), lokoregionale Behandlungslinie, Diagnostiklinie, Active Surveillance, Watchful Waiting … (offen/extensible)."
* behandlungsepisode.intention 1..1 CodeableConcept "Intention" "Zweck der Episode: kurativ, neoadjuvant, adjuvant, palliativ, supportiv; bei Diagnostik der Informationsgewinn."
* behandlungsepisode.zeitraum 0..1 Period "Zeitraum" "Beginn und Ende des Versorgungsabschnitts."
* behandlungsepisode.verantwortlich 0..1 Reference "Verantwortliche Organisation" "Organisation bzw. Team, das die Episode führt (z. B. Tumorzentrum, betreuende Praxis)."
* behandlungsepisode.status 1..1 code "Status" "Lebenszyklus der Episode: geplant, aktiv, beendet."

* therapieziel 1..* BackboneElement "Therapieziel — was soll erreicht werden" "Eigenständiges, dem Plan vorausgehendes Behandlungsziel; übergeordnet (strategische Intention) oder als Episodenziel."
* therapieziel.ebene 1..1 code "Zielebene" "uebergeordnet (genau ein aktives Ziel der Intentions-Ära) oder episodenziel (optional, einem Behandlungsabschnitt zugeordnet)."
* therapieziel.zielart 1..1 CodeableConcept "Zielart" "Heilung, Lebensverlängerung, Symptomkontrolle, Lebensqualität, Funktionserhalt."
* therapieziel.beschreibung 1..1 string "Zielbeschreibung" "Klartext-Beschreibung des angestrebten Ziels."
* therapieziel.adressierteErkrankung 0..* Reference "Adressierte Erkrankung" "Erkrankung, auf die sich das Ziel bezieht (Tumorerkrankung bzw. chronische Grunderkrankung)."
* therapieziel.zielwert 0..* BackboneElement "Zielwert" "Messbarer angestrebter Zielzustand: woran gemessen wird, welcher Wert als erreicht gilt, bis wann."
* therapieziel.zielwert.zielgroesse 1..1 CodeableConcept "Zielgröße" "Woran die Zielerreichung gemessen wird — codiert (z. B. LOINC) oder als Text (Scores, PROMs)."
* therapieziel.zielwert.wert[x] 0..1 Quantity or Range or CodeableConcept or string "Zielwert-Ausprägung" "Welcher Wert bzw. Wertebereich als erreicht gilt."
* therapieziel.zielwert.frist[x] 0..1 date or Duration "Frist" "Zeitpunkt bzw. Frist, bis zu der das Ziel erreicht sein soll."
* therapieziel.ergebnis 0..* Reference "Ergebnis" "Verlaufs-Beobachtungen, die die Zielerreichung evidenzieren; pro Ziel eigen, leer bis zur ersten Beobachtung."
* therapieziel.lebenszyklusStatus 1..1 code "Lebenszyklus-Status" "Warum bzw. ob die Zielverfolgung läuft oder endet: proposed, active, completed (nur bei Erfolg), cancelled …"
* therapieziel.erreichungsgrad 0..1 CodeableConcept "Erreichungsgrad" "in-progress, achieved, not-achieved, not-attainable (keine Trajektorie-Codes)."
* therapieziel.beziehung 0..* BackboneElement "Zielbeziehung" "Beziehung zu anderen Zielen der Behandlungs-Journey."
* therapieziel.beziehung.art 1..1 code "Beziehungsart" "predecessor/successor (zeitliche Journey nach erfolgreichem Abschluss) oder replacement (Intentions-Pivot)."
* therapieziel.beziehung.ziel 1..1 Reference "Bezogenes Ziel" "Das in Beziehung stehende Therapieziel."

* versorgungsplan 0..* BackboneElement "Versorgungsplan — was ist geplant" "Empfehlungsliste des Tumorboards oder episodenspezifischer Plan tatsächlich erbrachter Versorgung."
* versorgungsplan.planart 1..1 code "Planart" "empfehlung (Tumorboard-Empfehlungsliste) oder behandlung (episodenspezifischer Behandlungsplan)."
* versorgungsplan.verfolgtesZiel 0..* Reference "Verfolgtes Ziel" "Therapieziel(e), die der Plan verfolgt — Verfolgungs-Referenz, kein Besitz; dasselbe Ziel kann von mehreren Plänen verfolgt werden."
* versorgungsplan.episode 0..1 Reference "Behandlungsepisode" "Episode, in deren Rahmen der Plan umgesetzt wird."
* versorgungsplan.basiertAuf 0..1 Reference "Basiert auf" "Ein Behandlungsplan erfüllt eine Empfehlung (Referenz auf den Empfehlungsplan)."
* versorgungsplan.massnahme 0..* BackboneElement "Geplante Maßnahme" "Einzelne geplante bzw. empfohlene Maßnahme des Plans."
* versorgungsplan.massnahme.typ 1..1 code "Maßnahmentyp" "prozedur (Operation, Bestrahlung, Diagnostik) oder medikation (Systemtherapie)."
* versorgungsplan.massnahme.anforderung 1..1 Reference "Anforderung" "Die zugehörige Anforderung (Prozedur- bzw. Medikations-Request)."

Mapping: TherapiezielDreieckZuFHIR
Source: TherapiezielDreieck
Target: "http://hl7.org/fhir"
Id: fhir-r4
Title: "FHIR R4 / Profile dieses Leitfadens"
* patient -> "Patient (subject der jeweiligen Ressourcen)"
* behandlungsepisode -> "EpisodeOfCare"
* behandlungsepisode.art -> "EpisodeOfCare.type"
* behandlungsepisode.intention -> "EpisodeOfCare.extension[OnkoTherapyIntentExt]"
* behandlungsepisode.zeitraum -> "EpisodeOfCare.period"
* behandlungsepisode.verantwortlich -> "EpisodeOfCare.managingOrganization, EpisodeOfCare.team"
* behandlungsepisode.status -> "EpisodeOfCare.status"
* therapieziel -> "Goal (OnkoTherapyGoal)"
* therapieziel.ebene -> "implizit über den Plan-Graphen (welcher Plan das Ziel verfolgt)"
* therapieziel.zielart -> "Goal.category (OnkoTherapyGoalTypeVS)"
* therapieziel.beschreibung -> "Goal.description"
* therapieziel.adressierteErkrankung -> "Goal.addresses (OnkoCondition)"
* therapieziel.zielwert -> "Goal.target"
* therapieziel.zielwert.zielgroesse -> "Goal.target.measure"
* therapieziel.zielwert.wert[x] -> "Goal.target.detail[x]"
* therapieziel.zielwert.frist[x] -> "Goal.target.due[x]"
* therapieziel.ergebnis -> "Goal.outcomeReference (Observation)"
* therapieziel.lebenszyklusStatus -> "Goal.lifecycleStatus"
* therapieziel.erreichungsgrad -> "Goal.achievementStatus"
* therapieziel.beziehung -> "Goal.extension[goal-relationship]"
* versorgungsplan -> "CarePlan (OnkoCarePlan)"
* versorgungsplan.planart -> "CarePlan.intent (proposal/plan = Empfehlung, plan/order = Behandlung)"
* versorgungsplan.verfolgtesZiel -> "CarePlan.goal"
* versorgungsplan.episode -> "CarePlan.extension[workflow-episodeOfCare]"
* versorgungsplan.basiertAuf -> "CarePlan.basedOn"
* versorgungsplan.massnahme -> "CarePlan.activity.reference"
* versorgungsplan.massnahme.anforderung -> "ServiceRequest (TumorboardServiceRequest), MedicationRequest (TumorboardMedicationRequest)"
