# Zielwerte und Messgrößen - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Zielwerte und Messgrößen

Ein Therapieziel wird **messbar**, indem es einen oder mehrere Zielwerte trägt. FHIR `Goal.target` gliedert das in drei Elemente:

* **`target.measure`** — die **Messgröße**, an der die Zielerreichung beurteilt wird (codiert, z. B. LOINC/SNOMED). „Woran erkennt man, ob das Ziel erreicht ist?"
* **`target.detail[x]`** — der **angestrebte Wert bzw. Wertebereich** der Messgröße. „Welcher Wert gilt als Zielerreichung?"
* **`target.due[x]`** — der **Zieltermin** bzw. die Frist.

Ein Ziel kann **mehrere** Targets tragen (z. B. Krankheitsstatus **und** Bildgebung **und** Funktion).

### Vor allem auf Ebene der Therapieepisoden

Diese messbare `target`-Logik betrifft **vor allem die [Episodenziele](therapieziele.md)** der einzelnen Therapieepisoden — dort werden konkrete klinische Parameter (Krankheitsstatus, Staging, Ansprechen …) als Zielgröße gesetzt.

Das **übergeordnete Behandlungsziel** trägt dagegen in der Regel **keine messbare Zielgröße**, sondern die **strategische Intention** (kurativ vs. palliativ). Deren Festlegung ist kein Laborwert, sondern eine **klinische Einordnung** — abhängig von der **Krebsindikation** und davon, ab welchem **Staging/Grading** eine kurative Behandlung (z. B. Operabilität/Resektabilität) nicht mehr möglich ist.

### Zielwert ≠ Ergebnis

Sauber zu trennen sind der **angestrebte** Wert und das **beobachtete** Ergebnis:

* `Goal.target` ist der **Zielwert** (die Absicht). Derselbe Zielwert **darf über mehrere Ziele gleich** sein — Behandlungs- und Nachsorgeziel können denselben Krankheitsstatus anstreben, weil die Absicht über Heilung → Surveillance durchläuft.
* `Goal.outcomeReference` ist das **Ergebnis** — die evidenzierende `Observation`. Sie ist **pro Ziel eigen** und phasengerecht und bleibt **leer**, solange kein Ergebnis beobachtet wurde.

### Verlauf gehört in die Observation, nicht in den Status

