Profile: OnkoTherapyLine
Parent: CarePlan
Id: onko-therapy-line
Title: "Onkologische Therapielinie"
Description: "Eine onkologische Therapielinie (Line of Therapy, LoT) auf Basis von `CarePlan`, EnLiST-konform. Eine Therapielinie ist ein Behandlungsabschnitt mit einer bestimmten Intention, die durch ein definiertes Ereignis (Progress, Toxizität, Patientenwunsch, Studienende, geplanter Wechsel) beendet wird. Trägt die Therapieintention der Linie (`onko-therapy-intent`) und gehört über `partOf` zu einem übergeordneten `OnkoCarePlan`."
* extension contains OnkoTherapyIntentExt named therapyIntent 1..1 MS
* status 1..1 MS
* intent 1..1 MS
* subject 1..1 MS
* subject only Reference(Patient)
* period 1..1 MS
* addresses 1..* MS
* addresses only Reference(Condition)
* partOf MS
* partOf only Reference(OnkoCarePlan)
* goal MS
* goal only Reference(OnkoTherapyGoal)
* activity MS
