// =====================================================================
// Beispiel-Szenario: Metastasiertes kolorektales Karzinom (mCRC),
// palliative Therapieintention.
//
// Anlehnung an die szenariobasierte Darstellung des
// MII IG Modul Onkologie (Anwendungsfälle / Informationsmodell).
//
// Erzählung: Eine 67-jährige Patientin mit synchron metastasiertem
// Kolonkarzinom (Lebermetastasen). Der Diagnostikpfad (Koloskopie mit
// Biopsie → Histologie) wird über einen `DiagnosticCarePlan` abgebildet.
// Nach interdisziplinärer Tumorkonferenz (`CareTeam`) empfiehlt das
// Tumorboard eine palliative Systemtherapie (FOLFOX + Bevacizumab,
// `TumorboardMedicationRequest`) sowie die Anlage eines Portkatheters
// (`TumorboardServiceRequest`). Übergeordnete Therapieziele sind
// Lebensverlängerung und Symptomkontrolle. Das Tumoransprechen wird über
// eine Verlaufs-Observation (Disease Status) auf das Ziel bezogen
// ausgewertet.
//
// Genutzte Profile: OnkoCondition, DiagnosticCarePlan, OnkoCarePlan,
// OnkoTherapyLine, OnkoTherapyGoal (x2), TumorboardMedicationRequest,
// TumorboardServiceRequest.
// =====================================================================

// ---------------------------------------------------------------------
// Basis: Patientin und Akteure
// ---------------------------------------------------------------------

Instance: PatientinCRC
InstanceOf: Patient
Usage: #example
Title: "Patientin – mCRC (Beispiel)"
Description: "Beispielpatientin mit metastasiertem kolorektalem Karzinom."
* name.family = "Musterfrau"
* name.given = "Erika"
* gender = #female
* birthDate = "1961-09-12"

Instance: OnkologinCRC
InstanceOf: Practitioner
Usage: #example
Title: "Behandelnde Onkologin (Beispiel)"
* name.family = "Musterarzt"
* name.given = "Petra"

Instance: TumorzentrumCRC
InstanceOf: Organization
Usage: #example
Title: "Tumorzentrum (Custodian, Beispiel)"
Description: "Verantwortliche Stelle für Pflege und Aktualisierung der Versorgungspläne."
* name = "Onkologisches Zentrum Musterklinik"

Instance: TumorboardCRC
InstanceOf: CareTeam
Usage: #example
Title: "Interdisziplinäres Tumorboard (Beispiel)"
Description: "Tumorkonferenz, die die Therapieempfehlungen ausspricht (Requester der Tumorboard-Requests)."
* status = #active
* name = "Interdisziplinäres Tumorboard Kolorektales Karzinom"
* subject = Reference(PatientinCRC)
* participant.member = Reference(OnkologinCRC)
* managingOrganization = Reference(TumorzentrumCRC)

// ---------------------------------------------------------------------
// Diagnose
// ---------------------------------------------------------------------

Instance: ConditionCRC
InstanceOf: OnkoCondition
Usage: #example
Title: "Kolorektales Karzinom, metastasiert (Beispiel)"
Description: "Adressierte Tumorerkrankung: metastasiertes Kolonkarzinom (ICD-10-GM C18.9). Konform zum MII-Onkologie-Diagnoseprofil (Primärtumor)."
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* category.coding.system = "http://terminology.hl7.org/CodeSystem/condition-category"
* category.coding.code = #encounter-diagnosis
* code.coding[icd10-gm] = http://fhir.de/CodeSystem/bfarm/icd-10-gm#C18.9 "Bösartige Neubildung: Kolon, nicht näher bezeichnet"
* code.coding[icd10-gm].version = "2026"
* code.text = "Metastasiertes Kolonkarzinom (mCRC) mit Lebermetastasen"
* extension[Feststellungsdatum].valueDateTime = "2026-01-20"
* subject = Reference(PatientinCRC)
* onsetDateTime = "2026-01-20"
* recordedDate = "2026-01-20"

// ---------------------------------------------------------------------
// Diagnostikpfad: DiagnosticCarePlan mit ServiceRequest → DiagnosticReport
// ---------------------------------------------------------------------

Instance: DiagnostikCarePlanCRC
InstanceOf: DiagnosticCarePlan
Usage: #example
Title: "Diagnostischer CarePlan – Tumordiagnostik (Beispiel)"
Description: "Bildet den Weg zur Diagnosestellung ab: Koloskopie mit Biopsie und histopathologische Sicherung. Adressiert dieselbe Diagnose wie der Therapie-CarePlan."
* extension[custodian].valueReference = Reference(TumorzentrumCRC)
* status = #completed
* intent = #plan
* category.text = "Tumordiagnostik"
* subject = Reference(PatientinCRC)
* period.start = "2026-01-05"
* period.end = "2026-01-20"
* addresses = Reference(ConditionCRC)
* careTeam = Reference(TumorboardCRC)
// Geplante diagnostische Maßnahme
* activity[0].reference = Reference(ServiceRequestKoloskopieCRC)
// Dokumentiertes Ergebnis der Diagnostik
* activity[0].outcomeReference = Reference(DiagnosticReportHistologieCRC)

