Profile: OnkoTherapyLine
Parent: EpisodeOfCare
Id: onko-therapy-line
Title: "Onkologische Therapielinie"
Description: "Eine onkologische Therapielinie (Line of Therapy, LoT) auf Basis von `EpisodeOfCare`, EnLiST-konform. Eine Therapielinie ist ein Behandlungsabschnitt mit einer bestimmten Intention und einer definierten Tumorerkrankung, der durch ein klinisches Ereignis (Progress, Toxizität, Patientenwunsch, Studienende, geplanter Wechsel) beendet wird. Die Verbindung zu einem `OnkoCarePlan` erfolgt über `CarePlan.encounter` → `Encounter.episodeOfCare` oder die Standard-Extension `workflow-episodeOfCare`."
* insert Translation(^title, en, Oncological line of therapy)
* insert Translation(^description, en, An oncological line of therapy based on EpisodeOfCare\, EnLiST-conformant. A line of therapy is a treatment segment with a defined intent and a defined tumor condition\, ended by a clinical event such as progression\, toxicity\, patient wish\, end of study or planned switch.)

* extension contains OnkoTherapyIntentExt named therapyIntent 1..1 MS
* insert Label(extension[therapyIntent], Therapieintention, Strukturierte Therapieintention der Behandlungslinie – Hauptintention und optionale Behandlungsphase.)
* insert Translation(extension[therapyIntent] ^short, en, Therapy intent)
* insert Translation(extension[therapyIntent] ^definition, en, Structured therapy intent of the line of therapy – main intent and optional treatment phase.)

* status 1..1 MS
* insert Label(status, Status, Status der Therapielinie – z. B. active\, onhold\, finished\, cancelled.)
* insert Translation(status ^short, en, Status)
* insert Translation(status ^definition, en, Status of the line of therapy – e.g. active\, onhold\, finished\, cancelled.)

* statusHistory MS
* insert Label(statusHistory, Statusverlauf, Historie der Statuswechsel der Therapielinie mit jeweiligem Zeitraum.)
* insert Translation(statusHistory ^short, en, Status history)
* insert Translation(statusHistory ^definition, en, History of status changes of the line of therapy\, each with its period.)

* type MS
* type from OnkoTherapyLineTypeVS (extensible)
* insert Label(type, Art der Therapielinie, Behandlungsmodalität der Therapielinie – z. B. ambulante Chemotherapie\, Bestrahlung\, Immun- oder Hormontherapie.)
* insert Translation(type ^short, en, Type of line of therapy)
* insert Translation(type ^definition, en, Treatment modality of the line of therapy – e.g. ambulatory chemotherapy\, radiation therapy\, immunotherapy or hormone therapy.)

* patient 1..1 MS
* patient only Reference(Patient)
* insert Label(patient, Patientin/Patient, Person\, die in dieser Therapielinie behandelt wird.)
* insert Translation(patient ^short, en, Patient)
* insert Translation(patient ^definition, en, The person treated within this line of therapy.)

* period 1..1 MS
* insert Label(period, Behandlungszeitraum, Zeitraum der Therapielinie von Beginn bis Ende des Behandlungsabschnitts.)
* insert Translation(period ^short, en, Treatment period)
* insert Translation(period ^definition, en, Period of the line of therapy from start to end of the treatment segment.)

* diagnosis 1..* MS
* insert Label(diagnosis, Diagnosebezug, Der Therapielinie zugrunde liegende Tumordiagnose bzw. Tumordiagnosen.)
* insert Translation(diagnosis ^short, en, Diagnosis)
* insert Translation(diagnosis ^definition, en, Tumor diagnosis or diagnoses underlying the line of therapy.)
* diagnosis.condition 1..1 MS
* diagnosis.condition only Reference(Condition)
// Bindung an OnkoCondition via targetProfile (s. Hinweis in OnkoCarePlan)
* diagnosis.condition ^type.targetProfile = Canonical(OnkoCondition)
* insert Label(diagnosis.condition, Diagnose, Referenz auf die adressierte Tumorerkrankung OnkoCondition.)
* insert Translation(diagnosis.condition ^short, en, Condition)
* insert Translation(diagnosis.condition ^definition, en, Reference to the addressed tumor condition OnkoCondition.)
// Rolle der Diagnose in dieser Episode: fest auf "chief complaint" (Hauptbehandlungsgrund)
* diagnosis.role 1..1 MS
* diagnosis.role = http://terminology.hl7.org/CodeSystem/diagnosis-role#CC "Chief complaint"
* insert Label(diagnosis.role, Diagnoserolle, Rolle der Diagnose in dieser Episode – fest auf chief complaint als Hauptbehandlungsgrund.)
* insert Translation(diagnosis.role ^short, en, Diagnosis role)
* insert Translation(diagnosis.role ^definition, en, Role of the diagnosis in this episode – fixed to chief complaint.)
* diagnosis.rank MS
* insert Label(diagnosis.rank, Rangfolge, Rangfolge der Diagnose bei mehreren Diagnosen.)
* insert Translation(diagnosis.rank ^short, en, Rank)
* insert Translation(diagnosis.rank ^definition, en, Rank of the diagnosis when several diagnoses are present.)

// Behandelnde/steuernde Organisation dieser Therapielinie
* managingOrganization MS
* insert Label(managingOrganization, Behandelnde Organisation, Organisation\, die diese Episode of Care – die Therapielinie – verantwortlich behandelt bzw. steuert.)
* insert Translation(managingOrganization ^short, en, Managing organization)
* insert Translation(managingOrganization ^definition, en, Organization responsible for treating or managing this episode of care.)
* careManager MS
* insert Label(careManager, Fallverantwortliche/r, Für die Therapielinie fallverantwortliche behandelnde Person.)
* insert Translation(careManager ^short, en, Care manager)
* insert Translation(careManager ^definition, en, Practitioner responsible for managing the line of therapy.)
* team MS
* insert Label(team, Behandlungsteam, An der Therapielinie beteiligtes Versorgungsteam\, z. B. Tumorboard.)
* insert Translation(team ^short, en, Care team)
* insert Translation(team ^definition, en, Care team involved in the line of therapy\, e.g. tumor board.)
