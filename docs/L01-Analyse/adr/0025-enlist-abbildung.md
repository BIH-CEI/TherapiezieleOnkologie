# ADR-0025: EnLiST-Abbildung — die Line of Therapy als fachliches Kontinuum über organisationsgebundene Segmente

- **Status:** proposed
- **Datum:** 2026-07-31 (revidiert nach Design-Review: Multi-Agent-Prüfung von vier Modellierungsalternativen + Fachexperten-Iteration)
- **Beteiligte:** Thomas Debertshäuser
- **Bezug:** ADR-0015 (zweischichtiges Zielmodell), ADR-0024 (Zielart-Taxonomie), `CONTEXT.md` (Therapielinie, Behandlungsepisode, Multimodale Orchestrierung), EnLiST-Analysebaustein (`docs/L01-Analyse/EnLiST_Zusammenfassung_Onkologische_Therapieziele.md`); Saini et al., Ann Oncol 2026 (DOI 10.1016/j.annonc.2026.02.008)

## Kontext

EnLiST vergibt die X.Y-Designation an die **Line of Therapy** — eine
systemische Therapiesequenz, die (Beispiel KEYNOTE-522: neoadjuvante
Chemo-Immuntherapie → Operation → adjuvantes Pembrolizumab) mehrere
Behandlungsabschnitte und dazwischenliegende lokoregionale Eingriffe umspannen
kann. `EpisodeOfCare` ist in FHIR R4 dagegen **organisationsgebunden** und kennt
kein `partOf`. Eine 1:1-Setzung „Episode = Linie" scheitert daher doppelt: am
sektorübergreifenden Fall (mehrere Einrichtungen je Linie) und am
Kontinuum-Fall (eine Linie über mehrere Abschnitte). Geprüfte Alternativen:
LoT-Konzept-Episode mit partOf-Extension (verworfen: R4-fremde Hierarchie,
organisationslose Episode), Designation am BehandlungsCarePlan (verworfen:
mehrere Pläne je Linie im intersektoralen Setting), naive Wiederholung an jeder
Episode (verworfen: Doppelzählung, Drift), eine spannende Episode (verworfen im
Alleingang: kann Organisationsgrenzen nicht überschreiten).

## Entscheidung

1. **Die Linie ist ein fachliches Kontinuum — ihre Identität stiftet die
   Designation plus `lineId`, nicht eine Ressourceninstanz.** Die X.Y-Designation
   (`enlist-lot`: `setting` eLoT|aLoT|iLoT, `line` X, `modification` Y, optional
   `notation`, `lineId`) existiert je Linie **genau einmal**.
2. **Führung vs. Ausführung, kein Automatismus.** Träger der Designation ist die
   **führende Episode** (main contributor; `managingOrganization` = die
   koordinierende Stelle, z. B. das Tumorzentrum — Muster analog `custodian` am
   CarePlan). **Ausführende Einrichtungen** dokumentieren eigene Episoden und
   markieren sie mit `enlist-line-segment` (gemeinsame `lineId`, keine eigene
   Designation). Bei gleichem Ort/Sektor fallen Führung und Ausführung in einer
   Episode zusammen. Die Wahl der Form trifft die dokumentierende Stelle.
3. **MII-Pfad:** `enlist-lot` und `enlist-line-segment` sind zusätzlich im
   Kontext `Procedure` zulässig — die MII-SYST-Procedure (mit Intention,
   Stellung zur OP, `performedPeriod`) kann die Designation im MII-only-Szenario
   direkt tragen. Die Genau-einmal-Regel gilt über beide Kontexte.
4. **Änderungstypen auf der Request-Ebene.** `enlist-change` (new | modified |
   same) am `MedicationRequest`; `priorPrescription` nur bei tatsächlicher
   Ersetzung (Modified LoT) — die Sequenz prospektiv geplanter Blöcke liegt im
   Therapiekonzept (RequestGroup/CarePlan), nicht in der Request-Kette.
   Modified LoT = Y-Fortschreibung an der führenden Episode, **keine** neue
   Episode; New LoT = neue Linie (neue führende Episode).
5. **Zählstatus & Invarianten.** `enlist-countable` (counted | not-counted)
   grenzt lokoregionale/Management-Abschnitte ab. Invarianten: Designation nur
   bei counted (onko-enlist-1); Notation kongruent zur Struktur (onko-enlist-2,
   warning); counted erfordert Designation **oder** Segment-Marker
   (onko-enlist-3); Führung und Segment schließen sich an derselben Episode aus
   (onko-enlist-4). Die LoT-Zählung eines Patienten = Träger von `enlist-lot`
   (Segmente zählen nie).
6. **Klammer des kurativen Gesamtkonzepts** ist keine Umbrella-Episode, sondern
   Ziel- und Plan-Ebene: das übergeordnete kurative Therapieziel (Layer 1) plus
   EmpfehlungsCarePlan/RequestGroup (Sequenz neoadjuvant → OP → adjuvant via
   `relatedAction`). Lokoregionale Eingriffe sind eigenständige, zeitlich
   überlappende not-counted-Episoden (Überlappung ist in R4 zulässig und kein
   Modellfehler).
7. **Linienwechsel ≠ Zielwechsel.** EnLiST-Ereignisse liegen auf der
   Maßnahmen-Achse und lösen nie automatisch Ziel-Operationen aus (Matrix auf
   `behandlungsepisode.html`).

## Anschlussfähigkeit (Ausblick bei Zustimmung)

Findet die Modellierung Zustimmung, wird die Linie der Andockpunkt in beide
Richtungen: **Versorgungskontakte** (ISiK stationär, KBV vertragsärztlich)
verweisen via `Encounter.episodeOfCare` auf die (Segment-)Episoden; die
**MII-Prozeduren** (systemische Therapie, Strahlentherapie, Operationen — als
`Procedure` mit `performedPeriod`) bleiben unverändert und werden via
`workflow-episodeOfCare` bzw. den Procedure-Kontext der Extensions verkabelt.
Ergebnis: durchgehende Kette Kontakt → Segment → Linie → Ziel.

## Konsequenzen

- Beispiele: CRC-Erstlinie = aLoT 1.0 (Führung und Ausführung in einer Episode);
  Mamma: neoadjuvante Episode führt eLoT 1.0 (+ lineId), ambulante adjuvante
  Episode = Segment derselben lineId, OP not-counted; MRs tragen #new bzw. #same.
- Offen (Folge-ADRs / Fachkommission): Gegenlesen der Kontinuum-Lesart am
  Originalpaper (EnLiST bis 2027 im ESMO-road-testing); Konvention für
  Kombinationsregime (welche Requests eines Regimes tragen #new); Linienende-
  Grund als codierte Extension (EnLiST-Mindestdatensatz-Item 8);
  iLoT-Verknüpfung zu `ResearchStudy`; SearchParameters für die LoT-Auswertung;
  RequestGroup-Beispielinstanz (KEYNOTE-522-Sequenz).
