# ADR-0016: Generelles `Behandlungsepisode`-Profil ersetzt `OnkoTherapyLine`

- **Status:** proposed
- **Datum:** 2026-07-24
- **Beteiligte:** Thomas Debertshäuser
- **Bezug:** ADR-0010 (EnLiST), ADR-0015, ADR-0017, ADR-0020 (perioperative Episode), `CONTEXT.md` (Behandlungsverlauf); FHIR `EpisodeOfCare`, `workflow-episodeOfCare`

## Kontext

`OnkoTherapyLine` war auf **aktive Therapie** (Line of Therapy, EnLiST) verengt.
Reale Verläufe enthalten aber weitere begrenzte, intentionale Perioden, die
strukturell identisch sind (Periode, Intention, Status/Statusverlauf,
verantwortliche Organisation), aber **keine** Therapielinie: Diagnostik/Staging,
Active Surveillance, Watchful Waiting, perisurgische Reise. Ein Profil pro Art
würde die Timeline fragmentieren und mit jeder entitätsspezifischen Phase
(Prostata, Hämatologie …) proliferieren.

## Entscheidung

**Ein einziges** generelles `EpisodeOfCare`-Profil **`Behandlungsepisode`** ersetzt
`OnkoTherapyLine`. Die **Art** steht in `EpisodeOfCare.type` (offen/extensible:
Therapielinie, Diagnostiklinie, Active Surveillance, Watchful Waiting,
perioperativ …); die **Intention** (Zweck) ist gemeinsames Basis-Element;
art-spezifische Angaben liegen in einer **je-Art-Extension** (z. B.
Therapielinie-Extension: Rang, Regime, EnLiST-Endgrund). Eine [[Therapielinie]] ist
damit „Behandlungsepisode + Therapielinie-Extension". Die Verknüpfung zum CarePlan
läuft über `workflow-episodeOfCare` (nicht `CarePlan.encounter`); `Encounter` ist
außerhalb des Scopes (in DE via MII Fall / ISIK definiert, hier nicht nötig).

## Konsequenzen

### Positiv

- **Homogene Timeline:** eine Ressourcenart für jede gemanagte Periode; nach `type` filterbar.
- **Keine Profil-Proliferation** bei neuen entitätsspezifischen Phasen.
- EnLiST-Konformität bleibt für die Therapielinien-Art erhalten (Extension + Guidance).

### Negativ / Trade-offs

- Intent-Werteliste wird heterogen (Union der Zweck-Codes je Art).
- `OnkoTherapyLine` muss umgezogen werden (Canonical/Referenzen) — breaking.
- Chirurgie: die OP ist ein `Procedure` *innerhalb* der (chirurgischen) Episode; die Episode ist eine **lokoregionale** Behandlungslinie, keine *systemische* Therapielinie (ADR-0020) — muss im Beispiel korrigiert werden.

### Folgeaufgaben

- `OnkoTherapyLine` → `Behandlungsepisode` reparenten; Therapielinie-/Diagnostiklinie-Extensions definieren.
- Beispiel: `TherapielinieOperation` → perioperative Episode (Typ korrigieren).
- `EpisodeOfCare.type`-ValueSet (extensible) mit Startsatz anlegen.

## Alternativen

### Alternative A — `OnkoTherapyLine` eng behalten + Geschwister-Profile

- **Beschreibung:** je ein Profil für Surveillance, perioperativ etc.
- **Verworfen weil:** fragmentiert die Timeline, proliferiert mit jeder neuen Phase.

### Alternative B — Diagnostik/Surveillance ganz ohne `EpisodeOfCare`

- **Beschreibung:** nur Therapie als Episode, Rest anders modelliert.
- **Verworfen weil:** Diagnostik-/Surveillance-Perioden sind reale, wiederkehrende, intentionale Abschnitte (rare-disease-Odyssee, Re-Staging bei Rezidiv).

## Offene Punkte

- Genauer Inhalt der je-Art-Extensions (Therapielinie: Rang/Regime/Endgrund; Diagnostiklinie: Anlass).
