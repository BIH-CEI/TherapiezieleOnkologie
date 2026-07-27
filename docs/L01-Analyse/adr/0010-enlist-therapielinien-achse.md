# ADR-0010: EnLiST als Therapielinien-Strukturachse

- **Status:** accepted
- **Datum:** 2026-07-24
- **Beteiligte:** Sylvia Thun, Thomas Debertshäuser
- **Bezug:** ADR-0009, ADR-0016, ADR-0020 (lokoregionale, nicht-EnLiST Behandlungslinien); `00_Architekturentscheidung.md`, LG-01 §EnLiST; EnLiST: [Saini et al., *Ann Oncol* 2026;37(5):608–623, DOI 10.1016/j.annonc.2026.02.008](https://doi.org/10.1016/j.annonc.2026.02.008)

## Kontext

Für „Was ist eine Therapielinie, wie zählt/benennt man sie?" braucht es eine
konsentierte Notation. EnLiST (ESMO, paneuropäischer Delphi-Konsens für solide
Tumoren) liefert die X.Y-Notation, die Drei-Settings-Architektur und einen
Mindestdatensatz. Vergleichbares existiert international nicht.

## Entscheidung

EnLiST ist die **konzeptionelle Strukturachse** der [[Therapielinie]] (Line of
Therapy): Notation, Settings, Änderungstypen. Umgesetzt wird sie FHIR-seitig als
Ausprägung der generellen [[Behandlungsepisode]] (ADR-0016) mit
Therapielinie-Extension und Intentions-/Setting-Kodierung.

## Konsequenzen

### Positiv

- International anschlussfähige, konsensbasierte Linien-Semantik.
- Klare Trennung Systemtherapie-Linien vs. lokoregionale Modalitäten.

### Negativ / Trade-offs

- EnLiST adressiert **keine** hämatologischen Malignome (Phasenachse) — separater IG-Teil (Out-of-Scope, ADR-0009-Kontext).

### Folgeaufgaben

- Vor Release: EnLiST-Mapping (Settings/Änderungstypen) verifizieren (LG-01 §EnLiST offene Punkte).

## Alternativen

### Alternative A — Eigene Linien-Notation

- **Verworfen weil:** ignoriert den etablierten paneuropäischen Konsens, nicht anschlussfähig.

## Offene Punkte

- Hämatologische Phasenachse (Induktion/Konsolidierung/Erhaltung) als separater Baustein.
- **LoT-Zählung nicht als entitätsübergreifender Score interpretieren:** EnLiST gilt
  für **solide Tumoren + systemische Therapie** und ist im „road testing" (2026–2027);
  die Vergleichbarkeit der Linien-Zählung über Tumorentitäten hinweg ist begrenzt.
  Versionskompatibel zu EnLiST-Updates halten.