`Goal.achievementStatus` verwendet **nur Zustands-Codes**: `in-progress`, `achieved`, `not-achieved`, `not-attainable`. Die **Trajektorie** („besser/schlechter", Tumoransprechen) wird **nicht** hier abgelegt — das Feld ist einwertig und ohne Historie, und „verbessert gegenüber **was?**" (Baseline vs. Nadir) ist ohne Bezugspunkt nicht bestimmbar. Ansprechen und Verlauf liegen deshalb in den `outcomeReference`-**Observations** (z. B. RECIST, mCODE Cancer Disease Status), die zeitgestempelt sind und ihren Bezugspunkt selbst definieren.

### Typische Messgrößen entlang des Verlaufs

Diese Messgrößen gelten **generell**, nicht nur für ein einzelnes Szenario — das [Mamma-Szenario](szenario-mamma.md) dient hier lediglich der Illustration (nicht damit gleichsetzen). Einige sind **entitätsspezifisch** (z. B. ER/PR/HER2 und das Nottingham-Grading beim Mammakarzinom, Arm-/Lymphödem-Status nach Axilla-Eingriff), andere **allgemein** (TNM, Stadiengruppe, Krankheitsstatus):

| | | |
| :--- | :--- | :--- |
| Diagnostik | Klinisches TNM (cT / cN / cM) | LOINC`21905-5`/`21906-3`/`21907-1` |
| Diagnostik | Stadiengruppe (klinisch) | LOINC`21908-9` |
| Diagnostik | Östrogen-/Progesteronrezeptor, HER2 | LOINC`40556-3`/`85339-0`/`48676-1` |
| Diagnostik | Grading (Nottingham) | LOINC`44648-4` |
| Behandlung (kurativ) | Stadiengruppe (Ansprechen → pCR) | LOINC`21908-9` |
| Nachsorge | Krankheitsstatus / Rezidivfreiheit | LOINC`21976-6` |
| Nachsorge | Arm-/Schulterfunktion, Lymphödem | Freitext (`measure.text`) |
| Nachsorge | Lebensqualität (PROM, EORTC QLQ-C30/BR23) | Freitext, Anbindung via PCO |

Das zugehörige **Ergebnis** wird als Verlaufs-`Observation` geführt, z. B. der Krankheitsstatus „kein Tumornachweis" (LOINC `97509-4`, SNOMED `260415000` **Not detected**), und über `outcomeReference` auf das jeweilige Ziel bezogen.

> **Hinweis.** Nicht jede Messgröße muss codiert sein — wo (noch) kein passender Code existiert (Funktion, PROM), ist `measure.text` zulässig. Für patientenberichtete Endpunkte ist die Anbindung an das [PCO IG](https://hl7.org/fhir/us/pco/) vorgesehen, statt sie hier eigen zu modellieren.

### Messgrößen ändern sich — deshalb an die Leitlinie binden

Welche Größe ein Ziel misst, ist **keine zeitlose Konstante**, sondern folgt dem jeweils gültigen Leitlinienstand — und der ändert sich. Beispiel: In der **rheumatoiden Arthritis** war der **DAS28** (ein zusammengesetzter Aktivitäts-Punktwert) lange die Remissions-Messgröße; das **EULAR-2025-Update rät davon ausdrücklich ab** (der DAS28 überschätzt Remission unter modernen Entzündungshemmern wie IL-6-/JAK-Hemmern) und stellt auf die **ACR-EULAR-Kriterien (Boolean) bzw. SDAI/CDAI** um (siehe [Rheumatoide Arthritis](entitaet-rheuma.md)).

Entscheidend: **Nicht alle stellen gleichzeitig um.** Register, Standorte und Systeme sind zu jedem Zeitpunkt auf **unterschiedlichem** Leitlinienstand — alte und neue Messgröße **koexistieren**. Eine „Remission" nach DAS28 ist nicht dieselbe wie eine nach ACR-EULAR; ohne Herkunftsangabe vergleicht man Unvergleichbares.

Das Muster ist **nicht RA-spezifisch** — dieselbe Verschiebung zeigt sich quer durch die [weiteren Entitäten](therapieziele.md): **HbA1c → kardiorenaler Endpunkt / Time-in-Range** ([Diabetes](entitaet-diabetes.md)), **SABA → antiinflammatorischer Reliever** ([Asthma](entitaet-asthma.md)) und **symptombasiert → Calprotectin/Endoskopie** ([CED](entitaet-ced.md)). In allen Fällen laufen Alt- und Neu-Größe eine Zeit lang parallel.

Für die Modellierung folgt daraus zweierlei:

* `target.measure` ist **versionsabhängig und austauschbar**, kein hartkodierter Wert. Die Zielgröße trägt ihren **Herkunfts- und Gültigkeitskontext** mit (welche Leitlinie, welche Fassung).
* Zielgrößen werden an ihre **normative Leitlinienquelle** gebunden — über die Verlinkungs-Mechanik aus CPG-on-FHIR (`relatedArtifact` / `instantiatesCanonical`, siehe [Analysebericht](analysebericht.md)) — statt einen Zahlenwert als zeitlose Wahrheit zu behaupten. So bleiben parallele Stände **unterscheidbar und vergleichbar**.

### Modalität ist kein Endpunkt

Nicht jedes klinische Verfahren ist eine geeignete Zielgröße. Eine **Nachsorge-Mammographie** etwa ist ein **Verfahren zur Beurteilung**, **kein Endpunkt** — der Endpunkt ist der **Krankheitsstatus / die Rezidivfreiheit** (LOINC `21976-6`), den die Mammographie **feststellen hilft**. `target.measure` trägt den **gemessenen Zielzustand**, nicht die Modalität, mit der er erhoben wird (die Mammographie selbst gehört als geplante Maßnahme in einen `ServiceRequest`).

### Weitere typische Zielgrößen

| | | |
| :--- | :--- | :--- |
| Ansprechen (neoadjuvant) | Tumorgröße, max. Durchmesser (mm) | `33728-7` |
| Chirurgisches Ergebnis | Resektionsstatus (R0/R1/R2) | `84892-9` |
| Toxizitäts-/Labormonitoring | Leukozyten (z. B. Leukopenie) | `6690-2` |
| Tumormarker-Monitoring | PSA (Prostata) | `2857-1` |
| Tumormarker-Monitoring | CA-125 (Ovar) | `10334-1` |
| Tumormarker-Monitoring | CEA (gastrointestinal) | `2039-6` |
| Tumormarker-Monitoring | CA 15-3 (Mamma) | `6875-9` |

Tumormarker sind vor allem im **Verlaufsmonitoring** relevant; ihr sinnvoller Einsatz ist **entitäts- und situationsabhängig** (Marker × Entität × Situation). So ist **CA-125 beim Ovarialkarzinom** ein etablierter Monitoring-Endpunkt (GCIG-CA-125- Ansprech-/Progressionskriterien), während die routinemäßige **CA-15-3-Bestimmung in der asymptomatischen kurativen Mamma-Nachsorge** leitlinienkonform **nicht** empfohlen wird. CA-125 ist dabei der **Ovarial-**, CA 15-3 der **Mamma-Marker** — nicht austauschbar.

### Beispiele

* [Mammakarzinom (neoadjuvant)](szenario-mamma.md) — Diagnostik-, Heilungs- und Nachsorgeziel mit je eigenen Targets.
* [mCRC (palliativ)](szenario-crc.md) — Ziele Lebensverlängerung/Symptomkontrolle mit Bezug auf die Verlaufs-Observation.

→ Zurück zur [Übersicht der Therapieziele](therapieziele.md)

