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
// Im Anschluss an die Operation folgt — schemakonform zu KEYNOTE-522 und
// unabhängig vom pCR-Status — eine ambulante adjuvante Pembrolizumab-
// Monotherapie (~9 Zyklen q3w) als nachgelagerte Therapielinie
// (EpisodeOfCare).
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

Instance: Tumorboard
InstanceOf: Organization
Usage: #example
Title: "Tumorboard"
Description: "Verantwortliche Stelle für Pflege und Aktualisierung des Versorgungsplans."
* identifier.system = "https://www.musterklinik.de/fhir/sid/organisationen"
* identifier.value = "tumorboard-brust-001"
* active = true
* type = http://terminology.hl7.org/CodeSystem/organization-type#team "Organizational team"
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
Title: "Diagnostischer CarePlan"
Description: "Diagnostikplan zur Tumordiagnose: bildet den Weg zur Diagnosesicherung ab (Stanzbiopsie, Histologie, Grading, klinisches TNM, Rezeptor-/HER2-Status, Ki-67, Keimbahn-Testung) und verweist auf die daraus hervorgegangene Tumordiagnose."
* status = #active
* intent = #plan
* category.text = "Tumordiagnostik" 
* subject = Reference(PatientinMamma)
* addresses = Reference(ConditionMamma)
* author = Reference(OnkologinMamma)
* goal = Reference(DiagnosticGoal)
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
// Erstellung eines Goals für die Tumordiagnose (vorlaufender Goal)
// ---------------------------------------------------------------------

Instance: DiagnosticGoal
InstanceOf: OnkoTherapyGoal
Usage: #example
Title: "Onkologisches Diagnosezeil"
Description: "Das onkologische Diagnoseziel wird im diagnostischen CarePlan verlinkt und hat zum Ziel, dass eine Tumordiagnostik gestellt werden kann."
* extension[acceptance].extension[individual].valueReference = Reference(PatientinMamma)
* extension[acceptance].extension[status].valueCode = #agree
* extension[acceptance].extension[priority].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/goal-priority#high-priority "High Priority"
* lifecycleStatus = #active
* achievementStatus = http://terminology.hl7.org/CodeSystem/goal-achievement#in-progress "In Progress"
* category = http://snomed.info/sct#261004008 "Diagnostic intent"
* priority = http://terminology.hl7.org/CodeSystem/goal-priority#high-priority "High Priority"
* description.text = "Diagnosesicherung für die Verdachtsdiagnose"
* subject = Reference(PatientinMamma)
* startDate = "2025-09-12"
// Klinisches TNM
* target[0].measure = http://loinc.org#21905-5 "Primary tumor.clinical [Class] Cancer" // cT
* target[1].measure = http://loinc.org#21906-3 "Regional lymph nodes.clinical [Class] Cancer" // cN
* target[2].measure = http://loinc.org#21907-1 "Distant metastases.clinical [Class] Cancer" // cM
* target[3].measure = http://loinc.org#21908-9 "Stage group.clinical Cancer" // optional: Gesamtstadium

// Rezeptorstatus
* target[4].measure = http://loinc.org#40556-3 "Estrogen receptor Ag [Presence] in Tissue by Immune stain"
* target[5].measure = http://loinc.org#85339-0 "Progesterone receptor Ag [Presence] in Breast cancer specimen by Immune stain"
* target[6].measure = http://loinc.org#48676-1 "HER2 Ag [Interpretation] in Tissue"

// Lokalisation
* target[7].measure = http://loinc.org#21855-2 "Primary site Cancer"

// Nottingham-Score (Bloom-Richardson) & allgemeines Grading
* target[8].measure = http://loinc.org#44648-4 "Histologic grade [Score] in Breast cancer specimen by Nottingham"
* target[9].measure = http://loinc.org#33732-9 "Histology grade [Identifier] in Cancer specimen"

// Sentinel-Lymphknoten
* target[10].measure = http://loinc.org#85347-3 "Sentinel lymph nodes examined [#] in Cancer specimen by Light microscopy"

