# ADR-0009: Vier-Schichten-Architektur mit Primär-/Fallback-Pfad

- **Status:** accepted
- **Datum:** 2026-07-24
- **Beteiligte:** Sylvia Thun, Thomas Debertshäuser
- **Bezug:** `00_Architekturentscheidung.md` (LG-01); ADR-0010, ADR-0011, ADR-0012, ADR-0013, ADR-0014

## Kontext

Onkologische Versorgung ist teils leitliniengetrieben und computable
darstellbar, teils weicht sie (bewusst/unbewusst, seltene Tumoren,
Studieneinsatz) ab. Studien zeigen 15–30 % strukturierte Abweichung. Kein
einzelner FHIR-Standard deckt beide Fälle. Die Analyse (LG-01) hat aus dem
Scraping mehrerer FHIR-Specs (mCODE, IPS/EPS, MCC, PCO, EnLiST, CPG-on-FHIR,
MII Onkologie) eine Schichtenlogik abgeleitet.

## Entscheidung

Vier Schichten mit klarer Rollenverteilung und explizitem Fallback:
**S1 EnLiST** (Therapielinien-Strukturachse, konzeptionell),
**S2 CPG-on-FHIR** (computable Leitlinien, *Primärpfad* via `instantiatesCanonical`),
**S3 CarePlan/Goal** (reale Versorgung, *Fallback* bei fehlender/abweichender
Leitlinie), **S4 MII KDS Onkologie** (Datenelemente & Terminologie). IPS/EPS ist
Brückenformat an den Sektorengrenzen (ADR-0014), nicht Teil des internen Modells.
Details je Schicht in ADR-0010 bis 0014.

## Konsequenzen

### Positiv

- Deckt leitlinienkonforme **und** abweichende Verläufe ab (kein „vierter bis fünfter Verlauf unmodellierbar").
- Kompakte Primärdarstellung (Verweis) + Detailbild im Fallback.
- Anschlussfähig national (MII) und europäisch (IPS/EPS/EHDS).

### Negativ / Trade-offs

- Zwei Repräsentationspfade (Primär/Fallback) erhöhen Implementierungs-Komplexität.
- Abgrenzung „wann Primär, wann Fallback" muss normativ klar sein.

### Folgeaufgaben

- Fallback-Entscheidungstabelle (siehe `00_Architekturentscheidung.md`) in den IG übernehmen.
- Use-Cases wählen, die alle vier Schichten exemplifizieren (KRK 1L, mBC-Abweichung, Sarkom-Studie, molekulares Tumorboard).

## Alternativen

### Alternative A — Nur CPG-on-FHIR (rein computable)

- **Verworfen weil:** deckt Abweichungen/seltene Tumoren/Studien ohne computable Leitlinie nicht ab.

### Alternative B — Nur CarePlan/Goal (rein generisch)

- **Verworfen weil:** verschenkt die kompakte, normative Referenzierung leitlinienkonformer Fälle.

## Offene Punkte

- CAM/Studienteilnahme-Scope (vgl. ADR-0003) im Verhältnis zur Schichtenlogik.
