# HL7 CPG-on-FHIR — Methodology — Zusammenfassung

**Quellen:** HL7 *Clinical Practice Guidelines (CPG-on-FHIR) Implementation Guide* v2.0.0 STU2 (CI-Build, abgerufen Mai 2026; Package `hl7.fhir.uv.cpg#2.0.0`, FHIR R4 4.0.1, Generierungsdatum 29.04.2026). Verwendete Seiten:
- *Methodology* — [build.fhir.org/ig/HL7/cqf-recommendations/en/methodology.html](https://build.fhir.org/ig/HL7/cqf-recommendations/en/methodology.html)
- *Profiles* — [build.fhir.org/ig/HL7/cqf-recommendations/en/profiles.html](https://build.fhir.org/ig/HL7/cqf-recommendations/en/profiles.html)

Weitere Seiten des IG (Approach, Terminology, Libraries, Artifacts, Examples) sind hier **nicht** berücksichtigt.

**Trägerschaft:** HL7 Clinical Quality Information Work Group, Clinical Quality Framework (CQF). Steht in der Tradition von HL7 CDS Hooks, FHIR Reasoning Module, Quality Measure IG, DEQM, SDC.

---

## 1. Hintergrund

Klinische Leitlinien sind heute überwiegend als Fließtext-PDF publiziert. Eine maschinell ausführbare Repräsentation ist möglich, aber aufwendig — und sie ist in der Regel nicht von den Leitlinienautor\*innen, sondern in jedem Einführungssetting neu erstellt. Folgen: hohe Implementierungskosten, Inkonsistenz, schlechte Pflegbarkeit, Verzögerung der Versorgungswirksamkeit.

Das **CPG-on-FHIR-IG** liefert genau dafür die methodische Brücke: eine **strukturierte Vorgehensweise**, mit der eine narrative Leitlinie schrittweise in einen ausführbaren FHIR-Wissensartefakt überführt wird, und ein **Profilset** für die Repräsentation auf jeder Stufe. Ziel ist nicht "die eine wahre Implementierung", sondern eine austauschbare, versionierbare, abbildbare Form, die zwischen Leitlinien-Autorenschaft, Implementierungsstandort und CDS-Engine vermittelt.

## 2. Knowledge Representation Continuum (L1–L4)

CPG-on-FHIR versteht Wissensrepräsentation **nicht als diskrete Stufen, sondern als Kontinuum**. Vier Pegelpunkte dienen der Verständigung:

- **L1 — Narrativ:** Leitlinientext in natürlicher Sprache, ggf. mit erklärenden Abbildungen. Direkt aus dem Leitliniendokument übernommen.
- **L2 — Halb-strukturiert:** Pseudo-Code, Datenwörterbuch und Flussdiagramme. Domänennah, ohne formales Schema. Übersetzungsstufe zwischen klinischem Wissen und Informatik.
- **L3 — Strukturiert:** FHIR-Ressourcen, CQL-Bibliotheken, FHIR-Profile. Formal, prüfbar, austauschbar, aber noch nicht direkt ausgeführt.
- **L4 — Ausführbar:** Im Versorgungssystem laufende Implementierung (CDS Hooks, EHR-Workflow, SMART-on-FHIR-App).

Der Übergang ist **graduell und nicht linear** — typischerweise pendeln Teams zwischen Stufen (z. B. Validierung auf L3 deckt eine Mehrdeutigkeit in L1 auf).

## 3. Implementation-Guide-Kategorien

CPG-on-FHIR ordnet das Ökosystem in vier IG-Kategorien:

1. **Foundational Standards** — FHIR-Kerne (Foundation/Conformance/Administration/Clinical/Reasoning), FHIRPath, **CQL**, **CDS Hooks**, SMART-on-FHIR.
2. **Model IGs** — Datenmodell-Standards für breite Austauschbarkeit: **International Patient Summary (IPS)**, **US Core**, **QI-Core**. In Deutschland strukturell analog: **MII KDS-Module**.
3. **Specification IGs** — Methodische Profile für Wissensartefakte: **Quality Measure IG**, **DEQM**, **SDC** (Structured Data Capture), **CPG-on-FHIR**, **EBM-on-FHIR**.
4. **Content IGs** — Konkrete Leitlinien-Implementierungen, z. B. **HEDIS**, **CDC Opioid Prescribing**, **WHO Antenatal Care**. Bauen auf Specification + Model IGs auf.

Wichtig: **Content IGs werden nicht zwingend als HL7-Standard balotiert.** Sie nutzen den FHIR-Publikationswerkzeugkasten, die inhaltliche Hoheit liegt bei den jeweiligen Trägern (Fachgesellschaften, Qualitätsagenturen, Leitlinienherausgeber).

## 4. Vier-Schritte-Methodik

Der CPG-on-FHIR-Workflow ist als **Select → Represent → Translate → Validate** strukturiert. Teamzusammensetzung wechselt je Phase.

### 4.1 Select — "Was ist im Scope?"

Fünf Achsen (W-Fragen):

| Achse | Frage | CodeSystem |
|---|---|---|
| **Personas** | Wer? | `cpg-common-persona-cs` |
| **Activities** | Was? | `cpg-activity-type-cs` |
| **Processes** | Wann? | `cpg-common-process-cs` |
| **Settings** | Wo? | HL7 V3 `ServiceDeliveryLocationRoleType` |
| **Support** | Warum? | Evidence/Rating-Extensions |

Team: klinische\*r SME, Health Informaticist, Terminologe; optional Implementierungsstandort.

### 4.2 Represent — Halb-strukturierte Aufbereitung (L2)

Drei Outputs:

- **Data Dictionary:** Präzise Beschreibung jedes relevanten Datenelements (Kontext, Details, Modellierungshinweise).
- **Funktionale Beschreibungen:** Domänenspezifischer Pseudo-Code für klinische Logik.
- **Flussdiagramme:** Entscheidungs- und Prozessfluss.

Drei **Enablement-Levels** für Empfehlungen:
1. Kontextualisierter Hinweis (Message).
2. Umsetzbare Intervention (Request/Proposal).
3. Prozessintegration mit Erfüllungstracking (Event).

Team: identisch zu Select (SME + Informaticist + Terminologe).

### 4.3 Translate — Formale FHIR-Artefakte (L3)

Reihenfolge im IG-Workflow:

1. **Content IG anlegen** (typischerweise GitHub-Repo, kontrollierter Canonical-URL — Domain der Trägerorganisation).
2. **FHIR-Profile** für Datenelemente (Case Features) erstellen.
3. **CodeSystem-** und **ValueSet-Ressourcen** definieren.
4. **CQL-Bibliotheken** schreiben (Tools: VSCode + CQL Plug-in, **CDS Connect Authoring Tool**, CQL-to-ELM-Translator).
5. **ActivityDefinition** für jede Aktivitätstyp.
6. **PlanDefinition** als Recommendation, Strategy oder Pathway.
7. Supporting Information per Extensions anhängen.

Team: Health Informaticist, **Knowledge Engineer** (FHIR/IG-Tooling), **Knowledge Author** (CQL/FHIR/CPG), Terminologe.

### 4.4 Validate — Korrektheitsprüfung

Mehrere Ebenen, idealerweise alle:

- **Conformance Check** gegen Profile (`fhir validator`).
- **Expert Review** durch Leitlinienautor\*innen oder qualifizierte Fachpersonen.
- **Testszenarien** mit `ExampleScenario`-Ressourcen.
- **Unit Tests** (positiv, negativ, edge cases).
- **Komponententests** mit **CQF Ruler** (Referenzimplementierung von HAPI).
- **Integrationstests** mit CQF Ruler + **CDS Hooks Sandbox**.

## 5. Kern-FHIR-Pattern

### 5.1 Reasoning-Ressourcen

Vier kanonische Ressourcen sind das Rückgrat:

- **`Library`** — CQL-Logik und -Kriterien (auch ELM eingebettet).
- **`ActivityDefinition`** — wiederverwendbare Schablone einer durchführbaren Aktivität.
- **`PlanDefinition`** — Empfehlung, Strategie oder Pfad.
- **`Measure`** — Qualitätsmessungsspezifikation (für Quality Measure IG / DEQM).

### 5.2 Activity-Workflow-Pattern (Definition → Request → Event)

FHIR-typisches Drei-Dimensions-Muster:

- **Definitions:** `ActivityDefinition` als Schablone — z. B. `AdministerMedication`, `CollectInformation`, `ServiceRequest`, `MedicationRequest`, `RecordInferenceTask`.
- **Requests/Proposals:** Vorschlags-Instanzen mit Intent `proposal` — z. B. `CPGMedicationRequest`, `CPGServiceRequest`, `CPGQuestionnaireTask`.
- **Events:** Erfüllte Aktionen — z. B. `CPGMedicationAdministration`, `CPGProcedure`, `CPGObservation`, `CPGCondition`, `CPGFlag`.

Das **CPG-Präfix** kennzeichnet die im IG profilierten Varianten.

### 5.3 PlanDefinition-Anwendungen

Drei Anwendungsformen mit eigenen Profilen:

| Form | Profil | Zweck | Beispiel |
|---|---|---|---|
| **Recommendation** | `CPGRecommendationDefinition` | Event-Condition-Action-Regel ("Bei Ereignis X und Bedingung Y → Empfehlung Z"). | CDC Opioid Recommendation 4. |
| **Strategy** | `CPGStrategyDefinition` | Sequenzierte Aktivitäten an spezifischen Workflowpunkten (Subprozesse, Formulare, Servicecalls). | Sepsis-Bundle nach ED-Triage. |
| **Pathway** | `CPGPathwayDefinition` | Längsschnittliche Orchestrierung über Wochen/Monate, mehrere zeit- oder ereignisbasierte Eintrittspunkte. | WHO Antenatal Care mit 8 Kontakten. |

### 5.4 Supporting-Information-Extensions

Konformer Inhalt **MUSS** sein Bewertungssystem deklarieren und für jede Empfehlung folgende Extensions führen:

- `qualityOfEvidence` (FHIR-Base, GRADE-kompatibel)
- `strengthOfRecommendation` (FHIR-Base)
- `directionOfRecommendation` (CPG-spezifisch, optional: for/against/either)

CPG-on-FHIR schreibt **kein** Bewertungssystem vor (offen für GRADE, AHA/ACC, NHS, etc.), verlangt aber Deklaration und Dokumentation.

### 5.5 Case Features

Patientendaten als **Assertions** (dokumentiert) oder **Inferences** (abgeleitet). Profilbasis: `CPGCaseFeatureDefinition`. Sie sind die Brücke zwischen klinischer Realität (FHIR-Resource-Instanzen) und Empfehlungslogik (CQL-Kriterien).

## 6. Profil-Inventar (aus der *Profiles*-Seite)

Die *Profiles*-Seite ordnet alle Profile in **vier Kategorien**: Artifact, Domain, Activity, Content. Ergänzend werden alle Artefakte mit den **Shareable**- und (wenn publiziert) **Publishable**-Capability-Profilen aus dem CRMI-IG kombiniert.

### 6.1 Artifact Profile (Definitionsartefakte)

Konstrainen die definitorischen Ressourcen. Bauen auf den CRMI-Capability-Profilen auf.

| Profil | Basisressource | Zweck |
|---|---|---|
| **CPGComputablePlanDefinition** | PlanDefinition | Zentraler Artefakt — formaler Rahmen für computable Empfehlungen, Strategien, Pfade. |
| **CPGCaseFeatureDefinition** | StructureDefinition | Definiert klinische Case-Features (Datenelemente, die in der Empfehlungslogik referenziert werden). |
| CPGComputableActivity | ActivityDefinition | Computable Aktivitätsdefinition. |
| CPGComputableGraphDefinition | GraphDefinition | Graph-Struktur für komplexe Artefaktbeziehungen. |
| CPGComputableGuideline | ImplementationGuide | Profiliert den IG selbst für computable Use Cases. |
| CPGComputableMetric | Measure | Performance-Metriken zur Leitlinientreue. |
| CPGComputableQuestionnaire | Questionnaire | Computable Fragebögen im Pfadkontext. |

**Allgemeine Anforderung:** Konformer Inhalt MUSS für definitorische Ressourcen das **Shareable**-Profil verwenden und SOLLTE bei Veröffentlichung das **Publishable**-Profil verwenden — gilt für ActivityDefinition, CapabilityStatement, CodeSystem, ConceptMap, GraphDefinition, ImplementationGuide, Library, Measure, Medication, MedicationKnowledge, NamingSystem, OperationDefinition, PlanDefinition, Questionnaire, SearchParameter, StructureDefinition, StructureMap, TerminologyCapabilities, ValueSet.

### 6.2 Domain Profile (klinische und organisatorische Strukturen)

Repräsentieren die Welt, in der Leitlinien wirken. Pro Konzept gibt es typischerweise **zwei Ebenen**: Definition (Schablone) und Instance/Plan (konkrete Ausprägung am Patienten).

**Organisationen und Beteiligte:**

| Konzept | Definitionsprofil | Instanzprofil |
|---|---|---|
| Gruppe/Kohorte | CPGGroupDefinition | CPGGroup |
| Ort | CPGLocationDefinition | CPGLocation |
| Organisation | — | CPGOrganization |
| Patient\*in | — | CPGPatient |
| Behandelnde\*r | — | CPGPractitioner |
| Rolle | CPGPractitionerRoleDefinition | CPGPractitionerRole |
| Team | CPGCareTeamDefinition | CPGCareTeam |

**Pfade, Strategien, Empfehlungen — alle auf PlanDefinition:**

| Konzept | Definitionsprofil | Instanzprofil |
|---|---|---|
| Pfad | **CPGPathwayDefinition** | (Pfadinstanz wird in den `CPGCarePlan` und `CPGCase` materialisiert) |
| Fall (Einschluss in Pfad) | — | **CPGCase** |
| Care Plan | — | **CPGCarePlan** |
| Strategie | **CPGStrategyDefinition** | CPGStrategy |
| Empfehlung | **CPGRecommendationDefinition** | (s. u., Recommendation-Instanzprofile) |

**Recommendation-Instanzprofile** (an Recommendation Definitions gekoppelt):
CPGAdministerMedicationTask, CPGCommunicationRequest, CPGDispenseMedicationTask, CPGDocumentMedicationTask, CPGEnrollmentTask, CPGGenerateReportTask, CPGImmunizationRequest, CPGMedicationRequest, CPGProposeDiagnosisTask, CPGQuestionnaireTask, CPGRecordDetectedIssueTask, CPGRecordInferenceTask, CPGReportFlagTask, CPGServiceRequest.

**Qualität, Beurteilung, Dokumentation:**

| Profil | Basisressource | Zweck |
|---|---|---|
| CPGGoal | Goal | Therapieziel auf Patient\*innen- oder Populationsebene. |
| CPGMetricReport | MeasureReport | Ergebnisse von Metriken. |
| CPGClinicalImpression | ClinicalImpression | Klinische Einschätzung im Verlauf. |
| CPGCaseSummaryDefinition / CPGCaseSummary | — | Strukturierte Fallzusammenfassung (Schablone + Instanz). |
| CPGCasePlanSummaryDefinition / CPGCasePlanSummary | — | Strukturierte Care-Plan-Zusammenfassung. |
| CPGCasePlanProgressingNote | — | Narrative Verlaufsnote zu einem laufenden Care Plan. |

### 6.3 Activity Profile (Definition → Request → Event)

Jeder Aktivitätstyp hat **drei korrespondierende Profile** entlang des FHIR-Workflow-Patterns. Definitionen tragen die Felder `kind` (Zielressourcentyp), `profile` (Mindestprofil des Requests) und `intent` (typisch `proposal`); Requests tragen `instantiatesCanonical` (Verweis auf Definition); Events tragen `instantiatesCanonical` plus `basedOn` (Verweis auf Request).

**Medikation:**

| Aktivität | Definition | Request | Event |
|---|---|---|---|
| Verordnen | CPGMedicationRequestActivity | CPGMedicationRequest | CPGMedicationDispense, CPGMedicationAdministration, CPGMedicationStatement |
| Abgabe | CPGDispenseMedicationActivity | CPGDispenseMedicationTask | CPGMedicationDispense |
| Verabreichung | CPGAdministerMedicationActivity | CPGAdministerMedicationTask | CPGMedicationAdministration |
| Dokumentation | CPGDocumentMedicationActivity | CPGDocumentMedicationTask | CPGMedicationStatement |

**Kommunikation und Informationssammlung:**

| Aktivität | Definition | Request | Event |
|---|---|---|---|
| Nachricht senden | CPGCommunicationActivity | CPGCommunicationRequest | CPGCommunication |
| Info erheben | CPGCollectInformationActivity | CPGQuestionnaireTask | CPGQuestionnaireResponse |
| Impfung empfehlen | CPGImmunizationActivity | CPGImmunizationRequest | CPGImmunization |
| Service beauftragen | CPGServiceRequestActivity | CPGServiceRequest | CPGProcedure, CPGObservation |

**Klinische Entscheidung und Workflow:**

| Aktivität | Definition | Request | Event |
|---|---|---|---|
| Patient\*in einschließen | CPGEnrollmentActivity | CPGEnrollmentTask | CPGCase |
| Bericht generieren | CPGGenerateReportActivity | CPGGenerateReportTask | CPGMetricReport, CPGCaseSummary, CPGCasePlanSummary, CPGCasePlanProgressingNote |
| Diagnose vorschlagen | CPGProposeDiagnosisActivity | CPGProposeDiagnosisTask | CPGCondition |
| Detected Issue erfassen | CPGRecordDetectedIssueActivity | CPGRecordDetectedIssueTask | CPGDetectedIssue |
| Inferenz erfassen | CPGRecordInferenceActivity | CPGRecordInferenceTask | CPGObservation |
| Flag melden | CPGReportFlagActivity | CPGReportFlagTask | CPGFlag |

**Aktivitätssteuerung** (Lifecycle-Kontrolle laufender Aktivitäten):

| Profil | Basisressource | Funktion |
|---|---|---|
| CPGStopActivity / CPGStopTask | ActivityDefinition / Task | Aktivität beenden. |
| CPGHoldActivity / CPGHoldTask | ActivityDefinition / Task | Aktivität pausieren. |
| CPGResumeActivity / CPGResumeTask | ActivityDefinition / Task | Pausierte Aktivität fortsetzen. |

### 6.4 Content-Profile-Designprinzip

Eine zentrale konzeptionelle Aussage der *Profiles*-Seite ist die **Doppelnatur** von Profilen in einem Content IG:

- **Interoperabilitätsprofile** kommen aus Model IGs (IPS, US Core, QI-Core, AU Base; in DE: MII KDS) und regeln Datenaustausch.
- **Computability-Profile** dokumentieren die Erwartungen an Datenelemente für die *Ausführung* der computablen Logik. Bei CQL kann das oft statisch aus den `dataRequirement`-Elementen der Library-Ressource abgeleitet werden.

**Praktische Implikation:** *"Implementation of any given computable content is based on the intersection of the interoperability and computability profiles."* — Content-Autor\*innen dürfen Computability-Profile nicht so definieren, dass sie mit den Interoperabilitätsprofilen des Zielsystems kollidieren.

**Mapping ist unvermeidbar:** Die Seite betont explizit, dass selbst bei Verwendung von IPS *kein* CPG ohne lokales Mapping auskommt. Konformer Content MUSS dokumentieren:
1. Wo Datenelemente semantisch vollständig mit Standardprofilen alignieren — und wie.
2. Wo Alignment unvollständig ist — und wie diese Lücke abgebildet wird.

IPS als Summary-Modell ist ausdrücklich als **unvollständiges Ziel** beschrieben: nützlich als Basis für gemeinsame Datenelemente, muss aber um die für computable Repräsentation nötigen Elemente ergänzt werden.

### 6.5 Profil-Indexe im IG

Drei alphabetische Indexe stehen für die Implementierungsarbeit zur Verfügung:

- *Profile Index* (`artifacts.html#profile-index`)
- *Extension Index* (`artifacts.html#extension-index`)
- *Example Profile Index* (`examples.html#profile-index`)

## 7. Konkrete Beispiele

### 7.1 CDC Opioid Prescribing Recommendation 4

**L1-Text:** "When opioids are initiated for opioid-naïve patients with acute, subacute, or chronic pain, clinicians should prescribe the lowest effective dosage."

**L2 — When-Bedingungen:** Provider verschreibt opioid mit Missbrauchspotenzial im ambulanten Setting; Patient ≥ 18 Jahre; keine Sichelzellanämie; keine begrenzte Lebenserwartung; kein End-of-Life-Setting; keine aktive Krebstherapie; MME ≥ 50.

**L2 — Then-Aktionen:** Dokumentation niedrigerer Dosierung; graduelle Dosisanpassung; Snooze-Optionen (3 Monate, 1 Monat).

**L3:** CQL-Library mit Inclusion-Criteria, PlanDefinition mit Trigger `medication-prescribe`, ActivityDefinition `CommunicationRequest` für die Alert-Message, ValueSet "Opioid with Misuse Potential", Profile auf `CPGMedicationRequest`.

### 7.2 WHO Antenatal Care

Pathway mit acht Kontaktpunkten in spezifischen Schwangerschaftsphasen, jeweils mit Applicability-Timing und entsprechenden Recommendations/Strategies pro Kontakt. Prototyp für die **Pathway**-Anwendung von PlanDefinition.

## 8. Governance, Stewardship und Pflege

- **Canonical-URL** des Content-IG soll unter einer Domäne der **inhaltlich verantwortlichen Trägerorganisation** liegen. Alternativ: Publikation über `fhir.org` im FHIR Community Process.
- **Lifecycle** folgt der **Canonical Resource Management Infrastructure (CRMI)**. Inhalte können als IG oder über `CRMIManifestLibrary`-Profil paketiert werden.
- **Entscheidungstransparenz:** Trade-offs zwischen Aufwand, Machbarkeit und Nutzen sollen als ergänzende Dokumentation im Content-IG festgehalten werden. Häufig werden Entscheidungspunkte als **Konfigurationsmöglichkeiten** im Artefakt exponiert — Implementierungsstandorte können den Trade-off dann standortspezifisch entscheiden.
- **Expert Review** durch Originalautor\*innen oder qualifizierte Fachpersonen ist zwingend, wenn die Autorenschaft selbst nicht reviewen kann.
- **Pflege:** Versionierung über FHIR-Standardmechanismen; Beziehung zur Originalleitlinie wird über `relatedArtifact`-Element (Zitation) **SHALL** dokumentiert.

## 9. Relevanz für das KIG-Onko-Projekt (Therapieziel-Visualisierung)

CPG-on-FHIR ist für unser Projekt der **methodische Gegenpart zu EnLiST**:

- **EnLiST** liefert das **Daten-/Strukturmodell** für Therapielinien (was wird gezählt, wie wird dargestellt).
- **CPG-on-FHIR** liefert die **Methodik**, wie sich daraus ausführbare, austauschbare Wissensartefakte machen lassen — von der Leitlinie bis zum CDS-Hook.

Konkret nutzbar:

- **L1–L4-Stufung** entspricht direkt unserem Vorgehen: Onkologische Leitlinien (S3) → halb-strukturierte Pfaddiagramme → FHIR-Profile + CQL → ausführbare Pfad-Engine. Die Stufen sind ein etabliertes Vokabular für Workshop- und Stakeholder-Kommunikation.
- **PlanDefinition-Pathway-Pattern** ist die natürliche Modellierungsform für **Therapiepfade über Zeit**, inklusive Therapielinien-Übergänge. Ein onkologischer Behandlungspfad (z. B. mCRC 1L → 2L → 3L) lässt sich als `CPGPathwayDefinition` abbilden, einzelne Linien als `CPGStrategyDefinition`, konkrete Therapieentscheidungen als `CPGRecommendationDefinition`.
- **ActivityDefinition + Request + Event** als Drei-Dimensions-Pattern passt direkt zu unserer Visualisierung: Definition = Therapiebaustein, Request = geplante Linie, Event = tatsächlich verabreichte Therapie.
- **Case Features** sind der natürliche Anschlusspunkt an **MII KDS-Module Onkologie/Medikation/Prozedur**: jedes Profil aus dem KDS wird zu einem Case Feature in unserem Content IG.
- **`qualityOfEvidence` / `strengthOfRecommendation` / `directionOfRecommendation`** kommen direkt aus der Onkologie-Leitlinienarbeit (GRADE in S3-Leitlinien). Strukturierte Übernahme spart Übersetzungsarbeit.
- **CQF Ruler** + **CDS Hooks Sandbox** sind die natürlichen Validierungsumgebungen; in Deutschland gibt es darüber hinaus die Anbindung an MIO-Viewer und das KBV-CDS-Ökosystem.
- **Governance-Modell:** "Content IGs müssen nicht balotiert werden" passt zur Projektrealität — die fachliche Hoheit liegt bei den onkologischen Leitliniengremien (S3-Leitlinien-Onkologie, DGHO, AGO etc.), nicht bei HL7.

### 9.1 Leitlinienkonformität vs. Abweichung — Verlinkung vs. ausführliche CarePlan-Beschreibung

CPG-on-FHIR liefert **Vorgaben über normative Leitlinien**, an die unsere Visualisierung sich bei indizierter Behandlung **per Verweis** andocken kann; weicht der reale Verlauf von der Leitlinie ab (bewusst, unbewusst oder weil eine Kontraindikation vorliegt), wechselt die Darstellung auf eine **ausführlichere CarePlan-Beschreibung**. Das ist im IG-Modell explizit vorgesehen:

| Situation | Primäre Modellierung | Bedeutung in der Visualisierung |
|---|---|---|
| Leitlinienkonforme Behandlung | Verweis (`instantiatesCanonical`) auf das normative **CPGRecommendationDefinition** / **CPGPathwayDefinition** | Kompakte Darstellung "folgt S3-Leitlinie XY, Empfehlung Z" — keine inhaltliche Wiederholung. |
| Bewusste Abweichung (Patient\*innenpräferenz, Komorbidität, Studienteilnahme) | **CPGCarePlan** mit eigenständiger Beschreibung; optional weiter via `instantiatesCanonical` mit Verweis auf die Leitlinienempfehlung, plus Annotation des Abweichungsgrunds | Visualisierung zeigt Leitlinienempfehlung als "geplante Linie" und den tatsächlichen Verlauf als parallele Spur mit Begründung. |
| Unbewusste Abweichung (Versorgungsrealität, Drift) | **CPGCarePlan** ohne Verweis bzw. mit `CPGDetectedIssue`-Flag | In der Visualisierung als Differenz/Hinweis erkennbar; eignet sich als Audit-Anker. |
| Kontraindizierte Leitlinienempfehlung im konkreten Fall | **CPGCarePlan** plus **CPGRecordDetectedIssueTask**/`CPGFlag` mit Begründung; Verweis auf Leitlinie bleibt als "abgelehnte Option" | Visualisierung kann die Leitlinienempfehlung explizit als "nicht angewandt — Kontraindikation" markieren, statt sie zu verstecken. |

Konzeptionell heißt das: **Leitlinie = Verweisbild, CarePlan = Detailbild.** Solange der Verlauf konform ist, reicht ein Link auf das CPG-Artefakt; sobald er divergiert, übernimmt der CarePlan die volle Repräsentationslast. Das hält die Visualisierung im Standardfall schlank und macht Abweichungen sichtbar — was klinisch, qualitätsmedizinisch und für Tumor-Boards genau die richtige Asymmetrie ist.

Technisch tragen das insbesondere folgende Profile/Felder:

- `instantiatesCanonical` (auf Request- und Event-Ebene) — Verweis auf die Leitlinienempfehlung.
- `CPGCarePlan` — Container für den realen Plan mit aller nötigen Detailtiefe.
- `CPGDetectedIssue` / `CPGFlag` — explizite Markierung von Abweichungen, Risiken, Kontraindikationen.
- `CPGRecordInferenceTask` — Erfassung der hinter der Abweichung stehenden klinischen Inferenz.
- `relatedArtifact` (Zitation der Leitlinie) — sichert die Rückverfolgbarkeit auch bei Abweichung.

## 10. Kombinationsperspektive mit EnLiST

Aus den beiden Quellen ergibt sich ein konsistentes Stacking:

```
Layer 4 (Executable)          → CDS Hooks / EHR Pathway Engine
Layer 3 (Structured)          → CPG-on-FHIR Profile + CQL Libraries
                                 ↳ PlanDefinition (Pathway / Strategy / Recommendation)
                                 ↳ ActivityDefinition
                                 ↳ Library (CQL)
                                 ↳ CodeSystem / ValueSet
Layer 2 (Semi-Structured)     → Data Dictionary + Pseudo-Code + Flow Diagrams
                                 ↳ Therapielinien-Schema gemäß EnLiST X.Y
                                 ↳ Phasen-Adaption für Hämatologie (s. IG-Seitenentwurf)
Layer 1 (Narrative)           → Onkologische S3-Leitlinien (LL Mamma, KRK, Pankreas, …)
```

EnLiST füllt Layer 2 (das Vokabular für Therapielinien-Modellierung). CPG-on-FHIR liefert die Methodik und die FHIR-Ressourcen für die Layer 2→3→4-Übersetzung. Beides ist komplementär, kein Konkurrenzverhältnis.

## 11. Limitationen und offene Fragen

- **CPG-on-FHIR ist ein "build"-Status-IG** (Continuous Integration Build). Stabile, balotierte Releases sind kürzer als die Continuous-Build-Version; für Produktionseinsatz muss die jeweils aktuelle STU-Version verwendet werden.
- **Tooling-Reife** ist heterogen: CQL-Tooling ist gut (VSCode-Plug-in, CDS Connect), aber ActivityDefinition-Authoring ist überwiegend manuell, FHIR-Editor-Unterstützung begrenzt.
- **Lokalisierung:** Deutsche/europäische Settings (Gematik, MII, KBV) sind im CPG-on-FHIR-Beispielkanon (CDC, WHO) noch unterrepräsentiert. Mapping der CPG-Personas-/Activity-/Process-CodeSysteme auf deutsche Versorgungsstrukturen ist Projektarbeit.
- **Pflege von Content IGs** bleibt Aufgabe der Trägerorganisation — Versionsfolgen zwischen Leitlinienupdates und IG-Releases müssen prozessual geregelt sein, das IG selbst gibt nur das Rahmenwerk.

## 12. Referenzen und weiterführende Materialien

- **CPG-on-FHIR Methodology Page:** [build.fhir.org/ig/HL7/cqf-recommendations/en/methodology.html](https://build.fhir.org/ig/HL7/cqf-recommendations/en/methodology.html)
- **CPG-on-FHIR Profiles Page:** [build.fhir.org/ig/HL7/cqf-recommendations/en/profiles.html](https://build.fhir.org/ig/HL7/cqf-recommendations/en/profiles.html)
- **CPG-on-FHIR Content IG Walkthrough:** vollständiger End-to-End-Spaziergang mit Open-Source-Tools (im IG verlinkt).
- **CQL Specification:** [cql.hl7.org](https://cql.hl7.org/)
- **CQF Ruler (HAPI-Erweiterung):** [github.com/cqframework/cqf-ruler](https://github.com/cqframework/cqf-ruler)
- **CDS Hooks:** [cds-hooks.org](https://cds-hooks.org/)
- **CDS Connect Authoring Tool:** [cds.ahrq.gov/cdsconnect/authoring](https://cds.ahrq.gov/cdsconnect/authoring)
- **CRMI — Canonical Resource Management Infrastructure IG:** Pflege- und Lifecycle-Standard.
- **Verwandte Specification IGs:** Quality Measure IG, DEQM, SDC (Structured Data Capture), EBM-on-FHIR.
- **Beispiele im Projekt-Umfeld:** CDC Opioid Prescribing, WHO Antenatal Care, HEDIS-Quality-Measures.