Instance: ServiceRequestKoloskopieCRC
InstanceOf: ServiceRequest
Usage: #example
Title: "Anforderung Koloskopie mit Biopsie (Beispiel)"
Description: "Diagnostische Maßnahme des DiagnosticCarePlan."
* status = #completed
* intent = #order
* code = http://snomed.info/sct#73761001 "Colonoscopy"
* code.text = "Koloskopie mit Biopsieentnahme"
* subject = Reference(PatientinCRC)

Instance: DiagnosticReportHistologieCRC
InstanceOf: DiagnosticReport
Usage: #example
Title: "Histopathologischer Befund (Beispiel)"
Description: "Ergebnis der Diagnostik: histologische Sicherung eines Adenokarzinoms des Kolons."
* status = #final
* code = http://loinc.org#60568-3 "Pathology Synoptic report"
* code.text = "Histopathologie Kolonbiopsie"
* subject = Reference(PatientinCRC)
* effectiveDateTime = "2026-01-18"
* conclusion = "Adenokarzinom des Kolons (C18.9), ICD-O-3 M8140/3."

// ---------------------------------------------------------------------
// Therapielinie (Line of Therapy, EnLiST)
// ---------------------------------------------------------------------

Instance: TherapielinieCRCErstlinie
InstanceOf: OnkoTherapyLine
Usage: #example
Title: "Therapielinie 1 – FOLFOX + Bevacizumab (Beispiel)"
Description: "Erstlinien-Behandlungsabschnitt mit palliativer Intention."
* extension[therapyIntent].valueCodeableConcept = OnkoTherapyIntent#palliativ "Palliativ"
* status = #active
* patient = Reference(PatientinCRC)
* period.start = "2026-02-10"
* diagnosis.condition = Reference(ConditionCRC)
* diagnosis.rank = 1
* managingOrganization = Reference(TumorzentrumCRC)
* careManager = Reference(OnkologinCRC)
* team = Reference(TumorboardCRC)

// ---------------------------------------------------------------------
// Therapieziele
// ---------------------------------------------------------------------

Instance: TherapiezielCRCLebensverlaengerung
InstanceOf: OnkoTherapyGoal
Usage: #example
Title: "Therapieziel – Lebensverlängerung & Symptomkontrolle (Beispiel)"
Description: "Übergeordnetes palliatives Therapieziel: Lebensverlängerung bei gleichzeitiger Symptomkontrolle."
* extension[therapyIntent].valueCodeableConcept = OnkoTherapyIntent#palliativ "Palliativ"
// goal-acceptance: Die Patientin stimmt dem Ziel mit hoher Priorität zu (MCCGoal)
* extension[acceptance].extension[individual].valueReference = Reference(PatientinCRC)
* extension[acceptance].extension[status].valueCode = #agree
* extension[acceptance].extension[priority].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/goal-priority#high-priority "High Priority"
// goal-relationship: Dieses Ziel ersetzt das abgelehnte kurative Ziel (MCCGoal)
* extension[relatedGoal].extension[type].valueCodeableConcept = http://hl7.org/fhir/goal-relationship-type#replacement "Replacement"
* extension[relatedGoal].extension[target].valueReference = Reference(TherapiezielCRCKurativAbgelehnt)
* lifecycleStatus = #active
* achievementStatus = http://terminology.hl7.org/CodeSystem/goal-achievement#in-progress "In Progress"
* category[0] = OnkoTherapyGoalType#lebensverlaengerung "Lebensverlängerung"
* category[1] = OnkoTherapyGoalType#symptomkontrolle "Symptomkontrolle / Palliation"
* priority = http://terminology.hl7.org/CodeSystem/goal-priority#high-priority "High Priority"
* description.text = "Verlängerung des Gesamtüberlebens und Kontrolle tumorbedingter Symptome unter palliativer Systemtherapie."
* subject = Reference(PatientinCRC)
* startDate = "2026-02-10"
* target.measure = http://loinc.org#21908-9 "Stage group.clinical Cancer"
* target.dueDate = "2026-08-10"
* addresses = Reference(ConditionCRC)
* expressedBy = Reference(OnkologinCRC)
* outcomeReference = Reference(ObservationDiseaseStatusCRC)

