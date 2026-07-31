Ein onkologischer Verlauf besteht aus **abgegrenzten Abschnitten klinischer
Aktivität** — Diagnostik, Therapielinien, Operation, Überwachung, Nachsorge. Jeder
solche Abschnitt wird als **Behandlungsepisode** auf Basis von FHIR `EpisodeOfCare`
abgebildet: ein begrenzter Zeitraum aktiv gemanagter Versorgung mit eigenem Zweck
(Intention), Periode, Status/Statusverlauf und verantwortlicher Organisation.

### Ein Profil, viele Arten

Statt eines Profils je Abschnittstyp gibt es **ein generelles Behandlungsepisode-
Profil**; die **Art** der Episode wird über `EpisodeOfCare.type` codiert (offen/
extensible). Häufige Arten:

| Art | Nicht-therapeutisch / therapeutisch | In LoT-Zählung? |
|---|---|---|
| **Diagnostiklinie** (Staging, molekulare Charakterisierung) | informativ | — |
| **Systemische Therapielinie** (Line of Therapy) | therapeutisch, systemisch | **ja** |
| **Lokoregionale Behandlungslinie** (Chirurgie, Strahlentherapie, Ablation) | therapeutisch, lokoregional | nein |
| **Active Surveillance / Watchful Waiting** | Management | — |
| **Nachsorge / Surveillance** | Management | — |

Diese Liste ist **offen**: entitätsspezifische Abschnitte (z. B. Induktion/
Konsolidierung/Erhaltung bei hämatologischen Erkrankungen) lassen sich ergänzen, ohne
das Modell zu ändern.

{% include konzept-behandlungsepisoden.svg %}

### Systemische Therapielinie vs. lokoregionale Behandlungslinie

Der Oberbegriff **Behandlungslinie** umfasst zwei Modalitätsklassen:

