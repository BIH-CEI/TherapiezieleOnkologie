**MCC – Zusammenfassung für „Onkologische Therapieziele“**

*Baustein für Liefergegenstand LG-01 · Gematik-Auftrag · BIH-CEI*

#################### 

#################### 1. Management-Zusammenfassung

Der HL7 FHIR US Multiple Chronic Conditions (MCC) eCare Plan
Implementation Guide definiert auf Basis von FHIR R4 ein
Care-Plan-zentriertes Modell für die strukturierte Repräsentation,
Abfrage und den Austausch longitudinaler Versorgungspläne. Im
**Unterschied zu IPS und EPS**, die primär dokumentorientierte
Patientenzusammenfassungen mit festen Sektionen bereitstellen,
modelliert MCC den Behandlungsplan selbst als **dynamische,
konsensbasierte Struktur** aus Concerns, Goals, Interventions und
Outcomes. MCC ist deshalb weniger als weiterer Summary-Guide relevant,
sondern als inhaltlich näherliegende **Referenz für die semantische
Abbildung von Zielzuständen, Maßnahmen und Ergebnissen**.

Der IG profiliert CarePlan und Goal ausdrücklich und erlaubt
strukturierte Referenzen zwischen adressierten Gesundheitsproblemen,
übergeordneten Zielen und geplanten bzw. durchgeführten Aktivitäten. MCC
bleibt fachlich auf Multiple Chronic Conditions im US-Kontext
ausgerichtet und enthält **keine onkologiespezifischen Konzepte** für
Therapieintention, Therapielinie, Tumoransprechen, Progress oder
Abbruchgründe. Für eine onkologische Spezifikation ist MCC daher eher
ein **Architektur- und Workflow-Vorbild** als eine direkt ausreichende
Fachreferenz.

#################### 2. Mögliche übertragbare Elemente aus CarePlan und Goal

MCC profiliert den CarePlan als zentrales Koordinationsobjekt und
beschreibt ihn explizit als „consensus-driven dynamic plan“, der
priorisierte Concerns, Goals und geplante Interventions verschiedener
Versorgungsteams für mehrere Erkrankungen zusammenführt. Damit
adressiert MCC genau den Strukturraum, der für onkologische
Therapieziele benötigt wird: ein gemeinsames Planobjekt mit Bezug auf
Erkrankungen, Ziele, Maßnahmen und beobachtete Outcomes.

Elemente für onkologische Therapieziele:

| Element | BEschreibung |
|----|----|
| CarePlan.addresses  | Referenziert Gesundheitsprobleme (Verbindung Krankheit – CarePlan) |
| CarePlan.goal | Ein oder mehrere übergreifende Ziele des Behandlungsplans |
| CarePlan.activity.reference | Repräsentiert geplante Aktivitäten (z.B. MedicationRequest, ServiceRequest) |
| CarePlan.activity.outcomeReference | Repräsentiert durchgeführte Aktivitäten oder dokumentierte Ergebnisse (z.B. Procedure, Observation) |
| Goal.addresses | Erlaubt Verknüpfung vom Therapieziel mit Problemen, die mit diesem Ziel adressiert werden (Condition, Observation, ServiceRequest, etc.) |

StructureDefintion von CarePlan:
<https://build.fhir.org/ig/HL7/fhir-us-mcc/StructureDefinition-MCCCarePlan.html>

StructureDefintion von Goal:
<https://build.fhir.org/ig/HL7/fhir-us-mcc/StructureDefinition-MCCGoal.html>

#################### 

#################### 

#################### 

#################### 

#################### 3. Relevanz für onkologische Therapieziele

Für onkologische Therapieziele ist MCC vor allem dort nützlich, wo ein
longitudinaler Behandlungsplan mit mehreren Beteiligten, konkurrierenden
Prioritäten und auswertbaren Zielzuständen modelliert werden soll.
Konzeptionell lassen sich mit MCC mehrere onkologisch relevante
Zieltypen abbilden, auch wenn das IG sie nicht onkologiespezifisch
vorgibt:

- **Krankheitsbezogene Ziele:** z.B. Remission erreichen, Progress
  vermeiden oder Symptomlast senken *(über Goal.description,
  Goal.addresses, Goal.target)*

- **Patientenbezogene Ziele**: z.B. Funktionsniveau erhalten,
  Lebensqualität verbessern *(über Goal + ergänzende Observations /
  Narrative)*

- **Maßnahmenbezogene Ziele**: z.B. Durchführung einer systemischen
  Therapie, supportive Maßnahmen, Monitoring
  *(über CarePlan.activity.reference,
  CarePlan.activity.outcomeReference)*

- **Zeitbezogene Ziele**: z.B. Erreichen eines Zustands bis zu einem
  Stichtag oder innerhalb eines Therapieabschnitts *(über Goal.duex und
  CarePlan.period)*

Aber: die fachliche Präzisierung für die Onkologie fehlt.

#################### 4. Lücken von MCC und Lösungsansätze für unsere Spec

| **Lücke in MCC** | **Lösungsansatz für unsere Spec** |
|----|----|
| Kein onkologiespezifisches Condition-/Disease-Modell | Onkologisches Condition-Profil ergänzen, z. B. mit TNM, Grading, Biomarker-Referenzen und Disease-Status |
| *Wie in IPS/EPS: Keine Therapieintention* | *Siehe IPS/EPS Analyse: Codiertes Feld/Extension mit ValueSet kurativ / palliativ / adjuvant / neoadjuvant / Erhaltung – Alignment mit mCODE* |
| *Wie in IPS/EPS: Keine Therapielinien (ESMO-Notation)* | *Siehe IPS/EPS Analyse: Extension auf MedicationStatement / Procedure oder Attribut am EpisodeOfCare-Profil* |
| Keine standardisierte Abbildung von Tumoransprechen auf die Behandlung | Observation-Profil mit Response-Assessment mit Refernez 🡪 Goal.outcomeReference |
| *Wie in IPS/EPS: Keine strukturierten Therapieabbruch-Gründe oder Therapiewechsel* | *Siehe IPS/EPS Analyse: Codiertes ValueSet (Progress / Toxizität / Patientenwunsch / Behandlungsende) als Extension* |

#################### 5. Fazit: Direkt übernehmbare Elemente

- **CarePlan** als zentrales Steuerobjekt: Im MCC ist der CarePlan
  selbst interoperables Kernelement

- **Goal** als eigenständige, referenzbasierte Ressource

- **Must-support auf zielrelevante Beziehungen** z.B. CarePlan.adresses
  oder CarePlan.goal

- **Unterscheidung** zwischen **geplanten und durchgeführten
  Aktivitäten** (CarePlan.activity.reference und
  CarePlan.activity.outcomeReference)

> *Quellen:
> https://confluence.hl7.org/spaces/PC/pages/66935243/Multiple+Chronic+Conditions+MCC+eCare+Plan·
> https://build.fhir.org/ig/HL7/fhir-us-mcc/index.html ·
> Projektbeschreibung BIH-CEI Onkologie Therapieziele*
>
> **goal-acceptance Extension -\> Hat der Patient die Behandlung
> abgelehnt / anderes Ziel?**
>
> **Timeline des Relationship-Modells -\> Goal definieren, Activities,
> Reference checken, war gut oder nicht?, neue Behandlungsepisode**
>
> **Outcome-Clustering**
>
> **Activity Referenzen übernehmen (nicht alles in den Details des
> CarePlan) --\> wird in R5 auch so gemacht**
