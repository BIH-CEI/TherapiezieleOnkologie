Profile: DiagnosticCarePlan
Parent: CarePlan
Id: onko-diagnostic-care-plan
Title: "Diagnostischer CarePlan"
Description: """
CarePlan für die Tumordiagnostik auf Basis von `CarePlan`.

Ergänzend zum onkologischen Therapie-CarePlan (`OnkoCarePlan`) bildet dieses Profil den Weg
zur Diagnosestellung als strukturierten Prozess ab. Die Schritte des Diagnosepfads werden als
Aktivitäten abgebildet, deren Ergebnisse können
über `activity.outcomeReference` angebunden werden.

Der diagnostische CarePlan verweist über `addresses` auf die Tumordiagnose (`OnkoCondition`)
und ist darüber mit dem Therapie-CarePlan verknüpft, der dieselbe Diagnose adressiert.

Diagnostikspezifische Ergänzungen:
- Der Plan-Typ ist über `category` verpflichtend gekennzeichnet: `category.text`
  muss den Wert "Tumordiagnostik" tragen. Weitere Categories können ergänzt
  werden. Damit sind diagnostischer und Therapie-CarePlan unterscheidbar.

**Abgrenzung:** Dieses Profil beschreibt den *Prozess* der Diagnosefindung.
"""
* insert Translation(^title, en, Diagnostic care plan)
* insert Translation(^description, en, Care plan for tumor diagnostics based on CarePlan. Complementing the therapy care plan\, it models the path to diagnosis as a structured process; diagnostic steps are represented as activities whose results are linked via activity.outcomeReference. It addresses the same tumor condition as the therapy care plan.)

// Custodian
* extension contains OnkoCarePlanCustodianExt named custodian 0..* MS
* insert Label(extension[custodian], Custodian, Für Pflege und Aktualisierung des Diagnostik-Plans verantwortliche Stelle – R5-Backport aus MCC.)
* insert Translation(extension[custodian] ^short, en, Custodian)
* insert Translation(extension[custodian] ^definition, en, Party responsible for maintaining the diagnostic care plan – R5 backport adopted from MCC.)

// Kernattribute
* status 1..1 MS
* insert Label(status, Status, Status des Diagnostik-Plans – z. B. active\, completed.)
* insert Translation(status ^short, en, Status)
* insert Translation(status ^definition, en, Status of the diagnostic care plan – e.g. active\, completed.)

// Kategorisierung: Tumordiagnostik (Pflicht)
* category 1..* MS
* category.text 1..1
* category.text = "Tumordiagnostik"
* insert Label(category, Plan-Kategorie, Kennzeichnung des Plan-Typs; category.text trägt verpflichtend den Wert Tumordiagnostik.)
* insert Translation(category ^short, en, Plan category)
* insert Translation(category ^definition, en, Identification of the plan type; category.text is mandatorily set to Tumordiagnostik.)

// Patientenbezug
* subject 1..1 MS
* subject only Reference(Patient)
* insert Label(subject, Patientin/Patient, Person\, für die die Diagnostik durchgeführt wird.)
* insert Translation(subject ^short, en, Patient)
* insert Translation(subject ^definition, en, The person the diagnostics are performed for.)

// Geltungszeitraum der Diagnostikphase
* period MS
* insert Label(period, Diagnostikzeitraum, Zeitraum der Diagnostikphase von Beginn bis Diagnosesicherung.)
* insert Translation(period ^short, en, Diagnostic period)
* insert Translation(period ^definition, en, Period of the diagnostic phase from start to confirmation of diagnosis.)

// Adressierte Tumordiagnose (Verbindung Erkrankung – CarePlan)
* addresses 1..* MS
* addresses ^short = "Adressierte (Verdachts-)Tumordiagnose"
* addresses ^definition = "Referenz auf die Tumordiagnose, die der diagnostische CarePlan adressiert. Zu Beginn der Diagnostik ist dies eine Verdachtsdiagnose (Condition mit verificationStatus 'provisional' oder 'unconfirmed'); nach Diagnosesicherung wird dieselbe Condition auf 'confirmed' aktualisiert, sodass die Referenz über den gesamten Verlauf stabil bleibt."
// Bindung an OnkoCondition via targetProfile (SUSHI kann die externe Parent-Kette
// des MII-Profils im `only Reference()`-Check nicht auflösen; FHIR-Ausgabe identisch)
* addresses ^type.targetProfile = Canonical(OnkoCondition)
* insert Translation(addresses ^short, en, Addressed suspected tumor diagnosis)
* insert Translation(addresses ^definition, en, Reference to the tumor diagnosis addressed by the diagnostic care plan. Initially a suspected diagnosis with verificationStatus provisional or unconfirmed; after confirmation the same Condition is updated to confirmed\, so the reference stays stable throughout.)

// Diagnostische Maßnahmen: geplant vs. durchgeführt
* activity MS
* insert Label(activity, Diagnostische Maßnahmen, Geplante bzw. durchgeführte Schritte des Diagnosepfads.)
* insert Translation(activity ^short, en, Diagnostic activities)
* insert Translation(activity ^definition, en, Planned or performed steps of the diagnostic pathway.)
* activity.reference MS
* activity.reference only Reference(ServiceRequest or Appointment or Task)
* insert Label(activity.reference, Geplante Maßnahme, Referenz auf eine geplante diagnostische Maßnahme – z. B. ServiceRequest.)
* insert Translation(activity.reference ^short, en, Planned activity)
* insert Translation(activity.reference ^definition, en, Reference to a planned diagnostic activity – e.g. ServiceRequest.)
* activity.outcomeReference MS
* activity.outcomeReference only Reference(DiagnosticReport or Observation or Procedure)
* insert Label(activity.outcomeReference, Ergebnis, Referenz auf das Ergebnis der Diagnostik – z. B. DiagnosticReport oder Observation.)
* insert Translation(activity.outcomeReference ^short, en, Outcome)
* insert Translation(activity.outcomeReference ^definition, en, Reference to the diagnostic result – e.g. DiagnosticReport or Observation.)

// Verantwortliche Teams und ergänzende Information
* careTeam MS
* insert Label(careTeam, Behandlungsteam, An der Diagnostik beteiligtes Versorgungsteam.)
* insert Translation(careTeam ^short, en, Care team)
* insert Translation(careTeam ^definition, en, Care team involved in the diagnostics.)
* supportingInfo MS
* insert Label(supportingInfo, Ergänzende Information, Ergänzende Informationen zum Diagnostik-Plan.)
* insert Translation(supportingInfo ^short, en, Supporting information)
* insert Translation(supportingInfo ^definition, en, Supporting information for the diagnostic care plan.)
* contributor MS
* insert Label(contributor, Beteiligte, Personen oder Organisationen\, die zur Diagnostik beigetragen haben.)
* insert Translation(contributor ^short, en, Contributor)
* insert Translation(contributor ^definition, en, People or organizations that contributed to the diagnostics.)