* expressedBy = Reference(OnkologinMamma)
* addresses = Reference(ConditionMamma)
* outcomeReference = Reference(ObsDiseaseStatusMamma)



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
// Abgleich BreastCancerSpec: CoreNeedleBiopsySpecimenPart (spezifischer Biopsat-Typ + Entnahmemethode + codierter bodySite)
* type.coding[0] = http://snomed.info/sct#122737001 "Specimen from breast obtained by core needle biopsy"
* type.coding[1] = http://snomed.info/sct#119376003 "Tissue specimen (specimen)"
* type.text = "Stanzbiopsat (Gewebeprobe) Mamma links"
* subject = Reference(PatientinMamma)
* collection.collectedDateTime = "2025-09-15"
* collection.method = http://snomed.info/sct#9911007 "Core needle biopsy"
* collection.bodySite.coding = http://snomed.info/sct#76365002 "Structure of upper outer quadrant of breast"
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
// Abgleich BreastCancerSpec: CoreNeedleBiopsyHistologicalTypeICDO3 (LOINC 59847-4, Wert als SNOMED-Morphologie)
* code = http://loinc.org#59847-4 "Histology and Behavior ICD-O-3 Cancer"
* valueCodeableConcept.coding[0] = http://snomed.info/sct#82711006 "Infiltrating duct carcinoma"
* valueCodeableConcept.coding[1].system = "urn:oid:2.16.840.1.113883.6.43.1"
* valueCodeableConcept.coding[1].code = #8500/3
* valueCodeableConcept.coding[1].display = "Invasives duktales Karzinom / Karzinom ohne speziellen Typ (NST)"
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
// Abgleich BreastCancerSpec: CoreNeedleBiopsyNottinghamGrade (LOINC 44648-4, Wert als SNOMED-Grade)
* code = http://loinc.org#44648-4 "Histologic grade [Score] in Breast cancer specimen by Nottingham"
* valueCodeableConcept.coding[0] = http://snomed.info/sct#1155704001 "G3: Poorly differentiated"
* valueCodeableConcept.coding[1] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-grading#3 "schlecht differenziert"
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
// Abgleich BreastCancerSpec: CoreNeedleBiopsyERStatus (brustspezifischer LOINC + SNOMED-Methode IHC)
* code.coding[0] = http://loinc.org#85337-4 "Estrogen receptor Ag [Presence] in Breast cancer specimen by Immune stain"
* code.coding[1] = http://snomed.info/sct#1234806008 "Observation using immunohistochemistry (observable entity)"
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
// Abgleich BreastCancerSpec: CoreNeedleBiopsyPRStatus (LOINC + SNOMED-Methode IHC)
* code.coding[0] = http://loinc.org#85339-0 "Progesterone receptor Ag [Presence] in Breast cancer specimen by Immune stain"
* code.coding[1] = http://snomed.info/sct#1234806008 "Observation using immunohistochemistry (observable entity)"
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
// Abgleich BreastCancerSpec: HER2Overall (LOINC 48676-1, Interpretation als LOINC-Answer); MII-Kodierung bleibt erhalten
* code = http://loinc.org#48676-1 "HER2 [Interpretation] in Tissue"
* valueCodeableConcept.coding[0] = http://loinc.org#LA6577-6 "Negative"
* valueCodeableConcept.coding[1] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-her2neu-status-obds#N "negativ"
* valueCodeableConcept.coding[2] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-her2neu-status-leitlinie#negativ "HER2-negativ"
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
// Abgleich BreastCancerSpec: CoreNeedleBiopsyKi67 (LOINC 85330-9 + SNOMED-Methode IHC)
* code.coding[0] = http://loinc.org#85330-9 "Cells.Ki-67 nuclear Ag/cells in Breast cancer specimen by Immune stain"
* code.coding[1] = http://snomed.info/sct#1234806008 "Observation using immunohistochemistry (observable entity)"
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
// Therapielinie (Chemotherapy, LoT 1)
// ---------------------------------------------------------------------

