// =====================================================================
// Beispiel-Szenario: Primäres Mammakarzinom (frühes, nicht metastasiertes
// Stadium), triple-negativ (TNBC), kurative Therapieintention mit
// neoadjuvanter Systemtherapie und anschließender Operation.
//
// Anlehnung an die szenariobasierte Darstellung des MII IG Modul
// Onkologie und an das MII KDS-Modul Onkologie (Mamma-Zusatzmodul,
// v2026.0.3: Rezeptor-/HER2-Status).
//
// Klinische Erzählung (leitlinienorientiert, S3-Leitlinie Mammakarzinom /
// AGO-Empfehlungen, KEYNOTE-522):
// Eine 48-jährige Patientin mit einem invasiven Mammakarzinom links
// (NST, G3), klinisch cT2 cN1 cM0 (UICC IIB). Die Immunhistochemie der
// Stanzbiopsie zeigt ein triple-negatives Profil (ER negativ, PR negativ,
// HER2 negativ) bei hoher Proliferation (Ki-67 70 %); die Keimbahn-
// Testung (gBRCA1/2) ist unauffällig. In der interdisziplinären
// Tumorkonferenz wird — leitlinienkonform für ein frühes TNBC im Stadium
// II — eine kurative Behandlungsstrategie mit NEOADJUVANTER Systemtherapie
// (Pembrolizumab + Carboplatin/Paclitaxel, gefolgt von Pembrolizumab +
// EC nach dem KEYNOTE-522-Schema) und ANSCHLIESSENDER Operation festgelegt.
// Übergeordnetes Therapieziel ist die Heilung bei gleichzeitigem Wunsch
// nach Brusterhalt (Funktionserhalt). Nach Abschluss der neoadjuvanten
// Therapie erfolgt eine brusterhaltende Operation mit Sentinel-Lymphknoten-
// Biopsie; die pathologische Aufarbeitung zeigt eine pathologische
// Komplettremission (pCR, ypT0 ypN0). Das Ansprechen wird über eine
// Verlaufs-Observation (Disease Status) auf das Therapieziel bezogen.
// =====================================================================

Instance: PatientinMamma
InstanceOf: Patient
Usage: #example
Title: "Patientin – Mammakarzinom (Beispiel)"
Description: "Beispielpatientin mit primärem, triple-negativem Mammakarzinom (frühes Stadium)."
* name.family = "Baumann"
* name.given = "Sabine"
* gender = #female
* birthDate = "1977-06-24"

Instance: OnkologinMamma
InstanceOf: Practitioner
Usage: #example
Title: "Behandelnde Onkologin (Mamma, Beispiel)"
* name.family = "Musterarzt"
* name.given = "Katrin"

Instance: TumorzentrumMamma
InstanceOf: Organization
Usage: #example
Title: "Brustzentrum (Custodian, Beispiel)"
Description: "Verantwortliche Stelle für Pflege und Aktualisierung des Versorgungsplans."
* name = "Zertifiziertes Brustzentrum Musterklinik"


// ---------------------------------------------------------------------
// Diagnostische Anforderungen (Aktivitäten des diagnostischen CarePlans)
// ---------------------------------------------------------------------

Instance: ServiceRequestBiopsieMamma
InstanceOf: ServiceRequest
Usage: #example
Title: "Anforderung Stanzbiopsie Mamma (Beispiel)"
Description: "Anforderung einer sonografisch gesteuerten Stanzbiopsie der Mamma links zur histologischen Sicherung des Tumorverdachts."
* status = #completed
* intent = #order
* code = http://snomed.info/sct#44578009 "Core needle biopsy of breast (procedure)"
* subject = Reference(PatientinMamma)
* authoredOn = "2025-09-12"
* requester = Reference(OnkologinMamma)

Instance: ServiceRequestPathologieMamma
InstanceOf: ServiceRequest
Usage: #example
Title: "Anforderung histopathologische Untersuchung (Beispiel)"
Description: "Pathologieauftrag zum Stanzbiopsat: Histologie, Grading, Hormonrezeptor- und HER2-Status sowie Ki-67."
* status = #completed
* intent = #order
* code = http://snomed.info/sct#788124003 "Histopathology service (qualifier value)"
* code.text = "Histopathologische Untersuchung inkl. Rezeptor-/HER2-Status und Ki-67"
* specimen = Reference(SpecimenBiopsieMamma)
* subject = Reference(PatientinMamma)
* authoredOn = "2025-09-15"
* requester = Reference(OnkologinMamma)

