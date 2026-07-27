# ADR-0011: CPG-on-FHIR als Primärpfad für computable Leitlinien

- **Status:** accepted
- **Datum:** 2026-07-24
- **Beteiligte:** Sylvia Thun, Thomas Debertshäuser
- **Bezug:** ADR-0009, ADR-0012, ADR-0021 (RequestGroup als Request-Stufe); `00_Architekturentscheidung.md`, LG-01 §CPG-on-FHIR

## Kontext

Wo eine computable Leitlinienempfehlung existiert, soll sie **referenziert** statt
inhaltlich wiederholt werden. HL7 CPG-on-FHIR (CQF Recommendations) ist das einzige
FHIR-native Framework mit Methodik (Select→Represent→Translate→Validate, L1–L4)
**und** Profil-Set (PlanDefinition, ActivityDefinition, Library,
Definition–Request–Event-Triade). Alternativen (Quality Measure IG, SDC, CDS Hooks
pur) decken nur Teilaspekte.

## Entscheidung

CPG-on-FHIR ist der **Primärpfad**: existiert eine computable Empfehlung, wird sie
via `instantiatesCanonical` referenziert (kompakt, keine Wiederholung normativen
Inhalts). Onko-Profile leiten von den CPG-Profilen ab (z. B. `OnkoPathwayDefinition`
auf `CPGPathwayDefinition`). Bei Abweichung/fehlender Leitlinie greift der
CarePlan/Goal-Fallback (ADR-0012).

## Konsequenzen

### Positiv

- Kompakte, wartbare, normativ verankerte Darstellung leitlinienkonformer Fälle.
- Trennung normative Empfehlung vs. reale Versorgung.

### Negativ / Trade-offs

- Setzt verfügbare computable Leitlinien voraus — für viele Situationen (noch) nicht gegeben → Fallback nötig.
- Zusätzliche Profil-Familie (CPG-Ableitungen) im IG.

### Folgeaufgaben

- CPG-Ableitungsprofile spezifizieren; `CPGDetectedIssue`/`OnkoDetectedIssue` für Abweichungsbegründung.

## Alternativen

### Alternative A — Quality Measure IG / SDC / CDS Hooks

- **Verworfen weil:** decken jeweils nur Teilaspekte; kein vollständiges Methodik+Profil-Set.

## Offene Punkte

- Verfügbarkeit computable S3-Leitlinieninhalte (KRK etc.) als Referenzziel.
- **Kein normativer Katalog / keine interoperable Abbildung** für systemische
  Protokolle. Bezug bis dahin interim über `instantiatesUri`/Identifier. Ein Katalog
  wird vsl. **ab Q4 2026 durch die PHOENIX-Initiative** (European Common Cancer Model)
  bereitgestellt — Anbindung vorsehen, sobald verfügbar. Verhältnis CPG ↔ Katalog:
  s. ADR-0022.
