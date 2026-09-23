Profile: OnkoCarePlan
Parent: CarePlan
Id: onko-care-plan
Title: "Onkologischer CarePlan"
Description: """
Onkologischer Versorgungsplan auf Basis von `CarePlan`.

Das Profil ist architektonisch an den **HL7 FHIR US Multiple Chronic Conditions (MCC) eCare Plan**
([MCCCarePlan](https://build.fhir.org/ig/HL7/fhir-us-mcc/StructureDefinition-mccCarePlan.html))
angelehnt: Der CarePlan ist das zentrale, konsensbasierte Steuerobjekt, das adressierte
Erkrankungen (`addresses`), übergeordnete Ziele (`goal`) sowie geplante und durchgeführte
Maßnahmen (`activity`) verschiedener Versorgungsteams zusammenführt.

Onkologiespezifische Ergänzungen gegenüber MCC:
- Therapieintention über die Extension `onko-therapy-intent` (kurativ, neoadjuvant, adjuvant,
  Erhaltung, palliativ, supportiv).
- `goal` referenziert das Profil `OnkoTherapyGoal`.
- Therapielinien (`OnkoTherapyLine`, Basis `EpisodeOfCare`) werden über die
  Standard-Extension `workflow-episodeOfCare` verknüpft.
- `category` ist zweifach gesliced: Die Slice `erkrankungsart` trägt den ICD-10-GM-Code der
  adressierten Tumorerkrankung. Über die Slice `therapieabschnitt` lässt sich angeben, welcher Abschnitt der Versorgung betrachtet wird,
  beispielsweise der diagnostische (`Diagnostic intent`) oder der therapeutische (`Therapeutic intent`).

Im Fallback-Pfad (keine computable Leitlinie) ist der CarePlan die führende Repräsentation des
realen Versorgungsverlaufs; im Primärpfad referenziert er via `instantiatesCanonical` eine
`PlanDefinition` aus dem CPG-on-FHIR-Stack.
"""
* insert Translation(^title, en, Oncological care plan)
* insert Translation(^description, en, Oncological care plan based on CarePlan\, architecturally aligned with the HL7 FHIR US MCC eCare Plan. The care plan is the central\, consensus-driven steering object bringing together addressed conditions\, overarching goals and planned versus performed activities of the care teams. category is sliced into erkrankungsart – ICD-10-GM code of the addressed tumor disease – and therapieabschnitt – SNOMED CT Diagnostic intent 261004008 or Therapeutic intent 262202000\, so a single profile covers both the diagnostic pathway and the therapy pathway.)

// Therapieintention (onkologiespezifisch) und Custodian (übernommen aus MCC)
* extension contains
    OnkoTherapyIntentExt named therapyIntent 0..1 and
    OnkoCarePlanCustodianExt named custodian 0..* MS and
    http://hl7.org/fhir/StructureDefinition/workflow-episodeOfCare named episodeOfCare 0..1 MS
* insert Label(extension[therapyIntent], Therapieintention, Strukturierte Therapieintention des Versorgungsplans – Hauptintention und optionale Behandlungsphase.)
* insert Translation(extension[therapyIntent] ^short, en, Therapy intent)
* insert Translation(extension[therapyIntent] ^definition, en, Structured therapy intent of the care plan – main intent and optional treatment phase.)
* insert Label(extension[custodian], Custodian, Für Pflege und Aktualisierung des Plans verantwortliche Stelle – R5-Backport aus MCC.)
* insert Translation(extension[custodian] ^short, en, Custodian)
* insert Translation(extension[custodian] ^definition, en, Party responsible for maintaining the care plan – R5 backport adopted from MCC.)
* insert Label(extension[episodeOfCare], Behandlungsepisode, Behandlungsepisode bzw. Therapielinie\, in deren Rahmen der Plan umgesetzt wird.)
* insert Translation(extension[episodeOfCare] ^short, en, Episode of care)
* insert Translation(extension[episodeOfCare] ^definition, en, Episode of care or line of therapy in which this plan is carried out.)

// MCCCarePlan Kernattribute
* status 1..1 MS
* insert Label(status, Status, Status des Versorgungsplans – z. B. draft\, active\, completed\, revoked.)
* insert Translation(status ^short, en, Status)
* insert Translation(status ^definition, en, Status of the care plan – e.g. draft\, active\, completed\, revoked.)
* intent MS
* insert Label(intent, Planart, Art des Plans – proposal/plan = Empfehlungsplan des Tumorboards\, plan/order = Behandlungs- bzw. Diagnostikplan.)
* insert Translation(intent ^short, en, Intent)
* insert Translation(intent ^definition, en, Kind of plan – proposal/plan = tumor board recommendation plan\, plan/order = treatment or diagnostic plan.)