Instance: ServiceRequestStagingMamma
InstanceOf: ServiceRequest
Usage: #example
Title: "Anforderung klinisches Staging (Beispiel)"
Description: "Anforderung der klinischen Ausbreitungsdiagnostik (TNM-Klassifikation) vor Therapiebeginn."
* status = #completed
* intent = #order
* code.text = "Klinische Ausbreitungsdiagnostik / TNM-Staging"
* subject = Reference(PatientinMamma)
* authoredOn = "2025-09-15"
* requester = Reference(OnkologinMamma)

Instance: ServiceRequestGBRCAMamma
InstanceOf: ServiceRequest
Usage: #example
Title: "Anforderung Keimbahn-Testung gBRCA1 (Beispiel)"
Description: "Leitlinienindizierte Keimbahn-Panel-Diagnostik (BRCA1/BRCA2) beim triple-negativen Mammakarzinom."
* status = #completed
* intent = #order
* code = http://loinc.org#21639-0 "BRCA1 gene mutations tested for in Blood or Tissue by Molecular genetics method Nominal"
* subject = Reference(PatientinMamma)
* authoredOn = "2025-09-18"
* requester = Reference(OnkologinMamma)


// ---------------------------------------------------------------------
// Erstellung eines Tumordiagnose CarePlans
// ---------------------------------------------------------------------

Instance: CarePlanMammaDiagnostik
InstanceOf: DiagnosticCarePlan
Usage: #example
Title: "Diagnostischer CarePlan "
Description: "Diagnostikplan zur Tumordiagnose: bildet den Weg zur Diagnosesicherung ab (Stanzbiopsie, Histologie, Grading, klinisches TNM, Rezeptor-/HER2-Status, Ki-67, Keimbahn-Testung) und verweist auf die daraus hervorgegangene Tumordiagnose."
* status = #active
* intent = #plan
* category.text = "Tumordiagnostik" 
* subject = Reference(PatientinMamma)
* addresses = Reference(ConditionMamma)
* author = Reference(OnkologinMamma)
// Durchgeführte Maßnahme / dokumentiertes Ergebnis: Ansprechbeurteilung
* activity[0].reference = Reference(ServiceRequestBiopsieMamma)
* activity[0].outcomeReference = Reference(ProcedureBiopsieMamma)
* activity[1].reference = Reference(ServiceRequestPathologieMamma)
* activity[1].outcomeReference[0] = Reference(ObsHistologieMamma)
* activity[1].outcomeReference[1] = Reference(ObsGradingMamma)
* activity[1].outcomeReference[2] = Reference(ObsEstrogenrezeptorMamma)
* activity[1].outcomeReference[3] = Reference(ObsProgesteronrezeptorMamma)
* activity[1].outcomeReference[4] = Reference(ObsHER2Mamma)
* activity[1].outcomeReference[5] = Reference(ObsKi67Mamma)
* activity[2].reference = Reference(ServiceRequestStagingMamma)
* activity[2].outcomeReference = Reference(ObsTNMklinischMamma)
* activity[3].reference = Reference(ServiceRequestGBRCAMamma)
* activity[3].outcomeReference = Reference(ObsGBRCAMamma)



// ---------------------------------------------------------------------
// Tumorerkrankung (Diagnose)
// ---------------------------------------------------------------------

Instance: ConditionMamma
InstanceOf: OnkoCondition
Usage: #example
Title: "Mammakarzinom links, triple-negativ (Beispiel)"
Description: "Adressierte Tumorerkrankung: invasives Mammakarzinom links (NST), ICD-10-GM C50.4. Konform zum MII-Onkologie-Diagnoseprofil (Primärtumor)."
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* category.coding.system = "http://terminology.hl7.org/CodeSystem/condition-category"
* category.coding.code = #encounter-diagnosis
* code.coding[icd10-gm] = http://fhir.de/CodeSystem/bfarm/icd-10-gm#C50.4 "Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse"
* code.coding[icd10-gm].version = "2026"
* code.text = "Invasives Mammakarzinom links, oberer äußerer Quadrant (NST), triple-negativ"
* bodySite.text = "Mamma links, oberer äußerer Quadrant"
* extension[Feststellungsdatum].valueDateTime = "2025-09-15"
* subject = Reference(PatientinMamma)
* onsetDateTime = "2025-09-15"
* recordedDate = "2025-09-15"

