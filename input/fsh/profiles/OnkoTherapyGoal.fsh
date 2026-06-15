Profile: OnkoTherapyGoal
Parent: Goal
Id: onko-therapy-goal
Title: "Onkologisches Therapieziel"
Description: "Strukturiertes onkologisches Therapieziel auf Basis von `Goal`. Die Zielart wird über `category` codiert (Heilung, Lebensverlängerung, Symptomkontrolle, Lebensqualität, Funktionserhalt, Studienteilnahme). Über die Extension `onko-therapy-intent` kann zusätzlich die Therapieintention der zugehörigen Behandlungslinie hinterlegt werden. Das Ziel referenziert über `addresses` die adressierte Tumorerkrankung und kann über `Goal.outcomeReference` an Verlaufs-Observations (z. B. mCODE CancerDiseaseStatus) gebunden werden."
* extension contains OnkoTherapyIntentExt named therapyIntent 0..1
* lifecycleStatus 1..1 MS
* category 1..* MS
* category from OnkoTherapyGoalTypeVS (extensible)
* description 1..1 MS
* subject 1..1 MS
* subject only Reference(Patient)
* start[x] MS
* target MS
* addresses MS
* addresses only Reference(Condition)
* outcomeCode MS
* outcomeReference MS
* outcomeReference only Reference(Observation)
