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

Im Fallback-Pfad (keine computable Leitlinie) ist der CarePlan die führende Repräsentation des
realen Versorgungsverlaufs; im Primärpfad referenziert er via `instantiatesCanonical` eine
`PlanDefinition` aus dem CPG-on-FHIR-Stack.
"""
* insert Translation(^title, en, Oncological care plan)
* insert Translation(^description, en, Oncological care plan based on CarePlan\, architecturally aligned with the HL7 FHIR US MCC eCare Plan. The care plan is the central\, consensus-driven steering object bringing together addressed conditions\, overarching goals and planned versus performed activities of the care teams.)

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
* insert Label(intent, Planart, Art des Plans – proposal/plan = Empfehlungsplan des Tumorboards\, plan/order = Behandlungsplan.)
* insert Translation(intent ^short, en, Intent)
* insert Translation(intent ^definition, en, Kind of plan – proposal/plan = tumor board recommendation plan\, plan/order = treatment plan.)

// Kategorisierung des Plans
* category MS
* insert Label(category, Plan-Kategorie, Art bzw. Kategorie des Versorgungsplans.)
* insert Translation(category ^short, en, Plan category)
* insert Translation(category ^definition, en, Type or category of the care plan.)

// Patientenbezug
* subject 1..1 MS
* subject only Reference(Patient)
* insert Label(subject, Patientin/Patient, Person\, für die der Versorgungsplan erstellt wird.)
* insert Translation(subject ^short, en, Patient)
* insert Translation(subject ^definition, en, The person the care plan is created for.)

// Geltungszeitraum des Plans
* period
* insert Label(period, Geltungszeitraum, Zeitraum\, in dem der Versorgungsplan gültig ist.)
* insert Translation(period ^short, en, Period)
* insert Translation(period ^definition, en, Period during which the care plan is valid.)

// Adressierte Gesundheitsprobleme (Verbindung Erkrankung – CarePlan)
* addresses 1..* MS
// Bindung an OnkoCondition via targetProfile (SUSHI kann die externe Parent-Kette
// des MII-Profils im `only Reference()`-Check nicht auflösen; FHIR-Ausgabe identisch)
* addresses ^type.targetProfile = Canonical(OnkoCondition)
* insert Label(addresses, Adressierte Erkrankung, Referenz auf die vom Plan adressierte Tumorerkrankung OnkoCondition.)
* insert Translation(addresses ^short, en, Addressed condition)
* insert Translation(addresses ^definition, en, Reference to the tumor condition addressed by the plan OnkoCondition.)

// Übergeordnete Therapieziele
* goal MS
* goal only Reference(OnkoTherapyGoal)
* insert Label(goal, Therapieziele, Referenz auf die übergeordneten onkologischen Therapieziele OnkoTherapyGoal.)
* insert Translation(goal ^short, en, Goals)
* insert Translation(goal ^definition, en, Reference to the overarching oncological therapy goals OnkoTherapyGoal.)

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
