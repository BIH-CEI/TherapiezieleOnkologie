# ADR-0022: Zweistufige Vorlagen — CPG-Leitlinie → Empfehlungsplan, Protokollkatalog → Behandlungsplan

- **Status:** accepted
- **Datum:** 2026-07-27
- **Beteiligte:** Thomas Debertshäuser
- **Bezug:** ADR-0011 (CPG-Primärpfad), ADR-0017 (Empfehlungs-/Behandlungs-CarePlan), ADR-0021 (RequestGroup); PHOENIX-Initiative / European Common Cancer Model; FHIR `PlanDefinition`, `instantiatesCanonical`

## Kontext

Zwei Quellen liefern **Vorlagen** für die Versorgung: computable **Clinical
Guidelines** (CPG-on-FHIR, ADR-0011) und ein — noch nicht existierender — **Katalog
systemischer Protokolle** (vsl. ab Q4 2026 durch PHOENIX, ADR-0011 Offene Punkte). Ihr
Verhältnis ist zu klären: konkurrieren sie, oder ergänzen sie sich? Parallel trennt
ADR-0017 zwischen **Empfehlungsplan** (was das Board empfiehlt) und **Behandlungsplan**
(was tatsächlich ausgeführt wird).

## Entscheidung

CPG-Leitlinien und Protokollkatalog **ergänzen sich** als **zwei Ebenen von
`PlanDefinition`-Vorlagen**, passend zu den zwei CarePlan-Rollen:

- **CPG-Leitlinie = Empfehlungsvorlage** → instanziiert vom **EmpfehlungsCarePlan**
  („was ist leitliniengerecht zu empfehlen?").
- **Protokollkatalog-Eintrag = Behandlungsvorlage** → instanziiert vom
  **BehandlungsCarePlan** („welches Schema wird konkret ausgeführt?").

Beide werden über `instantiatesCanonical` referenziert (Definition-Stufe der
Definition→Request→Event-Triade, ADR-0021) — die Leitlinie auf Empfehlungs-, das
Protokoll auf Behandlungsebene.

## Konsequenzen

### Positiv

- Klares, konfliktfreies Verhältnis CPG ↔ Katalog; beide Pfade koexistieren.
- 1:1-Zuordnung Vorlage ↔ CarePlan-Rolle (ADR-0017) macht die Herkunft jedes Plans nachvollziehbar.
- Anschlussfähig an den europäischen Protokollansatz (PHOENIX / European Common Cancer Model).

### Negativ / Trade-offs

- Abhängigkeit vom noch fehlenden Protokollkatalog (PHOENIX vsl. Q4 2026); bis dahin Behandlungsvorlagen nur interim (`instantiatesUri`/Identifier).
- Zwei Vorlagen-Register zu pflegen/anzubinden statt einem.

### Folgeaufgaben

- `instantiatesCanonical` in den Empfehlungs-/Behandlungsplan-Profilen vorsehen (ADR-0017-Umsetzung).
- Mapping Protokollkatalog ↔ `PlanDefinition` festlegen, sobald PHOENIX verfügbar.

## Alternativen

### Alternative A — Nur CPG (keine Behandlungsvorlagen)

- **Verworfen weil:** Leitlinien decken die konkrete Ausführungsebene (Regime/Schema) nicht ab; der Behandlungsplan bliebe vorlagenlos.

### Alternative B — Ein einheitliches Vorlagenmodell für beide Ebenen

- **Verworfen weil:** vermischt Empfehlungs- und Ausführungsebene; widerspricht der Trennung aus ADR-0017.

## Offene Punkte

- Verfügbarkeit/Form des PHOENIX-Katalogs (Q4 2026) und dessen `PlanDefinition`-Anbindung.
- **Abdeckung zunächst nur systemische Chemo-/Targeted-Protokolle.** Nicht-chemo-
  systemische Therapien (Apherese/Blutwäsche, Elektrotherapien), genaue
  Operationsdurchführung, Vor-/Nachsorge und Strahlentherapie sind (noch) **nicht**
  abgedeckt — künftig via nationale/internationale Fachgesellschaften erweiterbar.
  (Betrifft besonders die lokoregionalen Linien aus ADR-0020, die vorerst ohne
  Behandlungsvorlage bleiben.)
