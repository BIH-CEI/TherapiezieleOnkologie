# Weitere Entität – Chronisch-entzündliche Darmerkrankungen - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.2

## Weitere Entität – Chronisch-entzündliche Darmerkrankungen

Diese Seite prüft das [Therapieziel-Modell](therapieziele.md) an den **chronisch- entzündlichen Darmerkrankungen (CED)** – **Morbus Crohn** und **Colitis ulcerosa** (zwei Formen dauerhafter Darmentzündung, die in Schüben verläuft). Die Frage ist nicht „wie behandelt man CED", sondern: **Trägt dieselbe Struktur** – übergeordnetes Ziel plus messbare Etappenziele mit `target.measure` / `target.detail` / `target.due` (**woran** gemessen wird, **welcher Wert** das Ziel ist, **bis wann**) – **auch hier?**

### Die Zielstruktur der CED

* **Übergeordnetes Ziel:** **anhaltende Beschwerdefreiheit ohne Kortison** (steroidfreie Remission) und **Vermeidung von Komplikationen und Operationen**. Eine strategische Grundausrichtung, hier **auf Rückbildung (Remission) ausgerichtet**.
* **Phasenstruktur:** CED zeigt am klarsten das **Erst-Löschen-dann-Halten**-Muster: **Remissionsinduktion** (den akuten Schub zum Abklingen bringen) → **Remissionserhalt** (den ruhigen Zustand bewahren). Zwei klar getrennte Phasen mit **unterschiedlichen Zielgrößen**.
* **„Treat to target" (Behandeln nach Zielwert):** In der Leitlinie (STRIDE-II) ist die Zielstaffel festgelegt – vom Ansprechen der Beschwerden über echte Beschwerdefreiheit und normale Laborwerte bis zur **Abheilung der Darmschleimhaut** (in der Darmspiegelung sichtbar).

### Abbildung auf das Modell

„Zielgröße" = **woran** gemessen wird, „Zielwert" = **welcher Wert** als erreicht gilt, „Ergebnis" = die tatsächliche Messung.

| | | | |
| :--- | :--- | :--- | :--- |
| **Übergeordnet**(auf Remission ausgerichtet) | — (strategisch) | — | — |
| Induktion – Beschwerden | Aktivitäts-Punktwert (Fragebögen/Scores wie CDAI/HBI bzw. Mayo/SCCAI) —`measure.text` | Beschwerdefreiheit (klinische Remission) | Score-Erhebung |
| Induktion/Erhalt – Laborwerte | Calprotectin im Stuhl (Entzündungsmarker) — LOINC`38445-3`; CRP (Entzündungswert im Blut)`1988-5` | Calprotectin < 150–250 µg/g; CRP normal | Messungen |
| Erhalt – Darmspiegelung | Schleimhaut-Befund in der Endoskopie (Scores SES-CD bzw. Mayo) —`measure.text` | abgeheilte Schleimhaut | Endoskopie-Befund |
| Erhalt – ohne Kortison | Kortison-Einsatz —`measure.text` | Remission ohne Kortison | Medikationsstatus |
| Begleit – Blutarmut | Hämoglobin (roter Blutfarbstoff) — LOINC`718-7` | Normalisierung | Messung |

Die **Medikamente** – entzündungshemmende Darmmittel (5-ASA/Mesalazin), Kortison (im Schub), klassische Immundämpfer (Azathioprin, Methotrexat) und die zielgerichteten **Biologika und modernen Tabletten** (Antikörper und kleine Moleküle gegen einzelne Entzündungswege, z. B. Anti-TNF, Vedolizumab, Ustekinumab, JAK-Hemmer) – sind im Modell **Maßnahmen** (`MedicationRequest`), nicht das Ziel.

> **Rasch wachsendes Arsenal (2022–2024).** Neu hinzugekommen sind die **S1P-Modulatoren** (Ozanimod, Etrasimod – als Tablette bei Colitis ulcerosa), weitere zielgerichtete Antikörper der **Interleukin-23-Klasse** (Risankizumab – Morbus Crohn 2022, Colitis ulcerosa 2024; Mirikizumab – Colitis ulcerosa 2023) und der **JAK-Hemmer Upadacitinib** (beide Erkrankungen). Die **Zielgrößen** (Beschwerden → Laborwerte → Schleimhautheilung) bleiben stabil, während sich die **Mittel** schnell erweitern – ein Beleg, warum Ziel und Maßnahme im Modell getrennt gehören.

