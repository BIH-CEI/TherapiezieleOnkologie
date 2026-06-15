Profile: OnkoCarePlan
Parent: CarePlan
Id: onko-care-plan
Title: "Onkologischer CarePlan"
Description: "Onkologischer Versorgungsplan auf Basis von `CarePlan`. Trägt die Therapieintention (Extension `onko-therapy-intent`), referenziert die adressierte Krebserkrankung (`addresses`), die übergeordneten Therapieziele (`goal` → `OnkoTherapyGoal`) sowie die Therapielinien als untergeordnete Pläne (`CarePlan.partOf` von `OnkoTherapyLine`). Im Fallback-Pfad (keine computable Leitlinie) ist der CarePlan die führende Repräsentation des realen Versorgungsverlaufs; im Primärpfad referenziert er via `instantiatesCanonical` eine `PlanDefinition` aus dem CPG-on-FHIR-Stack."
* extension contains OnkoTherapyIntentExt named therapyIntent 0..1
* status 1..1 MS
* intent 1..1 MS
* intent = #plan (exactly)
* subject 1..1 MS
* subject only Reference(Patient)
* period MS
* addresses 1..* MS
* addresses only Reference(Condition)
* goal MS
* goal only Reference(OnkoTherapyGoal)
* activity MS
* careTeam MS
* instantiatesCanonical MS
