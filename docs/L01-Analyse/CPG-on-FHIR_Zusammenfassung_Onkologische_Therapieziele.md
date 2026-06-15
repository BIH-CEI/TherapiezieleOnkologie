# HL7 CPG-on-FHIR – Analysebaustein „Onkologische Therapieziele"

Baustein für Liefergegenstand LG-01 · Gematik-Auftrag · BIH-CEI

**Quelle:** HL7 *Clinical Practice Guidelines (CPG-on-FHIR) Implementation Guide* v2.0.0 STU2 (CI-Build Mai 2026; Package `hl7.fhir.uv.cpg#2.0.0`, FHIR R4). Maintained durch HL7 Clinical Decision Support / Clinical Quality Framework. Untersuchte Seiten: *Methodology*, *Profiles*. URLs: [build.fhir.org/ig/HL7/cqf-recommendations/en/methodology.html](https://build.fhir.org/ig/HL7/cqf-recommendations/en/methodology.html) · [build.fhir.org/ig/HL7/cqf-recommendations/en/profiles.html](https://build.fhir.org/ig/HL7/cqf-recommendations/en/profiles.html)

**Status:** STU2, methodisch ausgereift, in Produktion u. a. bei CDC Opioid und WHO Antenatal Care.

## 1. Übertragbares Muster: Referenzierbare Leitlinieninhalte

CPG-on-FHIR ist für unsere Spec primär als **Referenzrahmen für Leitlinieninhalte** relevant. Statt der vollen computable Tiefe (CQL-Bibliotheken, ausführbare Pathway-Engine) nutzen wir die Profil- und Verlinkungslogik, um existierende Leitlinien – die parallel über AWMF erschlossen werden – strukturiert in unseren Verläufen zugänglich zu machen.

Die zentralen übertragbaren Elemente sind:

- **Reasoning-Kernressourcen:** `Library` (CQL-Logik bei Bedarf), `ActivityDefinition`, `PlanDefinition`, `Measure`.
- **Drei PlanDefinition-Anwendungen:** `CPGRecommendationDefinition` (Event-Condition-Action-Regel), `CPGStrategyDefinition` (sequenzierte Aktivitäten), `CPGPathwayDefinition` (längsschnittliche Orchestrierung).
- **Aktivitäts-Workflow Definition → Request → Event:** Pro Aktivitätstyp je ein Definitions-, Request- und Event-Profil mit `CPG`-Präfix; Verknüpfung über `instantiatesCanonical` und `basedOn`. Damit wird *Soll* (Empfehlung) vom *Ist* (verordnete bzw. verabreichte Therapie) sauber getrennt.
- **`relatedArtifact` und `instantiatesCanonical`** als Verlinkungs-Mechanik zu normativen Leitlinienquellen – der Kernhebel für unsere "Verweisbild"-Logik.
- **Optionale Bewertungs-Extensions** (`qualityOfEvidence`, `strengthOfRecommendation`, `directionOfRecommendation`); für die deutsche Versorgung referenzieren wir primär die **S3-Leitlinien** mit ihrem AWMF-Bewertungsschema; Mapping auf ESMO und weitere Evidenzsysteme kann später ergänzt werden, ist aber für die Erstversion nicht zwingend.

## 2. Anwendungsmuster: Leitlinienkonformität vs. Abweichung

In unserer Spec wird CPG-on-FHIR überall dort eingesetzt, wo **eine referenzierbare Leitlinienempfehlung existiert**. Liegt sie nicht vor oder weicht der konkrete Fall davon ab – etwa bei *patientenseitiger Abweichung* oder *Shared Decision Making* – übernimmt die CarePlan/Goal-Logik (siehe IPS/MCC/PCO-Bausteine) die ausführliche Beschreibung, ggf. mit eigenen Evidenzangaben.

Diese Asymmetrie spiegelt die Versorgungsrealität (15–30 % strukturierte Abweichung nach WiZen-, NCCN- und mCRC-AIO-Daten):

| Situation | Modellierung | Visualisierung |
|---|---|---|
| Leitlinienkonform | Verweis (`instantiatesCanonical`) auf `CPGRecommendationDefinition` / `CPGPathwayDefinition` | Kompakt: "folgt S3-Leitlinie X, Empfehlung Y" |
| Bewusste Abweichung (Präferenz, Komorbidität, Studienteilnahme) | `CPGCarePlan` mit eigener Beschreibung; `instantiatesCanonical` bleibt als "abgewichen von" sichtbar | Parallele Spur mit Begründung |
| Unbewusste Abweichung (Versorgungsdrift) | `CPGCarePlan` + `CPGDetectedIssue`-Flag | Differenz sichtbar, Audit-Anker |
| Kontraindizierte Empfehlung | `CPGCarePlan` + `CPGFlag` / `CPGRecordDetectedIssueTask` mit Begründung | Empfehlung explizit als "nicht angewandt – Kontraindikation" |

## 3. Lücken in CPG-on-FHIR und Lösungsansätze für unsere Spec

| Lücke / Designentscheidung | Lösungsansatz für unsere Spec |
|---|---|
| **CPG-Personas / Activity Type / Common Process CodeSysteme** sind international gehalten (US-/CDC-/WHO-zentriert) | Eigene CodeSysteme `onko-personas`, `onko-activity-type` ableiten; Mapping-Tabelle auf CPG-Common erstellen; bei generischen Konzepten direkt CPG-Common nutzen |
| **Kein Bewertungssystem vorgeschrieben** | Primärbezug **S3-Leitlinien (AWMF)**; optional über ConceptMap auf GRADE und ESMO Magnitude of Clinical Benefit Scale (MCBS) abbildbar – nicht im Hauptpfad |
| **IPS als Interop-Basis** ist im CPG-IG empfohlen, aber unvollständig | Für unsere Spec **MII KDS-Onkologie** als primärer Interop-Basis; Mapping auf IPS/EPS für EHDS-Anschluss separat |
| **MDT-Logik nicht explizit modelliert** – kein "Tumorboard-Entscheidung als Pathway-Knoten"-Pattern | Eigene `OnkoTumorboardDecision`-Aktivität (auf `CPGServiceRequestActivity` basierend) mit `OnkoClinicalImpression` als Event; Molekulares Tumorboard als Sonderfall |
| **CarePlan-Detail bei Abweichung** ist im IG nur skizziert, nicht als Pflicht-Pattern ausformuliert | Pflicht-Pattern in unserer Spec: bei Abweichung von einer referenzierten Recommendation MUSS ein `OnkoCarePlan`-Detail mit codiertem `OnkoDetectedIssue` (deviation-reason) hinterlegt werden |
| **Versions-Pflege** zwischen Leitlinien-Update und IG-Release ist Trägerverantwortung – kein Standardprozess | KIG-Onko-Pflegeprozess definieren: Versionierung an S3-Leitlinien-Updates des Leitlinienprogramms Onkologie gekoppelt |
| **Mapping ist Pflicht** – IPS und andere Standards nie vollständig | Mapping als eigenes Lieferobjekt im IG ausweisen (analog DEQM, SDC); ConceptMaps für ICD-10-GM × SNOMED, oBDS × FHIR-Profile, MII-Module × Onko |
| **Patientensicht / Patient-Reported-Outcomes** sind im CPG-Kern nicht prominent | Anbindung an PCO IG ergänzen (siehe PCO-Baustein) – insbesondere für Shared Decision Making und Abweichungsbegründungen aus Patientenperspektive |

## 4. Direkt übernehmbare Elemente

- **PlanDefinition-Pathway-Pattern** als natürliche Modellierungsform für onkologische Behandlungspfade (z. B. mKRK 1L → 2L → 3L als `CPGPathwayDefinition`, einzelne Linien als `CPGStrategyDefinition`, konkrete Therapieentscheidungen als `CPGRecommendationDefinition`).
- **Definition–Request–Event-Triade** als Achsenmodell: Definition = normative Empfehlung, Request = geplante Linie, Event = tatsächlich verabreichte Therapie.
- **`instantiatesCanonical` + `relatedArtifact`** als verbindlicher Verweis auf die S3-Leitlinienempfehlung.
- **Optionale Bewertungs-Extensions** für Empfehlungen – primär getragen durch S3-Empfehlungsstärke und LoE, optional gemappt auf GRADE.
- **CRMI (Canonical Resource Management Infrastructure)** für Lifecycle-Management, Versionierung, Paketierung.
- **Shareable-/Publishable-Capability-Profile** als Pflicht für alle definitorischen Ressourcen – sorgt für konsistente Metadaten.

## 5. Fazit: Was wir übernehmen und warum

**Übernehmen (referenziert, nicht explizit ausgebaut):**
- **CPG-on-FHIR als Referenzrahmen** für die Verlinkung zu Leitlinienempfehlungen. Wir nutzen die Profil- und Verlinkungsmechanik, nicht die volle computable Tiefe – sofern keine ausführbare Pathway-Logik benötigt wird.
- **PlanDefinition mit drei Anwendungen** (Pathway / Strategy / Recommendation) als zentrale Strukturressource für referenzierbare Behandlungspfade.
- **Definition–Request–Event-Pattern** als Modellierung jedes Therapiebausteins – Voraussetzung für `instantiatesCanonical`-basierte Adhärenzauswertung.
- **Verweisbild-/Detailbild-Asymmetrie** (Leitlinie verlinkt, CarePlan ausführlich bei Abweichung).
- **Bewertungs-Extensions optional** unterstützen; primär referenzieren wir **S3-Leitlinien-Empfehlungsstärken und LoE**, weitere Systeme (GRADE, ESMO-MCBS) später als ConceptMap-Anhang.

**Erweitern / spezialisieren:**
- **Eigene `Onko`-Profile** auf CPG-Basis (`OnkoTherapyLine`, `OnkoTumorboardDecision`, `OnkoCarePlan`, `OnkoDetectedIssue`). Begründung: deutsche Versorgungsstrukturen (Tumorboard-Pflicht, Konsiliumssystem, DKG-Quality-Indicators) benötigen spezifische Erweiterungen.
- **Pflicht-Pattern für CarePlan-Detail bei Abweichung** statt nur skizzierter Möglichkeit. Begründung: macht Abweichungsdokumentation auditierbar (relevant für WiZen-artige Versorgungsforschung und QI-Erfüllung).
- **MII KDS-Onkologie statt IPS** als primäre Interop-Basis. Begründung: deutsche Realität, etablierte Datenflüsse aus DIZ/oncoBox/oBDS; IPS/EPS-Anschluss als sekundäre Mapping-Schicht für EHDS-Konformität.

**Nicht übernehmen / bewusst abweichen:**
- **CPG-internationale CodeSysteme** (Personas, Activity Type, Process) im Original. Stattdessen eigene `onko-*` CodeSysteme mit Mapping-Tabelle auf CPG-Common.
- **Reine Ableitung von IPS-Composition** für Patient Summary. Begründung: für unseren Use Case "Therapieziel & Linien" reicht IPS-Komposition nicht – siehe IPS/EPS-Baustein.

## 6. Quellen

- HL7 *CPG-on-FHIR IG* v2.0.0 STU2 (CI-Build Mai 2026). Methodology: [build.fhir.org/ig/HL7/cqf-recommendations/en/methodology.html](https://build.fhir.org/ig/HL7/cqf-recommendations/en/methodology.html) · Profiles: [build.fhir.org/ig/HL7/cqf-recommendations/en/profiles.html](https://build.fhir.org/ig/HL7/cqf-recommendations/en/profiles.html)
- HL7 *Clinical Quality Language (CQL)*: [cql.hl7.org](https://cql.hl7.org/)
- HL7 *Canonical Resource Management Infrastructure (CRMI)* IG
- AWMF Regelwerk Leitlinien (Empfehlungsstärken, LoE): [awmf.org/regelwerk](https://www.awmf.org/regelwerk/)
- Verwandte Specification IGs: Quality Measure IG, DEQM, SDC (Structured Data Capture), EBM-on-FHIR
