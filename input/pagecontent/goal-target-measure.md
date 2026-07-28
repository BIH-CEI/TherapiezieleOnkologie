### Zielwerte und Messgrößen (`Goal.target`)

Ein Therapieziel wird **messbar**, indem es einen oder mehrere Zielwerte trägt. FHIR
`Goal.target` gliedert das in drei Elemente:

- **`target.measure`** — die *Messgröße*, an der die Zielerreichung beurteilt wird
  (codiert, z. B. LOINC/SNOMED). „Woran erkennt man, ob das Ziel erreicht ist?"
- **`target.detail[x]`** — der *angestrebte Wert bzw. Wertebereich* der Messgröße.
  „Welcher Wert gilt als Zielerreichung?"
- **`target.due[x]`** — der *Zieltermin* bzw. die Frist.

Ein Ziel kann **mehrere** Targets tragen (z. B. Krankheitsstatus *und* Bildgebung
*und* Funktion).

### Vor allem auf Ebene der Therapieepisoden

Diese messbare `target`-Logik betrifft **vor allem die
[Episodenziele](therapieziele.html)** der einzelnen Therapieepisoden — dort werden
konkrete klinische Parameter (Krankheitsstatus, Staging, Ansprechen …) als Zielgröße
gesetzt.

Das **übergeordnete Behandlungsziel** trägt dagegen in der Regel **keine messbare
Zielgröße**, sondern die **strategische Intention** (kurativ vs. palliativ). Deren
Festlegung ist kein Laborwert, sondern eine **klinische Einordnung** — abhängig von der
**Krebsindikation** und davon, ab welchem **Staging/Grading** eine kurative Behandlung
(z. B. Operabilität/Resektabilität) nicht mehr möglich ist.

### Zielwert ≠ Ergebnis

Sauber zu trennen sind der **angestrebte** Wert und das **beobachtete** Ergebnis:

- `Goal.target` ist der **Zielwert** (die Absicht). Derselbe Zielwert **darf über
  mehrere Ziele gleich** sein — Behandlungs- und Nachsorgeziel können denselben
  Krankheitsstatus anstreben, weil die Absicht über Heilung → Surveillance durchläuft.
- `Goal.outcomeReference` ist das **Ergebnis** — die evidenzierende `Observation`. Sie
  ist **pro Ziel eigen** und phasengerecht und bleibt **leer**, solange kein Ergebnis
  beobachtet wurde.

### Verlauf gehört in die Observation, nicht in den Status

`Goal.achievementStatus` verwendet **nur Zustands-Codes**: `in-progress`, `achieved`,
`not-achieved`, `not-attainable`. Die **Trajektorie** („besser/schlechter",
Tumoransprechen) wird **nicht** hier abgelegt — das Feld ist einwertig und ohne
Historie, und „verbessert gegenüber *was?*" (Baseline vs. Nadir) ist ohne Bezugspunkt
nicht bestimmbar. Ansprechen und Verlauf liegen deshalb in den
`outcomeReference`-**Observations** (z. B. RECIST, mCODE Cancer Disease Status), die
zeitgestempelt sind und ihren Bezugspunkt selbst definieren.

### Typische Messgrößen entlang des Verlaufs

Diese Messgrößen gelten **generell**, nicht nur für ein einzelnes Szenario — das
[Mamma-Szenario](szenario-mamma.html) dient hier lediglich der Illustration (nicht
damit gleichsetzen). Einige sind **entitätsspezifisch** (z. B. ER/PR/HER2 und das
Nottingham-Grading beim Mammakarzinom, Arm-/Lymphödem-Status nach Axilla-Eingriff),
andere **allgemein** (TNM, Stadiengruppe, Krankheitsstatus):

