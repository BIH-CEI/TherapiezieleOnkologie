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
- Therapielinien (`OnkoTherapyLine`, Basis `EpisodeOfCare`) werden über `CarePlan.encounter`
  bzw. die Standard-Extension `workflow-episodeOfCare` verknüpft.

Im Fallback-Pfad (keine computable Leitlinie) ist der CarePlan die führende Repräsentation des
realen Versorgungsverlaufs; im Primärpfad referenziert er via `instantiatesCanonical` eine
`PlanDefinition` aus dem CPG-on-FHIR-Stack.
"""

// Therapieintention (onkologiespezifisch)
* extension contains OnkoTherapyIntentExt named therapyIntent 0..1 MS

// MCCCarePlan Kernattribute
* status 1..1 MS
//* intent 1..1 MS
//* intent = #plan (exactly)

// Kategorisierung des Plans
* category MS

// Patientenbezug
* subject 1..1 MS
* subject only Reference(Patient)

// Geltungszeitraum des Plans
* period MS

// Adressierte Gesundheitsprobleme (Verbindung Erkrankung – CarePlan)
* addresses 1..* MS
* addresses only Reference(Condition)

// Übergeordnete Therapieziele
* goal MS
* goal only Reference(OnkoTherapyGoal)

// Maßnahmen: Unterscheidung geplant vs. durchgeführt (MCC-Kernkonzept)
* activity MS
// Geplante Aktivität (z. B. MedicationRequest, ServiceRequest)
* activity.reference MS
* activity.reference only Reference(Appointment or MedicationRequest or NutritionOrder or Task or ServiceRequest or RequestGroup)
// Durchgeführte Aktivität / dokumentiertes Ergebnis (z. B. Procedure, Observation)
* activity.outcomeReference MS
* activity.outcomeReference only Reference(Procedure or Observation or MedicationAdministration or DiagnosticReport)

// Verantwortliche Teams und ergänzende Information
* careTeam MS
* supportingInfo MS
* contributor MS
* author MS

// Verknüpfung zum CPG-on-FHIR-Stack (Primärpfad)
* instantiatesCanonical MS
