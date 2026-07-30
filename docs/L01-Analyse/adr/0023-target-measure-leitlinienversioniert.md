# ADR-0023: `Goal.target.measure` ist leitlinienversioniert und an die normative Quelle gebunden

- **Status:** proposed
- **Datum:** 2026-07-29
- **Beteiligte:** Thomas Debertshäuser
- **Bezug:** ADR-0011 (CPG-on-FHIR als Primärpfad), ADR-0015 (zweischichtiges Zielmodell), `CONTEXT.md` (Zielwert vs. Ergebnis); FHIR `Goal.target.measure`/`detail`, `relatedArtifact`, `instantiatesCanonical`; Konzeptseiten `goal-target-measure.html`, `entitaet-*.html`

## Kontext

`Goal.target.measure` benennt die Größe, an der Zielerreichung beurteilt wird
(z. B. „Remission"). Beim Ausbau auf nicht-onkologische Entitäten (Diabetes,
Asthma, CED, rheumatoide Arthritis) wurde offensichtlich: **Welche Größe
maßgeblich ist, ist nicht zeitstabil, sondern folgt dem gültigen Leitlinienstand
— und der ändert sich.**

Belege (jeweils jüngere Verschiebung):

- **RA:** Das EULAR-2025-Update rät **ausdrücklich vom DAS28** als
  Remissions-Messgröße ab (überschätzt Remission unter IL-6-/JAK-Inhibitoren) und
  stellt auf **ACR-EULAR-Boolean bzw. SDAI/CDAI** um.
- **Diabetes:** Fokusverschiebung vom HbA1c-zentrierten Ziel zum **kardiorenalen
  Endpunkt** (ADA/EASD 2022/23); zusätzlich **CGM/Time-in-Range** neben HbA1c.
- **Asthma:** **SABA-Monotherapie** nicht mehr empfohlen (GINA seit 2019).
- **CED:** symptombasiert → **Calprotectin/Endoskopie** (STRIDE-II).

Entscheidend: **Die Umstellung erfolgt nicht überall gleichzeitig.** Register,
Standorte und Systeme sind zu jedem Zeitpunkt auf unterschiedlichem Stand — alte
und neue Messgröße **koexistieren**. Eine „Remission" nach DAS28 ist **nicht**
dieselbe wie eine nach ACR-EULAR; ein bloßer Wert ohne Herkunft ist nicht
vergleichbar und kann fehlinterpretiert werden.

## Entscheidung

`target.measure` wird **nicht als zeitloser, hartkodierter Wert** modelliert,
sondern:

1. **Versionsabhängig und austauschbar.** Die Zielgröße trägt ihren
   **Herkunfts- und Gültigkeitskontext** (welche Leitlinie, welche Fassung/Datum).
2. **An die normative Leitlinienquelle gebunden** über die CPG-on-FHIR-Mechanik
   (`relatedArtifact` bzw. `instantiatesCanonical`; siehe ADR-0011) — statt einen
   Zahlenwert als zeitlose Wahrheit zu behaupten.
3. **Nicht konflatiert.** Konkurrierende Stände (DAS28- vs. ACR-EULAR-Remission)
   bleiben über ihren Quellen-/Versionsbezug **unterscheidbar**; sie werden nicht
   auf denselben `measure`-Code abgebildet.

## Konsequenzen

### Positiv

- **Vergleichbarkeit** über Systeme mit unterschiedlichem Leitlinienstand.
- **Nachvollziehbarkeit**: jeder Zielwert ist auf Leitlinie + Fassung rückführbar.
- **Zukunftssicherheit**: Leitlinien-Updates erzeugen eine neue, klar abgegrenzte
  Messgröße statt eine stille Umdeutung bestehender Daten.

### Negativ / Trade-offs

- Mehr **Metadaten pro `target`** (Quelle, Version) statt eines nackten Codes.
- Konsumenten müssen **Quelle/Version mitauswerten**, um „Remission ≠ Remission"
  korrekt zu behandeln.
- Terminologie muss ggf. **mehrere parallele Messgrößen** parallel führen.

### Folgeaufgaben

- Im `Goal`-/`target`-Profil `relatedArtifact` bzw. `instantiatesCanonical` als
  Quellen-/Versionsbindung für `target.measure` vorsehen.
- Value Sets für Messgrößen mit **Quellen-/Fassungsbezug** statt kontextloser
  Einzelcodes.
- Konzeptseite [Zielwerte und Messgrößen](../../../input/pagecontent/goal-target-measure.md)
  als narrative Referenz verlinken.

## Alternativen

### Alternative A — `measure` als reiner codierter Wert ohne Quellenbezug

- **Verworfen weil:** konfliert alte/neue Stände, „Remission" wird mehrdeutig, keine
  Nachvollziehbarkeit bei Leitlinien-Updates.

### Alternative B — `measure` nur als Freitext (`measure.text`)

- **Verworfen weil:** nicht maschinell auswertbar; Quelle/Version bleiben implizit.

## Offene Punkte

- Konkrete Bindungsform: `instantiatesCanonical` auf eine versionierte CPG-`PlanDefinition`
  vs. `relatedArtifact` (`derived-from`) mit Zitat — Festlegung im Profil-Ausbau.
- Umgang mit Messgrößen **ohne** publizierte computable Leitlinienquelle (PRO, Funktion):
  Quellen-/Fassungsangabe minimal als strukturiertes Zitat.
