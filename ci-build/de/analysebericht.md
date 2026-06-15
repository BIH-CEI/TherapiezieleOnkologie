# Analysebericht (LG-01) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Analysebericht (LG-01)

### Analysebericht LG-01

Liefergegenstand **LG-01** des Gematik-Auftrags C002717 (BIH-CEI). Dieser Bericht analysiert sechs internationale und nationale FHIR-/Standardisierungs-Quellen auf Übertragbarkeit für die deutsche Spezifikation „Onkologische Therapieziele" und leitet daraus die Architekturentscheidung für diesen Implementation Guide ab.

**Stand:** Entwurf · Mai 2026
 **Projektleitung:** Sylvia Thun · **Technische Leitung FHIR:** Thomas Debertshäuser

Die Original-Fassung (Markdown-Master und docx) liegt im Repository unter [`docs/L01-Analyse/`](https://github.com/BIH-CEI/TherapiezieleOnkologie/tree/main/docs/L01-Analyse).

-------

### Auftrag und Methodik

#### Auftrag

Die Spezifikation „Onkologische Therapieziele" wurde am 02.04.2026 von der gematik (Vertrag C002717) beauftragt. Sie soll bis 30.09.2026 als FHIR-Implementation-Guide vorliegen, ergänzt um ein Konzept zur MII-Integration. Dieser Analysebericht (LG-01) bildet die Grundlage für die Anforderungserhebung im ersten Workshop und für das Informationsmodell sowie den IG-Entwurf in den Folgephasen.

#### Methodik

Untersucht wurden sechs internationale und nationale FHIR-/Standardisierungs-Quellen, mit Fokus auf Übertragbarkeit auf die deutsche Versorgungsrealität:

1. **mCODE STU4**— Minimal Common Oncology Data Elements (HL7 International)
1. **International Patient Summary (IPS) / European Patient Summary (EPS)**— generische Patientenzusammenfassungen
1. **Multiple Chronic Conditions IG (MCC)**— chronische, parallele Erkrankungen, CarePlan-/Goal-Logik
1. **Patient-Centered Outcomes IG (PCO)**— patientenzentrierte Ergebniskonzepte
1. **ESMO EnLiST 2026**— Therapielinien-Konsens für solide Tumoren
1. **HL7 CPG-on-FHIR (CQF Recommendations)**— computable Leitlinien-Repräsentation

Pro Quelle ist die Analyse einheitlich strukturiert: übertragbares Muster, Anwendungsbeispiel, Lücken & Lösungsansätze, direkt übernehmbare Elemente, Fazit "Was nutzen wir warum", Quellen. Den Quellen folgt eine **Synthese mit Architekturentscheidung**.

### mCODE STU4 — Minimal Common Oncology Data Elements

#### mCODE STU4 – Analysebaustein „Onkologische Therapieziele"

Baustein für Liefergegenstand LG-01 · Gematik-Auftrag · BIH-CEI

**Quelle:** HL7 **Minimal Common Oncology Data Elements (mCODE) Implementation Guide** v4.0.0 (STU4, publiziert 16.02.2025, FHIR R4, US-Realm, Lizenz CC0-1.0). Träger: CodeX FHIR Accelerator (MITRE Corporation + American Society of Clinical Oncology). Canonical: [hl7.org/fhir/us/mcode](https://hl7.org/fhir/us/mcode) · Build IG: [build.fhir.org/ig/HL7/fhir-mCODE-ig](https://build.fhir.org/ig/HL7/fhir-mCODE-ig/)

**Status:** STU4, der bislang umfangreichste Release. Rund 53 FHIR-Profile in sechs Domänen, über 103 ValueSets, mehr als 130 Beispiele. Internationaler Referenzstandard für die strukturierte Modellierung onkologischer EHR-Daten.

##### 1. Anwendungskontext und Zielgruppe

mCODE adressiert insbesondere:

* **Comparative Effectiveness Analysis:** Vergleich von Behandlungsergebnissen über Versorgungssysteme hinweg, um klinische Entscheidungen kooperativ zu unterstützen.
* **NGS-Integration:** Anbindung von Next-Generation-Sequencing-Daten an Therapie-Effektivitätsanalysen für Präzisionsonkologie.
* **Zielgruppen:** Krankenhausinformationssysteme und EHR-Hersteller, klinisch-onkologische Forschung, Krebsregister (NAACCR-Alignment), Strahlentherapie- und pädiatrische Onkologieanbieter, klinische Studien-Organisationen, Interoperabilitäts-Stakeholder.

Für unsere Spec ist mCODE damit der zentrale Bezugspunkt zur internationalen Vergleichbarkeit oncologischer Datenstrukturen – insbesondere für **ProcedureIntent**, **DiseaseStatus** und die genomische Verknüpfung.

##### 2. Übertragbares Muster: Sechs Domänen, CancerPatient als zentraler Hub

mCODE ordnet onkologische Daten in **sechs miteinander verknüpfte Domänen** an, das `CancerPatient`-Profil ist der zentrale Knoten.

| | | |
| :--- | :--- | :--- |
| **Patient Information** | CancerPatient, HumanSpecimen, MCODEPatientBundle, MCODEPatientGroup | Demografie, Proben, Patient-Bundles für Datenaustausch |
| **Disease Characterization** | PrimaryCancerCondition, SecondaryCancerCondition, CancerStage, TNMStageGroup, TumorMarkerTest, Tumor, TumorSize, HistologicBehaviorAndType, HistologicGrade, TumorMorphology, CancerRiskAssessment | Diagnose, Staging (TNM + 15 Nicht-TNM-Systeme), Morphologie, Risikoassessment |
| **Health Assessment** | ECOGPerformanceStatus, KarnofskyPerformanceStatus, LanskyPlayPerformanceStatus, DeauvilleScale, BodySurfaceArea, Comorbidities, HistoryOfMetastaticCancer | Funktionsstatus, pädiatrisches Performance-Assessment, Lymphom-Response, Body-Metriken |
| **Genomics** | GenomicsReport, GenomicVariant, GenomicRegionStudied | Genomische Testergebnisse, Varianten (HGVS/ISCN), untersuchte Regionen; kompatibel mit Genomic Reporting IG |
| **Cancer Treatments** | CancerRelatedMedicationRequest, CancerRelatedMedicationAdministration, CancerRelatedSurgicalProcedure, RadiotherapyCourseSummary, RadiotherapyVolume | Medikation, Chirurgie, Strahlentherapie inkl. Modalität, Technik, Dosis |
| **Outcomes** | CancerDiseaseStatus, TumorSize | Verlaufstracking (responding, stable, progressing), Tumormessungen |

**Wichtige strukturelle Prinzipien:**

* mCODE schreibt **nicht** vor, welche Daten für jede*n Patient*in erfasst werden müssen. Es liefert Muster und Templates mit kontrollierten Terminologien für den Fall, dass Daten ausgetauscht werden.
* Daten außerhalb der mCODE-Profile lassen sich weiterhin als Standard-FHIR-Ressourcen austauschen.
* Terminologisch nutzt mCODE 14 externe Codesysteme: SNOMED CT, ICD-10-CM, ICD-O-3, LOINC, RxNorm, NCI Thesaurus, HGNC/HGVS, UCUM, CPT/ICD-10-PCS.

##### 3. Therapiezielrelevante Elemente

Vier Bereiche von mCODE sind für „Onkologische Therapieziele" direkt anschlussfähig:

* **Treatment Intent:** Die `ProcedureIntent`-Extension (curative, palliative, diagnostic, preventive, supportive, screening) bietet das Fundament, auf dem strukturierte Therapieziele aufbauen können.
* **Disease Status Tracking:** `CancerDiseaseStatus` und das `ConditionStatusTrendVS` (responding, stable, progressing, remission) liefern das Outcome-Vokabular, auf das Therapieziele referenzieren.
* **Staging und Prognose:** Cancer-Staging-Profile und das (neue) Risk-Assessment-Framework liefern den klinischen Kontext für die Zielbestimmung.
* **Performance Status:** ECOG, Karnofsky und (für die pädiatrische Onkologie) Lansky sind Schlüsseleingaben für die Therapieziel-Entscheidung.

##### 4. Lücken in mCODE und Lösungsansätze für unsere Spec

| | |
| :--- | :--- |
| **Keine expliziten Therapieziele**(Heilung, Lebensverlängerung, Symptomkontrolle, Lebensqualität) | Eigene Profile`OnkoTherapyGoal`(auf`Goal`) mit codiertem Zielart-Set; verknüpft mit`CarePlan`und`OnkoTherapyLine` |
| **Keine Therapielinien-Notation** | EnLiST-basierte`OnkoTherapyLine`ergänzen, mit Anschluss an mCODE-`CancerRelatedMedicationRequest` |
| **US-Realm-Bindung**(US Core 6.1.0 als Voraussetzung) | mCODE-Profile als Referenzfolie und Inspiration nutzen; eigene Profile auf MII-KDS-Onkologie verankern; Mapping-Tabelle auf mCODE-Profile als Option |
| **Terminologie überwiegend US-zentriert**(RxNorm, ICD-10-CM) | Für DE entsprechende Pendants verankern (ATC, ICD-10-GM, OPS), mit ConceptMaps |
| **Kein expliziter MDT/Tumorboard-Modus** | Wird in der Spec über CPG-on-FHIR-Pattern abgebildet (siehe CPG-Baustein); Molekulares Tumorboard explizit als Use Case |
| **Patient-Reported-Outcomes**nicht im Kernscope | Anbindung an PCO IG (siehe PCO-Baustein) |
| **Pflegeprozess**zwischen STU-Releases und unserer Spec | KIG-Onko hält Mapping-Versionen synchron zu mCODE-Releases; pro Major-Release ein Review-Zyklus |

##### 5. Direkt übernehmbare Elemente

* **ProcedureIntent-Extension** als Modellierungsbasis für Treatment Intent in `OnkoTherapyLine` und `OnkoTherapyGoal`.
* **CancerDiseaseStatus + ConditionStatusTrendVS** als Outcome-Vokabular und Trend-Tracking-Pattern.
* **Strukturierung in sechs Domänen** als Gliederungsmuster für das Informationsmodell.
* **Sliced ValueSets** mit klar getrennten Subsets (TNM × Nicht-TNM × pädiatrische Systeme) als Vorbild für unsere eigenen Setting-/Phasen-ValueSets.
* **Genomik-Anbindung** via `GenomicsReport` als Anknüpfungspunkt für die geplante Modellierung des Molekularen Tumorboards.

##### 6. Fazit: Was wir übernehmen und warum

**Übernehmen:**

* **mCODE-Profile als internationale Referenzfolie** für unsere onkologischen Datenstrukturen. Begründung: international etabliert, von ASCO und MITRE getragen, semantisch breit abgedeckt (Diagnose, Staging, Therapie, Outcomes, Genomik) und CC0-lizenziert. Ermöglicht Outcome-Vergleichbarkeit gegen US- und internationale Datensätze.
* **ProcedureIntent-Extension** für Treatment Intent in unseren Therapielinien- und Therapieziel-Profilen – strukturelles Vorbild, semantisch direkt nutzbar.
* **CancerDiseaseStatus + ConditionStatusTrendVS** als Outcome-Vokabular für die Therapieziel-Verlaufsdarstellung.

**Erweitern / spezialisieren:**

* **Eigene `OnkoTherapyGoal`-Ressource** (auf `Goal`), die mCODE-Outcome-Vokabular referenziert, aber die Zielart strukturiert codiert (Heilung, Lebensverlängerung, Symptomkontrolle, Lebensqualität).
* **MII-Anbindung statt US-Core**: deutsche Datenelemente und Terminologien als primäre Interop-Basis; Mapping auf mCODE als sekundäre Beilage.
* **Therapielinien via EnLiST** (siehe EnLiST-Baustein) – mCODE bietet keine LoT-Notation; EnLiST schließt diese Lücke.

**Nicht übernehmen / bewusst abweichen:**

* **US-Realm-spezifische Profile** (CapabilityStatement-Anforderungen, US-Core-Abhängigkeiten) – nicht relevant für die deutsche Versorgungsrealität.
* **US-Terminologien (RxNorm, ICD-10-CM)** als Primärbindung – wir nutzen ATC und ICD-10-GM, mit ConceptMaps zu mCODE.

##### 7. Quellen

* mCODE STU4 IG: [hl7.org/fhir/us/mcode/STU4](https://hl7.org/fhir/us/mcode/STU4/)
* mCODE CI Build: [build.fhir.org/ig/HL7/fhir-mCODE-ig](https://build.fhir.org/ig/HL7/fhir-mCODE-ig/)
* CodeX FHIR Accelerator: [www.hl7.org/codex](https://www.hl7.org/codex/)
* mCODE GitHub Repository: [github.com/HL7/fhir-mCODE-ig](https://github.com/HL7/fhir-mCODE-ig)
* mCODE Data Dictionary (STU4): im IG-Verzeichnis verlinkt
* Verbundene Standards: Genomic Reporting IG, NAACCR Cancer Registry Standards

### International Patient Summary (IPS) und European Patient Summary (EPS)

##### 1. Management-Zusammenfassung

Die **International Patient Summary (IPS) v2.0.0 STU 2** (HL7 International, FHIR R4, ISO/EN 27269) ist die normative Referenz für condition-agnostische Patientenzusammenfassungen. Die **European Patient Summary (EPS) v1.0.0-xtehr** (HL7 Europe, QA-Preview Februar 2026) leitet sich direkt aus IPS ab („imposes profile IPS Composition“) und ergänzt EU-Core-Profile und Xt-EHR-Obligations. EPS ist die strategisch relevante Bezugsgröße für EHDS-/EEHRxF-Konformität.

Beide Guides liefern **übertragbare strukturelle Muster**, adressieren aber **keinerlei strukturierte Therapieziele, Therapieintention oder Therapielinien**. Das offizielle IPS-Referenzbeispiel ist selbst ein Mammakarzinom-Fall und illustriert die Lücke im Standard direkt. Unsere Spezifikation sollte daher die IPS/EPS-Architektur übernehmen, die Core-Profile um onkologische Tiefe erweitern und die Ziel- und Abschnitts-Konzepte neu definieren.

##### 2. Übertragbares Muster: Composition-Architektur und Plan of Care

IPS definiert eine FHIR-Composition (Document-Type LOINC 60591-5) mit 16 sliced Sektionen: drei Required (Problems 11450-4, Medications 10160-0, Allergies 48765-2), eine Recommended (Immunizations 11369-6), zwölf Optional. Jede Sektion trägt einen LOINC-Code, menschenlesbaren Narrative-Text und eine definierte Ressourcen-Liste; das **emptyReason-Muster** macht „nicht vorhanden“ explizit. Der Slice Composition.event:careProvisioningEvent (v3-ActCode PCPR, event.period) ist der einzige vorhandene Anker für Behandlungszeiträume – mit Kardinalität 0..1 für unsere Spec zu eng. Therapieziel-relevant sind vor allem drei optionale Sektionen:

| | | |
| :--- | :--- | :--- |
| Plan of Care | 18776-5 | CarePlan + Goal – Kernansatz für Therapieziele |
| Patient Story | 81338-6 | Patientenzentrierte Präferenzen, Lebensqualitätsziele |
| History of Past Problems | 11348-0 | Rezidivnachweis, Remissionsstatus |

Die Plan-of-Care-Sektion erlaubt CarePlan und ImmunizationRecommendation; CarePlan.goal → Goal, **aber ein Goal-Profil ist weder in IPS noch in EPS definiert**. IPS ist zudem laut General Principles ein **informatives Dokument** – MedicationRequests oder CarePlans daraus dürfen nicht aktioniert werden. Zentrale Designfrage für unsere Spec: Therapieziele rein deskriptiv oder workflow-fähig?

##### 3. Das IPS-Referenzbeispiel illustriert die Lücke

Das offizielle IPS-Bundle Bundle-IPS-examples-Bundle-01 (Patientin „Martha DeLarosa“, Mammakarzinom Stage II in Remission, abatement = 2015-03) enthält Anastrozol 1 mg als MedicationStatement mit effective: 2016-01 –> (ongoing) und Freitext „treatment for breast cancer“ – **ohne strukturierte Verknüpfung zur Diagnose, ohne Therapieintention, ohne CarePlan/Goal**. Der „Plan of Treatment“ („Continue hormone medication … for total of 5 years and monitor for potential breast cancer recurrence“) steht ausschließlich im Narrative. Menopausal flushing ist als aktives Problem geführt, aber semantisch nicht mit der Hormontherapie verknüpft – obwohl unser Use Case „Therapieumstellung durch Nebenwirkungssymptome“ genau diese Kopplung braucht. Das Beispiel eignet sich in LG-01 als Referenzfall für eine Vorher-/Nachher-Gegenüberstellung gegen unsere Spec.

##### 4. Lücken in IPS/EPS und Lösungsansätze für unsere Spec

| | |
| :--- | :--- |
| Kein Goal-Profil | Neues Profil „Therapieziel Onkologie“ auf Basis Goal (Zielart, Condition-Bezug, Zielzeitraum, Zielstatus, Outcome-Observation) |
| Keine Therapieintention | Codiertes Feld/Extension mit ValueSet kurativ / palliativ / adjuvant / neoadjuvant / Erhaltung – Alignment mit mCODE |
| Keine Therapielinien (ESMO-Notation) | Extension auf MedicationStatement / Procedure oder Attribut am EpisodeOfCare-Profil |
| Kein EpisodeOfCare in Plan of Care | Profil „Behandlungsabschnitt“ (EpisodeOfCare) mit Bezug zu Diagnose, Therapielinie, Intention, Zieletabelle |
| Condition-Profil condition-agnostisch | Onkologische Attribute (Staging, Grading, Biomarker); mCODE PrimaryCancerCondition als Referenzspezifikation |
| Keine strukturierten Therapieabbruch-Gründe | Codiertes ValueSet (Progress / Toxizität / Patientenwunsch / Behandlungsende) als Extension |
| Medikation ↔ Diagnose ↔ Ziel nicht verknüpft | Must-Support auf reasonReference, basedOn, goal in MedicationStatement / Procedure / CarePlan |

##### 5. Direkt übernehmbare Elemente

* Composition-Architektur mit Sektions-Slicing, LOINC-Codierung und verpflichtendem Narrative (Narrative-first-Prinzip) inkl. emptyReason-Muster für fehlende Daten.
* Obligations-Framework (Creator/Consumer Actors mit SHALL:populate, SHALL:handle, SHOULD:display); EPS zeigt mit Obligation-only-Profilen über EU-Core ein übertragbares Muster.
* SNOMED CT (GPS/MII-Kernset) und LOINC als primäre Terminologien, validiert über MII-Terminologieserver.
* Patient (EPS) und EU-Core-Profile als Baseline für Personen-/Organisationsreferenzen, wenn EHDS-Kompatibilität Ziel ist.

**Vor LG-01-Release zu verifizieren**

LOINC-Codes und display-Strings gegen MII-Terminologieserver · EHDS-Zeitleiste (Publikation 05.03.2025, Inkrafttreten 26.03.2025, Implementing Acts bis 26.03.2027, PS-/ePrescription-Pflicht ab 26.03.2029) gegen Primärtext der Verordnung im EU-Amtsblatt · mCODE-Feldname treatmentIntent gegen aktuelle mCODE-Version · EPS-Status (QA-Preview) gegen aktuellen GitHub-Stand (github.com/hl7-eu/eps) · Konformitätsstrategie: volle IPS/EPS-Konformität vs. „nur aligned“ mit eigenem Document-Type.

**Quellen: hl7.org/fhir/uv/ips/STU2 · build.fhir.org/ig/hl7-eu/eps · Projektbeschreibung BIH-CEI Onkologie Therapieziele**

### Multiple Chronic Conditions IG (MCC)

##### 1. Management-Zusammenfassung

Der HL7 FHIR US Multiple Chronic Conditions (MCC) eCare Plan Implementation Guide definiert auf Basis von FHIR R4 ein Care-Plan-zentriertes Modell für die strukturierte Repräsentation, Abfrage und den Austausch longitudinaler Versorgungspläne. Im **Unterschied zu IPS und EPS**, die primär dokumentorientierte Patientenzusammenfassungen mit festen Sektionen bereitstellen, modelliert MCC den Behandlungsplan selbst als **dynamische, konsensbasierte Struktur** aus Concerns, Goals, Interventions und Outcomes. MCC ist deshalb weniger als weiterer Summary-Guide relevant, sondern als inhaltlich näherliegende **Referenz für die semantische Abbildung von Zielzuständen, Maßnahmen und Ergebnissen**.

Der IG profiliert CarePlan und Goal ausdrücklich und erlaubt strukturierte Referenzen zwischen adressierten Gesundheitsproblemen, übergeordneten Zielen und geplanten bzw. durchgeführten Aktivitäten. MCC bleibt fachlich auf Multiple Chronic Conditions im US-Kontext ausgerichtet und enthält **keine onkologiespezifischen Konzepte** für Therapieintention, Therapielinie, Tumoransprechen, Progress oder Abbruchgründe. Für eine onkologische Spezifikation ist MCC daher eher ein **Architektur- und Workflow-Vorbild** als eine direkt ausreichende Fachreferenz.

##### 2. Mögliche übertragbare Elemente aus CarePlan und Goal

MCC profiliert den CarePlan als zentrales Koordinationsobjekt und beschreibt ihn explizit als „consensus-driven dynamic plan“, der priorisierte Concerns, Goals und geplante Interventions verschiedener Versorgungsteams für mehrere Erkrankungen zusammenführt. Damit adressiert MCC genau den Strukturraum, der für onkologische Therapieziele benötigt wird: ein gemeinsames Planobjekt mit Bezug auf Erkrankungen, Ziele, Maßnahmen und beobachtete Outcomes.

Elemente für onkologische Therapieziele:

| | |
| :--- | :--- |
| CarePlan.addresses  | Referenziert Gesundheitsprobleme (Verbindung Krankheit – CarePlan) |
| CarePlan.goal | Ein oder mehrere übergreifende Ziele des Behandlungsplans |
| CarePlan.activity.reference | Repräsentiert geplante Aktivitäten (z.B. MedicationRequest, ServiceRequest) |
| CarePlan.activity.outcomeReference | Repräsentiert durchgeführte Aktivitäten oder dokumentierte Ergebnisse (z.B. Procedure, Observation) |
| Goal.addresses | Erlaubt Verknüpfung vom Therapieziel mit Problemen, die mit diesem Ziel adressiert werden (Condition, Observation, ServiceRequest, etc.) |

StructureDefintion von CarePlan: [https://build.fhir.org/ig/HL7/fhir-us-mcc/StructureDefinition-MCCCarePlan.html](https://build.fhir.org/ig/HL7/fhir-us-mcc/StructureDefinition-MCCCarePlan.html)

StructureDefintion von Goal: [https://build.fhir.org/ig/HL7/fhir-us-mcc/StructureDefinition-MCCGoal.html](https://build.fhir.org/ig/HL7/fhir-us-mcc/StructureDefinition-MCCGoal.html)

##### 3. Relevanz für onkologische Therapieziele

Für onkologische Therapieziele ist MCC vor allem dort nützlich, wo ein longitudinaler Behandlungsplan mit mehreren Beteiligten, konkurrierenden Prioritäten und auswertbaren Zielzuständen modelliert werden soll. Konzeptionell lassen sich mit MCC mehrere onkologisch relevante Zieltypen abbilden, auch wenn das IG sie nicht onkologiespezifisch vorgibt:

* **Krankheitsbezogene Ziele:** z.B. Remission erreichen, Progress vermeiden oder Symptomlast senken **(über Goal.description, Goal.addresses, Goal.target)**
* **Patientenbezogene Ziele**: z.B. Funktionsniveau erhalten, Lebensqualität verbessern **(über Goal + ergänzende Observations / Narrative)**
* **Maßnahmenbezogene Ziele**: z.B. Durchführung einer systemischen Therapie, supportive Maßnahmen, Monitoring **(über CarePlan.activity.reference, CarePlan.activity.outcomeReference)**
* **Zeitbezogene Ziele**: z.B. Erreichen eines Zustands bis zu einem Stichtag oder innerhalb eines Therapieabschnitts **(über Goal.duex und CarePlan.period)**

Aber: die fachliche Präzisierung für die Onkologie fehlt.

##### 4. Lücken von MCC und Lösungsansätze für unsere Spec

| | |
| :--- | :--- |
| Kein onkologiespezifisches Condition-/Disease-Modell | Onkologisches Condition-Profil ergänzen, z. B. mit TNM, Grading, Biomarker-Referenzen und Disease-Status |
| **Wie in IPS/EPS: Keine Therapieintention** | **Siehe IPS/EPS Analyse: Codiertes Feld/Extension mit ValueSet kurativ / palliativ / adjuvant / neoadjuvant / Erhaltung – Alignment mit mCODE** |
| **Wie in IPS/EPS: Keine Therapielinien (ESMO-Notation)** | **Siehe IPS/EPS Analyse: Extension auf MedicationStatement / Procedure oder Attribut am EpisodeOfCare-Profil** |
| Keine standardisierte Abbildung von Tumoransprechen auf die Behandlung | Observation-Profil mit Response-Assessment mit Refernez 🡪 Goal.outcomeReference |
| **Wie in IPS/EPS: Keine strukturierten Therapieabbruch-Gründe oder Therapiewechsel** | **Siehe IPS/EPS Analyse: Codiertes ValueSet (Progress / Toxizität / Patientenwunsch / Behandlungsende) als Extension** |

##### 5. Fazit: Direkt übernehmbare Elemente

* **CarePlan** als zentrales Steuerobjekt: Im MCC ist der CarePlan selbst interoperables Kernelement
* **Goal** als eigenständige, referenzbasierte Ressource
* **Must-support auf zielrelevante Beziehungen** z.B. CarePlan.adresses oder CarePlan.goal
* **Unterscheidung** zwischen **geplanten und durchgeführten Aktivitäten** (CarePlan.activity.reference und CarePlan.activity.outcomeReference)

> **Quellen: https://confluence.hl7.org/spaces/PC/pages/66935243/Multiple+Chronic+Conditions+MCC+eCare+Plan· https://build.fhir.org/ig/HL7/fhir-us-mcc/index.html · Projektbeschreibung BIH-CEI Onkologie Therapieziele****goal-acceptance Extension -> Hat der Patient die Behandlung abgelehnt / anderes Ziel?****Timeline des Relationship-Modells -> Goal definieren, Activities, Reference checken, war gut oder nicht?, neue Behandlungsepisode****Outcome-Clustering****Activity Referenzen übernehmen (nicht alles in den Details des CarePlan) –> wird in R5 auch so gemacht**

### Patient-Centered Outcomes IG (PCO)

#### 1. Überblick

Der **Person-Centered Outcomes (PCO) Implementation Guide** ist ein HL7 FHIR-Standard (v1.0.0, STU 1) für den Austausch von Informationen zu patientenzentrierten Ergebnissen. Er wurde vom **HL7 International / Patient Care Committee** entwickelt und basiert auf FHIR R4 (4.0.1), US Realm, CC0-Lizenz.

Der PCO IG entstand als Weiterentwicklung des MCC (Multiple Chronic Conditions) eCare Plan FHIR IG und unterstützt die Identifikation und das Tracking von persönlichen Outcome-Zielen, die für Patienten am wichtigsten sind.

| | |
| :--- | :--- |
| **Version** | 1.0.0 — STU 1 (Maturity Level 2) |
| **FHIR-Version** | R4 (4.0.1) |
| **Herausgeber** | HL7 International / Patient Care Committee |
| **Realm** | US (international anwendbar) |
| **Lizenz** | CC0-1.0 (Public Domain) |
| **URL** | http://hl7.org/fhir/us/pco |

#### 2. Kernkonzept: „What Matters Most“

Der PCO IG verfolgt einen Ansatz der **kollaborativen Zielsetzung**: Statt reiner Symptombehandlung steht im Mittelpunkt, was dem einzelnen Patienten am wichtigsten ist. Der Prozess umfasst:

* Identifikation persönlicher Gesundheitspriorititäten („What Matters Assessment“)
* Festlegung personalisierter, messbarer Ziele
* Bewertung von Bereitschaft und Barrieren
* Kontinuierliches Monitoring des Fortschritts
* Integration in umfassende Pflegepläne

#### 3. FHIR-Profile

| | | |
| :--- | :--- | :--- |
| **Ziele** | Person-Centered Goal | Basisprofil für alle PCO-Ziele |
|   | GAS Goal | Goal Attainment Scaling |
|   | PROM Goal | Patient-Reported Outcome Measures |
| **Assessment** | What Matters Assessment | Identifikation der Patientenpriorititäten |
|   | Readiness Assessment | Bereitschaftsbewertung |
|   | Goal Barriers Assessment | Barrieren-Analyse |
| **Koordination** | Person-Centered Care Plan | Patientenzentrierter Pflegeplan |
| **Outcomes** | GAS Score Observation | GAS-Ergebnis-Dokumentation |
|   | PROM Score Observation | PROM-Ergebnis-Dokumentation |

#### 4. Messmethoden

##### Goal Attainment Scaling (GAS)

GAS individualisiert die Zielmessung durch Festlegung von Baseline- und Ziel-Erreichungsgraden für spezifische Patientenziele. Die kollaborative Zielsetzung mit numerischen Skalen repräsentiert verschiedene Erreichungsstufen.

##### Patient-Reported Outcome Measures (PROM)

PROMs nutzen validierte, standardisierte Instrumente zur Messung von Ergebnissen, die Patienten als wichtig erachten. Terminologisch werden LOINC-Codes und spezifische Value Sets (GAS Score Type, PROM Target Measures) verwendet.

#### 5. Anwendungsfälle

* Patienten mit komplexen Versorgungsbedarfen: Identifikation von Prioritäten und Fortschrittsverfolgung
* Klinische Implementierung über das gesamte Versorgungskontinuum
* Gesundheitscoaching und Care Coordination
* Qualitätsmessung und Forschung
* Sektorenübergreifende Integration via FHIR-Interoperabilität

#### 6. Relevanz für die KIG Onko Therapieziel-Spezifikation

Der PCO IG ist hochrelevant für die gematik-Spezifikation „Therapieziel Onkologie“:

* PCO liefert ein generisches FHIR-Framework für patientenzentrierte Ziele — die KIG Onko Spezifikation kann darauf aufbauen
* Die GAS- und PROM-Ansätze sind direkt auf onkologische Therapieziele anwendbar
* Die „What Matters Most“-Philosophie passt zur partizipativen Entscheidungsfindung (Shared Decision Making) bei der Therapiezielfestlegung
* Das Person-Centered Goal Profil kann für onkologische Use Cases profiliert werden
* Lücke: PCO ist generisch, nicht onkologiespezifisch — die KIG Onko Spezifikation füllt die onkologische Lücke (z.B. Heilung, Lebensverlängerung, Symptomkontrolle, Lebensqualität)
* Komplementarität zu mCODE: PCO adressiert Patientenziele, mCODE die klinische Datenstruktur — beide zusammen bilden das Gesamtbild

#### 7. Referenzen

* [PCO IG (Published)](https://hl7.org/fhir/us/pco/) — https://hl7.org/fhir/us/pco/
* [PCO IG (CI Build)](https://build.fhir.org/ig/HL7/pco-ig/) — https://build.fhir.org/ig/HL7/pco-ig/
* [MCC eCare Plan IG](https://hl7.org/fhir/us/mcc/) — https://hl7.org/fhir/us/mcc/
* [mCODE STU4](https://hl7.org/fhir/us/mcode/STU4/) — https://hl7.org/fhir/us/mcode/STU4/

### ESMO EnLiST 2026 — Lines of Systemic Therapy

#### EnLiST – Analysebaustein „Onkologische Therapieziele"

Baustein für Liefergegenstand LG-01 · Gematik-Auftrag · BIH-CEI

**Quelle:** Saini KS, Koopman M, Martins-Branco D et al. **ESMO adaptation of Lines of Systemic Therapy (EnLiST): a consensus framework for standardising the designation of lines of therapy in solid tumours.** Annals of Oncology 2026;37(5):608–623. DOI: [10.1016/j.annonc.2026.02.008](https://doi.org/10.1016/j.annonc.2026.02.008)

**Status:** Publiziert Februar 2026, erster paneuropäischer Delphi-Konsens (26 Stakeholder, Endkonsens ≥ 87,5 %, vier Leitlinien einstimmig). Geltungsbereich solide Tumoren; hämatologische Adaption als separates Konzept.

##### 1. Problemstellung, die EnLiST adressiert

Die Zählung von Therapielinien war in der internationalen Onkologie bislang inkonsistent: Studienprotokolle, Real-World-Datenbanken, Erstattungssysteme und einzelne Tumorboards verwendeten unterschiedliche Definitionen von "1L", "2L", "Maintenance" oder "Re-Challenge". Folgen waren u. a. nicht vergleichbare Studienpopulationen, fehlende Reproduzierbarkeit von Outcome-Auswertungen und Schwierigkeiten in der korrekten Anwendung linienspezifischer Zulassungen.

EnLiST stellt erstmals ein paneuropäisches Konsensvokabular bereit, das **was als Linie zählt**, **wie Modifikationen abgegrenzt werden** (New / Modified / Same) und **welche Setting-Stufe zugrunde liegt** (early / advanced / investigational) einheitlich regelt. Für unsere Spec ist EnLiST damit die strukturierende Achse, an der sich die Visualisierung und die FHIR-Modellierung von Therapielinien orientieren.

##### 2. Übertragbares Muster: X.Y-Notation, Drei-Settings-Architektur, Mindestdatensatz

Drei strukturierende Elemente sind direkt übernehmbar:

**Settings-Trennung (separate Zählung):**

* **eLoT** – Early-stage (resektabel, neoadjuvant, adjuvant, perioperativ)
* **aLoT** – Advanced-stage (lokal fortgeschritten oder metastasiert)
* **iLoT** – Investigational: SACT mit ausschließlich nicht EMA/FDA-zugelassenen Komponenten, unabhängig vom Setting

**Notation pro Setting als X.Y:**

* X = Gesamtzahl der **New LoTs** (links vom Punkt)
* Y = Gesamtzahl der **Modified LoTs** seit der letzten New LoT (rechts vom Punkt; bei jedem X-Inkrement Reset auf 0)
* Gesamtdarstellung: `[eLoT + aLoT] + iLoT`, z. B. `[eLoT 2.0 + aLoT 2.1] + iLoT 1.0`

**Drei-Änderungstypen-Logik:**

* **New LoT** – bei klinischer Progression (cPD) oder fehlendem adäquatem Ansprechen
* **Modified LoT** – bei nicht-progressionsbedingten Änderungen (Intoleranz, Hinzunahme/Wechsel eines Wirkstoffs, finanzielle/logistische Gründe)
* **Same LoT** – bei prospektiv geplanten Änderungen (Dosis, Zeitplan, Applikationsweg, Erhaltungstherapie, Therapiepause mit unveränderter Reintroduktion)

**Mindestdatensatz (10 Items, 100 % Delphi-Konsens):**

1. Clinical setting · 2. Treatment intent · 3. Datum letzte cPD · 4. Anticancer modality · 5. SACT-Agent(en) · 6. Startdatum · 7. Stoppdatum · 8. Grund des Absetzens · 9. Kommentare · 10. Lines of therapy

**Vier Konsens-Leitlinien** regeln Re-Challenge nach Therapiepause, Wechsel ohne cPD, Hinzunahme/Wegfall von Wirkstoffen (siehe Sektion 3 für Mapping auf unsere Spec).

##### 3. Anwendungsbeispiel (aus dem Paper)

Mammakarzinom Stage III mit kurativer Intention:

* FEC × 6 → BCS + EBRT → Tamoxifen 2 J → Letrozol 3 J geplant; Letrozol-Intoleranz, Wechsel auf Anastrozol = `eLoT 1.1` (Modified)
* Isoliertes Lokalrezidiv → Mastektomie + Exemestan = `eLoT 2.0` (New)
* Spätere nicht-resektable Manifestation → Ribociclib + Fulvestrant = `aLoT 1.0` (im fortgeschrittenen Setting eigene Zählung)
* Phase-I LAG3-Antikörper nach cPD = `iLoT 1.0`

Gesamtnotation: `[eLoT 2.0 + aLoT 1.0] + iLoT 1.0`. Das Beispiel zeigt, dass die Notation gleichzeitig Zeitverlauf, Setting-Übergänge und Studienbeteiligung in kompakter Form abbildet – direkt nutzbar als Achsenmodell für unsere Visualisierung.

##### 4. Lücken in EnLiST und Lösungsansätze für unsere Spec

| | |
| :--- | :--- |
| **Nur solide Tumoren**im Scope; Hämatologie ausgeklammert | Setting-Achse parametrierbar (`lot_axis_type`=`solid-setting`oder`haem-phase`); Hämatologie-Adaption als separate IG-Seite |
| **Lokoregionale Therapien**(Chirurgie, Strahlentherapie, Ablation) ohne LoT | Eigene Modalitäten-Spur in der Visualisierung, nicht in LoT-Zählung |
| Keine harte**Treatment-Holiday-Dauer**als Cut-off | Entitäts- und protokollspezifische Heuristiken zulassen; optional als Konfiguration |
| **"Locally advanced"**unter aLoT geführt – tumorspezifisch diskutabel | aLoT führen, aber`clinicalSetting`codiert (early / advanced-locally / advanced-metastatic) erhalten |
| **Chemoradiotherapie-LoT**abhängig von SACT-Dosis und klinischem Urteil | Im Mindestdatensatz optional als codiertes Kommentar-Feld "CRT included"; explizite Doku im IG |
| **Intent vs. Setting**entkoppelt – Paper rät zur Setting-Achse als primärer Strukturierung | Beide Felder erhalten:`clinicalSetting`und`treatmentIntent`separat, Setting impliziert nicht 1:1 Intent (z. B. palliativer Frühphasen-Einsatz) |
| Kein**FHIR-Profil-Set**– EnLiST ist konzeptionell, nicht profiltechnisch | Eigene Profile:`OnkoTherapyLine`,`OnkoTherapyIntent`(Extension),`OnkoClinicalSetting`(Extension); CodeSysteme`onko-lot-setting`,`onko-treatment-intent` |
| Keine direkte**Anbindung an MII KDS** | Mapping-Tabellen: EnLiST`anticancer_modality`× MII-Medikation; EnLiST`cPD`× oncoBox/oBDS-Progression;`stop_reason`× oBDS-Therapieendegrund |
| Keine**Transformationsereignisse**(auch in soliden Tumoren relevant, z. B. NSCLC → SCLC unter EGFR-TKI) | Eigenes Event-Konzept analog zur Hämatologie-Adaption; ValueSet`onko-transformation-event` |

##### 5. Direkt übernehmbare Elemente

* **X.Y-Notation** mit `[eLoT + aLoT] + iLoT`-Gesamtdarstellung – als computable Repräsentation in einem `OnkoLineOfTherapy`-Profil mit Slot-basierten Komponenten
* **Drei-Änderungstypen-Logik** (New/Modified/Same) – ValueSet `onko-lot-change-type` und Pflichtfeld
* **Mindestdatensatz mit 10 Items** als MustSupport-Set des LoT-Profils
* **Vier Konsens-Leitlinien** als Invariants/Guidance im IG (z. B. `inv-onko-1`: "Re-Challenge nach Therapiepause ohne dazwischenliegendes anderes Regime ergibt Same LoT")
* **SACT-Definition** mit acht Subkategorien (zytotoxisch, endokrin, zielgerichtet, Immuntherapie, Zell-/Gentherapie, Krebsvakzine, Radiopharmaka, Sonstige) – CodeSystem `onko-anticancer-modality`
* **iLoT-Konzept** als Differenzierungsachse für Studienteilnahme – essenziell für RWD-Auswertbarkeit gemischter Real-World-/Studien-Verläufe
* **Trennung Intent / Setting / LoT-Zählung** als drei orthogonale Achsen – auch als Kommunikationsmuster für Workshop 1

##### 6. Fazit: Was wir übernehmen und warum

**Übernehmen:**

* **X.Y-Notation und Drei-Settings-Architektur** als zentrale Strukturachse unseres Therapielinien-Konzepts. Begründung: einziger paneuropäischer Delphi-Konsens für solide Tumoren mit hohem Konsensgrad; international anschlussfähig; existierende Alternativen (Saini & Twelves 2021, NHS England, OPTUM Claims, ChemoCare) sind entweder Vorläufer oder kontextlimitiert; mCODE/PCO/IPS adressieren das Problem strukturell nicht.
* **Mindestdatensatz mit 10 Items** als MustSupport-Set. Begründung: 100 %-Konsens-Item-Liste, deckt sich semantisch mit MII-KDS-Medikation und oBDS-Therapie zu ~80 %; die im EnLiST-Mindestdatensatz zusätzlich strukturierten Felder (cPD-Datum, Treatment Intent, Stop-Reason als codiertes Set) sind in der MII teilweise abgedeckt (z. B. **SystemtherapieEndeGrund** in `Procedure.outcome` und der Onko-Verlauf), EnLiST aggregiert sie aber auf einer linienübergreifenden Ebene, die in MII bisher fehlt.
* **Trennung von Treatment Intent und Clinical Setting** als orthogonale Felder. Begründung: für deutsche Versorgung (palliative Frühphasen-Therapie, kurative Intention auch im fortgeschrittenen Setting bei Oligometastasen) ist die 1:1-Kopplung "advanced = palliativ" empirisch falsch; EnLiST entkoppelt sie sauber.
* **iLoT-Konzept** für Studienteilnahme. Begründung: in deutschen onkologischen Zentren (besonders Comprehensive Cancer Centers, NCTs) ist Studienbeteiligung Versorgungsstandard; ohne iLoT-Trennung wird die Erstattungslogik (Linien-gebundene Zulassung) verfälscht.

**Optional langfristig erweitern (jetzt nicht im Hauptpfad):**

* **Hämatologie-Adaption** durch Phasen-Achse statt Setting-Achse. Begründung: hämatologische Patient*innen sind in deutschen Tumorzentren regelmäßig vertreten, aber ein hämatologisches EnLiST-Pendant ist nicht konsensual etabliert (außer Rajkumar 2015 für Multiples Myelom). Ohne Konsens und Evidenz würden wir uns die Spec unnötig erschweren; die Adaption wird daher als langfristige Erweiterung beschrieben, nicht als Pflichtinhalt von LG-03.
* **Transformationsereignisse** (z. B. NSCLC → SCLC unter EGFR-TKI). Begründung: klinisch relevant, aber tumorspezifisch und ohne breite Standardisierung – als optionale Extension einplanen, nicht als Pflichtfeld.

**Bewusst offen halten:**

* **Locally-advanced-Setting:** EnLiST führt es pauschal unter aLoT. Wir halten die Setting-Codierung über ein **`extensible` oder `preferred` Binding** offen, damit tumorspezifische Granularität (early / advanced-locally / advanced-metastatic) als Option möglich bleibt, ohne die Entscheidung im Hauptpfad zu erzwingen. Die finale Bindungsstärke ist mit der onkologischen Fachkommission abzustimmen.
* **Reine Konzeptebene:** wir liefern Profile, ValueSets, Extensions, Invariants in FHIR; das ist unser Mehrwert gegenüber dem rein konzeptionellen EnLiST.

##### 7. Vor LG-01-Release zu verifizieren

* **Konformitätsstrategie:** EnLiST-Notation strikt oder mit Erweiterungen (Phasenachse Hämatologie, Transformationsevents) – Auswirkung auf internationalen Anschluss klären
* **GRADE-Bewertungsangaben** (qualityOfEvidence / strengthOfRecommendation) für Anbindung an S3-Leitlinien klären
* **Status des Frameworks:** "road testing" durch ESMO 2026–2027 – unsere Spec versionskompatibel zu möglichen Updates halten
* **Onkologische Fachkommission der KIG** einbinden für Validierung der Übertragbarkeit auf deutsche Versorgungsrealität (Konsiliumsärzte, Tumorboard-Strukturen). Verteilung dieses Berichts bzw. einer Kurzfassung über die **AG Interoperabilität in der Onkologie**.
* **Erhaltungstherapie und CRT:** Versorgungspraxis in DE gegen EnLiST-Auslegung spiegeln. EnLiST behandelt prospektiv geplante Erhaltungstherapie als **Same LoT** (z. B. CDK4/6-Inhibitor-Maintenance, Olaparib-Maintenance, FOLFIRINOX-TNT rectal); das passt für solide Tumoren. Hämatologische Erhaltungs- und Konsolidierungstherapie folgt einer anderen Logik (Induktion–Konsolidierung–Maintenance als eine Linie) und ist außerhalb des Hauptscope.

##### 8. Quellen

* Saini KS, Koopman M, Martins-Branco D et al. **ESMO adaptation of Lines of Systemic Therapy (EnLiST): a consensus framework for standardising the designation of lines of therapy in solid tumours.** Annals of Oncology 2026;37(5):608–623. DOI: [10.1016/j.annonc.2026.02.008](https://doi.org/10.1016/j.annonc.2026.02.008)
* Saini KS, Twelves C. **Determining lines of therapy in patients with solid cancers: a proposed new systematic and comprehensive framework.** Br J Cancer 2021;125(2):155–163. (EnLiST-Vorgänger)
* Rajkumar SV, Richardson PG, San Miguel JF. **Guidelines for determination of the number of prior lines of therapy in multiple myeloma.** Blood 2015;126(7):921–922. (Hämatologie-Vorbild für Multiples Myelom, außerhalb des Hauptscope unserer Spec)

### HL7 CPG-on-FHIR (CQF Recommendations)

#### HL7 CPG-on-FHIR – Analysebaustein „Onkologische Therapieziele"

Baustein für Liefergegenstand LG-01 · Gematik-Auftrag · BIH-CEI

**Quelle:** HL7 **Clinical Practice Guidelines (CPG-on-FHIR) Implementation Guide** v2.0.0 STU2 (CI-Build Mai 2026; Package `hl7.fhir.uv.cpg#2.0.0`, FHIR R4). Maintained durch HL7 Clinical Decision Support / Clinical Quality Framework. Untersuchte Seiten: **Methodology**, **Profiles**. URLs: [build.fhir.org/ig/HL7/cqf-recommendations/en/methodology.html](https://build.fhir.org/ig/HL7/cqf-recommendations/en/methodology.html) · [build.fhir.org/ig/HL7/cqf-recommendations/en/profiles.html](https://build.fhir.org/ig/HL7/cqf-recommendations/en/profiles.html)

**Status:** STU2, methodisch ausgereift, in Produktion u. a. bei CDC Opioid und WHO Antenatal Care.

##### 1. Übertragbares Muster: Referenzierbare Leitlinieninhalte

CPG-on-FHIR ist für unsere Spec primär als **Referenzrahmen für Leitlinieninhalte** relevant. Statt der vollen computable Tiefe (CQL-Bibliotheken, ausführbare Pathway-Engine) nutzen wir die Profil- und Verlinkungslogik, um existierende Leitlinien – die parallel über AWMF erschlossen werden – strukturiert in unseren Verläufen zugänglich zu machen.

Die zentralen übertragbaren Elemente sind:

* **Reasoning-Kernressourcen:** `Library` (CQL-Logik bei Bedarf), `ActivityDefinition`, `PlanDefinition`, `Measure`.
* **Drei PlanDefinition-Anwendungen:** `CPGRecommendationDefinition` (Event-Condition-Action-Regel), `CPGStrategyDefinition` (sequenzierte Aktivitäten), `CPGPathwayDefinition` (längsschnittliche Orchestrierung).
* **Aktivitäts-Workflow Definition → Request → Event:** Pro Aktivitätstyp je ein Definitions-, Request- und Event-Profil mit `CPG`-Präfix; Verknüpfung über `instantiatesCanonical` und `basedOn`. Damit wird **Soll** (Empfehlung) vom **Ist** (verordnete bzw. verabreichte Therapie) sauber getrennt.
* **`relatedArtifact` und `instantiatesCanonical`** als Verlinkungs-Mechanik zu normativen Leitlinienquellen – der Kernhebel für unsere "Verweisbild"-Logik.
* **Optionale Bewertungs-Extensions** (`qualityOfEvidence`, `strengthOfRecommendation`, `directionOfRecommendation`); für die deutsche Versorgung referenzieren wir primär die **S3-Leitlinien** mit ihrem AWMF-Bewertungsschema; Mapping auf ESMO und weitere Evidenzsysteme kann später ergänzt werden, ist aber für die Erstversion nicht zwingend.

##### 2. Anwendungsmuster: Leitlinienkonformität vs. Abweichung

In unserer Spec wird CPG-on-FHIR überall dort eingesetzt, wo **eine referenzierbare Leitlinienempfehlung existiert**. Liegt sie nicht vor oder weicht der konkrete Fall davon ab – etwa bei **patientenseitiger Abweichung** oder **Shared Decision Making** – übernimmt die CarePlan/Goal-Logik (siehe IPS/MCC/PCO-Bausteine) die ausführliche Beschreibung, ggf. mit eigenen Evidenzangaben.

Diese Asymmetrie spiegelt die Versorgungsrealität (15–30 % strukturierte Abweichung nach WiZen-, NCCN- und mCRC-AIO-Daten):

| | | |
| :--- | :--- | :--- |
| Leitlinienkonform | Verweis (`instantiatesCanonical`) auf`CPGRecommendationDefinition`/`CPGPathwayDefinition` | Kompakt: "folgt S3-Leitlinie X, Empfehlung Y" |
| Bewusste Abweichung (Präferenz, Komorbidität, Studienteilnahme) | `CPGCarePlan`mit eigener Beschreibung;`instantiatesCanonical`bleibt als "abgewichen von" sichtbar | Parallele Spur mit Begründung |
| Unbewusste Abweichung (Versorgungsdrift) | `CPGCarePlan`+`CPGDetectedIssue`-Flag | Differenz sichtbar, Audit-Anker |
| Kontraindizierte Empfehlung | `CPGCarePlan`+`CPGFlag`/`CPGRecordDetectedIssueTask`mit Begründung | Empfehlung explizit als "nicht angewandt – Kontraindikation" |

##### 3. Lücken in CPG-on-FHIR und Lösungsansätze für unsere Spec

| | |
| :--- | :--- |
| **CPG-Personas / Activity Type / Common Process CodeSysteme**sind international gehalten (US-/CDC-/WHO-zentriert) | Eigene CodeSysteme`onko-personas`,`onko-activity-type`ableiten; Mapping-Tabelle auf CPG-Common erstellen; bei generischen Konzepten direkt CPG-Common nutzen |
| **Kein Bewertungssystem vorgeschrieben** | Primärbezug**S3-Leitlinien (AWMF)**; optional über ConceptMap auf GRADE und ESMO Magnitude of Clinical Benefit Scale (MCBS) abbildbar – nicht im Hauptpfad |
| **IPS als Interop-Basis**ist im CPG-IG empfohlen, aber unvollständig | Für unsere Spec**MII KDS-Onkologie**als primärer Interop-Basis; Mapping auf IPS/EPS für EHDS-Anschluss separat |
| **MDT-Logik nicht explizit modelliert**– kein "Tumorboard-Entscheidung als Pathway-Knoten"-Pattern | Eigene`OnkoTumorboardDecision`-Aktivität (auf`CPGServiceRequestActivity`basierend) mit`OnkoClinicalImpression`als Event; Molekulares Tumorboard als Sonderfall |
| **CarePlan-Detail bei Abweichung**ist im IG nur skizziert, nicht als Pflicht-Pattern ausformuliert | Pflicht-Pattern in unserer Spec: bei Abweichung von einer referenzierten Recommendation MUSS ein`OnkoCarePlan`-Detail mit codiertem`OnkoDetectedIssue`(deviation-reason) hinterlegt werden |
| **Versions-Pflege**zwischen Leitlinien-Update und IG-Release ist Trägerverantwortung – kein Standardprozess | KIG-Onko-Pflegeprozess definieren: Versionierung an S3-Leitlinien-Updates des Leitlinienprogramms Onkologie gekoppelt |
| **Mapping ist Pflicht**– IPS und andere Standards nie vollständig | Mapping als eigenes Lieferobjekt im IG ausweisen (analog DEQM, SDC); ConceptMaps für ICD-10-GM × SNOMED, oBDS × FHIR-Profile, MII-Module × Onko |
| **Patientensicht / Patient-Reported-Outcomes**sind im CPG-Kern nicht prominent | Anbindung an PCO IG ergänzen (siehe PCO-Baustein) – insbesondere für Shared Decision Making und Abweichungsbegründungen aus Patientenperspektive |

##### 4. Direkt übernehmbare Elemente

* **PlanDefinition-Pathway-Pattern** als natürliche Modellierungsform für onkologische Behandlungspfade (z. B. mKRK 1L → 2L → 3L als `CPGPathwayDefinition`, einzelne Linien als `CPGStrategyDefinition`, konkrete Therapieentscheidungen als `CPGRecommendationDefinition`).
* **Definition–Request–Event-Triade** als Achsenmodell: Definition = normative Empfehlung, Request = geplante Linie, Event = tatsächlich verabreichte Therapie.
* **`instantiatesCanonical` + `relatedArtifact`** als verbindlicher Verweis auf die S3-Leitlinienempfehlung.
* **Optionale Bewertungs-Extensions** für Empfehlungen – primär getragen durch S3-Empfehlungsstärke und LoE, optional gemappt auf GRADE.
* **CRMI (Canonical Resource Management Infrastructure)** für Lifecycle-Management, Versionierung, Paketierung.
* **Shareable-/Publishable-Capability-Profile** als Pflicht für alle definitorischen Ressourcen – sorgt für konsistente Metadaten.

##### 5. Fazit: Was wir übernehmen und warum

**Übernehmen (referenziert, nicht explizit ausgebaut):**

* **CPG-on-FHIR als Referenzrahmen** für die Verlinkung zu Leitlinienempfehlungen. Wir nutzen die Profil- und Verlinkungsmechanik, nicht die volle computable Tiefe – sofern keine ausführbare Pathway-Logik benötigt wird.
* **PlanDefinition mit drei Anwendungen** (Pathway / Strategy / Recommendation) als zentrale Strukturressource für referenzierbare Behandlungspfade.
* **Definition–Request–Event-Pattern** als Modellierung jedes Therapiebausteins – Voraussetzung für `instantiatesCanonical`-basierte Adhärenzauswertung.
* **Verweisbild-/Detailbild-Asymmetrie** (Leitlinie verlinkt, CarePlan ausführlich bei Abweichung).
* **Bewertungs-Extensions optional** unterstützen; primär referenzieren wir **S3-Leitlinien-Empfehlungsstärken und LoE**, weitere Systeme (GRADE, ESMO-MCBS) später als ConceptMap-Anhang.

**Erweitern / spezialisieren:**

* **Eigene `Onko`-Profile** auf CPG-Basis (`OnkoTherapyLine`, `OnkoTumorboardDecision`, `OnkoCarePlan`, `OnkoDetectedIssue`). Begründung: deutsche Versorgungsstrukturen (Tumorboard-Pflicht, Konsiliumssystem, DKG-Quality-Indicators) benötigen spezifische Erweiterungen.
* **Pflicht-Pattern für CarePlan-Detail bei Abweichung** statt nur skizzierter Möglichkeit. Begründung: macht Abweichungsdokumentation auditierbar (relevant für WiZen-artige Versorgungsforschung und QI-Erfüllung).
* **MII KDS-Onkologie statt IPS** als primäre Interop-Basis. Begründung: deutsche Realität, etablierte Datenflüsse aus DIZ/oncoBox/oBDS; IPS/EPS-Anschluss als sekundäre Mapping-Schicht für EHDS-Konformität.

**Nicht übernehmen / bewusst abweichen:**

* **CPG-internationale CodeSysteme** (Personas, Activity Type, Process) im Original. Stattdessen eigene `onko-*` CodeSysteme mit Mapping-Tabelle auf CPG-Common.
* **Reine Ableitung von IPS-Composition** für Patient Summary. Begründung: für unseren Use Case "Therapieziel & Linien" reicht IPS-Komposition nicht – siehe IPS/EPS-Baustein.

##### 6. Quellen

* HL7 **CPG-on-FHIR IG** v2.0.0 STU2 (CI-Build Mai 2026). Methodology: [build.fhir.org/ig/HL7/cqf-recommendations/en/methodology.html](https://build.fhir.org/ig/HL7/cqf-recommendations/en/methodology.html) · Profiles: [build.fhir.org/ig/HL7/cqf-recommendations/en/profiles.html](https://build.fhir.org/ig/HL7/cqf-recommendations/en/profiles.html)
* HL7 **Clinical Quality Language (CQL)**: [cql.hl7.org](https://cql.hl7.org/)
* HL7 **Canonical Resource Management Infrastructure (CRMI)** IG
* AWMF Regelwerk Leitlinien (Empfehlungsstärken, LoE): [awmf.org/regelwerk](https://www.awmf.org/regelwerk/)
* Verwandte Specification IGs: Quality Measure IG, DEQM, SDC (Structured Data Capture), EBM-on-FHIR

### Weitere relevante Initiativen

#### Weitere relevante Initiativen

Baustein für Liefergegenstand LG-01 · Gematik-Auftrag · BIH-CEI

Zwei weitere Initiativen sind für den Kontext dieser Spezifikation relevant, wurden hier aber bewusst nicht in der gleichen Tiefe analysiert wie die in Kapitel 3 untersuchten Standards. Sie werden im weiteren Projektverlauf — insbesondere in der Phase LG-05 (MII-Integrationskonzept) — eng angebunden.

##### MII-Erweiterungsmodul Onkologie

Das MII-Erweiterungsmodul Onkologie ist die nationale FHIR-Spezifikation für die strukturierte Erfassung onkologischer Versorgungsdaten in der Medizininformatik-Initiative. Es baut auf dem MII-Kerndatensatz auf, integriert die Datensätze des oBDS (onkologischer Basisdatensatz, ADT/GEKID) und liefert die Datenelemente, mit denen die deutschen Datenintegrationszentren (DIZ) und Cancer Centers heute arbeiten.

Diese Spezifikation **baut auf dem MII-Erweiterungsmodul Onkologie auf**: die in unserer Spec eingeführten Profile (z. B. `OnkoTherapyLine`, `OnkoCarePlan`, `OnkoTherapyGoal`) referenzieren die MII-Profile als Datenelemente-Basis. Auf eine eigene Tiefenanalyse wird hier verzichtet, weil die Ausschreibung explizit darauf aufbaut und in Phase LG-05 ein **schriftliches Integrationskonzept** in das MII-Erweiterungsmodul vorgesehen ist, das die finale Verzahnung herstellt.

Ergänzend ist das BMBF-geförderte **PM4Onko** (Personalisierte Medizin für die Onkologie) als komplementäre Initiative zu nennen — Miteinbeziehung erfolgt im Rahmen der Workshop-Phase über die Comprehensive Cancer Centers und NCTs.

Quellen:

* MII Kerndatensatz Modul Onkologie: [simplifier.net/medizininformatikinitiative-modulonkologie](https://simplifier.net/medizininformatikinitiative-modulonkologie)
* MII GitHub: [github.com/medizininformatik-initiative/kerndatensatzmodul-onkologie](https://github.com/medizininformatik-initiative/kerndatensatzmodul-onkologie)
* oBDS / ADT-GEKID: Klinische Krebsregister, Datenstandard der Gesellschaft der epidemiologischen Krebsregister in Deutschland

##### European Common Cancer Data Model (HL7 Europe)

Das **European Common Cancer Data Model** ist eine HL7-Europe-Initiative zur gemeinsamen Strukturierung onkologischer Daten auf europäischer Ebene. Es zielt darauf ab, EHDS-konforme Datenaustausch- und Auswertungsstrukturen für Krebspatient*innen über Sektoren- und Ländergrenzen hinweg zu ermöglichen.

Der Reifegrad ist derzeit **konzeptionell und logisch**: es liegen konzeptuelle und logische Modelle vor, aber **noch keine validierten FHIR-Profile**. Eine direkte Übernahme in unsere Spec ist daher zum jetzigen Zeitpunkt nicht möglich. Die Initiative ist gleichwohl wichtig zu beobachten, weil:

* sie ein natürliches **Andockziel für EHDS-/EPS-Konformität** im onkologischen Kontext darstellt,
* die in dieser Spec entstehenden Modelle (insb. die `OnkoTherapyLine`- und `OnkoTherapyGoal`-Strukturen, der CarePlan-/Goal-Pfad und die Leitlinienreferenz-Mechanik) **sehr wahrscheinlich Eingang in zukünftige Versionen** des Common Cancer Data Model finden werden,
* eine bidirektionale Mapping-Strategie schon jetzt mitgedacht werden sollte, um spätere Konvergenz zu erleichtern.

Quelle: [build.fhir.org/ig/hl7-eu/cancer-common](https://build.fhir.org/ig/hl7-eu/cancer-common/index.html)

##### Konsequenz für die Spec

Beide Initiativen sind in der Architekturentscheidung implizit berücksichtigt:

* **MII-Erweiterungsmodul Onkologie** ist in Schicht 4 (Datenelemente & Terminologie) der tragende Standard und wird in LG-05 mit einem Integrationskonzept formal angeschlossen.
* **European Common Cancer Data Model** wird über die EHDS-/EPS-Mapping-Schicht (siehe IPS/EPS-Baustein) anschlussfähig gehalten; eine eigene Profilbindung ist zum jetzigen Zeitpunkt nicht sinnvoll.

### Architekturentscheidung

#### Architekturentscheidung – Spezifikation „Onkologische Therapieziele"

Baustein für Liefergegenstand LG-01 · Gematik-Auftrag · BIH-CEI

##### Kernaussage

Die Spezifikation beruht auf vier Schichten mit klarer Rollenverteilung und einem expliziten Fallback-Pfad:

![](architektur_stack.png)

##### Rollen der vier Schichten

**Schicht 1 – Therapielinien-Strukturachse (EnLiST):** liefert die internationale Konsensnotation für Linien, Settings und Änderungstypen. Definiert **was** gezählt wird und **wie** es dargestellt wird. Konzeptionell, nicht profiltechnisch.

**Schicht 2 – Methodik & computable Repräsentation (CPG-on-FHIR):** liefert die Vorgehensweise (Select → Represent → Translate → Validate, L1–L4-Continuum) und das FHIR-Profil-Set (PlanDefinition, ActivityDefinition, Library, Definition–Request–Event-Triade). Wird im **Primärpfad** verwendet: existiert für den Fall eine computable Leitlinienempfehlung, wird sie via `instantiatesCanonical` referenziert – kompakte Darstellung, keine Wiederholung des normativen Inhalts.

**Schicht 3 – Plan- und Ziel-Logik (CarePlan / Goal):** liefert die generische Repräsentation des realen Versorgungsverlaufs. Wird im **Fallback** verwendet:

1. wenn für den klinischen Fall keine computable Leitlinienempfehlung existiert (Off-Label, seltene Tumoren, Studienteilnahme, palliative Sondersituationen);
1. wenn der reale Verlauf von der Leitlinie abweicht (bewusst, unbewusst oder kontraindiziert) – dann wird der CarePlan zum Detailbild neben dem Verweisbild auf die Leitlinie.

Quellen für das Plan-/Ziel-Pattern: MCC eCare Plan, mCODE-Treatment-Pattern, ergänzt um die Inhaltsstruktur aus IPS (Plan-of-Care-Sektion).

**IPS/EPS als Boundary Exchange Format – verpflichtend zu berücksichtigen:** IPS ist in dieser Architektur **kein** Fallback-Standard, sondern ein **Brückenformat** an den Sektorengrenzen. Konkrete Rollen:

* **Prepopulate:** Beim Übergang von Versorgungssektor zu Versorgungssektor (z. B. Klinikaufnahme nach ambulanter Vorgeschichte, Reha-Verlegung) wird unsere Spec aus einem IPS-/EPS-Dokument **vorbefüllt** – Diagnosen, Medikation, Allergien, ggf. Therapieabschnitte werden übernommen.
* **Writeback:** Beim Sektorenwechsel in die Gegenrichtung schreiben wir die aktuelle Therapieziel-/Therapielinien-Sicht so in ein IPS-/EPS-Dokument zurück, dass die Folgesektoren sie verlustarm lesen können.
* **EHDS-Anschluss:** EPS ist die strategische Bezugsgröße für EHDS-/EEHRxF-Konformität und damit hochrelevant für den **Datenaustausch innerhalb Europas**.

Daraus folgt: Unsere Spec MUSS ein **IPS-/EPS-Mapping** als eigenes Lieferobjekt führen und die Boundary-Transactions sauber abbilden. Die Empfehlung „Plan-/Ziel-Quelle ist nicht IPS" gilt nur für den internen Modellierungspfad, nicht für die Sektorengrenze.

**Schicht 4 – Datenelemente & Terminologie (MII Onkologie):** liefert die deutschen Datenelemente und Terminologien als primäre Interoperabilitätsbasis. Anschluss an EHDS via Mapping auf IPS/EPS als sekundäre Schicht.

##### Fallback-Logik: wann Primärpfad, wann Fallback

| | | |
| :--- | :--- | :--- |
| Leitliniengerechte 1L bei häufigem Tumor (z. B. KRK mFOLFOX6) | Primär –`instantiatesCanonical`auf normative Recommendation | Optional – kompakter CarePlan als Container für Verweis |
| Bewusste Abweichung (Patient*innenpräferenz, Komorbidität) | Verweis bleibt | **Fallback aktiv**– CarePlan mit Detailbeschreibung +`CPGDetectedIssue` |
| Seltene Tumoren / Off-Label / keine computable Leitlinie | – | **Fallback aktiv**– CarePlan + Goal als alleinige Repräsentation |
| Studienteilnahme (iLoT in EnLiST) | Wenn Studienprotokoll als CPG vorliegt: Verweis | Sonst Fallback – CarePlan referenziert ResearchStudy |
| Versorgungsdrift / unbewusste Abweichung | Verweis bleibt | **Fallback aktiv**– CarePlan +`CPGDetectedIssue`als Audit-Anker |
| Tumorboard-Entscheidung mit eigener Empfehlung | Verweis auf S3-Leitlinie +`OnkoTumorboardDecision`als ergänzende Recommendation | CarePlan als Container; bei Abweichung zusätzlich Fallback |

##### Implikation für die Profile

Die FHIR-Profile der Spec gliedern sich entsprechend:

* **EnLiST-konforme Profile:** `OnkoTherapyLine`, `OnkoTherapyIntent`-Extension, `OnkoClinicalSetting`-Extension
* **CPG-on-FHIR-basierte Profile (Primärpfad):** `OnkoPathwayDefinition` (auf `CPGPathwayDefinition`), `OnkoStrategyDefinition`, `OnkoRecommendationDefinition`, `OnkoMedicationRequest` (auf `CPGMedicationRequest`) etc.
* **CarePlan/Goal-Profile (Fallback):** `OnkoCarePlan` (auf `CPGCarePlan`, der wiederum CarePlan profiliert), `OnkoGoal` (mit Therapieziel-Codierung), `OnkoDetectedIssue` für Abweichungsbegründung
* **MII-Anschluss-Profile (Datenelemente):** Slicing auf MII KDS-Profile (Medikation, Prozedur, Diagnose) als Basis für `OnkoMedicationStatement`, `OnkoProcedure`, `OnkoCondition`

##### Warum diese Architektur

* **EnLiST** ist alternativlos: einziger paneuropäischer Delphi-Konsens für solide Tumoren, international anschlussfähig, sonst nichts Vergleichbares.
* **CPG-on-FHIR** ist alternativlos: einziges FHIR-natives Framework mit Methodik **und** Profil-Set für computable Leitlinien; Alternativen (Quality Measure IG, SDC, CDS Hooks pur) decken nur Teilaspekte.
* **CarePlan/Goal als Fallback** ist notwendig: WiZen-/internationale Studien zeigen 15–30 % strukturierte Abweichung; für seltene Tumoren und Studieneinsätze fehlen computable Leitlinien systematisch. Ohne Fallback bleibt jeder vierte bis fünfte Verlauf unmodellierbar.
* **MII KDS-Onkologie als Datenelemente-Basis** ist gesetzt: deutsche Versorgungsrealität, etablierte DIZ-Datenflüsse, gematik-/MII-Mandat. IPS/EPS sekundär für EHDS-Konformität.

##### Out-of-Scope-Entscheidungen mit Begründung

* **Hämatologische Malignome:** als separate IG-Seite (Phasen- statt Setting-Achse), nicht im Kern-Datenmodell. Begründung: EnLiST adressiert sie nicht; hämatologisches Pendant existiert noch nicht; Versorgungslogik (Induktion-Konsolidierung-Maintenance, Allo-SZT, CAR-T) unterscheidet sich strukturell.
* **Lokoregionale Therapien** (Chirurgie, Strahlentherapie, Ablation): in der Visualisierung als eigene Modalitäten-Spur, nicht in die LoT-Zählung. Begründung: EnLiST-konform; klinisch hochrelevant, aber konzeptuell von Systemtherapie zu trennen.
* **Patient-Reported-Outcomes:** via PCO IG anbinden, nicht selbst entwickeln. Begründung: PCO ist die international etablierte Lösung; Eigenentwicklung wäre Duplizierung.
* **EHDS-Anschluss:** via Mapping-Schicht auf IPS/EPS, nicht durch IPS-konforme Composition als Primärformat. Begründung: für computable Pfade ist IPS-Composition zu schmal (siehe IPS/EPS-Baustein).

##### Konsequenzen für die Folgephasen

* **Workshop 1 (Anforderungserhebung):** Use Cases auswählen, die alle vier Schichten exemplifizieren – empfohlen: KRK 1L (Primärpfad), mBC mit Komorbidität (Fallback wegen Abweichung), Sarkom in Studie (Fallback wegen iLoT/fehlender Leitlinie). Ein **Molekulares Tumorboard**-Use-Case soll explizit aufgenommen werden, um die Verzahnung von genomischen Befunden, CPG-Recommendations und CarePlan-Abweichungen zu prüfen.
* **Informationsmodell:** auf Basis der vier Schichten gegliedert, klare Trennung zwischen normativer Empfehlung und realer Versorgung.
* **IG-Entwurf:** Profil-Set wie oben skizziert; CPG-on-FHIR und CarePlan/Goal-Pattern als verbundenes Set in FSH/SUSHI.
* **MII-Integrationskonzept:** Schicht 4 in den MII-AGs Onkologie und Medikation gespiegelt.

