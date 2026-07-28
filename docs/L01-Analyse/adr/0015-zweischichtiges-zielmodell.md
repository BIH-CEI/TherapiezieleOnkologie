# ADR-0015: Zweischichtiges Zielmodell mit Replace-on-Pivot statt Mutation

- **Status:** accepted
- **Datum:** 2026-07-24
- **Beteiligte:** Thomas Debertshäuser
- **Bezug:** ADR-0012 (CarePlan/Goal-Fallback), ADR-0016, ADR-0017, ADR-0018, `CONTEXT.md` (Ziele); MCCGoal (HL7 US MCC eCare Plan)

## Kontext

Über den onkologischen Verlauf gibt es eine **strategische Gesamtausrichtung**
(kurativ vs. palliativ) und **phasenspezifische Ziele** (Diagnosesicherung, pCR,
Rezidivüberwachung). FHIR `Goal` liefert die Bausteine (`goal-relationship`,
`lifecycleStatus`, `achievementStatus`), trifft aber **keine Aussage** über
Kardinalität oder darüber, was bei einem Strategiewechsel (kurativ → palliativ bei
Progress) mit dem Ziel geschieht. Diese Politik muss der Leitfaden festlegen.

## Entscheidung

Zwei Ziel-Ebenen: **Layer 1** = genau **ein zu jedem Zeitpunkt aktives**
*Übergeordnetes Behandlungsziel* (`OnkoTherapyGoal`) mit der strategischen
Intention; **Layer 2** = optionale *Episodenziele* je [[Behandlungsepisode]]/Phase.
Bei einem Strategiewechsel wird das übergeordnete Ziel **nicht mutiert**, sondern
abgeschlossen (`lifecycleStatus = cancelled`, `achievementStatus = not-achieved`/
`not-attainable`) und durch ein **neues** ersetzt (`goal-relationship = replacement`).
Davon zu unterscheiden ist der **erfolgreiche Abschluss** eines Ziels
(`completed`/`achieved`): dessen Folgeziel wird über `predecessor`/`successor`
verknüpft, **nicht** über `replacement`. `replacement` bezeichnet die *Ablösung*
eines nicht (mehr) verfolgten Ziels (Pivot), `successor` die *zeitliche Abfolge* nach
erfolgreichem Abschluss. Das `Goal` ist konzeptionell **primär**; `CarePlan.goal` ist
eine Verfolgungs-Referenz, kein Besitz.

## Konsequenzen

### Positiv

- **Auditierbarkeit** des kurativ→palliativ-Pivots als eigenes, verknüpftes
  Ereignis statt eines überschriebenen Feldes.
- Klare Trennung strategisch (ein Ziel) vs. operativ (viele Phasenziele).
- Anschluss an MCCGoal (referenzbasiertes Goal-Modell).

### Negativ / Trade-offs

- „Genau eines aktiv"-Invariante wird von FHIR nicht erzwungen → Konsument prüft selbst.
- Pivot erzeugt zusätzliche Ressourcen statt eines Feld-Updates.

### Folgeaufgaben

- Invariant-Dokumentation „höchstens ein aktives übergeordnetes Ziel".
- CRC-Palliativ-Szenario als Demonstration des Replace-on-Pivot.
- Ratifizierung im Status-Meeting → `accepted`.

## Alternativen

### Alternative A — Ein Ziel, in-place mutiert

- **Beschreibung:** Intention/Status desselben `Goal` werden überschrieben.
- **Verworfen weil:** löscht die klinisch bedeutsame Pivot-Historie; nicht auditierbar.

### Alternative B — Flache Zielmenge ohne Ebenen

- **Beschreibung:** alle Ziele gleichrangig.
- **Verworfen weil:** keine erkennbare strategische Ausrichtung.

## Offene Punkte

- Bindung/Terminologie der Zielart des übergeordneten Ziels (`OnkoTherapyGoalTypeVS`).
- **Studienteilnahme als Zielart fraglich:** Studienteilnahme ist primär ein *Mittel*
  (investigational Line of Therapy, iLoT/EnLiST) bzw. eigener Dokumenttyp (ADR-0003) —
  **kein** patientenseitiger Zielzustand. Nur wenn die Patient:in sie ausdrücklich als
  eigenes Anliegen benennt (Shared Decision / „what matters most", PCO), ist sie ein
  Ziel. Aufnahme in `OnkoTherapyGoalTypeVS` mit Patient:in-Perspektive überdenken.
