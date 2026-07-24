# ADR-0013: MII KDS Onkologie als Datenelemente- und Terminologiebasis

- **Status:** accepted
- **Datum:** 2026-07-24
- **Beteiligte:** Sylvia Thun, Thomas Debertshäuser
- **Bezug:** ADR-0009, ADR-0014; LG-01 §MII; MII KDS Modul Onkologie v2026.0.3

## Kontext

Die Spezifikation muss an die deutsche Versorgungsrealität und etablierte
DIZ-Datenflüsse anschließen (gematik-/MII-Mandat). Für Diagnose, Medikation,
Prozedur, Rezeptor-/HER2-Status etc. existieren mit dem MII KDS-Modul Onkologie
nationale Datenelemente und Terminologien.

## Entscheidung

Das **MII KDS Onkologie** ist die **primäre Datenelemente-/Terminologiebasis**
(Schicht 4). Onko-Profile slicen bzw. leiten von MII-KDS-Profilen ab (z. B.
`OnkoCondition` auf MII Diagnose Primärtumor). EHDS-Anschluss erfolgt **sekundär**
via Mapping auf IPS/EPS (ADR-0014), nicht durch ein IPS-konformes Primärformat.

## Konsequenzen

### Positiv

- Nationale Interoperabilität, etablierte Datenflüsse, kein paralleles Datenmodell.
- Wiederverwendung geprüfter Terminologien (ICD-10-GM, ICD-O-3, oBDS-Kodierungen).

### Negativ / Trade-offs

- Kopplung an MII-KDS-Releasezyklen und -Constraints.
- Mapping-Schicht nach IPS/EPS für EHDS zusätzlich nötig.

### Folgeaufgaben

- Slicing/Ableitung auf MII-KDS-Profile (Medikation, Prozedur, Diagnose) festlegen.
- Spiegelung in MII-AGs Onkologie/Medikation.

## Alternativen

### Alternative A — Eigenes Datenmodell / IPS-Primärformat

- **Verworfen weil:** ignoriert nationale Versorgungsrealität und Mandat; dupliziert etablierte MII-Terminologien.

## Offene Punkte

- Versions-Pinning des MII-KDS-Moduls und Umgang mit dessen Updates.