// ---------------------------------------------------------------------
// Diagnostische Biopsie (Gewinnung des Tumormaterials)
// ---------------------------------------------------------------------

Instance: ProcedureBiopsieMamma
InstanceOf: Procedure
Usage: #example
Title: "Sonografisch gesteuerte Stanzbiopsie der Mamma (Beispiel)"
Description: "Diagnostische Prozedur zur Sicherung der Tumordiagnose: sonografisch gesteuerte Stanzbiopsie der Mamma links. Liefert das Material für Histologie, Grading und Rezeptor-/HER2-Bestimmung."
* status = #completed
* category = http://snomed.info/sct#103693007 "Diagnostic procedure (procedure)"
* code.coding = http://snomed.info/sct#44578009 "Core needle biopsy of breast (procedure)"
* code.text = "Sonografisch gesteuerte Stanzbiopsie der Mamma links"
* bodySite.text = "Mamma links, oberer äußerer Quadrant"
* subject = Reference(PatientinMamma)
* performedDateTime = "2025-09-15"
* reasonReference = Reference(ConditionMamma)

Instance: SpecimenBiopsieMamma
InstanceOf: Specimen
Usage: #example
Title: "Stanzbiopsat Mamma links (Beispiel)"
Description: "Gewebeprobe aus der Stanzbiopsie, an der die histopathologische und molekulare Diagnostik durchgeführt wurde."
* status = #available
* type.coding = http://snomed.info/sct#119376003 "Tissue specimen (specimen)"
* type.text = "Stanzbiopsat (Gewebeprobe) Mamma links"
* subject = Reference(PatientinMamma)
* collection.collectedDateTime = "2025-09-15"
* collection.bodySite.text = "Mamma links, oberer äußerer Quadrant"

// ---------------------------------------------------------------------
// Pathologisches Profil (Stanzbiopsie vor Therapie)
// ---------------------------------------------------------------------

Instance: ObsHistologieMamma
InstanceOf: Observation
Usage: #example
Title: "Histologie / Morphologie (ICD-O-3, Beispiel)"
Description: "Histologischer Befund der Stanzbiopsie: invasives Karzinom ohne speziellen Typ (NST)."
* status = #final
* code = http://loinc.org#33731-1 "Histology type in Cancer specimen Narrative"
* valueCodeableConcept.coding.system = "urn:oid:2.16.840.1.113883.6.43.1"
* valueCodeableConcept.coding.code = #8500/3
* valueCodeableConcept.coding.display = "Invasives duktales Karzinom / Karzinom ohne speziellen Typ (NST)"
* valueCodeableConcept.text = "Invasives Mammakarzinom, NST (ICD-O-3 8500/3)"
* specimen = Reference(SpecimenBiopsieMamma)
* subject = Reference(PatientinMamma)
* effectiveDateTime = "2025-09-15"

Instance: ObsGradingMamma
InstanceOf: Observation
Usage: #example
Title: "Grading G3 (Beispiel)"
Description: "Histopathologisches Grading nach Elston-Ellis: G3 (schlecht differenziert)."
* status = #final
* code = http://loinc.org#33732-9 "Histology grade [Identifier] in Cancer specimen"
* valueCodeableConcept.coding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-grading#3 "schlecht differenziert"
* valueCodeableConcept.text = "G3 – schlecht differenziert (Elston-Ellis)"
* specimen = Reference(SpecimenBiopsieMamma)
* subject = Reference(PatientinMamma)
* effectiveDateTime = "2025-09-15"

Instance: ObsTNMklinischMamma
InstanceOf: Observation
Usage: #example
Title: "Klinisches TNM / UICC-Stadium (Beispiel)"
Description: "Klinische Ausbreitungsdiagnostik vor Therapiebeginn: cT2 cN1 cM0, UICC-Stadium IIB."
* status = #final
* code = http://loinc.org#21908-9 "Stage group.clinical Cancer"
* valueCodeableConcept.text = "cT2 cN1 cM0 – UICC IIB"
* subject = Reference(PatientinMamma)
* effectiveDateTime = "2025-09-16"

