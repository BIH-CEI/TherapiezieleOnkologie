# ADR-0006: Dokument-Identität & Ersetzung auf XDS/MHD-Ebene (Companion zu ADR-0002)

- **Status:** proposed
- **Datum:** 2026-07-24
- **Beteiligte:** Thomas Debertshäuser
- **Bezug:** ADR-0001, ADR-0002, ADR-0005; [IHE MHD DocumentReference](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.Comprehensive.DocumentReference.html); [gemSpec_Dokumentenverwaltung](https://gemspec.gematik.de/docs/gemSpec/gemSpec_Dokumentenverwaltung/gemSpec_Dokumentenverwaltung_V1.10.0/)

## Kontext

ADR-0002 regelt die Versionierung auf **Inhaltsebene** (`Composition.identifier`
stabil, `Composition.id` je Version, `relatesTo = replaces`). Die Verifikation
gegen die ePA-Specs zeigt jedoch: die ePA-Dokumentenverwaltung ist **IHE-XDS-basiert**
(Repository/Registry), und die *versionsspezifische* Dokument-Identität sowie die
Ersetzung leben auf der **Dokument-Management-Ebene** — `DocumentReference.masterIdentifier`
(„specific to this version of the document") und `DocumentReference.relatesTo = replaces`
(bzw. die XDS-**RPLC**-Association). Der stabile ePA-Dokument-Anker liegt also
*nicht* allein auf `Composition.identifier`.

## Entscheidung

Die Dokument-Identität und Ersetzung im ePA-Kontext werden **auf beiden Ebenen**
festgelegt: **Inhaltsebene** (FHIR `Composition`, ADR-0002) *und*
**Dokument-Management-Ebene** (`DocumentReference.masterIdentifier` +
`relatesTo = replaces` / XDS-RPLC). Die stabile logische Dokumentidentität wird auf
der XDS/MHD-Metadatenebene geführt; `Composition.identifier` bleibt der
inhaltsseitige logische Anker. Beide müssen konsistent gepflegt werden.

## Konsequenzen

### Positiv

- Fundierung entspricht der realen ePA-Architektur (XDS Document Source/Registry).
- Ersetzungskette ist auf der Ebene auffindbar, auf der die ePA sie tatsächlich verwaltet.

### Negativ / Trade-offs

- Zwei zu synchronisierende Identitäts-/Versionsebenen (Content + Metadaten).

### Folgeaufgaben

- Mapping `Composition` ↔ `DocumentReference`-Metadaten (masterIdentifier, relatesTo) im IG dokumentieren.
- Prüfen, welche XDS-Association (RPLC/APND) je Fortschreibungstyp gilt.

## Alternativen

### Alternative A — Versionierung nur auf `Composition`-Ebene (Status quo ADR-0002)

- **Verworfen weil:** die ePA verwaltet Dokumentidentität/Ersetzung auf der XDS/MHD-Metadatenebene; reine Content-Ebene greift zu kurz.

## Offene Punkte

- Exakte gematik-Anforderungen an `masterIdentifier`/`relatesTo` beim Einstellen — in gemSpec_Dokumentenverwaltung / gemILF_PS_ePA verifizieren.