// Kategorisierung des Plans: Erkrankungsart (codierte Tumordiagnose) und Therapieabschnitt
// (diagnostisch/therapeutisch). Unterscheidet – statt zweier separater Profile – anhand der
// Slice therapieabschnitt, ob der Plan den Diagnostikpfad (vormals DiagnosticCarePlan\,
// Therapieabschnitt = Diagnostic intent SNOMED 261004008) oder den Therapiepfad (vormals
// OnkoCarePlan\, Therapieabschnitt = Therapeutic intent SNOMED 262202000) abbildet.
// Erkrankungsart trägt denselben ICD-10-GM-Code wie die referenzierte Condition (addresses).
* category 1..* MS
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "coding.system"
* category ^slicing.rules = #open
* category contains
    erkrankungsart 1..1 MS and
    therapieabschnitt 1..1 MS
* insert Label(category, Plan-Kategorie, Kategorisierung des Versorgungsplans – Erkrankungsart mit Diagnosecode und Therapieabschnitt mit diagnostisch oder therapeutisch.)
* insert Translation(category ^short, en, Plan category)
* insert Translation(category ^definition, en, Categorization of the care plan – disease type as diagnosis code and care phase as diagnostic or therapeutic.)
* category[erkrankungsart].coding.system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* insert Label(category[erkrankungsart], Erkrankungsart, Kodierte Tumorerkrankung nach ICD-10-GM\, die dieser Versorgungsplan adressiert – identisch zum Diagnosecode der referenzierten Condition.)
* insert Translation(category[erkrankungsart] ^short, en, Disease type)
* insert Translation(category[erkrankungsart] ^definition, en, Coded tumor disease per ICD-10-GM addressed by this care plan – identical to the diagnosis code of the referenced condition.)
* category[therapieabschnitt] from OnkoCarePlanPhaseVS (example)
* insert Label(category[therapieabschnitt], Therapieabschnitt, Diagnostischer oder therapeutischer Abschnitt der Versorgung – SNOMED CT Diagnostic intent 261004008 bzw. Therapeutic intent 262202000.)
* insert Translation(category[therapieabschnitt] ^short, en, Care plan phase)
* insert Translation(category[therapieabschnitt] ^definition, en, Diagnostic or therapeutic phase of care – SNOMED CT Diagnostic intent 261004008 or Therapeutic intent 262202000.)

// Patientenbezug
* subject 1..1 MS
* subject only Reference(Patient)
* insert Label(subject, Patientin/Patient, Person\, für die der Versorgungsplan erstellt wird.)
* insert Translation(subject ^short, en, Patient)
* insert Translation(subject ^definition, en, The person the care plan is created for.)

// Geltungszeitraum des Plans (bei diagnostischer Nutzung: Diagnostikzeitraum von Beginn bis
// Diagnosesicherung)
* period MS
* insert Label(period, Geltungszeitraum, Zeitraum\, in dem der Versorgungsplan gültig ist – bei diagnostischer Nutzung der Diagnostikzeitraum von Beginn bis Diagnosesicherung.)
* insert Translation(period ^short, en, Period)
* insert Translation(period ^definition, en, Period during which the care plan is valid – for diagnostic use\, the diagnostic period from start to confirmation of diagnosis.)

// Adressierte Gesundheitsprobleme (Verbindung Erkrankung – CarePlan)
* addresses 1..* MS
// Bindung an das MII-Onkologie-Diagnoseprofil via targetProfile (SUSHI kann die externe
// Parent-Kette des MII-Profils im `only Reference()`-Check nicht auflösen; FHIR-Ausgabe identisch)
* addresses ^type.targetProfile = Canonical(https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-diagnose-primaertumor)
* insert Label(addresses, Adressierte Erkrankung, Referenz auf die vom Plan adressierte Tumorerkrankung nach MII-Onkologie-Diagnoseprofil – im Diagnostikabschnitt ggf. eine Verdachtsdiagnose mit verificationStatus 'provisional' oder 'unconfirmed'\, die nach Diagnosesicherung auf 'confirmed' aktualisiert wird\, sodass die Referenz stabil bleibt.)
* insert Translation(addresses ^short, en, Addressed condition)
* insert Translation(addresses ^definition, en, Reference to the tumor condition addressed by the plan\, per the MII oncology diagnosis profile – during the diagnostic phase possibly a suspected diagnosis with verificationStatus provisional or unconfirmed that is updated to confirmed once the diagnosis is established\, so the reference stays stable.)

