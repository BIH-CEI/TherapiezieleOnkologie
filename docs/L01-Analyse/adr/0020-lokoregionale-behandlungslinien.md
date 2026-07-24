# ADR-0020: Lokoregionale Behandlungslinien (Chirurgie, Strahlentherapie, Ablation) als nicht-EnLiST-Behandlungsepisoden

- **Status:** proposed
- **Datum:** 2026-07-24
- **Beteiligte:** Thomas Debertshäuser
- **Bezug:** ADR-0010 (EnLiST), ADR-0016 (generelle Behandlungsepisode), ADR-0019 (Varianten-Beispiele), `00_Architekturentscheidung.md` (lokoregionale Modalitätsspur), `CONTEXT.md` (Behandlungslinie / Lokoregionale Behandlungslinie); FHIR `EpisodeOfCare`, `Procedure`, `Encounter`

## Kontext

Eine Operation wurde im ersten Beispiel als [[Therapielinie]] modelliert
(`TherapielinieOperation`, sogar mit `type = Erhaltungstherapie`). Das ist in zwei
Punkten unpräzise: (1) Es verwechselt **Achsen** — Chirurgie ist zwar eine
**Behandlungslinie**, aber eine **lokoregionale**, die **EnLiST nicht abdeckt**
(EnLiST zählt nur **systemische** Linien / LoT). Dasselbe gilt für
**Strahlentherapie** und **Ablation**. (2) Bei der Chirurgie verwechselt es
**Ressourcen** — die Operation *selbst* ist ein punktuelles `Procedure`, während
der **Weg um die OP herum** (Planung, chirurgische + anästhesiologische
Aufklärung/Consent, Eingriff, postoperativer Aufenthalt, Reha, postoperatives
Monitoring) sich über **mehrere `Encounter`** erstreckt.

## Entscheidung

**Lokoregionale Behandlungslinien — Chirurgie, Strahlentherapie, Ablation —** sind
**Behandlungslinien, die EnLiST nicht abdeckt** und die **nicht in die systemische
LoT-Zählung** eingehen (eigene Modalitätsspur). Sie werden als
**[[Behandlungsepisode]]** realisiert (`EpisodeOfCare`, `type` = lokoregional:
chirurgisch / strahlentherapeutisch / ablativ). Abgrenzung: lokoregionale
Behandlungslinie ≠ systemische [[Therapielinie]] (LoT).

**Chirurgie (ausgearbeiteter Fall):** die **Episode umfasst die perisurgische
Reise**; die **Operation selbst bleibt ein `Procedure`** als Ereignis *innerhalb*
der Episode (verknüpft über `Encounter.episodeOfCare` bzw. aus dem Phasen-CarePlan
referenziert). Strahlentherapie und Ablation analog (Episode = Behandlungsserie/
-abschnitt; einzelne Fraktion/Ablation = `Procedure` darin).

## Konsequenzen

### Positiv

- Chirurgie/Strahlentherapie/Ablation sind als Behandlungslinien **sichtbar**, ohne die systemische LoT-Zählung zu verfälschen (EnLiST-konform, ADR-0010).
- Saubere Trennung `EpisodeOfCare` (Periode) ≠ `Procedure` (Ereignis) ≠ `Encounter` (Kontakt).
- Ein einheitliches Muster für alle lokoregionalen Modalitäten (keine Sonderfälle je Modalität).

### Negativ / Trade-offs

- `EpisodeOfCare.type`-ValueSet braucht die lokoregionalen Ausprägungen (chirurgisch, strahlentherapeutisch, ablativ).
- Beispiel-Rework: `TherapielinieOperation` → chirurgische (lokoregionale) Behandlungsepisode.

### Folgeaufgaben

- `EpisodeOfCare.type`-ValueSet: lokoregionale Behandlungslinien-Arten ergänzen.
- Beispiel Mamma: `TherapielinieOperation` → chirurgische Behandlungsepisode; `ProcedureOperationMamma` als Ereignis darin.
- Kennzeichnung „nicht in LoT-Zählung" (Modalitätsspur) im Modell/Visualisierung festlegen.

## Alternativen

### Alternative A — Lokoregionale Therapie als systemische Therapielinie (LoT)

- **Verworfen weil:** verfälscht die EnLiST-Linien-Zählung; lokal ≠ systemisch.

### Alternative B — Lokoregionale Therapie nur als `Procedure`, keine Episode/Linie

- **Verworfen weil:** ignoriert den mehr-`Encounter`-Verlauf *und* die Tatsache, dass es (lokoregionale) Behandlungslinien sind.

### Alternative C — Verlauf als einzelner `Encounter`

- **Verworfen weil:** ein `Encounter` bildet die sektorübergreifende Periode nicht ab; `EpisodeOfCare` bündelt die zugehörigen `Encounter`.

## Offene Punkte

- Sequenz/Überlappung, wenn lokoregionale und systemische Linien verschränkt sind (neoadjuvant → OP → adjuvant; Radiochemotherapie = systemisch **und** lokoregional gleichzeitig): zeitliches/paralleles Verhältnis der Episoden — technisch über `RequestGroup` orchestriert (ADR-0021).
- Gemeinsame vs. je-Modalität-Extension (chirurgisch/strahlentherapeutisch/ablativ).
