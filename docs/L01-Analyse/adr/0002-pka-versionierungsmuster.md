# ADR-0002: PKA-Versionierungsmuster für Composition-Updates

- **Status:** accepted
- **Datum:** 2026-05-20
- **Beteiligte:** Sylvia Thun, Thomas Debertshäuser
- **Bezug:** ADR-0001, ADR-0005, LG-03

## Kontext

Therapieziele in der Onkologie sind explizit **fortschreibungspflichtig**: kurativ → palliativ ist ein klinisch hochbedeutsamer Übergang, Tumorboard-Entscheidungen ändern Linien, ECOG-Verschlechterung kann das Ziel verschieben. Die gewählte Document-Architektur (ADR-0001) liefert per FHIR-Spec **immutable Snapshots** — „Updates" sind technisch neue Compositions.

Vorbild im deutschen ePA-/MIO-Raum ist die **Patientenkurzakte (PKA)**: ein logisches Dokument pro Patient, mehrere Versionen über die Zeit, Vorgänger werden gespeichert (superseded), nicht gelöscht.

## Entscheidung

Versionierungsmuster für alle drei Document Bundles (Therapieziel, Studienteilnahme, CAM — siehe ADR-0003):

| Element | Festlegung |
|---|---|
| `Composition.identifier` | Stabile logische Dokument-ID, identisch über alle Versionen |
| `Composition.id` | Technische Ressourcen-ID, neu pro Version |
| `Composition.status` | `preliminary` → `final` → `amended` |
| `Composition.relatesTo` | **Pflicht** ab v2: `code = replaces`, Verweis auf Vorgänger-Composition |
| `Composition.date` | Zeitpunkt der jeweiligen Version |
| `Bundle.timestamp` | neu pro Submission |
| Vorgänger-Retention | „superseded" — gespeichert, nicht gelöscht (Anforderung an ePA-Festlegung) |

## Konsequenzen

### Positiv

- Vollständige Nachvollziehbarkeit klinischer Übergänge (kurativ → palliativ, Linie 1 → 2, …).
- Konsistent mit MIO-Praxis (PKA, Impfpass, Mutterpass) — Reviewer und Implementierer erkennen das Muster.
- Saubere Trennung von „aktueller Stand" (Default-Read) und „History" (Audit/QM).

### Negativ / Trade-offs

- Jede Änderung schreibt ein vollständiges neues Bundle — Speicheraufwand wächst über Patientenleben.
- Reader müssen `relatesTo`-Kette auflösen, um die History zu rekonstruieren.
- Identifier-System pro Dokumenttyp muss früh und stabil festgelegt werden.

### Folgeaufgaben

- Identifier-System pro Dokumenttyp definieren (Namensraum, OID/URN-Schema).
- IG-Seite „Versionierung & Lebenszyklus" mit Beispielinstanzen einer Versionskette (v1 preliminary → v2 final → v3 amended).
- Retention-Erwartung als Anforderung an ePA-Festlegung dokumentieren.

## Alternativen

### Alternative A — FHIR `_history` als Versionierung verwenden

- **Beschreibung:** Die FHIR-eigene Ressourcen-Versionshistorie (`Resource.meta.versionId`, `_history`-Endpunkt) als Versionsmodell verwenden.
- **Verworfen weil:** `_history` ist die *technische* Versionierung einer Ressource (Audit-Trail des Servers), nicht ein *fachliches* Versionierungsmodell. Bricht, sobald Identifier oder Speicherort wechseln. Nicht ePA-portabel.

### Alternative B — Eigenes Versionierungs-Element

- **Beschreibung:** Custom Extension `compositionVersion` mit Sequenznummer.
- **Verworfen weil:** dupliziert `relatesTo`-Semantik, nicht standardkonform, in keinem MIO etabliert.

## Offene Punkte

- Schreibhoheit-Modell: Darf nur der ursprüngliche Autor updaten, oder ist Übergabe an andere Akteure (Tumorboard, Folgesektor) erlaubt? → Workshop 1.
- Verhalten bei konkurrierenden Updates (zwei Akteure schreiben quasi-gleichzeitig) — Conflict-Resolution-Strategie der ePA-Festlegung.
