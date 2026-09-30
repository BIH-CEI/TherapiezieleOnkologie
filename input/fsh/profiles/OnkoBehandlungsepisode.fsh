// =====================================================================
// Generisches Episodenprofil (ADR-0016): EIN EpisodeOfCare-Profil für
// alle Episodenarten — systemische Therapielinie, lokoregionale
// Behandlungslinie, Diagnostiklinie, Active Surveillance, Watchful
// Waiting. Die Art steht in type (EpisodenartVS, extensible), die
// Behandlungsmodalität ist ein eigenes Merkmal (onko-modalitaet).
// EnLiST-Designation/Segment/Zählstatus (ADR-0025) nur an systemischen
// Therapielinien (onko-episode-2).
// =====================================================================

Profile: OnkoBehandlungsepisode
Parent: EpisodeOfCare
Id: onko-behandlungsepisode
Title: "Onkologische Behandlungsepisode"
Description: "Ein abgegrenzter onkologischer Versorgungsabschnitt mit eigener Intention auf Basis von `EpisodeOfCare` — die **Episodenart** (`type`) unterscheidet systemische Therapielinie, lokoregionale Behandlungslinie, Diagnostiklinie, Active Surveillance, Watchful Waiting u. a.; die Behandlungsmodalität ist ein eigenes Merkmal (Extension `onko-modalitaet`). Eine systemische **Therapielinie** (Line of Therapy, LoT) ist dabei ein **fachliches Kontinuum**, das organisatorisch in mehrere Episoden zerfallen kann, da `EpisodeOfCare` organisationsgebunden ist: Die EnLiST-Designation (`enlist-lot`) trägt je Linie **genau eine führende Episode** (main contributor); ausführende Einrichtungen dokumentieren eigene Episoden als Segmente (`enlist-line-segment`) mit gemeinsamer `lineId`. Bei gleichem Ort/Sektor fallen Führung und Ausführung in einer Episode zusammen. Die Verbindung zu einem `OnkoCarePlan` erfolgt über die Standard-Extension `workflow-episodeOfCare`."
* insert Translation(^title, en, Oncological care episode)
* insert Translation(^description, en, A delimited oncological care segment with its own intent based on EpisodeOfCare — the episode type distinguishes systemic line of therapy\, locoregional treatment line\, diagnostic line\, active surveillance and watchful waiting; the treatment modality is a characteristic of its own. A systemic line of therapy is a clinical continuum that may span multiple organisation-bound episodes; the EnLiST designation is carried by exactly one leading episode per line\, executing organisations document their episodes as segments with a shared lineId.)

* extension contains
    OnkoTherapyIntentExt named therapyIntent 1..1 MS and
    OnkoModalitaetExt named modalitaet 0..* MS and
    OnkoTherapyLineMedicationRequestExt named medicationRequest 0..* MS and
    EnlistLotExt named lot 0..1 MS and
    EnlistLineSegmentExt named lineSegment 0..1 MS and
    EnlistCountableExt named countable 0..1 MS
* insert Label(extension[therapyIntent], Intention, Strukturierte Intention der Behandlungsepisode – Hauptintention und optionale Behandlungsphase; für jede Episodenart bestimmbar.)
* insert Translation(extension[therapyIntent] ^short, en, Intent)
* insert Translation(extension[therapyIntent] ^definition, en, Structured intent of the care episode – main intent and optional treatment phase; determinable for every episode type.)
* insert Label(extension[modalitaet], Behandlungsmodalität, Modalität der Behandlung – z. B. Chemotherapie\, Immuntherapie\, Bestrahlung\, Operation; eigenes Merkmal neben der Episodenart.)
* insert Translation(extension[modalitaet] ^short, en, Treatment modality)
* insert Translation(extension[modalitaet] ^definition, en, Modality of treatment – e.g. chemotherapy\, immunotherapy\, radiotherapy\, surgery; a characteristic of its own next to the episode type.)
* insert Label(extension[medicationRequest], Medikationsverordnung, Referenz auf Medikationsverordnungen\, die den Anlass für diese Episode bilden – Ergänzung zu referralRequest\, das auf ServiceRequest beschränkt ist.)
* insert Translation(extension[medicationRequest] ^short, en, Medication request)
* insert Translation(extension[medicationRequest] ^definition, en, Reference to the medication requests giving rise to this episode – complements referralRequest\, which is restricted to ServiceRequest.)
* insert Label(extension[lot], EnLiST-LoT-Designation, X.Y-Designation je Setting-Achse — eLoT\, aLoT oder iLoT — nach EnLiST; nur an systemischen Therapielinien.)
* insert Translation(extension[lot] ^short, en, EnLiST LoT designation)
* insert Translation(extension[lot] ^definition, en, X.Y designation per setting axis — eLoT\, aLoT or iLoT — per EnLiST; only on systemic lines of therapy.)
* insert Label(extension[countable], EnLiST-Zählstatus, Zählstatus nach EnLiST — counted oder not-counted.)
* insert Translation(extension[countable] ^short, en, EnLiST countability)
* insert Translation(extension[countable] ^definition, en, EnLiST countability — counted or not-counted.)
* insert Label(extension[lineSegment], EnLiST-Linien-Segment, Segment-Marker einer ausführenden Einrichtung — gemeinsame lineId\, keine eigene Designation.)
* insert Translation(extension[lineSegment] ^short, en, EnLiST line segment)
* insert Translation(extension[lineSegment] ^definition, en, Segment marker of an executing organisation — shared lineId\, no designation of its own.)
* obeys onko-enlist-1 and onko-enlist-3 and onko-enlist-4 and onko-episode-1 and onko-episode-2