- Die **systemische Therapielinie** (Line of Therapy, LoT) folgt der internationalen
  Konsensnotation **EnLiST** ([Saini et al., *Ann Oncol* 2026](https://doi.org/10.1016/j.annonc.2026.02.008))
  und wird in die **Linien-Zählung** aufgenommen. Eine Linie ist ein Abschnitt aktiver Systemtherapie mit definierter
  Intention, beendet durch ein klinisches Ereignis (Progress, Toxizität,
  Patientenwunsch, Studienende, geplanter Wechsel).
- Die **lokoregionale Behandlungslinie** (Chirurgie, Strahlentherapie, Ablation) wird
  von EnLiST **nicht** abgedeckt und **nicht** mitgezählt — sie bildet eine eigene
  Modalitätsspur.

> **Einordnung EnLiST.** EnLiST ist ein paneuropäischer Delphi-Konsens zur
> **Standardisierung der Linien-Bezeichnung bei soliden Tumoren** — bewusst begrenzt
> auf **systemische** Therapie. Für **hämatologische** Erkrankungen gilt eine
> **separate** Adaptation (andere Achse: Induktion/Konsolidierung/Erhaltung), und das
> Framework befindet sich noch im „road testing" (ESMO 2026–2027). Die **LoT-Zählung
> ist damit kein universeller, entitätsübergreifender Score**, sondern eine Struktur-
> und Notationskonvention innerhalb ihres Geltungsbereichs; ihre Vergleichbarkeit über
> Tumorentitäten hinweg ist begrenzt. Die Spalte „In LoT-Zählung?" ist entsprechend
> **im Kontext der jeweiligen Entität** zu lesen.

### Linienwechsel ≠ Zielwechsel

EnLiST notiert Linien als **X.Y je Setting-Achse** (eLoT früh · aLoT
fortgeschritten · iLoT investigational, getrennt gezählt): X zählt **New LoTs**
(nur bei Progression oder fehlendem Ansprechen), Y zählt **Modified LoTs**
(nicht-progressionsbedingte Änderungen), **Same LoTs** (prospektiv geplante
Änderungen inkl. Erhaltung) verändern die Designation nicht. Diese Ereignisse
liegen auf der **Maßnahmen-Achse** — sie lösen **nie automatisch** eine
Ziel-Operation aus:

| EnLiST-Ereignis | Auslöser | Episodenziel | Übergeordnetes Ziel |
|---|---|---|---|
| **Same LoT** (X.Y bleibt) | prospektiv geplant: Dosis, Pause, Erhaltung | bleibt — *oder* `successor`, wenn ein Phasenziel erreicht ist | bleibt |
| **Modified LoT** (Y+1) | Intoleranz, Wirkstoffwechsel ohne Progression | **bleibt** (nur die Maßnahme ändert sich) | bleibt |
| **New LoT** (X+1) | Progression / fehlendes Ansprechen | i. d. R. neu — altes Ziel abgeschlossen, oft `not-achieved` | bleibt, solange die Intention stabil ist |
| **New LoT + Strategiewechsel** (oft eLoT→aLoT) | Progression macht die Intention unhaltbar | neu | **`replacement`** |

Belege in beide Richtungen: Im [mCRC-Szenario](szenario-crc.html) überdauert das
übergeordnete Ziel mehrere palliative Linien; der Übergang Induktion → Erhaltung
ist dort ein **Zielwechsel ohne Linienwechsel** (Erhaltung = *Same LoT*); ein
Wirkstoffwechsel wegen Intoleranz (z. B. Letrozol → Anastrozol, `eLoT 1.0 → 1.1`)
ändert **gar kein Ziel**. Auch der Setting-Wechsel koppelt nicht 1:1 — EnLiST
entkoppelt Setting und Intention ausdrücklich (kurative Oligometastasen-Therapie
im advanced Setting, palliative Frühphasen-Therapie).

### Eine Linie über mehrere Einrichtungen — Führung und Ausführung

`EpisodeOfCare` ist **organisationsgebunden**. Eine Line of Therapy, die
sektorübergreifend läuft (z. B. stationäre neoadjuvante Systemtherapie →
ambulantes adjuvantes Pembrolizumab), zerfällt daher organisatorisch in mehrere
Episoden — **ohne** dass die Linie ihre Identität verliert:

- Die **führende Episode** (main contributor — typischerweise die koordinierende
  Stelle, z. B. das Tumorzentrum) trägt die EnLiST-Designation (`enlist-lot`)
  samt gemeinsamer `lineId` — **genau einmal je Linie**.
- **Ausführende Einrichtungen** dokumentieren autonom eigene Episoden und
  markieren sie als Segmente (`enlist-line-segment`) mit derselben `lineId` —
  ohne eigene Designation.
- Bei **gleichem Ort und Sektor** fallen Führung und Ausführung in einer
  einzigen Episode zusammen (der Normalfall, z. B. im mCRC-Beispiel). Die Wahl
  der Form trifft die dokumentierende Stelle — **kein Automatismus**.

Die LoT-Zählung bleibt damit trivial: Gezählt werden ausschließlich Träger von
`enlist-lot`; Segmente können nie doppelt zählen.

### Anschluss an Versorgungskontakte (ISiK/KBV) und MII-Prozeduren

Findet die vorgeschlagene Therapielinien-Modellierung Zustimmung, ist sie der
**Andockpunkt in beide Richtungen** der Versorgungsdokumentation:

- **Kontakte aus der Versorgung:** `Encounter` aus dem Krankenhausumfeld
  (**ISiK**) wie aus der vertragsärztlichen Versorgung (**KBV**) verweisen über
  das Standard-Element `Encounter.episodeOfCare` auf die jeweilige
  (Segment-)Episode — die einzelnen Kontakte hängen sich an die Linie, ohne dass
  dieser Leitfaden Encounter selbst profilieren muss (bewusst out of scope).
- **MII-Prozeduren:** Die im MII KDS Onkologie als `Procedure` mit
  `performedPeriod` modellierten Therapieblöcke — **systemische Therapie,
  Strahlentherapie und Operationen** — bleiben unverändert und werden verkabelt:
  über die Standard-Extension `workflow-episodeOfCare` (Procedure → Episode)
  bzw. im MII-only-Pfad direkt über `enlist-lot`/`enlist-line-segment` an der
  Procedure selbst (die MII-SYST-Procedure trägt Intention, Stellung zur OP und
  Zeitraum ohnehin bereits — die LoT-Angabe fügt sich dort nativ ein).

So entsteht die durchgehende Kette **Kontakt (Encounter) → Segment/Episode →
Linie (LoT) → Ziel** — von der einzelnen Ambulanz-Sitzung bis zur strategischen
Therapieintention.

### Episode ≠ Prozedur ≠ Kontakt

Wichtige Abgrenzung am Beispiel Chirurgie: Die **Operation selbst** ist ein
punktuelles Ereignis (`Procedure`). Die **perisurgische Reise** dagegen — Planung,
Aufklärung/Consent, Eingriff, postoperativer Aufenthalt, Rehabilitation,
postoperatives Monitoring — erstreckt sich über **mehrere Kontakte** (`Encounter`) und
*ist* die Behandlungsepisode. Kurz: `EpisodeOfCare` (Periode) ≠ `Procedure` (Ereignis)
≠ `Encounter` (einzelner Kontakt).

### Verknüpfung mit dem Versorgungsplan

Die Behandlungsepisode wird mit dem [Behandlungsplan](empfehlung-behandlung.html) über
die Standard-Extension **`workflow-episodeOfCare`** verknüpft (direkt am `CarePlan`,
`Reference(EpisodeOfCare)`) — nicht über `CarePlan.encounter` (das nur den
*erstellenden* Kontakt bezeichnet). `Encounter` selbst ist bewusst außerhalb des
Scopes dieses Leitfadens.

> **Zielmodell.** Das generelle `Behandlungsepisode`-Profil (Art über `type`,
> art-spezifische Angaben in Extensions) löst das aktuell auf aktive Therapie verengte
> Profil [`OnkoTherapyLine`](StructureDefinition-onko-therapy-line.html) ab und wird im
> laufenden Ausbau umgesetzt. Die EnLiST-Konformität der systemischen Linien bleibt
> dabei erhalten.

### Beispiele

- [mCRC (palliativ)](szenario-crc.html) — Diagnostikpfad und systemische Erstlinie
  (`OnkoTherapyLine`).
- [Mammakarzinom (neoadjuvant)](szenario-mamma.html) — neoadjuvante Systemtherapie und
  anschließende Operation als getrennte Abschnitte.

→ Weiter: [Zielwerte und Messgrößen](goal-target-measure.html)
