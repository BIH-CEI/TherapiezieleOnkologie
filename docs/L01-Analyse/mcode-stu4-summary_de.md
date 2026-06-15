# mCODE STU4 – Analysebaustein „Onkologische Therapieziele"

Baustein für Liefergegenstand LG-01 · Gematik-Auftrag · BIH-CEI

**Quelle:** HL7 *Minimal Common Oncology Data Elements (mCODE) Implementation Guide* v4.0.0 (STU4, publiziert 16.02.2025, FHIR R4, US-Realm, Lizenz CC0-1.0). Träger: CodeX FHIR Accelerator (MITRE Corporation + American Society of Clinical Oncology). Canonical: [hl7.org/fhir/us/mcode](https://hl7.org/fhir/us/mcode) · Build IG: [build.fhir.org/ig/HL7/fhir-mCODE-ig](https://build.fhir.org/ig/HL7/fhir-mCODE-ig/)

**Status:** STU4, der bislang umfangreichste Release. Rund 53 FHIR-Profile in sechs Domänen, über 103 ValueSets, mehr als 130 Beispiele. Internationaler Referenzstandard für die strukturierte Modellierung onkologischer EHR-Daten.

## 1. Anwendungskontext und Zielgruppe

mCODE adressiert insbesondere:

- **Comparative Effectiveness Analysis:** Vergleich von Behandlungsergebnissen über Versorgungssysteme hinweg, um klinische Entscheidungen kooperativ zu unterstützen.
- **NGS-Integration:** Anbindung von Next-Generation-Sequencing-Daten an Therapie-Effektivitätsanalysen für Präzisionsonkologie.
- **Zielgruppen:** Krankenhausinformationssysteme und EHR-Hersteller, klinisch-onkologische Forschung, Krebsregister (NAACCR-Alignment), Strahlentherapie- und pädiatrische Onkologieanbieter, klinische Studien-Organisationen, Interoperabilitäts-Stakeholder.

Für unsere Spec ist mCODE damit der zentrale Bezugspunkt zur internationalen Vergleichbarkeit oncologischer Datenstrukturen – insbesondere für *ProcedureIntent*, *DiseaseStatus* und die genomische Verknüpfung.

## 2. Übertragbares Muster: Sechs Domänen, CancerPatient als zentraler Hub

mCODE ordnet onkologische Daten in **sechs miteinander verknüpfte Domänen** an, das `CancerPatient`-Profil ist der zentrale Knoten.

| Domäne | Schlüsselprofile | Scope |
|---|---|---|
| **Patient Information** | CancerPatient, HumanSpecimen, MCODEPatientBundle, MCODEPatientGroup | Demografie, Proben, Patient-Bundles für Datenaustausch |
| **Disease Characterization** | PrimaryCancerCondition, SecondaryCancerCondition, CancerStage, TNMStageGroup, TumorMarkerTest, Tumor, TumorSize, HistologicBehaviorAndType, HistologicGrade, TumorMorphology, CancerRiskAssessment | Diagnose, Staging (TNM + 15 Nicht-TNM-Systeme), Morphologie, Risikoassessment |
| **Health Assessment** | ECOGPerformanceStatus, KarnofskyPerformanceStatus, LanskyPlayPerformanceStatus, DeauvilleScale, BodySurfaceArea, Comorbidities, HistoryOfMetastaticCancer | Funktionsstatus, pädiatrisches Performance-Assessment, Lymphom-Response, Body-Metriken |
| **Genomics** | GenomicsReport, GenomicVariant, GenomicRegionStudied | Genomische Testergebnisse, Varianten (HGVS/ISCN), untersuchte Regionen; kompatibel mit Genomic Reporting IG |
| **Cancer Treatments** | CancerRelatedMedicationRequest, CancerRelatedMedicationAdministration, CancerRelatedSurgicalProcedure, RadiotherapyCourseSummary, RadiotherapyVolume | Medikation, Chirurgie, Strahlentherapie inkl. Modalität, Technik, Dosis |
| **Outcomes** | CancerDiseaseStatus, TumorSize | Verlaufstracking (responding, stable, progressing), Tumormessungen |

**Wichtige strukturelle Prinzipien:**

- mCODE schreibt **nicht** vor, welche Daten für jede\*n Patient\*in erfasst werden müssen. Es liefert Muster und Templates mit kontrollierten Terminologien für den Fall, dass Daten ausgetauscht werden.
- Daten außerhalb der mCODE-Profile lassen sich weiterhin als Standard-FHIR-Ressourcen austauschen.
- Terminologisch nutzt mCODE 14 externe Codesysteme: SNOMED CT, ICD-10-CM, ICD-O-3, LOINC, RxNorm, NCI Thesaurus, HGNC/HGVS, UCUM, CPT/ICD-10-PCS.

## 3. Therapiezielrelevante Elemente

Vier Bereiche von mCODE sind für „Onkologische Therapieziele" direkt anschlussfähig:

- **Treatment Intent:** Die `ProcedureIntent`-Extension (curative, palliative, diagnostic, preventive, supportive, screening) bietet das Fundament, auf dem strukturierte Therapieziele aufbauen können.
- **Disease Status Tracking:** `CancerDiseaseStatus` und das `ConditionStatusTrendVS` (responding, stable, progressing, remission) liefern das Outcome-Vokabular, auf das Therapieziele referenzieren.
- **Staging und Prognose:** Cancer-Staging-Profile und das (neue) Risk-Assessment-Framework liefern den klinischen Kontext für die Zielbestimmung.
- **Performance Status:** ECOG, Karnofsky und (für die pädiatrische Onkologie) Lansky sind Schlüsseleingaben für die Therapieziel-Entscheidung.

## 4. Lücken in mCODE und Lösungsansätze für unsere Spec

| Lücke / Designentscheidung in mCODE | Lösungsansatz für unsere Spec |
|---|---|
| **Keine expliziten Therapieziele** (Heilung, Lebensverlängerung, Symptomkontrolle, Lebensqualität) | Eigene Profile `OnkoTherapyGoal` (auf `Goal`) mit codiertem Zielart-Set; verknüpft mit `CarePlan` und `OnkoTherapyLine` |
| **Keine Therapielinien-Notation** | EnLiST-basierte `OnkoTherapyLine` ergänzen, mit Anschluss an mCODE-`CancerRelatedMedicationRequest` |
| **US-Realm-Bindung** (US Core 6.1.0 als Voraussetzung) | mCODE-Profile als Referenzfolie und Inspiration nutzen; eigene Profile auf MII-KDS-Onkologie verankern; Mapping-Tabelle auf mCODE-Profile als Option |
| **Terminologie überwiegend US-zentriert** (RxNorm, ICD-10-CM) | Für DE entsprechende Pendants verankern (ATC, ICD-10-GM, OPS), mit ConceptMaps |
| **Kein expliziter MDT/Tumorboard-Modus** | Wird in der Spec über CPG-on-FHIR-Pattern abgebildet (siehe CPG-Baustein); Molekulares Tumorboard explizit als Use Case |
| **Patient-Reported-Outcomes** nicht im Kernscope | Anbindung an PCO IG (siehe PCO-Baustein) |
| **Pflegeprozess** zwischen STU-Releases und unserer Spec | KIG-Onko hält Mapping-Versionen synchron zu mCODE-Releases; pro Major-Release ein Review-Zyklus |

## 5. Direkt übernehmbare Elemente

- **ProcedureIntent-Extension** als Modellierungsbasis für Treatment Intent in `OnkoTherapyLine` und `OnkoTherapyGoal`.
- **CancerDiseaseStatus + ConditionStatusTrendVS** als Outcome-Vokabular und Trend-Tracking-Pattern.
- **Strukturierung in sechs Domänen** als Gliederungsmuster für das Informationsmodell.
- **Sliced ValueSets** mit klar getrennten Subsets (TNM × Nicht-TNM × pädiatrische Systeme) als Vorbild für unsere eigenen Setting-/Phasen-ValueSets.
- **Genomik-Anbindung** via `GenomicsReport` als Anknüpfungspunkt für die geplante Modellierung des Molekularen Tumorboards.

## 6. Fazit: Was wir übernehmen und warum

**Übernehmen:**
- **mCODE-Profile als internationale Referenzfolie** für unsere onkologischen Datenstrukturen. Begründung: international etabliert, von ASCO und MITRE getragen, semantisch breit abgedeckt (Diagnose, Staging, Therapie, Outcomes, Genomik) und CC0-lizenziert. Ermöglicht Outcome-Vergleichbarkeit gegen US- und internationale Datensätze.
- **ProcedureIntent-Extension** für Treatment Intent in unseren Therapielinien- und Therapieziel-Profilen – strukturelles Vorbild, semantisch direkt nutzbar.
- **CancerDiseaseStatus + ConditionStatusTrendVS** als Outcome-Vokabular für die Therapieziel-Verlaufsdarstellung.

**Erweitern / spezialisieren:**
- **Eigene `OnkoTherapyGoal`-Ressource** (auf `Goal`), die mCODE-Outcome-Vokabular referenziert, aber die Zielart strukturiert codiert (Heilung, Lebensverlängerung, Symptomkontrolle, Lebensqualität).
- **MII-Anbindung statt US-Core**: deutsche Datenelemente und Terminologien als primäre Interop-Basis; Mapping auf mCODE als sekundäre Beilage.
- **Therapielinien via EnLiST** (siehe EnLiST-Baustein) – mCODE bietet keine LoT-Notation; EnLiST schließt diese Lücke.

**Nicht übernehmen / bewusst abweichen:**
- **US-Realm-spezifische Profile** (CapabilityStatement-Anforderungen, US-Core-Abhängigkeiten) – nicht relevant für die deutsche Versorgungsrealität.
- **US-Terminologien (RxNorm, ICD-10-CM)** als Primärbindung – wir nutzen ATC und ICD-10-GM, mit ConceptMaps zu mCODE.

## 7. Quellen

- mCODE STU4 IG: [hl7.org/fhir/us/mcode/STU4](https://hl7.org/fhir/us/mcode/STU4/)
- mCODE CI Build: [build.fhir.org/ig/HL7/fhir-mCODE-ig](https://build.fhir.org/ig/HL7/fhir-mCODE-ig/)
- CodeX FHIR Accelerator: [www.hl7.org/codex](https://www.hl7.org/codex/)
- mCODE GitHub Repository: [github.com/HL7/fhir-mCODE-ig](https://github.com/HL7/fhir-mCODE-ig)
- mCODE Data Dictionary (STU4): im IG-Verzeichnis verlinkt
- Verbundene Standards: Genomic Reporting IG, NAACCR Cancer Registry Standards
