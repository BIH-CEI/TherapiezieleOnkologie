Profile: OnkoTherapyLine
Parent: EpisodeOfCare
Id: onko-therapy-line
Title: "Onkologische Therapielinie"
Description: "Eine onkologische Therapielinie (Line of Therapy, LoT) auf Basis von `EpisodeOfCare`, EnLiST-konform. Eine Therapielinie ist ein **fachliches Kontinuum** mit definierter Intention und Tumorerkrankung, das durch ein klinisches Ereignis (Progress, Toxizität, Patientenwunsch, Studienende, geplanter Wechsel) beendet wird — und das organisatorisch in mehrere Episoden zerfallen kann, da `EpisodeOfCare` organisationsgebunden ist. Die EnLiST-Designation (`enlist-lot`) trägt je Linie **genau eine führende Episode** (main contributor); ausführende Einrichtungen dokumentieren eigene Episoden als Segmente (`enlist-line-segment`) mit gemeinsamer `lineId`. Bei gleichem Ort/Sektor fallen Führung und Ausführung in einer einzigen Episode zusammen. Die Verbindung zu einem `OnkoCarePlan` erfolgt über die Standard-Extension `workflow-episodeOfCare`."
* insert Translation(^title, en, Oncological line of therapy)
* insert Translation(^description, en, An oncological line of therapy based on EpisodeOfCare\, EnLiST-conformant. A line of therapy is a treatment segment with a defined intent and a defined tumor condition\, ended by a clinical event such as progression\, toxicity\, patient wish\, end of study or planned switch.)

* extension contains
    OnkoTherapyIntentExt named therapyIntent 1..1 MS and
    OnkoTherapyLineMedicationRequestExt named medicationRequest 0..* MS and
    EnlistLotExt named lot 0..1 MS and
    EnlistLineSegmentExt named lineSegment 0..1 MS and
    EnlistCountableExt named countable 0..1 MS
* insert Label(extension[therapyIntent], Therapieintention, Strukturierte Therapieintention der Behandlungslinie – Hauptintention und optionale Behandlungsphase.)
* insert Translation(extension[therapyIntent] ^short, en, Therapy intent)
* insert Translation(extension[therapyIntent] ^definition, en, Structured therapy intent of the line of therapy – main intent and optional treatment phase.)
* insert Label(extension[medicationRequest], Medikationsverordnung, Referenz auf Medikationsverordnungen\, die den Anlass für diese Therapielinie bilden – Ergänzung zu referralRequest\, das auf ServiceRequest beschränkt ist.)
* insert Translation(extension[medicationRequest] ^short, en, Medication request)
* insert Translation(extension[medicationRequest] ^definition, en, Reference to the medication requests giving rise to this line of therapy – complements referralRequest\, which is restricted to ServiceRequest.)
* insert Label(extension[lot], EnLiST-LoT-Designation, X.Y-Designation je Setting-Achse — eLoT\, aLoT oder iLoT — nach EnLiST.)
* insert Translation(extension[lot] ^short, en, EnLiST LoT designation)
* insert Translation(extension[lot] ^definition, en, X.Y designation per setting axis — eLoT\, aLoT or iLoT — per EnLiST.)
* insert Label(extension[countable], EnLiST-Zählstatus, Zählstatus nach EnLiST — counted oder not-counted.)
* insert Translation(extension[countable] ^short, en, EnLiST countability)
* insert Translation(extension[countable] ^definition, en, EnLiST countability — counted or not-counted.)
* insert Label(extension[lineSegment], EnLiST-Linien-Segment, Segment-Marker einer ausführenden Einrichtung — gemeinsame lineId\, keine eigene Designation.)
* insert Translation(extension[lineSegment] ^short, en, EnLiST line segment)
* insert Translation(extension[lineSegment] ^definition, en, Segment marker of an executing organisation — shared lineId\, no designation of its own.)
* obeys onko-enlist-1 and onko-enlist-3 and onko-enlist-4

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

// Auslösende Anforderung(en) dieser Therapielinie – auf ServiceRequest beschränkt (FHIR-Core);
// für MedicationRequest s. extension[medicationRequest]
* referralRequest MS
* insert Label(referralRequest, Anforderung, Der Therapielinie zugrunde liegende Anforderung oder Anforderungen\, z. B. Überweisung oder Prozedur-Anforderung.)
* insert Translation(referralRequest ^short, en, Referral request)
* insert Translation(referralRequest ^definition, en, Requests giving rise to this line of therapy\, e.g. a referral or procedure request.)

// EnLiST-Invariante: Eine LoT-Designation setzt voraus, dass die Linie zählt.
Invariant: onko-enlist-1
Description: "Eine EnLiST-LoT-Designation (enlist-lot) darf nur vorliegen, wenn der Zählstatus (enlist-countable) 'counted' ist."
Severity: #error
Expression: "extension.where(url = 'https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-lot').exists() implies extension.where(url = 'https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-countable').value.ofType(CodeableConcept).coding.where(code = 'counted').exists()"

// Rückrichtung: Wer zählt, trägt Designation oder Segment-Marker.
Invariant: onko-enlist-3
Description: "Zählstatus 'counted' erfordert eine EnLiST-Designation (enlist-lot, führende Episode) oder einen Segment-Marker (enlist-line-segment, ausführende Episode)."
Severity: #error
Expression: "extension.where(url = 'https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-countable').value.ofType(CodeableConcept).coding.where(code = 'counted').exists() implies (extension.where(url = 'https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-lot').exists() or extension.where(url = 'https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-line-segment').exists())"

// Führung und Segment schließen sich an derselben Episode aus.
Invariant: onko-enlist-4
Description: "enlist-lot (führende Episode) und enlist-line-segment (ausführendes Segment) dürfen nicht an derselben Episode vorliegen."
Severity: #error
Expression: "(extension.where(url = 'https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-lot').exists() and extension.where(url = 'https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-line-segment').exists()).not()"
