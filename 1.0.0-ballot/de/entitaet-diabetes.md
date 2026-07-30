# Weitere Entität – Diabetes mellitus - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Weitere Entität – Diabetes mellitus

Diese Seite prüft das [Therapieziel-Modell](therapieziele.md) an einer **nicht- onkologischen Entität** (also einer Erkrankung außerhalb der Krebsmedizin): dem **Diabetes mellitus Typ 2** (der „Alterszucker", die häufige Zuckerkrankheit mit Insulinresistenz). Die Frage ist nicht „wie behandelt man Diabetes" (das ist Lehrbuchstoff), sondern: **Passt dieselbe Struktur** – ein übergeordnetes Ziel plus messbare Etappenziele mit `target.measure` / `target.detail` / `target.due` (also: **woran** man die Zielerreichung misst, **welcher Wert** als erreicht gilt, **bis wann**) – **auch hier?**

Der Diabetes ist dafür ein besonders lehrreicher Fall, weil das deutsche **DMP** (Disease-Management-Programm – ein geregeltes Dauerbehandlungs-Programm der Krankenkassen für chronisch Kranke) – und in seiner digitalen Fortschreibung das **dDMP** – die Versorgungsziele bereits **festschreibt** und teils an messbare Schwellenwerte bindet.

### Die Zielstruktur des Diabetes

* **Übergeordnetes Ziel:** laut [DMP-Richtlinie](https://www.g-ba.de/richtlinien/83/) die **Erhöhung der Lebenserwartung**, die **Erhaltung/Verbesserung der Lebensqualität** sowie die **Vermeidung von Folgeschäden** (an Augen, Nieren, Nerven, Herz und Gefäßen). Das ist – wie „kurativ/palliativ" (auf Heilung vs. auf Linderung ausgerichtet) in der Krebsmedizin – eine **strategische Grundausrichtung**; heilbar im Sinne der Krebsmedizin ist der Diabetes nicht.
* **Phasenstruktur:** feiner als zunächst gedacht. In der **Frühphase** des Typ-2-Diabetes ist die **Remission** (Rückbildung – normale Blutzuckerwerte **ohne** Medikamente) ein realistisches Ziel (konsequente Lebensstiländerung; [Birkenfeld 2024]) – das dDMP soll es für neu Aufgenommene **ausdrücklich benennen**. Danach folgt die **dauerhafte Kontrolle** mit parallelen **Schutzzielen** für Herz/Kreislauf und Nieren. Also: **Frühphase (auf Rückbildung aus)** → **Erhalt/Kontrolle**.

### Abbildung auf das Modell

Zur Tabelle: „Zielgröße" = **woran** gemessen wird, „Zielwert" = **welcher Wert** als erreicht gilt, „Ergebnis" = die tatsächliche Messung, die man dagegenhält. Die `LOINC`-Kürzel sind international standardisierte Codes für den jeweiligen Messwert.

| | | | |
| :--- | :--- | :--- | :--- |
| **Übergeordnet**(Lebenserwartung, Lebensqualität, Folgeschäden vermeiden) | — (strategisch) | — | — |
| **Frühphase – Remission** | HbA1c (Langzeit-Blutzucker, ~3 Monate) ohne Medikamente — LOINC`4548-4` | Remission (HbA1c < 6,5 % ohne Medikation) | HbA1c-Messung |
| Blutzucker-Kontrolle/Erhalt | HbA1c`4548-4` | 6,5 – 7,5 % (individuell) | HbA1c-Messung |
| Herz-Kreislauf-Schutz | Blutdruck`8480-6`/`8462-4`; LDL („schlechtes" Cholesterin)`13457-7` | < 140/90 mmHg; LDL je nach Risiko | Messungen |
| Nierenschutz | eGFR (geschätzte Nierenleistung)`62238-1`; Eiweiß-im-Urin-Quotient`9318-7` | Nierenleistung stabil; Eiweiß-Quotient < 30 mg/g | Messungen |
| **Lebensqualität / Belastung** | Patienten-Fragebogen (WHO-5, PAID, DDS) —`measure.text` | z. B. WHO-5 ≥ 13; PAID < 40 | Fragebogen-Erhebung |

Die **Medikamente** (Metformin, SGLT2-Hemmer, GLP-1-Wirkstoffe, DPP-4-Hemmer, Sulfonylharnstoffe, Insulin – verschiedene Gruppen blutzuckersenkender Mittel) sind im Modell **Maßnahmen** (`MedicationRequest`), **nicht** das Ziel – die Trennung „**was wird getan**" vs. „**was soll erreicht werden**" aus der [Therapieziel-Seite](therapieziele.md).

> **Jüngere Zielverschiebung.** Die große Diabetes-Fachgesellschaften-Leitlinie (ADA/EASD) 2022/2023 hat den Fokus vom **reinen Blutzucker-Ziel** hin zum **Organschutz** verschoben: SGLT2-Hemmer und GLP-1-Wirkstoffe werden bei hohem Herz-/Nierenrisiko gegeben – **unabhängig vom Blutzuckerwert**, weil ihr Nutzen **nicht** an der Zuckersenkung hängt. Damit tritt neben den Blutzucker-Zielwert ein **Herz-/Nieren-Ergebnisziel**. Parallel etabliert sich mit der **kontinuierlichen Zuckermessung (CGM)** die „Time-in-Range" (der Anteil der Zeit im Zielbereich) als **zweite Blutzucker-Messgröße neben dem HbA1c** – alte und neue Größe bestehen nebeneinander, genau wie im [Messgrößen-Prinzip](goal-target-measure.md) beschrieben.

### Fragebögen als messbare Zielgröße – mit auslösenden Schwellen

Das übergeordnete Ziel „Lebensqualität" wird über **von Patienten selbst ausgefüllte Fragebögen** (englisch: Patient-Reported Outcome Measures, **PROMs**) messbar gemacht – der stärkste Beleg, dass eine Zielgröße auch **etwas anderes als einen Laborwert** sein kann. Im dDMP werden solche Fragebögen regelmäßig (z. B. alle zwei Wochen über eine Gesundheits-App oder die elektronische Patientenakte) erhoben und an **Schwellenwerte** gebunden, die automatisch eine Reaktion auslösen:

* **WHO-5** (kurzer Fragebogen zum Wohlbefinden, 5 Fragen): Wert **< 10** → Empfehlung, die betreuende Praxis aufzusuchen.
* **PAID** („Problem Areas in Diabetes", 20 Fragen, Skala 0–100): **≥ 40** zeigt eine hohe seelische Belastung durch den Diabetes an → Warnhinweis, Terminvermittlung.

Im Modell ist das **genau** die Kette `Goal.target` (Schwelle = Zielwert) → Verlaufs- Messung (Fragebogen-Wert als Ergebnis) → `achievementStatus` (Stand der Zielerreichung). Die Anbindung solcher Patienten-Fragebögen ist in [Zielwerte und Messgrößen](goal-target-measure.md) bereits vorgesehen; das dDMP zeigt den konkreten Ablauf dazu.

### Wo die Ziele „leben" (dDMP / ePA)

Im digitalen DMP wird der **Behandlungsplan in der elektronischen Patientenakte (ePA)** hinterlegt, die Dokumentation fein (bis zu einzelnen Laborwerten und Tagebucheinträgen) geführt und über sichere Kanäle geteilt. Für die technische Modellierung heißt das: die hier beschriebenen Zielobjekte haben im dDMP einen **realen Ablage- und Austauschort** – der Transfer des Modells ist nicht nur theoretisch, sondern trifft eine bereits gesetzlich angelegte Struktur (§ 137f SGB V, dDMP ab 2027).

### Was der Transfer zeigt

**Allgemeingültig** ist die Struktur: übergeordnetes Ziel + messbare Zielwerte + Ergebnis- Messung. **Krankheitsspezifisch** sind nur die konkreten Werte und eine **eigene Phasenlogik** (Frühphasen-Remission neben parallelen Dauer-/Schutzzielen). Dass hier **Fragebögen** und **Laborwerte** gleichberechtigt als Zielgrößen auftreten und das DMP daran **automatische Reaktionen** knüpft, zeigt zweierlei: Die Ausrichtungen/Phasen müssen **erweiterbar** bleiben, und eine Zielgröße muss **sowohl codierte Laborwerte als auch textuelle Fragebogen-Werte** tragen können.

### Semantische Annotationen (Codesysteme)

Unabhängig von der Erklärung oben – so werden die Inhalte **maschinenlesbar** codiert. Die Codes sind gegen den MII-Terminologieserver geprüft (ICD-10-GM 2026, SNOMED CT 2026-07-01, ATC 2026, LOINC).

| | | |
| :--- | :--- | :--- |
| **Diagnose** | ICD-10-GM · SNOMED CT | `E11.9`Diabetes mellitus Typ 2 · SNOMED`44054006`**Type 2 diabetes mellitus** |
| **Diagnostik / Messwerte** | LOINC | `4548-4`HbA1c ·`62238-1`eGFR (CKD-EPI) ·`9318-7`Albumin/Kreatinin (Urin) ·`13457-7`LDL-Cholesterin ·`8480-6`/`8462-4`Blutdruck |
| **Therapien (Prozeduren)** | OPS · SNOMED CT | überwiegend medikamentös; nicht-medikamentös z. B. Diabetes-Schulung, Ernährungstherapie |
| **Medikation** | ATC | `A10`Antidiabetika:`A10BA02`Metformin ·`A10BK`SGLT2-Inhibitoren ·`A10BJ`GLP-1-Rezeptoragonisten ·`A10BH`DPP-4-Inhibitoren ·`A10BB`Sulfonylharnstoffe ·`A10A`Insuline |

### Leitlinien und Quellen

* Bundesärztekammer (BÄK), Kassenärztliche Bundesvereinigung (KBV), AWMF. **Nationale VersorgungsLeitlinie Typ-2-Diabetes.** Version 3, 15.05.2023 (gültig bis 15.05.2028), AWMF-Reg.-Nr. nvl-001. [leitlinien.de/themen/diabetes](https://www.leitlinien.de/themen/diabetes) (abgerufen 29.07.2026).
* Deutsche Diabetes Gesellschaft (DDG) (Hrsg.). **Therapie des Typ-2-Diabetes.** Praxisempfehlung, 2025 (Diabetologie und Stoffwechsel, Suppl.). [ddg.info (PDF)](https://www.ddg.info/fileadmin/user_upload/05_Behandlung/01_Leitlinien/Praxisempfehlungen/2025/PE_Therapie_Typ-2-Diabetes_2025.pdf)
* **Europäisch:** Davies MJ, Aroda VR, Collins BS, et al. **Management of Hyperglycaemia in Type 2 Diabetes, 2022. A Consensus Report by the American Diabetes Association (ADA) and the European Association for the Study of Diabetes (EASD).** Diabetologia 2022;65:1925–1966. DOI [10.1007/s00125-022-05787-2](https://doi.org/10.1007/s00125-022-05787-2).
* Gemeinsamer Bundesausschuss (G-BA). **DMP-Anforderungen-Richtlinie (DMP-A-RL)** – Anlage Diabetes mellitus Typ 2 (Versorgungsziele des DMP). [g-ba.de/richtlinien/83](https://www.g-ba.de/richtlinien/83/) (abgerufen 29.07.2026).
* Caumanns J, Timpel P (_fbeta GmbH). **Patientenpfade im digitalen DMP Diabetes – Potenziale der Digitalisierung in die Versorgung von Menschen mit chronischen Erkrankungen bringen.** Hrsg. Bertelsmann Stiftung, Gütersloh, August 2025. DOI [10.11586/2025055](https://doi.org/10.11586/2025055). — Quelle für Versorgungsziele, PROMs (WHO-5, PAID, DDS) und die dDMP/ePA-Struktur.

→ Zurück zur [Übersicht der Therapieziele](therapieziele.md) · [Zielwerte und Messgrößen](goal-target-measure.md)

