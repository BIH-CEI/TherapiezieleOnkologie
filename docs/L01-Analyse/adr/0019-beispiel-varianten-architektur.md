# ADR-0019: Beispiel-/Bundle-Varianten-Architektur (self-contained, PUT, RuleSet)

- **Status:** proposed
- **Datum:** 2026-07-24
- **Beteiligte:** Thomas Debertshäuser
- **Bezug:** ADR-0017, `CONTEXT.md`; FHIR `Bundle` (transaction), SUSHI `RuleSet`

## Kontext

Zur Illustration sollen für **denselben Patienten** mehrere Verlaufs-**Varianten**
gezeigt werden (erfolgreich, Abbruch wegen Toxizität, Ablehnung durch Patient,
Dosisreduktion …) mit **geteilter** Diagnostik-/Empfehlungs-Vorgeschichte, aber
**divergenter** Behandlung. Varianten sind **einander ausschließende alternative
Zeitlinien**: dieselben Instanzen können nicht gleichzeitig widersprüchliche
Verläufe auf einem Server tragen. Zusätzlich ist zu entscheiden, ob Beispiel-
Bundles per POST oder PUT geladen werden.

## Entscheidung

**Ein self-contained Transaction-Bundle pro Variante**, mit **PUT** und
**varianten-skopierten stabilen IDs** (Suffix je Variante, geklonter Patient je
Variante zur Koexistenz auf einem Server). Der geteilte Präfix (Patient,
Diagnostiklinie(n), EmpfehlungsCarePlan) wird im **FSH-Source als `RuleSet`**
DRY gehalten, aber **vollständig in jedes Bundle emittiert**. Der Divergenzpunkt ist
die **Empfehlung→Behandlung-Grenze** (ADR-0017): gleiche Empfehlung, variante
`BehandlungsCarePlan`s (`basedOn`). Diese **Transaction**-Bundles sind vom
**Document**-Bundle der ePA-Auslieferung (ADR-0001/0005) zu unterscheiden.

## Konsequenzen

### Positiv

- Jede Variante rendert im IG eigenständig und ist unabhängig postbar.
- PUT erhält die lesbaren IDs → interne Referenzen lösen deterministisch auf.
- Varianten koexistieren kollisionsfrei (Suffix + Patienten-Klon).
- Kein kombinatorisches Aufblähen: Varianten additiv, nicht Varianten × Versionen.

### Negativ / Trade-offs

- Der geteilte Präfix wird im generierten Output dupliziert (Source bleibt DRY).
- Mehrere Patienten-Klone für konzeptionell „einen" Patienten.

### Folgeaufgaben

- `RuleSet` für den geteilten Präfix; Bundles auf `request.method = PUT` umstellen.
- Kleine, repräsentative Variantenauswahl (nicht die volle Matrix); Betriebs-Hinweis „viele Versionen" in den IG-Text.
- **Darm-/CRC-Szenario** als Träger verschiedener **Schweregrade / Therapieoptionen**: z. B. lokalisiert-kurativ (Radiochemotherapie + TME-Chirurgie + adjuvante Systemtherapie) vs. metastasiert-palliativ (Systemtherapie ± Ablation von Lebermetastasen) — demonstriert zugleich das Zusammenspiel **systemischer** [[Therapielinie]]n und **lokoregionaler** Behandlungslinien (ADR-0020).

## Alternativen

### Alternative A — Ein Basis-Bundle + Delta-Bundles (Referenz auf geteilte IDs)

- **Verworfen weil:** Delta-Bundles sind nicht self-contained → dangeln im IG-Render, laden nur nach dem Basis-Bundle.

### Alternative B — Ein Mega-Bundle mit allen Varianten

- **Verworfen weil:** impliziert, ein Patient habe alle Verläufe zugleich — klinisch unsinnig.

### Alternative C — POST (server-vergebene IDs)

- **Verworfen weil:** verwirft die sorgfältig gesetzten lesbaren/suffigierten IDs; Referenzauflösung wird server-abhängig.

## Offene Punkte

- Anzahl/Auswahl der Varianten fürs Erstrelease.
