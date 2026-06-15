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

| # | Titel | Status | Datum |
|---|-------|--------|-------|
| [0001](0001-dokumentenbasierte-architektur.md) | Dokumentenbasierte Architektur statt loser FHIR-Ressourcen | accepted | 2026-05-20 |
| [0002](0002-pka-versionierungsmuster.md) | PKA-Versionierungsmuster für Composition-Updates | accepted | 2026-05-20 |
| [0003](0003-drei-parallele-document-bundles.md) | Drei parallele Document Bundles (Therapieziel, Studienteilnahme, CAM) | accepted (Scope-Risiko CAM offen) | 2026-05-20 |
| [0004](0004-eigenes-profil-statt-pka-ableitung.md) | Eigenes Composition-Profil statt Ableitung von kbv-pr-mio-pka-composition | accepted | 2026-05-20 |
| [0005](0005-fhir-interaktionsmodell.md) | FHIR-Interaktionsmodell: Create/Update/Read als Document-Pattern | accepted | 2026-05-20 |

## Workflow

1. Vor einer Architekturentscheidung: ADR im Status `proposed` anlegen.
2. Diskutieren (Workshop, Mai/Juni Status-Meeting, intern).
3. Bei Annahme: Status auf `accepted`, Datum eintragen.
4. Bei späterer Ablösung: neue ADR anlegen, alte auf `superseded by ADR-NNNN` setzen.