* status 1..1 MS
* insert Label(status, Status, Status der Behandlungsepisode – z. B. active\, onhold\, finished\, cancelled.)
* insert Translation(status ^short, en, Status)
* insert Translation(status ^definition, en, Status of the care episode – e.g. active\, onhold\, finished\, cancelled.)

* statusHistory MS
* insert Label(statusHistory, Statusverlauf, Historie der Statuswechsel der Behandlungsepisode mit jeweiligem Zeitraum.)
* insert Translation(statusHistory ^short, en, Status history)
* insert Translation(statusHistory ^definition, en, History of status changes of the care episode\, each with its period.)

// Episodenart: WAS für ein Versorgungsabschnitt vorliegt (nicht die Modalität)
* type 1..1 MS
* type from EpisodenartVS (extensible)
* insert Label(type, Episodenart, Art der Behandlungsepisode – systemische Therapielinie\, lokoregionale Behandlungslinie\, Diagnostiklinie\, Active Surveillance\, Watchful Waiting u. a.)
* insert Translation(type ^short, en, Episode type)
* insert Translation(type ^definition, en, Type of the care episode – systemic line of therapy\, locoregional treatment line\, diagnostic line\, active surveillance\, watchful waiting and others.)

* patient 1..1 MS
* patient only Reference(Patient)
* insert Label(patient, Patientin/Patient, Person\, die in dieser Behandlungsepisode versorgt wird.)
* insert Translation(patient ^short, en, Patient)
* insert Translation(patient ^definition, en, The person cared for within this episode.)

* period 1..1 MS
* insert Label(period, Zeitraum, Zeitraum der Behandlungsepisode von Beginn bis Ende des Versorgungsabschnitts.)
* insert Translation(period ^short, en, Period)
* insert Translation(period ^definition, en, Period of the care episode from start to end of the care segment.)

// Diagnosebezug: art-abhängig — therapeutische Arten erfordern eine Diagnose
// (onko-episode-1); die Erstdiagnose-Diagnostiklinie startet dagegen mit einer
// Verdachtsdiagnose ohne Staging — die gesicherte Diagnose ist ihr Ergebnis.
* diagnosis MS
* insert Label(diagnosis, Diagnosebezug, Der Episode zugrunde liegende Tumordiagnose bzw. Tumordiagnosen – für therapeutische Episodenarten verpflichtend\, für die Erstdiagnose-Diagnostiklinie optional.)
* insert Translation(diagnosis ^short, en, Diagnosis)
* insert Translation(diagnosis ^definition, en, Tumor diagnosis or diagnoses underlying the episode – mandatory for therapeutic episode types\, optional for the initial diagnostic line.)
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

// Behandelnde/steuernde Organisation dieser Behandlungsepisode
* managingOrganization MS
* insert Label(managingOrganization, Behandelnde Organisation, Organisation\, die diese Episode of Care verantwortlich behandelt bzw. steuert – bei der führenden Episode einer Linie die koordinierende Stelle.)
* insert Translation(managingOrganization ^short, en, Managing organization)
* insert Translation(managingOrganization ^definition, en, Organization responsible for treating or managing this episode of care – for the leading episode of a line the coordinating body.)
* careManager MS
* insert Label(careManager, Fallverantwortliche/r, Für die Behandlungsepisode fallverantwortliche behandelnde Person.)
* insert Translation(careManager ^short, en, Care manager)
* insert Translation(careManager ^definition, en, Practitioner responsible for managing the care episode.)
* team MS
* insert Label(team, Behandlungsteam, An der Behandlungsepisode beteiligtes Versorgungsteam\, z. B. Tumorboard.)
* insert Translation(team ^short, en, Care team)
* insert Translation(team ^definition, en, Care team involved in the episode\, e.g. tumor board.)

// Auslösende Anforderung(en) dieser Episode – auf ServiceRequest beschränkt (FHIR-Core);
// für MedicationRequest s. extension[medicationRequest]
* referralRequest MS
* insert Label(referralRequest, Anforderung, Der Episode zugrunde liegende Anforderung oder Anforderungen\, z. B. Überweisung oder Prozedur-Anforderung.)
* insert Translation(referralRequest ^short, en, Referral request)
* insert Translation(referralRequest ^definition, en, Requests giving rise to this episode\, e.g. a referral or procedure request.)

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

// Therapeutische Episodenarten (Behandlungslinien) erfordern einen Diagnosebezug;
// die Erstdiagnose-Diagnostiklinie startet mit Verdachtsdiagnose ohne Staging.
Invariant: onko-episode-1
Description: "Therapeutische Episodenarten (systemische Therapielinie, lokoregionale Behandlungslinie) erfordern mindestens einen Diagnosebezug."
Severity: #error
Expression: "type.coding.where(system = 'https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/episodenart' and (code = 'systemische-therapielinie' or code = 'lokoregionale-behandlungslinie')).exists() implies diagnosis.exists()"

// EnLiST liegt nur auf der systemischen Achse: Designation, Segment-Marker und
// Zählstatus 'counted' sind der systemischen Therapielinie vorbehalten.
Invariant: onko-episode-2
Description: "EnLiST-Designation (enlist-lot), Segment-Marker (enlist-line-segment) und Zählstatus 'counted' sind nur bei Episodenart 'systemische Therapielinie' zulässig."
Severity: #error
Expression: "(extension.where(url = 'https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-lot').exists() or extension.where(url = 'https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-line-segment').exists() or extension.where(url = 'https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-countable').value.ofType(CodeableConcept).coding.where(code = 'counted').exists()) implies type.coding.where(system = 'https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/episodenart' and code = 'systemische-therapielinie').exists()"
