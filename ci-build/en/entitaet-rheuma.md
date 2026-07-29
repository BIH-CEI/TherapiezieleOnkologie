# Weitere Entität – Rheumatoide Arthritis - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Weitere Entität – Rheumatoide Arthritis

 
There is no translation page available for the current page, so it has been rendered in the default language 

Diese Seite prüft das [Therapieziel-Modell](therapieziele.md) an der **rheumatoiden Arthritis (RA)** – der häufigsten entzündlichen Gelenkerkrankung, bei der das Immunsystem die Gelenke angreift; stellvertretend für den rheumatischen Formenkreis. Die Frage ist nicht „wie behandelt man RA", sondern: **Trägt dieselbe Struktur** – übergeordnetes Ziel plus messbare Etappenziele mit `target.measure` / `target.detail` / `target.due` (**woran** gemessen wird, **welcher Wert** das Ziel ist, **bis wann**) – **auch hier?**

### Die Zielstruktur der RA

* **Übergeordnetes Ziel:** **anhaltende Remission** (weitgehende Rückbildung der Entzündung) oder – wo nicht erreichbar – **niedrige Krankheitsaktivität**, dazu **Verhinderung bleibender Gelenkschäden** und **Erhalt der Funktion/Beweglichkeit**. Eine strategische Grundausrichtung, hier **auf Remission ausgerichtet**; eine echte Heilung (dauerhaft ganz ohne Medikamente) ist laut EULAR 2025 „extremely rare" (äußerst selten).
* **„Treat to target" (Behandeln nach Zielwert):** Die RA ist das **Musterbeispiel** dafür – ein **festgelegter Zielwert** (Remission bzw. niedrige Aktivität), **engmaschige Messung** (alle 1–3 Monate) und **Anpassung der Therapie, bis das Ziel erreicht ist**: mindestens 50 % weniger Krankheitsaktivität nach 3 Monaten, volle Zielerreichung nach 6 Monaten.
* **Phasenstruktur:** **Erst herunterbringen** (bis das Ziel erreicht ist) → **dann halten** – dasselbe Erst-Löschen-dann-Halten-Muster wie bei CED.

### Abbildung auf das Modell

„Zielgröße" = **woran** gemessen wird, „Zielwert" = **welcher Wert** als erreicht gilt, „Ergebnis" = die tatsächliche Messung. Krankheitsaktivität wird über zusammengesetzte Punktwerte („Scores") erfasst.

| | | | |
| :--- | :--- | :--- | :--- |
| **Übergeordnet**(auf Remission ausgerichtet) | — (strategisch) | — | — |
| Herunterbringen – Aktivität | Remissions-Kriterien nach ACR-EULAR bzw. Punktwerte SDAI/CDAI —`measure.text` | Remission (SDAI ≤ 3,3 / CDAI ≤ 2,8) oder niedrige Aktivität; ≥ 50 % Reduktion nach 3 Mon., Ziel nach 6 Mon. (`target.due`) | Score-Erhebung |
| Herunterbringen – Entzündung | CRP (Entzündungswert im Blut) — LOINC`1988-5`; BSG (Blutsenkung)`30341-2` | Normalisierung | Messungen |
| Halten – Funktion | HAQ (Fragebogen zur Alltagsfähigkeit) —`measure.text` | Erhalt/Verbesserung | Fragebogen |
| Halten – Gelenkschäden | Fortschreiten im Röntgen —`measure.text` | kein Fortschreiten | Bildgebung |

> **DAS28 taugt nicht (mehr) als Remissions-Zielwert.** Der **DAS28** („Disease Activity Score" über 28 Gelenke) verrechnet die Zahl geschwollener und druckschmerzhafter Gelenke, einen Entzündungslaborwert (CRP **oder** Blutsenkung) und die Selbsteinschätzung des Patienten zu **einer** Zahl (grob: < 2,6 = „Remission"). Das EULAR-2025-Update rät ausdrücklich davon ab: Weil der DAS28 stark am Entzündungslabor hängt und moderne Wirkstoffe (IL-6- bzw. JAK-Hemmer) genau dieses Labor senken, **ohne** dass die Gelenke ebenso gut sind, täuscht er Remission vor. Maßgeblich sind stattdessen die **ACR-EULAR-Kriterien** bzw. die Punktwerte **SDAI/CDAI**. Fürs Modell heißt das: `target.measure` trägt das ACR-EULAR-/SDAI-/CDAI-Kriterium, nicht den DAS28 – ein Musterfall für [wechselnde, an die Leitlinie gebundene Messgrößen](goal-target-measure.md).