// ---------------------------------------------------------------------
// Molekulares / prädiktives Profil (Rezeptorstatus, Proliferation, Keimbahn)
// Kodierung angelehnt an das MII KDS Mamma-Zusatzmodul (v2026.0.3).
// ---------------------------------------------------------------------

Instance: ObsEstrogenrezeptorMamma
InstanceOf: Observation
Usage: #example
Title: "Östrogenrezeptor-Status – negativ (Beispiel)"
Description: "Immunhistochemischer Östrogenrezeptor-Status: negativ (<1 % positive Tumorzellkerne)."
* status = #final
* code = http://loinc.org#40556-3 "Estrogen receptor Ag [Presence] in Tissue by Immune stain"
* valueCodeableConcept = http://loinc.org#LA6577-6 "Negative"
* note.text = "Immunhistochemie: <1 % positive Kerne → ER-negativ."
* specimen = Reference(SpecimenBiopsieMamma)
* subject = Reference(PatientinMamma)
* effectiveDateTime = "2025-09-17"

Instance: ObsProgesteronrezeptorMamma
InstanceOf: Observation
Usage: #example
Title: "Progesteronrezeptor-Status – negativ (Beispiel)"
Description: "Immunhistochemischer Progesteronrezeptor-Status: negativ (<1 % positive Tumorzellkerne)."
* status = #final
* code = http://loinc.org#85339-0 "Progesterone receptor Ag [Presence] in Breast cancer specimen by Immune stain"
* valueCodeableConcept = http://loinc.org#LA6577-6 "Negative"
* note.text = "Immunhistochemie: <1 % positive Kerne → PR-negativ."
* specimen = Reference(SpecimenBiopsieMamma)
* subject = Reference(PatientinMamma)
* effectiveDateTime = "2025-09-17"

Instance: ObsHER2Mamma
InstanceOf: Observation
Usage: #example
Title: "HER2/neu-Status – negativ (Beispiel)"
Description: "HER2/neu-Status: negativ (IHC 1+). Kodierung nach MII Mamma-Zusatzmodul (oBDS + Leitlinie)."
* status = #final
* code = http://loinc.org#48676-1 "HER2 Ag [Interpretation] in Tissue"
* valueCodeableConcept.coding[0] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-her2neu-status-obds#N "negativ"
* valueCodeableConcept.coding[1] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-her2neu-status-leitlinie#negativ "HER2-negativ"
* note.text = "Immunhistochemie 1+ → HER2-negativ; keine In-situ-Hybridisierung erforderlich."
* specimen = Reference(SpecimenBiopsieMamma)
* subject = Reference(PatientinMamma)
* effectiveDateTime = "2025-09-17"

Instance: ObsKi67Mamma
InstanceOf: Observation
Usage: #example
Title: "Ki-67 Proliferationsindex (Beispiel)"
Description: "Proliferationsmarker Ki-67: 70 % – hohe Proliferationsaktivität."
* status = #final
* code.text = "Ki-67 Proliferationsindex (MIB-1)"
* valueQuantity = 70 '%' "%"
* specimen = Reference(SpecimenBiopsieMamma)
* subject = Reference(PatientinMamma)
* effectiveDateTime = "2025-09-17"

Instance: ObsGBRCAMamma
InstanceOf: Observation
Usage: #example
Title: "Keimbahn-Testung gBRCA1 – unauffällig (Beispiel)"
Description: "Leitlinienindizierte Keimbahn-Panel-Diagnostik (BRCA1/BRCA2) beim TNBC: keine (wahrscheinlich) pathogene Variante nachgewiesen."
* status = #final
* code = http://loinc.org#21639-0 "BRCA1 gene mutations tested for in Blood or Tissue by Molecular genetics method Nominal"
* valueCodeableConcept = http://snomed.info/sct#260385009 "Negative"
* note.text = "gBRCA1/2: keine (wahrscheinlich) pathogene Variante (Klasse 4/5) nachgewiesen."
* subject = Reference(PatientinMamma)
* effectiveDateTime = "2025-09-25"

// ---------------------------------------------------------------------
// Therapielinie (neoadjuvante Systemtherapie, LoT 1)
// ---------------------------------------------------------------------

