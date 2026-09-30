# ADR-0025: EnLiST-Abbildung — die Line of Therapy als fachliches Kontinuum über organisationsgebundene Segmente

- **Status:** accepted
- **Datum:** 2026-07-31 (revidiert nach Design-Review: Multi-Agent-Prüfung von vier Modellierungsalternativen + Fachexperten-Iteration; ratifiziert mit Amendments nach Grill-Session am selben Tag)
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
   *Amendment (Ratifizierung):* Der Procedure-Pfad ist ein **heute unvalidiertes
   Andock-Angebot** — die Invarianten (onko-enlist-1/3/4, onko-episode-2) leben
   ausschließlich am Episodenprofil; am Procedure-Kontext gilt die
   Genau-einmal-Regel als dokumentierte **Konvention**. Begründung: Die
   MII-Onko-Profile werden derzeit größtenteils nachgelagert aus
   **Krebsregistermeldungen** befüllt, nicht am Point of Care — eine
   Validierungshoheit dort wäre Fiktion. Das **Zielbild** ist gleichwohl genau
   dieser Pfad: Sobald MII-Onko point-of-care-nah dokumentiert wird, folgt der
   Validierungspfad (z. B. dünnes von der MII-SYST-Procedure abgeleitetes
   Profil) als Folge-Arbeit; ein `enlist-countable` braucht die Procedure nicht
   (MII-SYST ist per Definition systemisch = counted).
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

## Genau-einmal-Mechanismus: ePA-Composition, nicht Validierung (Amendment)

Die Genau-einmal-Regel ist **instanzübergreifend** und damit durch keine
FHIRPath-Invariante prüfbar. Ihr Durchsetzungsmechanismus ist die
**ePA-Composition** (Dokument-Strang, ADR-0001–0006): Die Episoden werden
langfristig Teil einer Composition, die in der ePA landet — dort ist die
führende Episode patientenzentriert **für alle Beteiligten sichtbar**, und
Ausführende schlagen die `lineId` nach, statt auf Arztbrief-Übermittlung
angewiesen zu sein. Pro Linie gibt es dann genau eine aktive führende Episode.

**Führungswechsel (Amendment, Grill-Session 2026-08-02):** Die Führung kann im
Linienverlauf wechseln (z. B. Klinik → niedergelassene Praxis in der adjuvanten
Phase). Regelsatz: Die **neue** führende Episode übernimmt Designation **und**
Linien-Id und schreibt X.Y fort; die **bisherige** wird abgeschlossen und
behält ihren letzten Stand als eingefrorene Historie. „Genau einmal" bedeutet
damit: **höchstens eine aktive führende Episode je Linie und Zeitpunkt**;
auswertungsseitig ist der Linienstand der **jüngste `enlist-lot`-Träger je
Linien-Id**. Begründung: Die Y-Fortschreibung (Modified LoT) muss bei der
aktuell koordinierenden Stelle liegen — eine abgeschlossene Fremd-Episode
fortzuschreiben würde die Einrichtungs-Autonomie verletzen. Die nötige
Dedup-Mechanik (je Linien-Id) existiert bereits für den Übergangs-Fallback.

**Übergangs-Fallback (bekannte Limitation):** Kennt eine ausführende
Einrichtung die `lineId` (noch) nicht, dokumentiert sie ersatzweise mit
*eigener* Designation — Ausfallsicherheit schlägt Eindeutigkeit („dokumentiert
erfasst, nicht berechnet"). Die daraus möglichen **Doppelzählungen werden in
der Auswertungsschicht dedupliziert**, nicht am Datenbestand verhindert:
überlappende counted-Linien gleicher Setting-Achse beim selben Patienten sind
Dedup-Kandidat bzw. Datenqualitätssignal (Anschluss an den offenen Punkt
„SearchParameters für die LoT-Auswertung").

## Anschlussfähigkeit (Ausblick)

Die Linie ist der Andockpunkt in beide Richtungen: **Versorgungskontakte**
(ISiK stationär, KBV vertragsärztlich) verweisen via `Encounter.episodeOfCare`
auf die (Segment-)Episoden; die **MII-Prozeduren** (systemische Therapie,
Strahlentherapie, Operationen — als `Procedure` mit `performedPeriod`) bleiben
unverändert und werden via `workflow-episodeOfCare` bzw. den Procedure-Kontext
der Extensions verkabelt. Ergebnis: durchgehende Kette
Kontakt → Segment → Linie → Ziel → **Dokument** (ePA-Composition als
patientenzentrierte Klammer).

## Konsequenzen

- **Episodenart (Querverweis ADR-0016):** Das Träger-Profil ist das generische
  `OnkoBehandlungsepisode` — die Art (systemische Therapielinie, lokoregionale
  Behandlungslinie, Diagnostiklinie, Surveillance) steht in `type`
  (`EpisodenartVS`, extensible), die Modalität ist eigenes Merkmal
  (`onko-modalitaet`). EnLiST-Designation, Segment-Marker und Zählstatus
  `counted` sind der Episodenart *systemische Therapielinie* vorbehalten
  (onko-episode-2). Dieses ADR vollzieht ADR-0016 nach, entscheidet es nicht neu.
- Beispiele: CRC-Erstlinie = aLoT 1.0 (Führung und Ausführung in einer Episode);
  Mamma: neoadjuvante Episode führt eLoT 1.0 (+ lineId), ambulante adjuvante
  Episode = Segment derselben lineId, OP not-counted; MRs tragen #new bzw. #same.
- Offen (Folge-ADRs / Fachkommission): Gegenlesen der Kontinuum-Lesart am
  Originalpaper (EnLiST bis 2027 im ESMO-road-testing); Konvention für
  Kombinationsregime (welche Requests eines Regimes tragen #new); Linienende-
  Grund als codierte Extension (EnLiST-Mindestdatensatz-Item 8);
  iLoT-Verknüpfung zu `ResearchStudy`; SearchParameters für die LoT-Auswertung;
  RequestGroup-Beispielinstanz (KEYNOTE-522-Sequenz).