Instance: TherapielinieChemo
InstanceOf: OnkoTherapyLine
Usage: #example
Title: "Therapielinie 1 – neoadjuvante Chemo-/Immuntherapie"
Description: "Erstlinien-Behandlungsabschnitt mit neoadjuvanter Intention (KEYNOTE-522-Schema) im Rahmen eines kurativen Gesamtkonzepts."
* extension[therapyIntent].extension[hauptintention].valueCodeableConcept = http://snomed.info/sct#373847000 "Neoadjuvant"
* extension[therapyIntent].extension[phase].valueCodeableConcept = http://snomed.info/sct#373808002 "Kurativ"
* status = #finished
* type = http://snomed.info/sct#385786002  "Chemotherapy care"
* diagnosis.condition = Reference(ConditionMamma)
* diagnosis.rank = 1
* patient = Reference(PatientinMamma)
* period.start = "2025-10-01"
* period.end = "2026-03-15"
* diagnosis.role = http://terminology.hl7.org/CodeSystem/diagnosis-role#CC "Chief complaint"
* extension[medicationRequest].valueReference = Reference(MedicationRequestPembroChemoNeoadjuvantMamma)
* managingOrganization = Reference(Tumorboard)
* careManager = Reference(OnkologinMamma)

// Tumorhauseboard
// * type-> hier besser proceudre angeben -> antineoplastische therapie...   könnte hier sein ein value aus https://snomedbrowser.org/?perspective=full&conceptId1=225355000&edition=MAIN/2026-07-01&release=&languages=en

// ---------------------------------------------------------------------
// Therapielinie (Operation, LoT 2)
// ---------------------------------------------------------------------

Instance: TherapielinieOperation
InstanceOf: OnkoTherapyLine
Usage: #example
Title: "Therapielinie 2 – Operation"
Description: "Erstlinien-Behandlungsabschnitt mit neoadjuvanter Intention (KEYNOTE-522-Schema) im Rahmen eines kurativen Gesamtkonzepts."
* extension[therapyIntent].extension[hauptintention].valueCodeableConcept = http://snomed.info/sct#373808002 "Kurativ"
* status = #finished
* type = http://snomed.info/sct#1345242003 "Erhaltungstherapie"
* patient = Reference(PatientinMamma)
* period.start = "2026-03-20"
* period.end = "2026-04-06"
* diagnosis.condition = Reference(ConditionMamma)
* diagnosis.rank = 1
* diagnosis.role = http://terminology.hl7.org/CodeSystem/diagnosis-role#CC "Chief complaint"
* referralRequest = Reference(ServiceRequestProcedure)
* managingOrganization = Reference(Tumorboard)
* careManager = Reference(OnkologinMamma)

// ---------------------------------------------------------------------
// Therapielinie (adjuvante Immuntherapie, LoT 3) — nachgelagert, ambulant
// Vervollständigt das KEYNOTE-522-Schema: adjuvante Pembrolizumab-
// Monotherapie im Anschluss an die Operation (unabhängig vom pCR-Status),
// ~9 Zyklen q3w im ambulanten Setting. Zum Zeitpunkt der Darstellung noch
// laufend (status = active).
// ---------------------------------------------------------------------

