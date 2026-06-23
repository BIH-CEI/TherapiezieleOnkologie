Profile: OnkoTherapyLine
Parent: EpisodeOfCare
Id: onko-therapy-line
Title: "Onkologische Therapielinie"
Description: "Eine onkologische Therapielinie (Line of Therapy, LoT) auf Basis von `EpisodeOfCare`, EnLiST-konform. Eine Therapielinie ist ein Behandlungsabschnitt mit einer bestimmten Intention und einer definierten Tumorerkrankung, der durch ein klinisches Ereignis (Progress, Toxizität, Patientenwunsch, Studienende, geplanter Wechsel) beendet wird. Die Verbindung zu einem `OnkoCarePlan` erfolgt über `CarePlan.encounter` → `Encounter.episodeOfCare` oder die Standard-Extension `workflow-episodeOfCare`."
* extension contains OnkoTherapyIntentExt named therapyIntent 1..1 MS
* status 1..1 MS
* patient 1..1 MS
* patient only Reference(Patient)
* period 1..1 MS
* diagnosis 1..* MS
* diagnosis.condition 1..1 MS
* diagnosis.condition only Reference(Condition)
// Bindung an OnkoCondition via targetProfile (s. Hinweis in OnkoCarePlan)
* diagnosis.condition ^type.targetProfile = Canonical(OnkoCondition)
* diagnosis.role MS
* diagnosis.rank MS
* managingOrganization MS
* careManager MS
* team MS
