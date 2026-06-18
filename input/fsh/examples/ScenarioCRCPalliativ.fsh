// =====================================================================
// Beispiel-Szenario: Metastasiertes kolorektales Karzinom (mCRC),
// palliative Therapieintention.
//
// Anlehnung an die szenariobasierte Darstellung des
// MII IG Modul Onkologie (Anwendungsfälle / Informationsmodell).
//
// Erzählung: Eine 67-jährige Patientin mit synchron metastasiertem
// Kolonkarzinom (Lebermetastasen). Nach interdisziplinärer
// Tumorkonferenz wird eine palliative Systemtherapie (FOLFOX +
// Bevacizumab) als Erstlinientherapie festgelegt. Übergeordnete
// Therapieziele sind Lebensverlängerung und Symptomkontrolle. Das
// Tumoransprechen wird über eine Verlaufs-Observation (Disease Status)
// auf das Ziel bezogen ausgewertet.
// =====================================================================

Instance: PatientinCRC
InstanceOf: Patient
Usage: #example
Title: "Patientin – mCRC (Beispiel)"
Description: "Beispielpatientin mit metastasiertem kolorektalem Karzinom."
* name.family = "Musterfrau"
* name.given = "Erika"
* gender = #female
* birthDate = "1961-09-12"

Instance: ConditionCRC
InstanceOf: Condition
Usage: #example
Title: "Kolorektales Karzinom, metastasiert (Beispiel)"
Description: "Adressierte Tumorerkrankung: metastasiertes Kolonkarzinom (ICD-10-GM C18.9, mit Lebermetastasen C78.7)."
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* code.coding[0] = http://fhir.de/CodeSystem/bfarm/icd-10-gm#C18.9 "Bösartige Neubildung: Kolon, nicht näher bezeichnet"
* code.text = "Metastasiertes Kolonkarzinom (mCRC) mit Lebermetastasen"
* subject = Reference(PatientinCRC)
* onsetDateTime = "2026-01-20"

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

Instance: TherapiezielCRCLebensverlaengerung
InstanceOf: OnkoTherapyGoal
Usage: #example
Title: "Therapieziel – Lebensverlängerung & Symptomkontrolle (Beispiel)"
Description: "Übergeordnetes palliatives Therapieziel: Lebensverlängerung bei gleichzeitiger Symptomkontrolle."
* extension[therapyIntent].valueCodeableConcept = OnkoTherapyIntent#palliativ "Palliativ"
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

Instance: OnkologinCRC
InstanceOf: Practitioner
Usage: #example
Title: "Behandelnde Onkologin (Beispiel)"
* name.family = "Musterarzt"
* name.given = "Petra"

Instance: CarePlanCRCPalliativ
InstanceOf: OnkoCarePlan
Usage: #example
Title: "Onkologischer CarePlan – mCRC palliativ (Beispiel)"
Description: "Zentraler Versorgungsplan, der adressierte Erkrankung, palliatives Therapieziel sowie geplante und durchgeführte Maßnahmen zusammenführt."
* extension[therapyIntent].valueCodeableConcept = OnkoTherapyIntent#palliativ "Palliativ"
* status = #active
* intent = #plan
* category = http://snomed.info/sct#736252007 "Cancer care plan"
* subject = Reference(PatientinCRC)
* period.start = "2026-02-10"
* addresses = Reference(ConditionCRC)
* goal = Reference(TherapiezielCRCLebensverlaengerung)
* author = Reference(OnkologinCRC)
// Geplante Maßnahme: systemische Erstlinientherapie
* activity[0].reference = Reference(MedicationRequestFOLFOX)
// Durchgeführte Maßnahme / dokumentiertes Ergebnis: Verlaufsbeurteilung
* activity[0].outcomeReference = Reference(ObservationDiseaseStatusCRC)

Instance: MedicationRequestFOLFOX
InstanceOf: MedicationRequest
Usage: #example
Title: "Geplante Systemtherapie – FOLFOX + Bevacizumab (Beispiel)"
Description: "Geplante Aktivität des CarePlan: palliative Erstlinien-Chemotherapie."
* status = #active
* intent = #plan
* medicationCodeableConcept.text = "FOLFOX + Bevacizumab"
* subject = Reference(PatientinCRC)