Instance: TherapiezielCRCKurativAbgelehnt
InstanceOf: OnkoTherapyGoal
Usage: #example
Title: "Therapieziel – kurative Resektion (abgelehnt, Beispiel)"
Description: "In der Tumorkonferenz erwogenes kuratives Ziel, das aufgrund der Metastasierung verworfen wurde. Demonstriert die Extension goal-reasonRejected."
* extension[therapyIntent].valueCodeableConcept = OnkoTherapyIntent#kurativ "Kurativ"
// goal-reasonRejected: Begründung für die Ablehnung des Ziels (MCCGoal)
* extension[reasonRejected].valueCodeableConcept.text = "Nicht resektable Fernmetastasierung — kuratives Ziel nicht erreichbar."
* lifecycleStatus = #rejected
* category[0] = OnkoTherapyGoalType#heilung "Heilung"
* description.text = "Kurative Resektion des Primärtumors mit kurativer Absicht."
* subject = Reference(PatientinCRC)
* addresses = Reference(ConditionCRC)
* expressedBy = Reference(OnkologinCRC)

// ---------------------------------------------------------------------
// Tumorboard-Empfehlungen (Requests)
// ---------------------------------------------------------------------

Instance: MedicationRequestFOLFOX
InstanceOf: TumorboardMedicationRequest
Usage: #example
Title: "Tumorboard-Empfehlung – FOLFOX + Bevacizumab (Beispiel)"
Description: "Vom Tumorboard empfohlene palliative Erstlinien-Systemtherapie (geplante Aktivität des Therapie-CarePlan)."
* status = #active
* intent = #plan
* category[tumorboardConsult] = http://loinc.org#85232-7 "Tumor board Consult note"
* medicationCodeableConcept.text = "FOLFOX + Bevacizumab"
* subject = Reference(PatientinCRC)
* requester = Reference(OnkologinCRC)

Instance: ServiceRequestPortCRC
InstanceOf: TumorboardServiceRequest
Usage: #example
Title: "Tumorboard-Empfehlung – Portimplantation (Beispiel)"
Description: "Vom Tumorboard empfohlene Anlage eines Portkatheters für die systemische Therapie."
* status = #active
* intent = #plan
* category[tumorboardConsult] = http://loinc.org#85232-7 "Tumor board Consult note"
* code = http://snomed.info/sct#1255694000 "Implantable venous access port injection"
* code.text = "Implantation eines Portkatheters für die systemische Therapie"
* subject = Reference(PatientinCRC)
* requester = Reference(OnkologinCRC)

// ---------------------------------------------------------------------
// Verlauf: Tumoransprechen
// ---------------------------------------------------------------------

Instance: ObservationDiseaseStatusCRC
InstanceOf: Observation
Usage: #example
Title: "Tumoransprechen / Disease Status (Beispiel)"
Description: "Verlaufs-Observation zum Krankheitsstatus, die das Tumoransprechen auf das Therapieziel bezieht (vgl. mCODE Cancer Disease Status)."
* status = #final
* code = http://loinc.org#97509-4 "Cancer disease progression"
* valueCodeableConcept = http://snomed.info/sct#260415000 "Not detected"
* subject = Reference(PatientinCRC)
* effectiveDateTime = "2026-05-15"

// ---------------------------------------------------------------------
// Therapie-CarePlan (zentrales Steuerobjekt)
// ---------------------------------------------------------------------

Instance: CarePlanCRCPalliativ
InstanceOf: OnkoCarePlan
Usage: #example
Title: "Onkologischer CarePlan – mCRC palliativ (Beispiel)"
Description: "Zentraler Versorgungsplan, der adressierte Erkrankung, palliatives Therapieziel sowie geplante und durchgeführte Maßnahmen zusammenführt."
* extension[therapyIntent].valueCodeableConcept = OnkoTherapyIntent#palliativ "Palliativ"
// custodian: verantwortliche Stelle für Pflege/Aktualisierung des Plans (MCC R5-Backport)
* extension[custodian].valueReference = Reference(TumorzentrumCRC)
* status = #active
* intent = #plan
* category = http://snomed.info/sct#736252007 "Cancer care plan"
* subject = Reference(PatientinCRC)
* period.start = "2026-02-10"
* addresses = Reference(ConditionCRC)
* goal = Reference(TherapiezielCRCLebensverlaengerung)
* author = Reference(OnkologinCRC)
* careTeam = Reference(TumorboardCRC)
// Verknüpfung zum vorgelagerten Diagnostik-CarePlan
* supportingInfo = Reference(DiagnostikCarePlanCRC)
// Geplante Maßnahmen: Tumorboard-Empfehlungen
* activity[0].reference = Reference(MedicationRequestFOLFOX)
* activity[1].reference = Reference(ServiceRequestPortCRC)
// Durchgeführte Maßnahme / dokumentiertes Ergebnis: Verlaufsbeurteilung
* activity[0].outcomeReference = Reference(ObservationDiseaseStatusCRC)
