Profile: OnkoTherapyGoal
Parent: Goal
Id: onko-therapy-goal
Title: "Onkologisches Therapieziel"
Description: """
Strukturiertes onkologisches Therapieziel auf Basis von `Goal`.

Das Profil ist an den **HL7 FHIR US Multiple Chronic Conditions (MCC) eCare Plan**
([MCCGoal](https://build.fhir.org/ig/HL7/fhir-us-mcc/StructureDefinition-MCCGoal.html))
angelehnt: Das Therapieziel ist eine eigenständige, referenzbasierte Ressource, die über
`addresses` mit den adressierten Erkrankungen und über `outcomeReference` mit beobachteten
Ergebnissen (Verlaufs-Observations) verknüpft wird.

Onkologiespezifische Ergänzungen gegenüber MCC:
- Die Zielart wird über `category` aus `OnkoTherapyGoalTypeVS` codiert (Heilung,
  Lebensverlängerung, Symptomkontrolle, Lebensqualität, Funktionserhalt, Studienteilnahme).
- Über die Extension `onko-therapy-intent` kann zusätzlich die Therapieintention der
  zugehörigen Behandlungslinie hinterlegt werden.
- `outcomeReference` bindet das Ziel an Verlaufs-Observations (z. B. mCODE
  CancerDiseaseStatus / Response Assessment), wodurch das Tumoransprechen auf das Ziel
  bezogen ausgewertet werden kann.

`achievementStatus` bildet — analog MCC — den Erreichungsgrad bzw. die Zielakzeptanz ab
(z. B. erreicht, in Bearbeitung, nicht erreicht).
"""

// Therapieintention (onkologiespezifisch) sowie die von MCCGoal als Must-Support
// gesetzten Standard-FHIR-Extensions (goal-acceptance, goal-reasonRejected, goal-relationship)
* extension contains
    OnkoTherapyIntentExt named therapyIntent 0..1 and
    http://hl7.org/fhir/StructureDefinition/goal-acceptance named acceptance 0..* MS and
    http://hl7.org/fhir/StructureDefinition/goal-reasonRejected named reasonRejected 0..1 MS and
    http://hl7.org/fhir/StructureDefinition/goal-relationship named relatedGoal 0..* MS

// Lebenszyklus und Erreichungsgrad
* lifecycleStatus 1..1 MS
* achievementStatus MS

// Zielart (onkologiespezifische ValueSet-Bindung)
* category 1..*
* category from OnkoTherapyGoalTypeVS (extensible)

// Priorisierung konkurrierender Ziele
* priority MS

// Klartext-Beschreibung des Ziels
* description 1..1 MS

// Patientenbezug
* subject 1..1 MS
* subject only Reference(Patient)

// Zeitbezug: Beginn und messbare Zielwerte
* start[x] MS
* target MS
* target.measure MS
* target.detail[x] MS
* target.due[x] MS

// Adressierte Tumorerkrankung
* addresses MS
* addresses only Reference(Condition)
// Bindung an OnkoCondition via targetProfile (s. Hinweis in OnkoCarePlan)
* addresses ^type.targetProfile = Canonical(OnkoCondition)

// Verfasser des Ziels (Behandler bzw. Patient)
* expressedBy MS

// Ergebnisse / Tumoransprechen
* outcomeCode
* outcomeReference MS
* outcomeReference only Reference(Observation)

// Begleitende Hinweise
* note
