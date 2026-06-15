# ADR-0004: Eigenes Composition-Profil statt Ableitung von kbv-pr-mio-pka-composition

- **Status:** accepted
- **Datum:** 2026-05-20
- **Beteiligte:** Sylvia Thun, Thomas Debertshäuser
- **Bezug:** ADR-0001, ADR-0002, ADR-0003

## Kontext

Die Patientenkurzakte (PKA) ist das nächstliegende Vorbild für die Document-Architektur (siehe ADR-0001, ADR-0002). Es stellt sich die Frage, ob das Therapieziel-Composition-Profil **formal von `kbv-pr-mio-pka-composition` abgeleitet** wird (FHIR-Profilvererbung), oder ob es **strukturell am PKA-Muster orientiert, aber ein eigenes Profil** ist.

Zwischenstufen wären auch denkbar: eine Section innerhalb der PKA-Composition aufnehmen, oder ein abgeleitetes PKA-Profil mit Onko-Erweiterungen.

## Entscheidung

Eigenständige Composition-Profile pro Dokumenttyp (Therapieziel, Studienteilnahme, CAM). Strukturelles Pattern (Identifier-Stabilität, `relatesTo`-Versionierung, Status-Lifecycle) wird vom PKA-Vorbild übernommen, **formale Profilableitung jedoch nicht**.

## Konsequenzen

### Positiv

- **Entkopplung von mio42-/KBV-Releasezyklus** — Updates am PKA-Profil propagieren nicht automatisch in die Therapieziel-Spec.
- **Governance bei gematik**, nicht bei mio42 — passt zum Auftraggeber.
- **Saubere Scope-Grenze:** PKA-Profil-Änderungen sind nicht unsere Verantwortung, und unsere Änderungen brechen die PKA nicht.
- **Profil-Schlankheit:** keine PKA-spezifischen Pflichtfelder (z. B. IPS-konforme Sections), die für das Therapieziel irrelevant sind, müssen mitgeführt werden.

### Negativ / Trade-offs

- **Doppelte Pflege des Strukturmusters:** wenn PKA-Versionierungssemantik sich ändert, müssen wir manuell nachziehen.
- **Keine automatische Cross-Profile-Validierung** — Reader-Implementierer müssen jedes Profil separat unterstützen.
- **Klinische Sichtbarkeit:** Therapieziel erscheint nicht „in" der PKA. Verknüpfung nur über `relatesTo appends` (lose).

### Folgeaufgaben

- IG-Text muss explizit machen: „strukturell orientiert an PKA, formal eigenständig" — sonst entsteht der Eindruck einer Ableitung.
- Beispielinstanzen sollen das Pattern sichtbar machen (gleiche Lifecycle-Felder, gleiche Versionierungssemantik).
- Bei späterer PKA-Modernisierung: prüfen, ob Strukturmuster nachgezogen werden muss.

## Alternativen

### Alternative A — PKA-Section-Erweiterung (Therapieziel als optionale Section innerhalb der PKA)

- **Beschreibung:** Eine optionale Section „Onkologische Therapieziele" wird in das PKA-Composition-Profil aufgenommen.
- **Verworfen weil:**
  - **Schreibhoheit-Problem:** PKA wird typischerweise vom Hausarzt geführt, Document Bundle ist atomar — Onkologe kann das Therapieziel nicht ändern, ohne die gesamte PKA neu zu schreiben.
  - **Governance:** liegt bei mio42/KBV, nicht bei euch/gematik. PKA-Releases sind langsam.
  - **Profil-Aufblähung:** Onko-Section wäre für >95 % nicht-onkologische Patienten leer.

### Alternative B — Profilableitung von `kbv-pr-mio-pka-composition`

- **Beschreibung:** FHIR-Profilvererbung — Therapieziel-Composition erbt formal von PKA.
- **Verworfen weil:**
  - **Harte Versionskopplung** an mio42-Releases.
  - **Constraint-Konflikte:** PKA-spezifische Pflichtfelder (z. B. IPS-Sections) sind im Therapieziel-Kontext sinnlos.
  - **Governance bleibt geteilt** — mio42 für die Basis, gematik für die Ableitung.

### Alternative C — Composition ohne PKA-Vorbild, freies Design

- **Beschreibung:** Eigenes Design ohne Bezug zu PKA.
- **Verworfen weil:** ignoriert etablierte deutsche Document-Pattern; erschwert Implementierern den Anschluss; verzichtet auf eine bewährte Versionierungssemantik ohne Grund.

## Offene Punkte

- Verhältnis zu MII-KDS-Composition-Profilen (falls vorhanden) — in LG-05 prüfen, ob dort harmonisierungsfähige Patterns existieren.