Instance: TherapieliniePembroAdjuvant
InstanceOf: OnkoTherapyLine
Usage: #example
Title: "Therapielinie 3 – adjuvante Immuntherapie (Pembrolizumab), ambulant"
Description: "Nachgelagerter, ambulanter Behandlungsabschnitt: adjuvante Pembrolizumab-Monotherapie nach dem KEYNOTE-522-Schema im Anschluss an die Operation (kuratives Gesamtkonzept)."
* extension[therapyIntent].extension[hauptintention].valueCodeableConcept = http://snomed.info/sct#373846009 "Adjuvant"
* extension[therapyIntent].extension[phase].valueCodeableConcept = http://snomed.info/sct#1345242003 "Erhaltungstherapie"
* extension[medicationRequest].valueReference = Reference(MedicationRequestPembroAdjuvantMamma)
* status = #active
* type = http://snomed.info/sct#76334006 "Immunological therapy"
* type.text = "Ambulante adjuvante Immuntherapie – Pembrolizumab-Monotherapie"
* patient = Reference(PatientinMamma)
* period.start = "2026-04-24"
* diagnosis.condition = Reference(ConditionMamma)
* diagnosis.rank = 1
* diagnosis.role = http://terminology.hl7.org/CodeSystem/diagnosis-role#CC "Chief complaint"
* managingOrganization = Reference(Tumorboard)
* careManager = Reference(OnkologinMamma)

// ---------------------------------------------------------------------
// Therapieziel (kurativ) mit Zielakzeptanz und Verlaufsergebnis
// ---------------------------------------------------------------------

Instance: TherapiezielMammaHeilung
InstanceOf: OnkoTherapyGoal
Usage: #example
Title: "Therapieziel – Heilung & Brusterhalt (Beispiel)"
Description: "Übergeordnetes kuratives Therapieziel: Heilung des frühen TNBC durch neoadjuvante Systemtherapie und anschließende Operation, bei gleichzeitigem Ziel des Brusterhalts (Funktionserhalt)."
* extension[therapyIntent].extension[hauptintention].valueCodeableConcept = http://snomed.info/sct#373808002 "Kurativ"
* extension[acceptance].extension[individual].valueReference = Reference(PatientinMamma)
* extension[acceptance].extension[status].valueCode = #agree
* extension[acceptance].extension[priority].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/goal-priority#high-priority "High Priority"
* extension[relatedGoal][0].extension[type].valueCodeableConcept = http://hl7.org/fhir/goal-relationship-type#predecessor "Predecessor"
* extension[relatedGoal][0].extension[target].valueReference = Reference(DiagnosticGoal)
* extension[relatedGoal][1].extension[type].valueCodeableConcept = http://hl7.org/fhir/goal-relationship-type#successor "Successor"
* extension[relatedGoal][1].extension[target].valueReference = Reference(FollowUpGoal)
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
// Medikationsabgabe
// ---------------------------------------------------------------------

Instance: MedicationAdministrationPembroChemoNeoadjuvantMamma1
InstanceOf: MedicationAdministration
Usage: #example
Title: "Verabreichte Systemtherapie – Pembrolizumab + Carboplatin/Paclitaxel, Zyklus 1/4 (KEYNOTE-522, Beispiel)"
Description: "Dokumentierte Gabe (Zyklus 1 von 4, KEYNOTE-522 Phase 1) im Rahmen der neoadjuvanten Chemo-/Immuntherapie, referenziert auf den zugehörigen MedicationRequest aus dem Tumorboard-CarePlan."
* status = #completed
* medicationCodeableConcept.text = "Pembrolizumab + Carboplatin (q3w), Paclitaxel wöchentlich begleitend (KEYNOTE-522, Phase 1)"
* subject = Reference(PatientinMamma)
* request = Reference(MedicationRequestPembroChemoNeoadjuvantMamma)
* effectiveDateTime = "2025-10-01"
* note.text = "Zyklus 1 von 4 (Pembro/Carbo q3w); begleitend wöchentliche Paclitaxel-Gaben, hier nicht einzeln erfasst"

