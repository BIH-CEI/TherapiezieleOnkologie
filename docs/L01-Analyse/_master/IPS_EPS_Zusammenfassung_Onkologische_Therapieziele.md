**IPS & EPS – Zusammenfassung für „Onkologische Therapieziele“**

*Baustein für Liefergegenstand LG-01 · Gematik-Auftrag · BIH-CEI*

#################### 1. Management-Zusammenfassung

Die **International Patient Summary (IPS) v2.0.0 STU 2** (HL7
International, FHIR R4, ISO/EN 27269) ist die normative Referenz für
condition-agnostische Patientenzusammenfassungen. Die **European Patient
Summary (EPS) v1.0.0-xtehr** (HL7 Europe, QA-Preview Februar 2026)
leitet sich direkt aus IPS ab („imposes profile IPS Composition“) und
ergänzt EU-Core-Profile und Xt-EHR-Obligations. EPS ist die strategisch
relevante Bezugsgröße für EHDS-/EEHRxF-Konformität.

Beide Guides liefern **übertragbare strukturelle Muster**, adressieren
aber **keinerlei strukturierte Therapieziele, Therapieintention oder
Therapielinien**. Das offizielle IPS-Referenzbeispiel ist selbst ein
Mammakarzinom-Fall und illustriert die Lücke im Standard direkt. Unsere
Spezifikation sollte daher die IPS/EPS-Architektur übernehmen, die
Core-Profile um onkologische Tiefe erweitern und die Ziel- und
Abschnitts-Konzepte neu definieren.

#################### 2. Übertragbares Muster: Composition-Architektur und Plan of Care

IPS definiert eine FHIR-Composition (Document-Type LOINC 60591-5) mit 16
sliced Sektionen: drei Required (Problems 11450-4, Medications 10160-0,
Allergies 48765-2), eine Recommended (Immunizations 11369-6), zwölf
Optional. Jede Sektion trägt einen LOINC-Code, menschenlesbaren
Narrative-Text und eine definierte Ressourcen-Liste; das
**emptyReason-Muster** macht „nicht vorhanden“ explizit. Der Slice
Composition.event:careProvisioningEvent (v3-ActCode PCPR, event.period)
ist der einzige vorhandene Anker für Behandlungszeiträume – mit
Kardinalität 0..1 für unsere Spec zu eng. Therapieziel-relevant sind vor
allem drei optionale Sektionen:

| **Optionale Sektion** | **LOINC** | **Relevanz** |
|----|----|----|
| Plan of Care | 18776-5 | CarePlan + Goal – Kernansatz für Therapieziele |
| Patient Story | 81338-6 | Patientenzentrierte Präferenzen, Lebensqualitätsziele |
| History of Past Problems | 11348-0 | Rezidivnachweis, Remissionsstatus |

Die Plan-of-Care-Sektion erlaubt CarePlan und
ImmunizationRecommendation; CarePlan.goal → Goal, **aber ein Goal-Profil
ist weder in IPS noch in EPS definiert**. IPS ist zudem laut General
Principles ein *informatives Dokument* – MedicationRequests oder
CarePlans daraus dürfen nicht aktioniert werden. Zentrale Designfrage
für unsere Spec: Therapieziele rein deskriptiv oder workflow-fähig?

#################### 3. Das IPS-Referenzbeispiel illustriert die Lücke

Das offizielle IPS-Bundle Bundle-IPS-examples-Bundle-01 (Patientin
„Martha DeLarosa“, Mammakarzinom Stage II in Remission, abatement =
2015-03) enthält Anastrozol 1 mg als MedicationStatement mit effective:
2016-01 --\> (ongoing) und Freitext „treatment for breast cancer“ –
**ohne strukturierte Verknüpfung zur Diagnose, ohne Therapieintention,
ohne CarePlan/Goal**. Der „Plan of Treatment“ („Continue hormone
medication … for total of 5 years and monitor for potential breast
cancer recurrence“) steht ausschließlich im Narrative. Menopausal
flushing ist als aktives Problem geführt, aber semantisch nicht mit der
Hormontherapie verknüpft – obwohl unser Use Case „Therapieumstellung
durch Nebenwirkungssymptome“ genau diese Kopplung braucht. Das Beispiel
eignet sich in LG-01 als Referenzfall für eine
Vorher-/Nachher-Gegenüberstellung gegen unsere Spec.

#################### 4. Lücken in IPS/EPS und Lösungsansätze für unsere Spec

| **Lücke in IPS/EPS** | **Lösungsansatz für unsere Spec** |
|----|----|
| Kein Goal-Profil | Neues Profil „Therapieziel Onkologie“ auf Basis Goal (Zielart, Condition-Bezug, Zielzeitraum, Zielstatus, Outcome-Observation) |
| Keine Therapieintention | Codiertes Feld/Extension mit ValueSet kurativ / palliativ / adjuvant / neoadjuvant / Erhaltung – Alignment mit mCODE |
| Keine Therapielinien (ESMO-Notation) | Extension auf MedicationStatement / Procedure oder Attribut am EpisodeOfCare-Profil |
| Kein EpisodeOfCare in Plan of Care | Profil „Behandlungsabschnitt“ (EpisodeOfCare) mit Bezug zu Diagnose, Therapielinie, Intention, Zieletabelle |
| Condition-Profil condition-agnostisch | Onkologische Attribute (Staging, Grading, Biomarker); mCODE PrimaryCancerCondition als Referenzspezifikation |
| Keine strukturierten Therapieabbruch-Gründe | Codiertes ValueSet (Progress / Toxizität / Patientenwunsch / Behandlungsende) als Extension |
| Medikation ↔ Diagnose ↔ Ziel nicht verknüpft | Must-Support auf reasonReference, basedOn, goal in MedicationStatement / Procedure / CarePlan |

#################### 5. Direkt übernehmbare Elemente

- Composition-Architektur mit Sektions-Slicing, LOINC-Codierung und
  verpflichtendem Narrative (Narrative-first-Prinzip) inkl.
  emptyReason-Muster für fehlende Daten.

- Obligations-Framework (Creator/Consumer Actors mit SHALL:populate,
  SHALL:handle, SHOULD:display); EPS zeigt mit Obligation-only-Profilen
  über EU-Core ein übertragbares Muster.

- SNOMED CT (GPS/MII-Kernset) und LOINC als primäre Terminologien,
  validiert über MII-Terminologieserver.

- Patient (EPS) und EU-Core-Profile als Baseline für
  Personen-/Organisationsreferenzen, wenn EHDS-Kompatibilität Ziel ist.

**Vor LG-01-Release zu verifizieren**

LOINC-Codes und display-Strings gegen MII-Terminologieserver ·
EHDS-Zeitleiste (Publikation 05.03.2025, Inkrafttreten 26.03.2025,
Implementing Acts bis 26.03.2027, PS-/ePrescription-Pflicht ab
26.03.2029) gegen Primärtext der Verordnung im EU-Amtsblatt ·
mCODE-Feldname treatmentIntent gegen aktuelle mCODE-Version · EPS-Status
(QA-Preview) gegen aktuellen GitHub-Stand (github.com/hl7-eu/eps) ·
Konformitätsstrategie: volle IPS/EPS-Konformität vs. „nur aligned“ mit
eigenem Document-Type.

*Quellen: hl7.org/fhir/uv/ips/STU2 · build.fhir.org/ig/hl7-eu/eps ·
Projektbeschreibung BIH-CEI Onkologie Therapieziele*