// Übergeordnete Therapie- bzw. Diagnoseziele
* goal MS
* goal only Reference(OnkoTherapyGoal)
* insert Label(goal, Therapieziele, Referenz auf die übergeordneten onkologischen Therapie- bzw. Diagnoseziele OnkoTherapyGoal.)
* insert Translation(goal ^short, en, Goals)
* insert Translation(goal ^definition, en, Reference to the overarching oncological therapy or diagnostic goals OnkoTherapyGoal.)

// Maßnahmen: Unterscheidung geplant vs. durchgeführt (MCC-Kernkonzept)
* activity MS
* insert Label(activity, Maßnahmen, Geplante bzw. durchgeführte Maßnahmen des Versorgungsplans.)
* insert Translation(activity ^short, en, Activities)
* insert Translation(activity ^definition, en, Planned or performed activities of the care plan.)
// Geplante Aktivität (z. B. MedicationRequest, ServiceRequest)
* activity.reference MS
* activity.reference only Reference(Appointment or MedicationRequest or TumorboardMedicationRequest or NutritionOrder or Task or ServiceRequest or TumorboardServiceRequest or RequestGroup )
* insert Label(activity.reference, Geplante Maßnahme, Referenz auf eine geplante Maßnahme – z. B. MedicationRequest oder ServiceRequest\, auch als Tumorboard-Empfehlung.)
* insert Translation(activity.reference ^short, en, Planned activity)
* insert Translation(activity.reference ^definition, en, Reference to a planned activity – e.g. MedicationRequest or ServiceRequest\, also as a tumor board recommendation.)
// Durchgeführte Aktivität / dokumentiertes Ergebnis (z. B. Procedure, Observation)
* activity.outcomeReference MS
* activity.outcomeReference only Reference(Procedure or Observation or MedicationAdministration or DiagnosticReport)
* insert Label(activity.outcomeReference, Durchgeführte Maßnahme, Referenz auf eine durchgeführte Maßnahme bzw. ein dokumentiertes Ergebnis – z. B. Procedure oder Observation.)
* insert Translation(activity.outcomeReference ^short, en, Performed activity)
* insert Translation(activity.outcomeReference ^definition, en, Reference to a performed activity or documented outcome – e.g. Procedure or Observation.)

// Verantwortliche Teams und ergänzende Information
* careTeam MS
* insert Label(careTeam, Behandlungsteam, An der Versorgung beteiligte Teams – z. B. Tumorboard.)
* insert Translation(careTeam ^short, en, Care team)
* insert Translation(careTeam ^definition, en, Care teams involved in the care – e.g. tumor board.)
* supportingInfo MS
* insert Label(supportingInfo, Ergänzende Information, Ergänzende Informationen zum Plan – z. B. Verweis auf den Diagnostik-CarePlan.)
* insert Translation(supportingInfo ^short, en, Supporting information)
* insert Translation(supportingInfo ^definition, en, Supporting information for the plan – e.g. reference to the diagnostic care plan.)
* contributor MS
* insert Label(contributor, Beteiligte, Personen oder Organisationen\, die zum Plan beigetragen haben.)
* insert Translation(contributor ^short, en, Contributor)
* insert Translation(contributor ^definition, en, People or organizations that contributed to the plan.)
* author
* insert Label(author, Autor/in, Für den Plan verantwortliche autorisierende Person oder Stelle.)
* insert Translation(author ^short, en, Author)
* insert Translation(author ^definition, en, Person or party responsible for authoring the plan.)

// Verknüpfung zum CPG-on-FHIR-Stack (Primärpfad)
* instantiatesCanonical MS
* insert Label(instantiatesCanonical, Zugrunde liegende PlanDefinition, Referenz auf eine PlanDefinition aus dem CPG-on-FHIR-Stack\, die der Plan umsetzt.)
* insert Translation(instantiatesCanonical ^short, en, Instantiates canonical)
* insert Translation(instantiatesCanonical ^definition, en, Reference to a PlanDefinition from the CPG-on-FHIR stack that the plan instantiates.)
