# ADR-0012: CarePlan/Goal als Fallback-Repräsentation (Quellen MCC/mCODE/IPS)

- **Status:** accepted
- **Datum:** 2026-07-24
- **Beteiligte:** Sylvia Thun, Thomas Debertshäuser
- **Bezug:** ADR-0009, ADR-0011, ADR-0015, ADR-0016, ADR-0017; LG-01 §MCC/§IPS; [MCC eCare Plan](https://build.fhir.org/ig/HL7/fhir-us-mcc/), [mCODE](https://hl7.org/fhir/us/mcode/), [IPS](https://hl7.org/fhir/uv/ips/)

## Kontext

Für Fälle ohne computable Leitlinie (seltene Tumoren, Off-Label, Studien,
palliative Sondersituationen) oder bei bewusster Abweichung braucht es eine
generische Repräsentation des **realen** Versorgungsverlaufs. FHIR `CarePlan`/`Goal`
sind dafür vorgesehen; Muster liefern MCC eCare Plan (CarePlan/Goal-Zusammenspiel),
mCODE (Treatment-Pattern) und IPS (Plan-of-Care-Inhaltsstruktur).

## Entscheidung

`CarePlan`/`Goal` bilden den **Fallback-Pfad** (Schicht 3): führende Darstellung des
realen Verlaufs, wenn kein computable Verweis existiert; Detailbild neben dem
Verweisbild bei Abweichung. Profil-Pattern angelehnt an **MCC** (referenzbasiert),
ergänzt um mCODE-Ansprechen und IPS-Plan-of-Care-Struktur. Die konkrete
Ausgestaltung (Zielschichtung, Episoden, Empfehlung/Behandlung, Status) ist in
ADR-0015 bis 0017 festgelegt.

## Konsequenzen

### Positiv

- Kein Verlauf bleibt unmodellierbar; strukturierte Abweichungsdokumentation.
- Etablierte internationale Muster statt Eigenentwicklung.

### Negativ / Trade-offs

- Generik erfordert Konventionen (Kardinalität, Status, Verknüpfung), die FHIR offen lässt → ADR-0015–0017.

### Folgeaufgaben

- `OnkoCarePlan`/`OnkoTherapyGoal`-Profile gemäß ADR-0015–0018 finalisieren.

## Alternativen

### Alternative A — IPS Plan of Care als internes Primärformat

- **Verworfen weil:** IPS ist narrativ/schmal, kein strukturiertes Ziel-/Episodenmodell (siehe ADR-0014); nur als Boundary-Format geeignet.

## Offene Punkte

- Grad der mCODE-Anlehnung bei Ansprechen/Disease-Status-Observations.
