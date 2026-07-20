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

// Custodian
* extension contains OnkoCarePlanCustodianExt named custodian 0..* MS

// Kernattribute
* status 1..1 MS

// Kategorisierung: Tumordiagnostik (Pflicht)
* category 1..* MS
* category.text 1..1
* category.text = "Tumordiagnostik"

// Patientenbezug
* subject 1..1 MS
* subject only Reference(Patient)

// Geltungszeitraum der Diagnostikphase
* period MS

// Adressierte Tumordiagnose (Verbindung Erkrankung – CarePlan)
* addresses 1..* MS
* addresses ^short = "Adressierte (Verdachts-)Tumordiagnose"
* addresses ^definition = "Referenz auf die Tumordiagnose, die der diagnostische CarePlan adressiert. Zu Beginn der Diagnostik ist dies eine Verdachtsdiagnose (Condition mit verificationStatus 'provisional' oder 'unconfirmed'); nach Diagnosesicherung wird dieselbe Condition auf 'confirmed' aktualisiert, sodass die Referenz über den gesamten Verlauf stabil bleibt."
// Bindung an OnkoCondition via targetProfile (SUSHI kann die externe Parent-Kette
// des MII-Profils im `only Reference()`-Check nicht auflösen; FHIR-Ausgabe identisch)
* addresses ^type.targetProfile = Canonical(OnkoCondition)

// Diagnostische Maßnahmen: geplant vs. durchgeführt
* activity MS
* activity.reference MS
* activity.reference only Reference(ServiceRequest or Appointment or Task)
* activity.outcomeReference MS
* activity.outcomeReference only Reference(DiagnosticReport or Observation or Procedure)

// Verantwortliche Teams und ergänzende Information
* careTeam MS
* supportingInfo MS
* contributor MS