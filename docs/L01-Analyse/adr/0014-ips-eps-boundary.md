# ADR-0014: IPS/EPS als Boundary Exchange Format (verlustbehafteter Grenzvertrag)

- **Status:** accepted
- **Datum:** 2026-07-24
- **Beteiligte:** Sylvia Thun, Thomas Debertshäuser
- **Bezug:** ADR-0009, ADR-0012, ADR-0013; [HL7 IPS](https://hl7.org/fhir/uv/ips/), [IPS Structure](https://hl7.org/fhir/uv/ips/ipsStructure.html); EEHRxF/EHDS

## Kontext

An den Sektorengrenzen (Klinik↔ambulant↔Reha) und für EHDS ist ein Brückenformat
nötig. IPS/EPS ist der etablierte Patient-Summary-Standard. Die Verifikation der
IPS-Struktur zeigt: **16 Sektionen**, Pflicht = Allergien/Probleme/Medikation;
**Plan of Care** ist *optional und narrativ*; es gibt **keine Goal-Sektion** und
**kein `EpisodeOfCare`**. IPS ist ein *Snapshot*, kein Longitudinal-Planungsmodell.
EPS (EEHRxF/EHDS) ist IPS-abgeleitet — dieselben Grenzen.

## Entscheidung

IPS/EPS ist **Brücke, nicht internes Modell**. Der Grenzvertrag ist
**verlustbehaftet**:

| Unser Element | IPS-Sektion | Güte |
|---|---|---|
| `OnkoCondition` | Problems (R) | strukturiert |
| Medikation / Systemtherapie | Medication Summary (R) | strukturiert |
| Prozeduren (OP/Biopsie) | Procedures (S) | strukturiert |
| Staging/Rezeptor/Disease-Status | Results (S) | als `Observation` |
| Aktueller CarePlan + übergeordnetes Ziel | Plan of Care (opt., **narrativ**) | nur Referenz + Text |
| [[Behandlungsepisode]]/Therapielinie, Zielschichtung, Empfehlung/Behandlung-Graph, achievementStatus-Verlauf, Tumorboard/CPG | — | **keine IPS-Heimat** |

- **Writeback → IPS/EPS:** verlustbehaftete Projektion des *aktuellen* Zustands (Problems, Medikation, jüngste Results, Procedures + aktuelles Ziel/CarePlan als narrativer Plan of Care).
- **Prepopulate ← IPS/EPS:** seedet die *Inhalts-Ressourcen* (Condition, Medication, Allergy, Procedure), **kann die Planungs-Struktur nicht rekonstruieren**.

## Konsequenzen

### Positiv

- EHDS-/EEHRxF-Anschluss ohne das interne Modell zu verbiegen.
- Klare Erwartung, *was* über die Grenze verlustarm reist und was nicht.

### Negativ / Trade-offs

- Strukturierte Ziel-/Linien-Semantik überquert die Grenze nicht — nur narrativ zusammengefasst.

### Folgeaufgaben

- IPS/EPS-**Mapping** als eigenes Lieferobjekt führen (Boundary-Transactions Prepopulate/Writeback).
- Plan-of-Care-Narrative-Generierung aus dem aktuellen Ziel/CarePlan definieren.

## Alternativen

### Alternative A — IPS als internes Primärformat

- **Verworfen weil:** kein strukturiertes Ziel-/Episodenmodell; würde das Inhaltsmodell zerstören.

## Offene Punkte

- Verhältnis EPS (HL7 Europe) ↔ IPS-Version; EEHRxF-Konformitätsdetails.