### Was der Transfer zeigt

CED belegt den Transfer am deutlichsten: eine **echte Erst-Löschen-dann-Halten-Phasenlogik** mit **phasenspezifischen Zielgrößen** (Beschwerden → Laborwerte → Schleimhautheilung), die sich genau in `Goal.target` je Behandlungsabschnitt abbilden lassen. **Allgemeingültig** ist die Struktur; **krankheitsspezifisch** sind die Punktwerte und Schwellen.

### Semantische Annotationen (Codesysteme)

Unabhängig von der Erklärung oben – so werden die Inhalte **maschinenlesbar** codiert. Die Codes sind gegen den MII-Terminologieserver geprüft (ICD-10-GM 2026, SNOMED CT 2026-07-01, ATC 2026, LOINC, OPS 2026).

| | | |
| :--- | :--- | :--- |
| **Diagnose** | ICD-10-GM · SNOMED CT | Morbus Crohn`K50.9`/ SNOMED`34000006`· Colitis ulcerosa`K51.9`/ SNOMED`64766004` |
| **Diagnostik / Messwerte** | LOINC · OPS (Endoskopie) | `38445-3`Calprotectin (Stuhl) ·`1988-5`CRP ·`718-7`Hämoglobin; Koloskopie OPS`1-650`/ SNOMED`73761001` |
| **Therapien (Prozeduren)** | OPS · SNOMED CT | endoskopische Diagnostik/Therapie OPS`1-650`(Koloskopie); Darmresektion (chirurgisch) |
| **Medikation** | ATC | `A07EC02`Mesalazin ·`H02AB`Glucocorticoide ·`L04A`Immunsuppressiva:`L04AB`TNF-Inhibitoren ·`L04AC`Interleukin-Inhibitoren (Ustekinumab, IL-23) ·`L04AE`S1P-Modulatoren ·`L04AF`JAK-Inhibitoren ·`L04AG`monoklonale Antikörper (Vedolizumab) |

### Leitlinien und Quellen

* Deutsche Gesellschaft für Gastroenterologie, Verdauungs- und Stoffwechselkrankheiten (DGVS). **S3-Leitlinie Diagnostik und Therapie des Morbus Crohn.** Version 4.1, März 2024 (Living Guideline), AWMF-Reg.-Nr. 021-004. [dgvs.de](https://www.dgvs.de/leitlinien/unterer-gi-trakt/morbus-crohn/) (abgerufen 29.07.2026).
* DGVS. **S3-Leitlinie Colitis ulcerosa.** Version 7.0, November 2025, AWMF-Reg.-Nr. 021-009. [register.awmf.org/de/leitlinien/detail/021-009](https://register.awmf.org/de/leitlinien/detail/021-009) (abgerufen 29.07.2026).
* **Europäisch:** Torres J, Bonovas S, Doherty G, et al. (ECCO). **ECCO Guidelines on Therapeutics in Crohn's Disease: Medical Treatment.** J Crohns Colitis 2020;14(1):4–22. DOI [10.1093/ecco-jcc/jjz180](https://doi.org/10.1093/ecco-jcc/jjz180) (2024 aktualisiert, JCC 18(10):1531).
* **Europäisch:** Raine T, Bonovas S, Burisch J, et al. (ECCO). **ECCO Guidelines on Therapeutics in Ulcerative Colitis: Medical Treatment.** J Crohns Colitis 2022;16(1):2–17. DOI [10.1093/ecco-jcc/jjab178](https://doi.org/10.1093/ecco-jcc/jjab178).
* Turner D, Ricciuto A, Lewis A, et al. **STRIDE-II: An Update on the Selecting Therapeutic Targets in Inflammatory Bowel Disease (STRIDE) Initiative of the International Organization for the Study of IBD (IOIBD).** Gastroenterology 2021;160(5):1570–1583. DOI [10.1053/j.gastro.2020.12.031](https://doi.org/10.1053/j.gastro.2020.12.031). — Staffel der Behandlungsziele („treat to target").

→ Zurück zur [Übersicht der Therapieziele](therapieziele.md) · [Zielwerte und Messgrößen](goal-target-measure.md)