Die **Medikamente** – die Basismedikamente „DMARDs" (krankheitsmodifizierende Antirheumatika: Methotrexat als Standard-Basismittel, Leflunomid, Sulfasalazin, Hydroxychloroquin), kurzzeitig **Kortison** zur Überbrückung, sowie die neueren zielgerichteten **Biologika** (Antikörper gegen einzelne Entzündungsbotenstoffe wie TNF oder Interleukin-6) und die **JAK-Hemmer** (zielgerichtete Tabletten) – sind im Modell **Maßnahmen** (`MedicationRequest`), nicht das Ziel.

### Was der Transfer zeigt

Die RA macht den **Kern des Modells** sichtbar: Ein **festgelegter Zielzustand** (Remission nach ACR-EULAR bzw. SDAI/CDAI) mit **Frist** (3-/6-Monats-Etappen) und **schrittweiser Nachsteuerung** ist genau das, was `Goal.target` + Verlaufs-Messung abbilden. **Allgemeingültig** ist die Struktur; **krankheitsspezifisch** sind Punktwert und Schwelle – und die Warnung, dass die **Wahl** der Messgröße (ACR-EULAR statt DAS28) das Ergebnis verzerren kann.

### Semantische Annotationen (Codesysteme)

Unabhängig von der Erklärung oben – so werden die Inhalte **maschinenlesbar** codiert. Die Codes sind gegen den MII-Terminologieserver geprüft (ICD-10-GM 2026, SNOMED CT 2026-07-01, ATC 2026, LOINC).

| | | |
| :--- | :--- | :--- |
| **Diagnose** | ICD-10-GM · SNOMED CT | `M05.9`seropositive /`M06.99`sonstige chronische Polyarthritis · SNOMED`69896004`**Rheumatoid arthritis** |
| **Diagnostik / Messwerte** | LOINC | `1988-5`CRP ·`30341-2`BSG (Blutsenkung) ·`11572-5`Rheumafaktor ·`33935-8`Anti-CCP (ACPA); Scores DAS28/SDAI/CDAI/HAQ als`measure.text` |
| **Therapien (Prozeduren)** | OPS · SNOMED CT | überwiegend medikamentös; Gelenkprozeduren bei Spätschäden |
| **Medikation** | ATC | `L04AX03`Methotrexat ·`H02AB`Glucocorticoide ·`M01A`NSAR ·`L04A`Immunsuppressiva:`L04AB`TNF-Inhibitoren ·`L04AC`Interleukin-Inhibitoren (Tocilizumab/IL-6) ·`L04AF`JAK-Inhibitoren |

### Leitlinien und Quellen

* **Europäisch (maßgeblich):** Smolen JS, Edwards CJ, Konzett V, et al. **EULAR recommendations for the management of rheumatoid arthritis with synthetic and biologic disease-modifying antirheumatic drugs: 2025 update.** Ann Rheum Dis 2026;85:991–1009. DOI [10.1016/j.ard.2026.01.023](https://doi.org/10.1016/j.ard.2026.01.023) (Open Access). — Vorgänger: **2022 update**, Ann Rheum Dis 2023;82(1):3–18, DOI [10.1136/ard-2022-223356](https://doi.org/10.1136/ard-2022-223356).
* Fiehn C, Holle J, Iking-Konert C, et al. (DGRh). **S2e-Leitlinie: Therapie der rheumatoiden Arthritis mit krankheitsmodifizierenden Medikamenten.** AWMF-Reg.-Nr. 060-004, Juli 2018 (in Überarbeitung); Z Rheumatol 2018. DOI [10.1007/s00393-018-0481-y](https://doi.org/10.1007/s00393-018-0481-y).

→ Zurück zur [Übersicht der Therapieziele](therapieziele.md) · [Zielwerte und Messgrößen](goal-target-measure.md)

