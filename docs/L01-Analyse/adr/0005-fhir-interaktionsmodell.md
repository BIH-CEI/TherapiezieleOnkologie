# ADR-0005: FHIR-Interaktionsmodell — Create/Update/Read als Document-Pattern

- **Status:** accepted
- **Datum:** 2026-05-20
- **Beteiligte:** Sylvia Thun, Thomas Debertshäuser
- **Bezug:** ADR-0001, ADR-0002, ADR-0003, LG-03

## Kontext

Mit der Entscheidung für eine dokumentenbasierte Architektur (ADR-0001) und PKA-Versionierungsmuster (ADR-0002) muss das **FHIR-Interaktionsmodell** explizit gemacht werden. Implementierer stolpern erfahrungsgemäß über zwei häufige Missverständnisse:

1. „Update eines Dokuments" wird fälschlich als `PUT` auf die Vorgänger-Ressource verstanden — tatsächlich ist es ein **neuer Create** mit `relatesTo replaces`.
2. FHIR-`_history` (technischer Audit-Trail einer Ressource) wird mit der **Dokument-Versionskette** (fachliche `relatesTo`-Verkettung *zwischen* Ressourcen) verwechselt.

Beide Punkte müssen der IG normativ klarstellen.

## Entscheidung

### Create (Erstanlage eines Dokuments)

| Aspekt | Festlegung |
|---|---|
| Operation | `POST [base]/Bundle` mit `Bundle.type = document` — alternativ `$process-document`, falls die ePA-Festlegung das vorsieht |
| Inhalt | Vollständiges Document Bundle: Composition als erster Eintrag + alle referenzierten Ressourcen vollständig enthalten (closed-world) |
| `Composition.status` | `preliminary` oder `final` |
| `Composition.identifier` | neu zugewiesen, stabile logische Dokument-ID |
| `Composition.relatesTo` | leer |
| Idempotenz | Wiederholter Create mit gleichem `Composition.identifier` MUSS vom ePA-Endpunkt abgelehnt werden (Conflict) |

### Update (neue Version eines existierenden Dokuments)

| Aspekt | Festlegung |
|---|---|
| Operation | `POST [base]/Bundle` (erneuter Create) — **nicht** PUT auf die alte Composition |
| `Composition.identifier` | **identisch** mit Vorgänger |
| `Composition.id` | **neu** |
| `Composition.status` | `final` oder `amended` |
| `Composition.relatesTo` | **Pflicht**: `code = replaces`, Verweis auf Vorgänger-Composition |
| `Composition.date` | Zeitpunkt der Update-Version |
| Serververhalten | Vorgängerversion wird auf `superseded` gesetzt, nicht gelöscht |

### Read

| Modus | Operation | Liefert |
|---|---|---|
| Aktuelle Version | `GET [base]/Composition?identifier=<id>&status:not=superseded` | nur aktuelle Composition |
| Versionskette | `GET [base]/Composition?identifier=<id>` | alle Versionen |
| Vollständiges Bundle | `GET [base]/Composition/{id}/$document` | rekonstruiertes Document Bundle |
| Technische Ressourcen-History | `GET [base]/Composition/{id}/_history` | FHIR-Audit-History (nicht zu verwechseln mit Versionskette) |

### Delete

Nur durch **Patientenrecht** über die ePA-Oberfläche, nicht durch Behandelnde. Bei Löschung MUSS der Server `relatesTo`-Auflösbarkeit als `gone`/Tombstone signalisieren, nicht als Hard-Delete-404 — sonst sind verbleibende Compositions unbrauchbar.

### Search-Parameter (Minimum)

- `Composition?identifier=<id>` — Dokument-Lookup
- `Composition?patient=<ref>&type=<therapieziel|studie|cam>` — alle Dokumente eines Typs pro Patient
- `Composition?patient=<ref>&status=current` — aktuelle Zustände
- `Composition?_has:Composition:relatesTo:identifier=<id>` — Nachfolger finden (Reverse Chaining)

### Cross-Dokument-Konsistenz

Reader muss damit umgehen, dass das verlinkte Ziel-Dokument **fehlen** kann, eine **andere aktuelle Version** hat, oder per **logischem Identifier** (nicht versionsfest) referenziert ist. Default-Empfehlung: Verlinkung auf logischen Identifier — Verweis zeigt damit auf „jeweils aktuelle Fassung".

## Konsequenzen

### Positiv

- Klares, FHIR-spec-konformes Interaktionsmodell.
- Implementierer-stolperfallen explizit adressiert (Update ≠ PUT, `relatesTo` ≠ `_history`).
- Kompatibel mit allen üblichen ePA-Modul-Schnittstellen.

### Negativ / Trade-offs

- Mehr POST-Last beim ePA-Server (jedes Update = vollständiger Create).
- Server-seitige Idempotenz- und Konflikt-Logik muss von ePA-Festlegung geleistet werden.

### Folgeaufgaben

- IG-Seite „Interaktionsmodell" mit konkreten Beispielen (Create v1, Update v2 mit `relatesTo`, Read aktuelle Version, Read Historie).
- Erwartungs-Katalog an ePA-Festlegung: Endpunkte, Auth, Profile-Validierung, Schreibhoheit pro Dokumenttyp, Retention, Delete-Verhalten, Search-Indizierung.
- Test-Suite-Konzept: für jeden Dokumenttyp eine Create- und mindestens eine Update-Folge als Beispielinstanzen.

## Alternativen

### Alternative A — RESTful PUT auf Composition-ID für Updates

- **Beschreibung:** `PUT [base]/Composition/{id}` zum „Aktualisieren".
- **Verworfen weil:** widerspricht der Document-Immutability. FHIR-Spec sieht das nicht vor; die ePA-Schreibsemantik unterstützt es nicht; bricht Versionskette und Audit.

### Alternative B — Patch-Operationen auf einzelne Ressourcen im Dokument

- **Beschreibung:** `PATCH` auf Goal/CarePlan innerhalb eines Document Bundles.
- **Verworfen weil:** Document-Atomarität gebrochen; ePA-Festlegung sieht das nicht vor.

### Alternative C — Eigene `$update-therapy-goal`-Operation

- **Beschreibung:** Custom Operation für Updates.
- **Verworfen weil:** unnötig — der normale Create-Pfad mit `relatesTo` deckt das ab; weniger Standard-konform; höherer Implementierungsaufwand.

## Offene Punkte

- Konkrete Endpunkt-URL und Authentifizierungsverfahren — Festlegungs-Sache, mit gematik klären.
- Verhalten bei konkurrierenden Updates (zwei Akteure schreiben quasi-gleichzeitig) — Conflict-Resolution-Strategie.
- Such-Parameter-Indizierung: welche der oben definierten Parameter sind in der ePA-Festlegung verpflichtend zu unterstützen.