| Ziel-Phase | Messgröße (`target.measure`) | Code |
|---|---|---|
| Diagnostik | Klinisches TNM (cT / cN / cM) | LOINC `21905-5` / `21906-3` / `21907-1` |
| Diagnostik | Stadiengruppe (klinisch) | LOINC `21908-9` |
| Diagnostik | Östrogen-/Progesteronrezeptor, HER2 | LOINC `40556-3` / `85339-0` / `48676-1` |
| Diagnostik | Grading (Nottingham) | LOINC `44648-4` |
| Behandlung (kurativ) | Stadiengruppe (Ansprechen → pCR) | LOINC `21908-9` |
| Nachsorge | Krankheitsstatus / Rezidivfreiheit | LOINC `21976-6` |
| Nachsorge | Arm-/Schulterfunktion, Lymphödem | Freitext (`measure.text`) |
| Nachsorge | Lebensqualität (PROM, EORTC QLQ-C30/BR23) | Freitext, Anbindung via PCO |

Das zugehörige **Ergebnis** wird als Verlaufs-`Observation` geführt, z. B. der
Krankheitsstatus „kein Tumornachweis" (LOINC `97509-4`, SNOMED `260415000` *Not
detected*), und über `outcomeReference` auf das jeweilige Ziel bezogen.

> **Hinweis.** Nicht jede Messgröße muss codiert sein — wo (noch) kein passender Code
> existiert (Funktion, PROM), ist `measure.text` zulässig. Für patientenberichtete
> Endpunkte ist die Anbindung an das [PCO IG](https://hl7.org/fhir/us/pco/) vorgesehen,
> statt sie hier eigen zu modellieren.

### Modalität ist kein Endpunkt

Nicht jedes klinische Verfahren ist eine geeignete Zielgröße. Eine
**Nachsorge-Mammographie** etwa ist ein **Verfahren zur Beurteilung**, **kein
Endpunkt** — der Endpunkt ist der **Krankheitsstatus / die Rezidivfreiheit** (LOINC
`21976-6`), den die Mammographie *feststellen hilft*. `target.measure` trägt den
**gemessenen Zielzustand**, nicht die Modalität, mit der er erhoben wird (die
Mammographie selbst gehört als geplante Maßnahme in einen `ServiceRequest`).

### Weitere typische Zielgrößen

| Zweck | Messgröße | Code (LOINC) |
|---|---|---|
| Ansprechen (neoadjuvant) | Tumorgröße, max. Durchmesser (mm) | `33728-7` |
| Chirurgisches Ergebnis | Resektionsstatus (R0/R1/R2) | `84892-9` |
| Toxizitäts-/Labormonitoring | Leukozyten (z. B. Leukopenie) | `6690-2` |
| Tumormarker-Monitoring | PSA (Prostata) | `2857-1` |
| Tumormarker-Monitoring | CA-125 (Ovar) | `10334-1` |
| Tumormarker-Monitoring | CEA (gastrointestinal) | `2039-6` |
| Tumormarker-Monitoring | CA 15-3 (Mamma) | `6875-9` |

Tumormarker sind vor allem im **Verlaufsmonitoring** relevant; ihr sinnvoller Einsatz
ist **entitäts- und situationsabhängig** (Marker × Entität × Situation). So ist
**CA-125 beim Ovarialkarzinom** ein etablierter Monitoring-Endpunkt (GCIG-CA-125-
Ansprech-/Progressionskriterien), während die routinemäßige **CA-15-3-Bestimmung in der
asymptomatischen kurativen Mamma-Nachsorge** leitlinienkonform *nicht* empfohlen wird.
CA-125 ist dabei der **Ovarial-**, CA 15-3 der **Mamma-Marker** — nicht austauschbar.

### Beispiele

- [Mammakarzinom (neoadjuvant)](szenario-mamma.html) — Diagnostik-, Heilungs- und
  Nachsorgeziel mit je eigenen Targets.
- [mCRC (palliativ)](szenario-crc.html) — Ziele Lebensverlängerung/Symptomkontrolle mit
  Bezug auf die Verlaufs-Observation.

→ Zurück zur [Übersicht der Therapieziele](therapieziele.html)
