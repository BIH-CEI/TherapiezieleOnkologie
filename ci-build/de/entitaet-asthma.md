# Weitere Entität – Asthma bronchiale - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Weitere Entität – Asthma bronchiale

Diese Seite prüft das [Therapieziel-Modell](therapieziele.md) an einer **nicht- onkologischen Entität** (Erkrankung außerhalb der Krebsmedizin): dem **Asthma bronchiale** (der chronisch-entzündlichen, anfallsartig verengenden Atemwegserkrankung). Die Frage ist nicht „wie behandelt man Asthma", sondern: **Trägt dieselbe Struktur** – übergeordnetes Ziel plus messbare Etappenziele mit `target.measure` / `target.detail` / `target.due` (**woran** gemessen wird, **welcher Wert** das Ziel ist, **bis wann**) – **auch hier?**

### Die Zielstruktur des Asthmas

* **Übergeordnetes Ziel:** **Asthmakontrolle** – Beschwerdefreiheit im Alltag, normale Belastbarkeit und **keine schweren Anfälle** (Exazerbationen = akute, oft behandlungsbedürftige Verschlechterungen). Wie „kurativ/palliativ" (auf Heilung vs. auf Linderung) in der Krebsmedizin eine **strategische Grundausrichtung**, hier **kontrollierend**; heilbar ist Asthma nicht.
* **Phasenstruktur:** typisch ist das **Hoch- und Herunterstufen** (englisch „step-up / step-down" im GINA-Stufenschema) – erst die Kontrolle **erreichen**, dann auf die **geringste noch wirksame Therapie zurückfahren**. Eine eigene Phasenlogik (anders als das Induktion→Erhalt-Muster bei CED/Rheuma).

### Abbildung auf das Modell

„Zielgröße" = **woran** gemessen wird, „Zielwert" = **welcher Wert** als erreicht gilt, „Ergebnis" = die tatsächliche Messung.

| | | | |
| :--- | :--- | :--- | :--- |
| **Übergeordnet**(kontrollierend) | — (strategisch) | — | — |
| Beschwerde-Kontrolle | Asthma-Kontroll-Test (ACT – kurzer Fragebogen) —`measure.text` | ≥ 20 (gut kontrolliert) | Fragebogen |
| Lungenfunktion | FEV1 (Einsekundenkapazität – Luftmenge in 1 s ausgeatmet) — LOINC`20150-9`; FEV1/FVC`19926-5` | bester persönlicher Wert / Normbereich | Lungenfunktionstest (Spirometrie) |
| Anfallsfreiheit | schwere Anfälle pro Jahr —`measure.text` | 0 | Verlaufsdoku |
| Entzündungs-Steuerung (für Biologika) | FeNO (Entzündungsmarker in der Atemluft) —`measure.text`; eosinophile Blutzellen`26449-9` | Rückgang / Ansprechen | Messungen |
| Herunterstufen | benötigte Kortison-Tablettendosis —`measure.text` | ohne Kortisontabletten (Ziel) | Medikationsstatus |

Die **Medikamente** – Kortison-Sprays (ICS), die Kombination ICS-Formoterol (wirkt als Bedarfs- **und** Dauermittel), langwirksame Bronchien-Erweiterer (LABA/LAMA), Leukotrien-Hemmer und die **Biologika** (zielgerichtete Antikörper gegen einzelne Entzündungsbotenstoffe, z. B. gegen IgE oder Interleukin-5) – sind im Modell **Maßnahmen** (`MedicationRequest`), nicht das Ziel.

> **Jüngerer Umbruch.** Seit **GINA 2019** wird das alleinige Benutzen eines reinen Notfall-Sprays (kurzwirksamer Bronchien-Erweiterer, „SABA") **nicht mehr empfohlen** – es schützt nicht vor schweren Anfällen. Bedarfsmittel der Wahl ist heute ein **Spray mit entzündungshemmendem Anteil** (niedrigdosiertes ICS-Formoterol), das schwere Anfälle um ~60–65 % senkt. Ein Strategiewechsel, der die Bedarfstherapie neu definiert – während ältere Notfallspray-Schemata in der Versorgung noch nebeneinander bestehen.

### Was der Transfer zeigt

**Allgemeingültig** bleibt die Struktur; **krankheitsspezifisch** ist, dass das eigentliche Ziel ein **zusammengesetzter Zustand** ist (Beschwerden **und** Lungenfunktion **und** Anfallsfreiheit) – also **mehrere Zielgrößen gleichzeitig** – und dass die Phasenlogik ein **Herunterstufen** kennt. Erneut ein Beleg, dass die Ausrichtungen/Phasen **erweiterbar** sein müssen.

### Semantische Annotationen (Codesysteme)

Unabhängig von der Erklärung oben – so werden die Inhalte **maschinenlesbar** codiert. Die Codes sind gegen den MII-Terminologieserver geprüft (ICD-10-GM 2026, SNOMED CT 2026-07-01, ATC 2026, LOINC).

| | | |
| :--- | :--- | :--- |
| **Diagnose** | ICD-10-GM · SNOMED CT | `J45.9`Asthma bronchiale · SNOMED`195967001`**Asthma** |
| **Diagnostik / Messwerte** | LOINC | `20150-9`FEV1 ·`19926-5`FEV1/FVC ·`26449-9`Eosinophile im Blut; FeNO/ACT-Score als`measure.text` |
| **Therapien (Prozeduren)** | OPS · SNOMED CT | Inhalationstherapie (überwiegend medikamentös) |
| **Medikation** | ATC | `R03`Mittel bei obstruktiven Atemwegserkrankungen:`R03BA`inhalative Glucocorticoide (ICS) ·`R03AK`ICS+LABA-Kombination ·`R03AC`Beta2-Agonisten (SABA/LABA) ·`R03BB`Anticholinergika (LAMA) ·`R03DC`Leukotrienrezeptor-Antagonisten ·`R03DX`Biologika (systemisch) |

### Leitlinien und Quellen

* Bundesärztekammer (BÄK), Kassenärztliche Bundesvereinigung (KBV), AWMF. **Nationale VersorgungsLeitlinie Asthma.** Version 5, 23.08.2024 (gültig bis 14.08.2029), AWMF-Reg.-Nr. nvl-002. [leitlinien.de/themen/asthma](https://www.leitlinien.de/themen/asthma) (abgerufen 29.07.2026).
* Global Initiative for Asthma (GINA). **Global Strategy for Asthma Management and Prevention – 2025 Update.** GINA, Mai 2025. [ginasthma.org/2025-gina-strategy-report](https://ginasthma.org/2025-gina-strategy-report/) (abgerufen 29.07.2026).
* **Europäisch:** Holguin F, Cardet JC, Chung KF, et al. **Management of severe asthma: a European Respiratory Society/American Thoracic Society guideline.** Eur Respir J 2020;55:1900588. DOI [10.1183/13993003.00588-2019](https://doi.org/10.1183/13993003.00588-2019). — betrifft das **schwere** Asthma (Einteilung nach Entzündungstyp, Biologika).

→ Zurück zur [Übersicht der Therapieziele](therapieziele.md) · [Zielwerte und Messgrößen](goal-target-measure.md)

