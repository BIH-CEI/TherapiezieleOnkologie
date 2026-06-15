*Person-Centered Outcomes (HL7 FHIR) — Zusammenfassung*

# 1. Überblick

Der **Person-Centered Outcomes (PCO) Implementation Guide** ist ein HL7
FHIR-Standard (v1.0.0, STU 1) für den Austausch von Informationen zu
patientenzentrierten Ergebnissen. Er wurde vom **HL7 International /
Patient Care Committee** entwickelt und basiert auf FHIR R4 (4.0.1), US
Realm, CC0-Lizenz.

Der PCO IG entstand als Weiterentwicklung des MCC (Multiple Chronic
Conditions) eCare Plan FHIR IG und unterstützt die Identifikation und
das Tracking von persönlichen Outcome-Zielen, die für Patienten am
wichtigsten sind.

|                  |                                            |
|------------------|--------------------------------------------|
| **Version**      | 1.0.0 — STU 1 (Maturity Level 2)           |
| **FHIR-Version** | R4 (4.0.1)                                 |
| **Herausgeber**  | HL7 International / Patient Care Committee |
| **Realm**        | US (international anwendbar)               |
| **Lizenz**       | CC0-1.0 (Public Domain)                    |
| **URL**          | http://hl7.org/fhir/us/pco                 |

# 2. Kernkonzept: „What Matters Most“

Der PCO IG verfolgt einen Ansatz der **kollaborativen Zielsetzung**:
Statt reiner Symptombehandlung steht im Mittelpunkt, was dem einzelnen
Patienten am wichtigsten ist. Der Prozess umfasst:

- Identifikation persönlicher Gesundheitspriorititäten („What Matters
  Assessment“)

- Festlegung personalisierter, messbarer Ziele

- Bewertung von Bereitschaft und Barrieren

- Kontinuierliches Monitoring des Fortschritts

- Integration in umfassende Pflegepläne

# 3. FHIR-Profile

| **Kategorie** | **Profil** | **Beschreibung** |
|----|----|----|
| **Ziele** | Person-Centered Goal | Basisprofil für alle PCO-Ziele |
|  | GAS Goal | Goal Attainment Scaling |
|  | PROM Goal | Patient-Reported Outcome Measures |
| **Assessment** | What Matters Assessment | Identifikation der Patientenpriorititäten |
|  | Readiness Assessment | Bereitschaftsbewertung |
|  | Goal Barriers Assessment | Barrieren-Analyse |
| **Koordination** | Person-Centered Care Plan | Patientenzentrierter Pflegeplan |
| **Outcomes** | GAS Score Observation | GAS-Ergebnis-Dokumentation |
|  | PROM Score Observation | PROM-Ergebnis-Dokumentation |

# 4. Messmethoden

## Goal Attainment Scaling (GAS)

GAS individualisiert die Zielmessung durch Festlegung von Baseline- und
Ziel-Erreichungsgraden für spezifische Patientenziele. Die kollaborative
Zielsetzung mit numerischen Skalen repräsentiert verschiedene
Erreichungsstufen.

## Patient-Reported Outcome Measures (PROM)

PROMs nutzen validierte, standardisierte Instrumente zur Messung von
Ergebnissen, die Patienten als wichtig erachten. Terminologisch werden
LOINC-Codes und spezifische Value Sets (GAS Score Type, PROM Target
Measures) verwendet.

# 5. Anwendungsfälle

- Patienten mit komplexen Versorgungsbedarfen: Identifikation von
  Prioritäten und Fortschrittsverfolgung

- Klinische Implementierung über das gesamte Versorgungskontinuum

- Gesundheitscoaching und Care Coordination

- Qualitätsmessung und Forschung

- Sektorenübergreifende Integration via FHIR-Interoperabilität

# 6. Relevanz für die KIG Onko Therapieziel-Spezifikation

Der PCO IG ist hochrelevant für die gematik-Spezifikation „Therapieziel
Onkologie“:

- PCO liefert ein generisches FHIR-Framework für patientenzentrierte
  Ziele — die KIG Onko Spezifikation kann darauf aufbauen

- Die GAS- und PROM-Ansätze sind direkt auf onkologische Therapieziele
  anwendbar

- Die „What Matters Most“-Philosophie passt zur partizipativen
  Entscheidungsfindung (Shared Decision Making) bei der
  Therapiezielfestlegung

- Das Person-Centered Goal Profil kann für onkologische Use Cases
  profiliert werden

- Lücke: PCO ist generisch, nicht onkologiespezifisch — die KIG Onko
  Spezifikation füllt die onkologische Lücke (z.B. Heilung,
  Lebensverlängerung, Symptomkontrolle, Lebensqualität)

- Komplementarität zu mCODE: PCO adressiert Patientenziele, mCODE die
  klinische Datenstruktur — beide zusammen bilden das Gesamtbild

# 7. Referenzen

- [PCO IG (Published)](https://hl7.org/fhir/us/pco/) —
  https://hl7.org/fhir/us/pco/

- [PCO IG (CI Build)](https://build.fhir.org/ig/HL7/pco-ig/) —
  https://build.fhir.org/ig/HL7/pco-ig/

- [MCC eCare Plan IG](https://hl7.org/fhir/us/mcc/) —
  https://hl7.org/fhir/us/mcc/

- [mCODE STU4](https://hl7.org/fhir/us/mcode/STU4/) —
  https://hl7.org/fhir/us/mcode/STU4/