Instance: MedicationAdministrationPembroChemoNeoadjuvantMamma2
InstanceOf: MedicationAdministration
Usage: #example
Title: "Verabreichte Systemtherapie – Pembrolizumab + Carboplatin/Paclitaxel, Zyklus 2/4 (KEYNOTE-522, Beispiel)"
Description: "Dokumentierte Gabe (Zyklus 2 von 4, KEYNOTE-522 Phase 1) im Rahmen der neoadjuvanten Chemo-/Immuntherapie, referenziert auf den zugehörigen MedicationRequest aus dem Tumorboard-CarePlan."
* status = #completed
* medicationCodeableConcept.text = "Pembrolizumab + Carboplatin (q3w), Paclitaxel wöchentlich begleitend (KEYNOTE-522, Phase 1)"
* subject = Reference(PatientinMamma)
* request = Reference(MedicationRequestPembroChemoNeoadjuvantMamma)
* effectiveDateTime = "2025-11-01"
* note.text = "Zyklus 2 von 4 (Pembro/Carbo q3w); begleitend wöchentliche Paclitaxel-Gaben, hier nicht einzeln erfasst"

Instance: MedicationAdministrationPembroChemoNeoadjuvantMamma3
InstanceOf: MedicationAdministration
Usage: #example
Title: "Verabreichte Systemtherapie – Pembrolizumab + Carboplatin/Paclitaxel, Zyklus 3/4 (KEYNOTE-522, Beispiel)"
Description: "Dokumentierte Gabe (Zyklus 3 von 4, KEYNOTE-522 Phase 1) im Rahmen der neoadjuvanten Chemo-/Immuntherapie, referenziert auf den zugehörigen MedicationRequest aus dem Tumorboard-CarePlan."
* status = #completed
* medicationCodeableConcept.text = "Pembrolizumab + Carboplatin (q3w), Paclitaxel wöchentlich begleitend (KEYNOTE-522, Phase 1)"
* subject = Reference(PatientinMamma)
* request = Reference(MedicationRequestPembroChemoNeoadjuvantMamma)
* effectiveDateTime = "2026-02-10"
* note.text = "Zyklus 3 von 4 (Pembro/Carbo q3w); begleitend wöchentliche Paclitaxel-Gaben, hier nicht einzeln erfasst"

Instance: MedicationAdministrationPembroChemoNeoadjuvantMamma4
InstanceOf: MedicationAdministration
Usage: #example
Title: "Verabreichte Systemtherapie – Pembrolizumab + Carboplatin/Paclitaxel, Zyklus 4/4 (KEYNOTE-522, Beispiel)"
Description: "Dokumentierte Gabe (Zyklus 4 von 4, KEYNOTE-522 Phase 1) im Rahmen der neoadjuvanten Chemo-/Immuntherapie, referenziert auf den zugehörigen MedicationRequest aus dem Tumorboard-CarePlan."
* status = #completed
* medicationCodeableConcept.text = "Pembrolizumab + Carboplatin (q3w), Paclitaxel wöchentlich begleitend (KEYNOTE-522, Phase 1)"
* subject = Reference(PatientinMamma)
* request = Reference(MedicationRequestPembroChemoNeoadjuvantMamma)
* effectiveDateTime = "2026-03-15"
* note.text = "Zyklus 4 von 4 (Pembro/Carbo q3w); begleitend wöchentliche Paclitaxel-Gaben, hier nicht einzeln erfasst"





// ---------------------------------------------------------------------
// Geplante Systemtherapie vom Tumorboard (neoadjuvant)
// ---------------------------------------------------------------------

Instance: MedicationRequestPembroChemoNeoadjuvantMamma
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
// Geplante adjuvante Systemtherapie vom Tumorboard (nach der Operation)
// Adjuvante Phase des KEYNOTE-522-Schemas: Pembrolizumab-Monotherapie.
// ---------------------------------------------------------------------

