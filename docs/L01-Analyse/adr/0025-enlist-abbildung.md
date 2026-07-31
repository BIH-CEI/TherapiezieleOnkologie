# ADR-0025: EnLiST-Abbildung — X.Y-Designation je Setting-Achse, entkoppelt von der Ziel-Achse

- **Status:** proposed
- **Datum:** 2026-07-31
- **Beteiligte:** Thomas Debertshäuser
- **Bezug:** ADR-0015 (zweischichtiges Zielmodell), ADR-0024 (Zielart-Taxonomie, zwei Achsen), `CONTEXT.md` (Therapielinie, Behandlungsepisode), EnLiST-Analysebaustein (`docs/L01-Analyse/EnLiST_Zusammenfassung_Onkologische_Therapieziele.md`); Saini et al., Ann Oncol 2026 (DOI 10.1016/j.annonc.2026.02.008)

## Kontext

`OnkoTherapyLine` behauptete „EnLiST-konform“, trug aber keines der
EnLiST-Strukturelemente. EnLiST definiert: (1) die **X.Y-Notation** — X zählt
*New LoTs* (nur bei klinischer Progression/fehlendem Ansprechen), Y zählt
*Modified LoTs* seit der letzten New LoT (Reset bei X-Inkrement); (2) **drei
getrennt gezählte Setting-Achsen** — eLoT (early: neoadjuvant/adjuvant/
perioperativ), aLoT (advanced), iLoT (investigational, eigene Achse — nicht
„zählt nicht“); (3) die **Drei-Änderungstypen-Logik** New / Modified / Same
(Same = prospektiv geplante Änderungen inkl. Erhaltung, Designation
unverändert); (4) lokoregionale Therapien bleiben **außerhalb** jeder Zählung.

## Entscheidung

1. **Designation als Datum, nicht als Ableitung.** Komplexe Extension
   `enlist-lot` an der Therapielinie (`EpisodeOfCare`): `setting` (eLoT | aLoT |
   iLoT, required-Binding), `line` (X), `modification` (Y), optional `notation`
   (z. B. „aLoT 2.1“). Die Zählregeln sind dokumentierte Konvention; der IG
   berechnet nichts.
2. **Zählstatus-Marker** `enlist-countable` (counted | not-counted) für Linien
   außerhalb jeder Achse (lokoregional, Management). Invariante `onko-enlist-1`:
   `enlist-lot` nur bei `counted`.
3. **Änderungstypen-Vokabular** `enlist-change-type` (new | modified | same) —
   vorgesehen für die Request-Ebene: Modifikationen innerhalb der Linie werden
   über die `MedicationRequest`-Kette (`priorPrescription` + Änderungstyp)
   nachvollziehbar, nicht über neue Episoden.
4. **Modified LoT = dieselbe Episode.** Die Episode entspricht der Linie X
   (Grenze = Progression); Y wird an der Episode fortgeschrieben. Begründung:
   EnLiST-Beispiel Letrozol→Anastrozol (`eLoT 1.0 → 1.1`) ist klinisch derselbe
   Behandlungsabschnitt.
5. **Perioperative Systemtherapie zählt** — im frühen Setting (eLoT). Die
   neoadjuvante Mamma-Systemtherapie trägt `eLoT 1.0`; das prospektiv geplante
   adjuvante Pembrolizumab ist *Same LoT* (Designation unverändert). Ob die
   adjuvante Episode dieselbe Designation redundant trägt oder designationsfrei
   bleibt, ist Ausgestaltung der Beispiele, nicht des Modells.
6. **Linienwechsel ≠ Zielwechsel.** EnLiST-Ereignisse liegen auf der
   Maßnahmen-Achse und lösen **nie automatisch** Ziel-Operationen aus.
   `replacement` (Intentions-Pivot) und `predecessor`/`successor` (Journey)
   bleiben eigenständige klinische Entscheidungen. Matrix siehe Konzeptseite
   `behandlungsepisode.html` („Linienwechsel ≠ Zielwechsel“). Kernfälle:
   Modified/Same LoT ändern kein Ziel; New LoT wechselt i. d. R. das
   Episodenziel, das übergeordnete Ziel nur beim Strategiewechsel; der Übergang
   Induktion→Erhaltung ist ein Zielwechsel **ohne** Linienwechsel.

## Konsequenzen

- `enlist-linenumber` (flacher Vorläufer, nur X) entfällt zugunsten von
  `enlist-lot`; `investigational` wandert aus dem Zählstatus in die
  Setting-Achse (iLoT).
- Beispiele: CRC-Erstlinie `aLoT 1.0`, Mamma-Chemo `eLoT 1.0`, Mamma-OP
  `not-counted`.
- Offen (Folge-ADRs bzw. Fachkommission): Linienende-Grund als codierte
  Extension; iLoT-Verknüpfung zu `ResearchStudy`; Hämatologie-Phasenachse
  (außerhalb Hauptscope, EnLiST-Adaption ausstehend); Treatment-Holiday-Cut-offs.
