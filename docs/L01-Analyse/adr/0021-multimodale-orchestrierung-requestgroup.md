# ADR-0021: Multimodale, sequenzierte/konkurrente Ansätze als `RequestGroup` (R4) / `RequestOrchestration` (R6)

- **Status:** proposed
- **Datum:** 2026-07-24
- **Beteiligte:** Thomas Debertshäuser
- **Bezug:** ADR-0011 (CPG-Primärpfad), ADR-0017 (Empfehlungs-/Behandlungs-CarePlan), ADR-0020 (lokoregionale Linien); `CONTEXT.md`; FHIR `RequestGroup` (R4) / `RequestOrchestration` (R6)

## Kontext

**Multimodale** onkologische Konzepte kombinieren **systemische** [[Therapielinie]]n
und **lokoregionale** Behandlungslinien (ADR-0020) in einem zusammen gedachten Plan
— zeitlich **verschränkt** (neoadjuvante Systemtherapie → OP → adjuvante
Systemtherapie) oder **gleichzeitig** (Radiochemotherapie: systemisch *und*
lokoregional). Einzelne `MedicationRequest`/`ServiceRequest` tragen diese
**Inter-Dependenzen** (Reihenfolge, Gleichzeitigkeit, Abstände) nicht; es fehlt ein
Orchestrierungs-Container.

## Entscheidung

Ein zusammen gedachter multimodaler Ansatz wird als **`RequestGroup`** (FHIR R4;
in R6 **`RequestOrchestration`**) orchestriert. Die Verschränkung wird über
`action.relatedAction.relationship` ausgedrückt — **`before-start`/`after-end`**
für Sequenz (neoadjuvant → OP → adjuvant), **`concurrent`/`concurrent-with-start`**
für Gleichzeitigkeit (Radiochemotherapie) — mit `relatedAction.offset[x]`
(Duration/Range) für Abstände. `action.resource` referenziert die einzelnen
Requests; `instantiatesCanonical` verweist auf die `PlanDefinition` des
**CPG-Primärpfads** (ADR-0011). Die RequestGroup ist die **Request-Stufe** der
Definition→Request→Event-Triade und wird vom [[EmpfehlungsCarePlan]] (ADR-0017)
referenziert.

## Konsequenzen

### Positiv

- **Sequenz und Gleichzeitigkeit** multimodaler Ansätze werden explizit, standardkonform tragbar.
- **Vereint Primär- und Fallback-Pfad:** `PlanDefinition.$apply` erzeugt die RequestGroup (Primär); dieselbe Struktur wird im Fallback vom Tumorboard direkt autoriert.
- Verbindet systemische und lokoregionale Linien in *einem* orchestrierten Empfehlungsobjekt.

### Negativ / Trade-offs

- Zusätzliche Ressourcenschicht (RequestGroup) über den einzelnen Requests.
- **R4→R6-Migration:** Umbenennung `RequestGroup` → `RequestOrchestration` (Semantik gleich, aber Ressourcenname/Referenzen ändern sich).

### Folgeaufgaben

- Profil `OnkoRequestGroup` (R4) mit den relevanten `relatedAction`-Mustern (Sequenz/Concurrent) skizzieren.
- Beispiel Mamma: neoadjuvant → OP → (ggf. adjuvant) als RequestGroup mit `before-start`/`after-end`.
- Beispiel CRC: Radiochemotherapie als `concurrent`-verknüpfte Aktionen.
- R6-Migrationspfad (`RequestOrchestration`) im IG-Text vermerken.

## Alternativen

### Alternative A — Flache Request-Liste ohne Orchestrierung

- **Verworfen weil:** Reihenfolge/Gleichzeitigkeit/Abstände sind nicht ausdrückbar; multimodale Verschränkung geht verloren.

### Alternative B — Nur `CarePlan.activity`-Reihenfolge

- **Verworfen weil:** `CarePlan.activity` hat keine strukturierten Inter-Aktions-Beziehungen (kein `relatedAction`/Concurrent); RequestGroup ist dafür das vorgesehene Mittel und schließt an CPG an.

## Offene Punkte

- Genaue Referenz `EmpfehlungsCarePlan` ↔ `RequestGroup` (via `activity.reference` oder eigenständig referenziert).
- Ob die lokoregional/systemisch-Verschränkung aus ADR-0020 vollständig über `relatedAction` abbildbar ist oder Zusatzangaben braucht.
- R4-Beibehaltung vs. früher R6-Wechsel (Abhängigkeit vom ePA-/MII-FHIR-Versionspfad).
