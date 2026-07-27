# ADR-0007: Therapieziel-Dokument als Current-Summary, nicht kumulativ

- **Status:** accepted
- **Datum:** 2026-07-24
- **Beteiligte:** Thomas Debertshäuser
- **Bezug:** ADR-0001, ADR-0002, ADR-0015; [KBV PKA](https://mio.kbv.de/display/PKA/); [HL7 IPS](https://hl7.org/fhir/uv/ips/)

## Kontext

Jede Fortschreibung erzeugt ein neues, geschlossenes Document Bundle (ADR-0001/0005),
Vorgänger bleiben `superseded` erhalten (ADR-0002). Es ist zu entscheiden, **was**
jede Version enthält: die *gesamte* Historie (kumulativ) oder den *aktuellen
Zustand* (Kurzakte). Ein kumulatives Modell lässt jedes einzelne Dokument monoton
wachsen.

## Entscheidung

Das Therapieziel-Dokument ist eine **Current-Summary-Momentaufnahme**: es trägt den
*aktuellen* Zustand (aktives [[Übergeordnetes Behandlungsziel]], aktuelle
[[Behandlungsepisode]]n, relevante jüngste Befunde), **nicht** die vollständige
Historie. Die Longitudinal-Historie wird über die **Versionskette** (`relatesTo`)
bzw. FDZ/Register rekonstruiert. Muster: PKA/IPS (Kurzakte), nicht Langzeit-Register.

## Konsequenzen

### Positiv

- Einzeldokument bleibt **schlank und stabil** in der Größe.
- Deckt sich mit dem Inhaltsmodell (ein aktives übergeordnetes Ziel; Ersetztes ist Historie, ADR-0015).
- Gutes, fokussiertes Rendering der aktuellen Sicht.

### Negativ / Trade-offs

- Historie nur über die Versionskette / externe Quellen, nicht in einem Dokument.
- Kumulative Speichermenge (superseded-Retention) wächst dennoch — ePA-seitig verwaltet.

### Folgeaufgaben

- IG-Text: „Current-Summary, Historie über Versionskette" explizit machen.
- Section-Auswahl der Composition auf den aktuellen Zustand ausrichten.

## Alternativen

### Alternative A — Kumulatives Dokument (volle Historie je Version)

- **Verworfen weil:** monoton wachsende Einzeldokumente; Redundanz zur Versionskette.

## Offene Punkte

- Definition „relevant/aktuell" je Section (z. B. wie weit zurück Befunde mitgeführt werden).