Instance: MedicationRequestPembroAdjuvantMamma
InstanceOf: TumorboardMedicationRequest
Usage: #example
Title: "Adjuvante Systemtherapie – Pembrolizumab-Monotherapie (KEYNOTE-522, Beispiel)"
Description: "Adjuvante Phase des KEYNOTE-522-Schemas: Pembrolizumab-Monotherapie im Anschluss an die Operation (unabhängig vom pCR-Status), ambulant über ~9 Zyklen (q3w)."
* status = #active
* intent = #plan
* category[tumorboardConsult] = http://loinc.org#85232-7 "Tumor board Consult note"
* medicationCodeableConcept.text = "Pembrolizumab-Monotherapie (adjuvant, KEYNOTE-522), ambulant, ~9 Zyklen q3w"
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
* activity[0].reference = Reference(MedicationRequestPembroChemoNeoadjuvantMamma)
* activity[0].outcomeReference[0] = Reference(MedicationAdministrationPembroChemoNeoadjuvantMamma1)
* activity[0].outcomeReference[1] = Reference(MedicationAdministrationPembroChemoNeoadjuvantMamma2)
* activity[0].outcomeReference[2] = Reference(MedicationAdministrationPembroChemoNeoadjuvantMamma3)
* activity[0].outcomeReference[3] = Reference(MedicationAdministrationPembroChemoNeoadjuvantMamma4)
// Geplante Maßnahme: OP-Empfehlung des Tumorboards → durchgeführte Operation
* activity[1].reference = Reference(ServiceRequestProcedure)
* activity[1].outcomeReference = Reference(ProcedureOperationMamma)
// Geplante Maßnahme: adjuvante Systemtherapie (Pembrolizumab-Monotherapie, ambulant)
* activity[2].reference = Reference(MedicationRequestPembroAdjuvantMamma)
// Dokumentiertes Ergebnis: Ansprechbeurteilung
* activity[3].outcomeReference = Reference(ObsDiseaseStatusMamma)


// ---------------------------------------------------------------------
// Erhaltung des Gesundheitsstauts -> wichtig zu bestimmen, wann dieser Goal erstellt wird. In meinem Beispiel wenn der CarePlan erstellt wird
// ---------------------------------------------------------------------


Instance: FollowUpGoal
InstanceOf: OnkoTherapyGoal
Usage: #example
Title: "Verbesserung und Erhaltung der QoL nach der onkologischen Behandlung"
Description: "Nachsorge-/Monitoring-Ziel nach abgeschlossener Primärtherapie (Chemotherapie und Operation) des Mammakarzinoms."
* extension[acceptance].extension[individual].valueReference = Reference(PatientinMamma)
* extension[acceptance].extension[status].valueCode = #agree
* extension[acceptance].extension[priority].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/goal-priority#high-priority "High Priority"
* extension[relatedGoal][0].extension[type].valueCodeableConcept = http://hl7.org/fhir/goal-relationship-type#predecessor "Predecessor"
* extension[relatedGoal][0].extension[target].valueReference = Reference(DiagnosticGoal)
* extension[relatedGoal][1].extension[type].valueCodeableConcept = http://hl7.org/fhir/goal-relationship-type#predecessor "Predecessor"
* extension[relatedGoal][1].extension[target].valueReference = Reference(TherapiezielMammaHeilung)
* lifecycleStatus = #planned
* achievementStatus = http://terminology.hl7.org/CodeSystem/goal-achievement#in-progress "In Progress"
* category = OnkoTherapyGoalType#lebensqualitaet "Lebensqualität"
* priority = http://terminology.hl7.org/CodeSystem/goal-priority#high-priority "High Priority"
* description.text = "Monitoring der Lebensqualität und des Krankheitsstatus nach der onkologischen Erkrankung und Therapie"
* subject = Reference(PatientinMamma)
* startDate = "2026-08-15"
// Kern-Target: Rezidivfreiheit / Krankheitsstatus (S3-LL Mammakarzinom, AGO)
* target[0].measure = http://loinc.org#21976-6 "Cancer outcome status"
* target[0].detailCodeableConcept.text = "Kein Hinweis auf Lokalrezidiv oder Fernmetastasen"
* target[0].dueDate = "2026-11-15"
// Bildgebung: jährliche Mammographie der operierten und kontralateralen Brust
* target[1].measure = http://loinc.org#24606-6 "MG Breast Screening"
* target[1].detailCodeableConcept.text = "Unauffällige Nachsorge-Mammographie (jährlich), kein Rezidivnachweis"
* target[1].dueDate = "2027-04-15"
// Funktion / Nebenwirkung nach Sentinel-Lymphknoten-Biopsie: Armfunktion, Lymphödem
* target[2].measure.text = "Arm-/Schulterfunktion und Lymphödem-Status nach axillärem Eingriff"
* target[2].detailCodeableConcept.text = "Kein manifestes Lymphödem, erhaltene Schulterbeweglichkeit"
// Patientenberichtete Lebensqualität (EORTC QLQ-C30 / BR23).
// Erfassung erfolgt im MII PRO-Modul (PROM) — hier nur als Nachsorge-Target
// referenziert; die eigentlichen PRO-Messungen werden über das PCO IG
// angebunden (vgl. analysebericht.md, PCO-Baustein), nicht selbst modelliert.
* target[3].measure.text = "Gesundheitsbezogene Lebensqualität (PROM, EORTC QLQ-C30 / BR23) – MII PRO-Modul"
* target[3].detailCodeableConcept.text = "Stabile bis verbesserte Lebensqualität im Verlauf"
// Hinweis: Routinemäßige Tumormarker-Bestimmung (z. B. CA 15-3) wird in der
// asymptomatischen kurativen Nachsorge leitlinienkonform NICHT empfohlen und
// ist daher bewusst nicht als Monitoring-Target hinterlegt.
* expressedBy = Reference(OnkologinMamma)
* addresses[0] = Reference(ConditionMamma)
* outcomeReference = Reference(ObsDiseaseStatusMamma)