Instance: TherapielinieMammaNeoadjuvant
InstanceOf: OnkoTherapyLine
Usage: #example
Title: "Therapielinie 1 – neoadjuvante Chemo-/Immuntherapie (Beispiel)"
Description: "Erstlinien-Behandlungsabschnitt mit neoadjuvanter Intention (KEYNOTE-522-Schema) im Rahmen eines kurativen Gesamtkonzepts."
* extension[therapyIntent].valueCodeableConcept = OnkoTherapyIntent#neoadjuvant "Neoadjuvant"
* status = #finished
* patient = Reference(PatientinMamma)
* period.start = "2025-10-01"
* period.end = "2026-03-15"
* diagnosis.condition = Reference(ConditionMamma)
* diagnosis.rank = 1

// ---------------------------------------------------------------------
// Therapieziel (kurativ) mit Zielakzeptanz und Verlaufsergebnis
// ---------------------------------------------------------------------

Instance: TherapiezielMammaHeilung
InstanceOf: OnkoTherapyGoal
Usage: #example
Title: "Therapieziel – Heilung & Brusterhalt (Beispiel)"
Description: "Übergeordnetes kuratives Therapieziel: Heilung des frühen TNBC durch neoadjuvante Systemtherapie und anschließende Operation, bei gleichzeitigem Ziel des Brusterhalts (Funktionserhalt)."
* extension[therapyIntent].valueCodeableConcept = OnkoTherapyIntent#kurativ "Kurativ"
// goal-acceptance: Die Patientin stimmt dem kurativen Ziel mit hoher Priorität zu (MCCGoal)
* extension[acceptance].extension[individual].valueReference = Reference(PatientinMamma)
* extension[acceptance].extension[status].valueCode = #agree
* extension[acceptance].extension[priority].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/goal-priority#high-priority "High Priority"
* lifecycleStatus = #active
* achievementStatus = http://terminology.hl7.org/CodeSystem/goal-achievement#achieved "Achieved"
* category[0] = OnkoTherapyGoalType#heilung "Heilung"
* category[1] = OnkoTherapyGoalType#funktionserhalt "Funktionserhalt"
* priority = http://terminology.hl7.org/CodeSystem/goal-priority#high-priority "High Priority"
* description.text = "Kurative Behandlung des frühen triple-negativen Mammakarzinoms mittels neoadjuvanter Systemtherapie und brusterhaltender Operation; Erreichen einer pathologischen Komplettremission (pCR)."
* subject = Reference(PatientinMamma)
* startDate = "2025-09-22"
* target.measure = http://loinc.org#21908-9 "Stage group.clinical Cancer"
* target.dueDate = "2026-04-15"
* addresses = Reference(ConditionMamma)
* expressedBy = Reference(OnkologinMamma)
* outcomeReference = Reference(ObsDiseaseStatusMamma)

// ---------------------------------------------------------------------
// Geplante Operation vom Tumorboard
// ---------------------------------------------------------------------

Instance: ServiceRequestProcedure
InstanceOf: TumorboardServiceRequest
Usage: #example
Title: "Geplante Operation vom Tumorboard um den Tumor operativ zu entfernen"
Description: "Empfehlung des Tumorboards: operative Entfernung des Tumors (Lumpektomie) bei Mammakarzinom."
* status = #active
* intent = #proposal
* category[tumorboardConsult] = http://loinc.org#85232-7 "Tumor board Consult note"
* category[+] = http://snomed.info/sct#387713003 "Surgical procedure"
* code = http://snomed.info/sct#392021009 "Lumpectomy of breast (procedure)"
* subject = Reference(PatientinMamma)



// ---------------------------------------------------------------------
// Geplante Systemtherapie vom Tumorboard (neoadjuvant)
// ---------------------------------------------------------------------

Instance: MedicationRequestKEYNOTE522
InstanceOf: TumorboardMedicationRequest
Usage: #example
Title: "Geplante Systemtherapie – Pembrolizumab + Chemotherapie (KEYNOTE-522, Beispiel)"
Description: "Geplante Aktivität des CarePlan: neoadjuvante Chemo-/Immuntherapie nach KEYNOTE-522 (Pembrolizumab + Carboplatin/Paclitaxel → Pembrolizumab + EC)."
* status = #completed
* intent = #plan
* category[tumorboardConsult] = http://loinc.org#85232-7 "Tumor board Consult note"
* medicationCodeableConcept.text = "Pembrolizumab + Carboplatin/Paclitaxel, gefolgt von Pembrolizumab + Epirubicin/Cyclophosphamid (KEYNOTE-522)"
* subject = Reference(PatientinMamma)

