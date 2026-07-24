# Architecture Decision Records (ADRs)

Projekt: gematik — Spezifikation Therapieziel Onkologie

ADRs erfassen einzeln referenzierbare Architekturentscheidungen mit Kontext, Begründung und Konsequenzen. Sie ergänzen die narrativen Analysedokumente (`00_Architekturentscheidung.md`, `01_Dokumentenarchitektur_ePA.md`) durch atomare, zitierfähige Einheiten.

## Konventionen

- **Dateiname:** `NNNN-kurzer-titel.md`, vier Ziffern, fortlaufend ab `0001`.
- **Status-Werte:** `proposed` · `accepted` · `superseded by ADR-NNNN` · `deprecated`
- **Superseding:** Eine ADR wird nicht editiert, wenn sie obsolet wird — stattdessen neue ADR anlegen, im Status der alten auf die neue verweisen.
- **Sprache:** Deutsch, technische Begriffe (FHIR, Composition, …) bleiben in Originalschreibweise.
- **Granularität:** Eine ADR pro Entscheidung. Wenn sich „eine Entscheidung" in mehrere unabhängige Sub-Entscheidungen aufspalten lässt — splitten.
- **Template:** `_TEMPLATE.md`.

## Index

ADR-Nummern sind **Erstellungsreihenfolge**, nicht logische Reihenfolge. Zur
Orientierung sind sie thematisch in drei Bänder gruppiert. Fachliches Fundament
ist Band B (Content-Architektur aus der LG-01-Analyse); Band A (ePA/Dokument)
und Band C (Content-Modell-Detail) bauen darauf auf.

### Band A — ePA / Dokument-Ebene (Auslieferung, Verpackung, Versionierung)

| # | Titel | Status | Datum |
|---|-------|--------|-------|
| [0001](0001-dokumentenbasierte-architektur.md) | Dokumentenbasierte Architektur statt loser FHIR-Ressourcen | accepted | 2026-05-20 |
| [0002](0002-pka-versionierungsmuster.md) | PKA-Versionierungsmuster für Composition-Updates | accepted | 2026-05-20 |
| [0003](0003-drei-parallele-document-bundles.md) | Drei parallele Document Bundles (Therapieziel, Studienteilnahme, CAM) | accepted (Scope-Risiko CAM offen) | 2026-05-20 |
| [0004](0004-eigenes-profil-statt-pka-ableitung.md) | Eigenes Composition-Profil statt Ableitung von kbv-pr-mio-pka-composition | accepted | 2026-05-20 |
| [0005](0005-fhir-interaktionsmodell.md) | FHIR-Interaktionsmodell: Create/Update/Read als Document-Pattern | accepted | 2026-05-20 |
| [0006](0006-dokumentidentitaet-xds-mhd.md) | Dokument-Identität & Ersetzung auf XDS/MHD-Ebene (Companion zu 0002) | proposed | 2026-07-24 |
| [0007](0007-therapieziel-current-summary.md) | Therapieziel-Dokument als Current-Summary, nicht kumulativ | proposed | 2026-07-24 |
| [0008](0008-generische-behandlungsziel-composition.md) | Generische Behandlungsziel-Composition, Krankheits-Spezifik nur via Value Sets | proposed | 2026-07-24 |

### Band B — Content-Architektur (LG-01-Analyse, Vier-Schichten-Fundament)

| # | Titel | Status | Datum |
|---|-------|--------|-------|
| [0009](0009-vier-schichten-architektur.md) | Vier-Schichten-Architektur mit Primär-/Fallback-Pfad | accepted | 2026-07-24 |
| [0010](0010-enlist-therapielinien-achse.md) | EnLiST als Therapielinien-Strukturachse | accepted | 2026-07-24 |
| [0011](0011-cpg-on-fhir-primaerpfad.md) | CPG-on-FHIR als Primärpfad für computable Leitlinien | accepted | 2026-07-24 |
| [0012](0012-careplan-goal-fallback.md) | CarePlan/Goal als Fallback-Repräsentation (MCC/mCODE/IPS) | accepted | 2026-07-24 |
| [0013](0013-mii-kds-datenbasis.md) | MII KDS Onkologie als Datenelemente- und Terminologiebasis | accepted | 2026-07-24 |
| [0014](0014-ips-eps-boundary.md) | IPS/EPS als Boundary Exchange Format (verlustbehafteter Grenzvertrag) | accepted | 2026-07-24 |

### Band C — Content-Modell-Detail (Grilling-Session 2026-07-24)

| # | Titel | Status | Datum |
|---|-------|--------|-------|
| [0015](0015-zweischichtiges-zielmodell.md) | Zweischichtiges Zielmodell mit Replace-on-Pivot | proposed | 2026-07-24 |
| [0016](0016-generelle-behandlungsepisode.md) | Generelles `Behandlungsepisode`-Profil ersetzt `OnkoTherapyLine` | proposed | 2026-07-24 |
| [0017](0017-empfehlung-behandlung-careplan.md) | Empfehlungs-/Behandlungs-CarePlan getrennt, `basedOn` statt `partOf` | proposed | 2026-07-24 |
| [0018](0018-achievementstatus-zustandscodes.md) | `achievementStatus` nur Zustands-Codes; Trajektorie in Observations | proposed | 2026-07-24 |
| [0019](0019-beispiel-varianten-architektur.md) | Beispiel-/Bundle-Varianten-Architektur (self-contained, PUT, RuleSet) | proposed | 2026-07-24 |
| [0020](0020-lokoregionale-behandlungslinien.md) | Lokoregionale Behandlungslinien (Chirurgie, Strahlentherapie, Ablation) als nicht-EnLiST-Behandlungsepisoden | proposed | 2026-07-24 |
| [0021](0021-multimodale-orchestrierung-requestgroup.md) | Multimodale, sequenzierte/konkurrente Ansätze als `RequestGroup` / `RequestOrchestration` | proposed | 2026-07-24 |

## Workflow

1. Vor einer Architekturentscheidung: ADR im Status `proposed` anlegen.
2. Diskutieren (Workshop, Mai/Juni Status-Meeting, intern).
3. Bei Annahme: Status auf `accepted`, Datum eintragen.
4. Bei späterer Ablösung: neue ADR anlegen, alte auf `superseded by ADR-NNNN` setzen.