// ---------------------------------------------------------------------
// Nachsorge / Surveillance
// Eigener Nachsorge-CarePlan, der das Nachsorge-Ziel (FollowUpGoal) trägt.
// Enthält die geplante (noch nicht durchgeführte) jährliche Mammographie als
// Maßnahme. Bewusst OHNE outcomeReference/Observation: die Nachsorge liegt in
// der Zukunft (ab 08/2026), ein Negativbefund existiert daher noch nicht.
// ---------------------------------------------------------------------

Instance: ServiceRequestMammographieNachsorge
InstanceOf: ServiceRequest
Usage: #example
Title: "Anforderung Nachsorge-Mammographie (Beispiel)"
Description: "Geplante jährliche Nachsorge-Mammographie der operierten und der kontralateralen Brust zur Rezidiv-/Zweitkarzinom-Früherkennung (S3-Leitlinie Mammakarzinom / AGO)."
* status = #active
* intent = #plan
* code = http://loinc.org#24606-6 "MG Breast Screening"
* code.text = "Nachsorge-Mammographie beidseits (jährlich)"
* subject = Reference(PatientinMamma)
* occurrenceDateTime = "2027-04-15"
* requester = Reference(OnkologinMamma)
* reasonReference = Reference(ConditionMamma)

Instance: CarePlanMammaNachsorge
InstanceOf: OnkoCarePlan
Usage: #example
Title: "Onkologischer CarePlan – Nachsorge/Surveillance Mamma (Beispiel)"
Description: "Nachsorgeplan nach abgeschlossener kurativer Primärtherapie (pCR): trägt das Nachsorge-Ziel (Rezidivfreiheit, Funktion, Lebensqualität) und die geplante jährliche Mammographie als Maßnahme."
// custodian: verantwortliche Stelle für Pflege/Aktualisierung des Plans
* extension[custodian].valueReference = Reference(TumorzentrumMamma)
* status = #active
* intent = #plan
* category = http://snomed.info/sct#736252007 "Cancer care plan"
* subject = Reference(PatientinMamma)
* period.start = "2026-08-15"
* addresses = Reference(ConditionMamma)
* goal = Reference(FollowUpGoal)
* author = Reference(OnkologinMamma)
// Geplante Nachsorge-Maßnahme: jährliche Mammographie (noch kein Ergebnis/Befund)
* activity[0].reference = Reference(ServiceRequestMammographieNachsorge)