// ---------------------------------------------------------------------
// Durchgeführte Operation nach neoadjuvanter Therapie
// ---------------------------------------------------------------------

Instance: ProcedureOperationMamma
InstanceOf: Procedure
Usage: #example
Title: "Brusterhaltende Operation + Sentinel-Lymphknoten-Biopsie (Beispiel)"
Description: "Durchgeführte lokale Therapie nach Abschluss der neoadjuvanten Systemtherapie: brusterhaltende Operation (BET) links mit Sentinel-Lymphknoten-Biopsie."
* status = #completed
* code.coding = http://snomed.info/sct#392021009 "Lumpectomy of breast (procedure)"
* code.text = "Brusterhaltende Operation (BET) links + Sentinel-Lymphknoten-Biopsie"
* subject = Reference(PatientinMamma)
* performedDateTime = "2026-04-02"

Instance: ObsTNMpathologischMamma
InstanceOf: Observation
Usage: #example
Title: "Postneoadjuvantes TNM / pCR (Beispiel)"
Description: "Pathologische Aufarbeitung des OP-Präparats nach neoadjuvanter Therapie: ypT0 ypN0 – pathologische Komplettremission (pCR)."
* status = #final
* code = http://loinc.org#21902-2 "Stage group.pathology Cancer"
* valueCodeableConcept.text = "ypT0 ypN0 – pathologische Komplettremission (pCR)"
* subject = Reference(PatientinMamma)
* effectiveDateTime = "2026-04-07"

Instance: ObsDiseaseStatusMamma
InstanceOf: Observation
Usage: #example
Title: "Tumoransprechen / Disease Status – Komplettremission (Beispiel)"
Description: "Verlaufs-Observation zum Krankheitsstatus nach neoadjuvanter Therapie und Operation: pathologische Komplettremission (vgl. mCODE Cancer Disease Status)."
* status = #final
* code = http://loinc.org#97509-4 "Cancer disease progression"
* valueCodeableConcept = http://snomed.info/sct#260415000 "Not detected"
* note.text = "Pathologische Komplettremission (pCR, ypT0 ypN0) nach neoadjuvanter Systemtherapie."
* subject = Reference(PatientinMamma)
* effectiveDateTime = "2026-04-07"

// ---------------------------------------------------------------------
// Zentraler Versorgungsplan
// ---------------------------------------------------------------------

Instance: CarePlanMammaNeoadjuvant
InstanceOf: OnkoCarePlan
Usage: #example
Title: "Onkologischer CarePlan – Mamma neoadjuvant/kurativ (Beispiel)"
Description: "Zentraler Versorgungsplan, der adressierte Erkrankung, kuratives Therapieziel sowie geplante (neoadjuvante Systemtherapie) und durchgeführte Maßnahmen (Operation, Ansprechbeurteilung) zusammenführt."
* extension[therapyIntent].valueCodeableConcept = OnkoTherapyIntent#kurativ "Kurativ"
// custodian: verantwortliche Stelle für Pflege/Aktualisierung des Plans (MCC R5-Backport)
* extension[custodian].valueReference = Reference(TumorzentrumMamma)
* status = #active
* intent = #plan
* category = http://snomed.info/sct#736252007 "Cancer care plan"
* subject = Reference(PatientinMamma)
* period.start = "2025-09-22"
* addresses = Reference(ConditionMamma)
* goal = Reference(TherapiezielMammaHeilung)
* author = Reference(OnkologinMamma)
// Geplante Maßnahme: neoadjuvante Systemtherapie
// Geplante Maßnahme: neoadjuvante Systemtherapie (Tumorboard-Empfehlung)
* activity[0].reference = Reference(MedicationRequestKEYNOTE522)
// Geplante Maßnahme: OP-Empfehlung des Tumorboards → durchgeführte Operation
* activity[1].reference = Reference(ServiceRequestProcedure)
* activity[1].outcomeReference = Reference(ProcedureOperationMamma)
// Dokumentiertes Ergebnis: Ansprechbeurteilung
* activity[2].outcomeReference = Reference(ObsDiseaseStatusMamma)