# ADR-0018: `achievementStatus` nur Zustands-Codes; Trajektorie in Observations

- **Status:** accepted
- **Datum:** 2026-07-24
- **Beteiligte:** Thomas Debertshäuser
- **Bezug:** ADR-0015, `CONTEXT.md` (Status-Konvention, Zielwert vs. Ergebnis); FHIR `Goal.lifecycleStatus`/`achievementStatus`, `goal-achievement`

## Kontext

FHIR `Goal` hat zwei orthogonale Status-Achsen: `lifecycleStatus` (administrativ)
und `achievementStatus` (Erreichungsgrad). Die R4-`goal-achievement`-Hierarchie
enthält neben Zustands-Codes (`in-progress`, `achieved`, `not-achieved`,
`not-attainable`) auch **Trajektorie-Codes** (`improving`, `worsening`, `no-change`,
`sustaining`, `no-progress`). `Goal.achievementStatus` ist `0..1` **ohne
Historie**, und die Trajektorie-Codes definieren **keinen Bezugspunkt**
(Baseline vs. Nadir vs. Vorwert). Zudem ist zu klären, wann `completed` gilt.

## Entscheidung

`achievementStatus` verwendet **nur die Zustands-Codes** (`in-progress`,
`achieved`, `not-achieved`, `not-attainable`); Trajektorie-Codes werden
**vermieden**. Konvention: `lifecycleStatus` = *warum die Verfolgung endet*,
`achievementStatus` = *erreichter Grad*; **`completed` nur bei Erfolg** (CR/pCR →
`completed`+`achieved`), Abbruch/Pivot = `cancelled`+`not-achieved`/`not-attainable`
mit einem über `replacement` verknüpften neuen Ziel. Ein **erfolgreich
abgeschlossenes** Ziel (CR/pCR) übergibt dagegen über `predecessor`/`successor` an
sein Folgeziel — nicht `replacement`. Partielle Remission = `active`+`in-progress`
**oder** `cancelled`+`replacement`. **Verlauf/Ansprechen** (RECIST, mCODE CancerDiseaseStatus)
liegt in den `outcomeReference`-**Observations**, die zeitgestempelt sind und ihren
Bezugspunkt selbst definieren.

## Konsequenzen

### Positiv

- Kein Zeit-Differenzial in einem historienlosen Einzelfeld.
- Ansprechen wird dort geführt, wo Zeitreihe *und* Bezugspunkt (Baseline/Nadir) sauber definiert sind.
- Eindeutige, prüfbare Status-Kombinationen.

### Negativ / Trade-offs

- `improving`/`worsening` stehen nicht direkt am Ziel — Konsumenten müssen die Observations auswerten.

### Folgeaufgaben

- `achievementStatus`-Bindung im `OnkoTherapyGoal`-Profil auf die Zustands-Codes einschränken.
- Beispiele: Zielstatus (Diagnostic/Heilung/FollowUp) gemäß Konvention korrigieren.

## Alternativen

### Alternative A — Volle `goal-achievement`-Hierarchie inkl. Trajektorie

- **Verworfen weil:** kein Bezugspunkt + keine Historie am `Goal` → semantisch unterbestimmt.

## Offene Punkte

- Konkrete Observation-Profile für Ansprechen (RECIST / mCODE) als `outcomeReference`-Ziel.
