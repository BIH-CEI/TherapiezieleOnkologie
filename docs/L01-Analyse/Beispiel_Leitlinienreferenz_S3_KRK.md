# Beispiel: Referenzierung einer S3-Leitlinien-Empfehlung

Baustein für Liefergegenstand LG-01 · Gematik-Auftrag · BIH-CEI

**Zweck:** Konzeptionelles Beispiel, wie unsere Spezifikation eine Empfehlung aus einer existierenden onkologischen S3-Leitlinie in der Patient\*innenakte sichtbar macht. Fokus liegt auf der **Verlinkbarkeit** — nicht auf der detaillierten technischen Umsetzung (diese folgt in LG-03).

## Beispielquelle

**Leitlinienprogramm Onkologie (DGVS, DKG, AWMF) — S3-Leitlinie Kolorektales Karzinom**, AWMF-Reg.-Nr. 021/007OL, Langversion 2.1 (Januar 2019, Living Guideline). Online: [leitlinienprogramm-onkologie.de/leitlinien/kolorektales-karzinom](https://www.leitlinienprogramm-onkologie.de/leitlinien/kolorektales-karzinom/)

**Beispielempfehlung 8.27** (Erstlinientherapie nicht-resektables metastasiertes KRK):

> "In der Erstlinientherapie soll bei Patienten mit nicht-resektablem metastasiertem kolorektalem Karzinom (mKRK) eine Kombinationschemotherapie (FOLFOX, FOLFIRI oder XELOX) angeboten werden. Bei linksseitigen, RAS-Wildtyp-Tumoren soll die Kombination mit einem anti-EGFR-Antikörper bevorzugt werden."
>
> *Empfehlungsstärke A · LoE 1b · Konsens*

## Abbildung in der Spec — konzeptionell

Zwei Verlinkungsebenen ergeben das angestrebte "Verweisbild":

1. **Leitlinienempfehlung als eigenes Artefakt** (`PlanDefinition` mit `OnkoRecommendationDefinition`-Profil). Trägt eine stabile Canonical-URL, eine Zitation und einen Tiefenlink auf die genaue Empfehlungs-Anker-Stelle im Leitlinien-PDF (über `relatedArtifact`).
2. **Konkrete Therapielinie** (z. B. ein `MedicationRequest` für mFOLFOX6) verweist über `instantiatesCanonical` auf diese Empfehlung. Damit ist jede tatsächlich verordnete Linie eindeutig ihrer normativen Quelle zuordenbar.

## Was die Visualisierung damit zeigt

- **Im Standardfall:** "1L mFOLFOX6 — folgt S3-Leitlinie KRK, Empfehlung 8.27" als kompakte Verweisanzeige; Klick öffnet das PDF an der Empfehlungs-Stelle.
- **Bei Abweichung:** dieselbe Linie als `OnkoCarePlan` mit eigener Detailbeschreibung und Begründung; der `instantiatesCanonical`-Verweis bleibt als "abgewichen von" sichtbar (siehe Architektur-Baustein, Sektion "Fallback-Logik").

## Was die Spec dafür leisten muss

- `instantiatesCanonical` als MustSupport auf jedem Therapie-Request/-Event-Profil.
- `relatedArtifact` als MustSupport auf `OnkoRecommendationDefinition` mit Citation, URL (idealerweise Tiefenlink) und Type *documentation*.
- Stabile Canonical-Namenskonvention je Leitlinie/Empfehlung (Versionierung).
- Pflegeprozess mit der Geschäftsstelle Leitlinienprogramm Onkologie für die maschinenlesbare Empfehlungsliste pro Leitlinien-Update.

## Bewertungsangaben (optional)

Die Empfehlungsstärke (A/B/0/soll nicht), Level of Evidence (1a–5) und Konsensstärke kommen aus dem AWMF-Schema und werden, sofern eingebunden, als Extensions am Empfehlungsartefakt geführt. Ein **AWMF↔GRADE-Mapping** kann optional als `ConceptMap` mitgeliefert werden, damit international anschlussfähige Auswertungen möglich bleiben. Tiefere Bewertungsmodellierung (`qualityOfEvidence` etc. aus CPG-on-FHIR) ist **nicht** für jede Empfehlung erforderlich.

## Quellen

- S3-Leitlinie Kolorektales Karzinom, AWMF 021/007OL: [leitlinienprogramm-onkologie.de](https://www.leitlinienprogramm-onkologie.de/leitlinien/kolorektales-karzinom/)
- AWMF-Regelwerk Leitlinien: [awmf.org/regelwerk](https://www.awmf.org/regelwerk/)
- HL7 CPG-on-FHIR Profiles: [build.fhir.org/ig/HL7/cqf-recommendations/en/profiles.html](https://build.fhir.org/ig/HL7/cqf-recommendations/en/profiles.html)
- Technische Details der Profilierung folgen in LG-03 (Implementation Guide).
