### Behandlungsepisoden (`EpisodeOfCare`)

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

### Systemische Therapielinie vs. lokoregionale Behandlungslinie

Der Oberbegriff **Behandlungslinie** umfasst zwei Modalitätsklassen:

- Die **systemische Therapielinie** (Line of Therapy, LoT) folgt der internationalen
  Konsensnotation **[EnLiST](https://www.esmo.org/)** und wird in die **Linien-Zählung**
  aufgenommen. Eine Linie ist ein Abschnitt aktiver Systemtherapie mit definierter
  Intention, beendet durch ein klinisches Ereignis (Progress, Toxizität,
  Patientenwunsch, Studienende, geplanter Wechsel).
- Die **lokoregionale Behandlungslinie** (Chirurgie, Strahlentherapie, Ablation) wird
  von EnLiST **nicht** abgedeckt und **nicht** mitgezählt — sie bildet eine eigene
  Modalitätsspur.

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
