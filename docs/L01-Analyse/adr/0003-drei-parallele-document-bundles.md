# ADR-0003: Drei parallele Document Bundles (Therapieziel, Studienteilnahme, CAM)

- **Status:** accepted (Scope-Risiko für Studienteilnahme und CAM offen — Klärung im Mai-Status mit gematik)
- **Datum:** 2026-05-20
- **Beteiligte:** Sylvia Thun, Thomas Debertshäuser
- **Bezug:** ADR-0001, ADR-0002, ADR-0004, LG-02, LG-03, LG-05

## Kontext

In der Diskussion zur ePA-Anbindung sind drei Inhaltskomplexe identifiziert worden, die jeweils unterschiedliche **Schreibhoheit**, **Lebenszyklen** und **Datenqualitäts-Verträge** haben:

1. **Therapieziel** — durch behandelnden Onkologen/Tumorboard autorisiert. Vertragsgegenstand der Ausschreibung.
2. **Studienteilnahme** — durch Studienzentrum/Prüfarzt autorisiert. Eng mit Therapielinie verkoppelt (iLoT in EnLiST), aber eigener Lifecycle (Einschluss → Randomisierung → Visiten → Abschluss).
3. **Eigenmedikation / Komplementärmedizin (CAM)** — überwiegend patient-reported, optional erhebend durch Onkologe. Klinisch sicherheitsrelevant wegen Drug-Herb-Interaktionen.

Eine PKA-Section-Erweiterung wurde verworfen (siehe ADR-0004). Die Frage ist, ob diese Inhalte in **einem** Document Bundle gemeinsam oder in **mehreren parallelen** Bundles abgebildet werden.

## Entscheidung

Drei eigenständige Document Bundles parallel, lose verknüpft über `Composition.relatesTo` (`code = appends`):

| # | Dokument | Schreibhoheit | Status im IG |
|---|----------|---------------|--------------|
| 1 | Therapieziel Onkologie | Behandelnder Onkologe / Tumorboard | Kernspezifikation |
| 2 | Studienteilnahme Onkologie | Studienzentrum / Prüfarzt | Erweiterung — Scope mit gematik klären |
| 3 | Eigenmedikation / CAM | Patient-reported, ggf. ärztlich erhoben | Erweiterung — **Scope-Risiko hoch**, mit gematik klären |

Verknüpfung ist **nicht-zwingend** (jedes Dokument kann ohne die anderen existieren). Identifier-Systeme pro Dokumenttyp getrennt.

## Konsequenzen

### Positiv

- Saubere Trennung der Schreibhoheiten.
- Lifecycle pro Dokument unabhängig — Update am Therapieziel touchen die Studienteilnahme nicht.
- Skalierbares Muster: weitere Dokumente (z. B. „Versorgungsplan", „Symptomtagebuch") können später analog hinzukommen.
- Klare Datenschutz-Trennlinie (insb. Studienteilnahme mit Blinding-Konstellationen, CAM mit patient-reported-Status).

### Negativ / Trade-offs

- Lese-Clients müssen mehrere Dokumente kennen und aggregieren.
- Drei statt einer ePA-Festlegung erforderlich — Mehraufwand auf gematik-Seite.
- **Scope-Risiko gegenüber Vertrag:** Ausschreibung spricht von „Therapieziel", nicht von Studienteilnahme/CAM.
- **Domänenkollision für CAM:** Eigenmedikation/OTC/Phytotherapie/Nahrungsergänzung gehört primär in die Medikations-Spezifikationsstränge (eML, MIO Medikationsplan/eMP, MII-Modul Medikation). Eine vierte Parallelspezifikation neben diesen ist redundant und potenziell konfliktbehaftet.

### Folgeaufgaben

- **Mai-Status-Meeting mit gematik:** Scope-Frage für Dokumente 2 und 3 explizit auf die Agenda. Drei Optionen pro Dokument zur Entscheidung vorlegen:
  - (a) als integraler Bestandteil mitspezifizieren (Budget/Timeline anpassen)
  - (b) als Folgespezifikation markieren, Verknüpfungspunkt heute schon definieren
  - (c) nur Referenzpunkte im Therapieziel-IG, kein eigenes Bundle
- **Workshop 1:** Schreibhoheit-Modell pro Dokument klären, Use Cases für jedes Dokument durchspielen — auch CAM-Fall als klinisches Szenario (Drug-Herb-Interaktion mit Johanniskraut/Chemo).
- **Default bei fehlender Klärung:** Dokument 1 voll spezifizieren, Dokumente 2 und 3 als architektonisches Pattern dokumentieren (Profile/ValueSets als Folgespezifikation markieren).

## Alternativen

### Alternative A — Ein gemeinsames Document Bundle für alle drei Inhalte

- **Beschreibung:** Eine Composition, drei Sections (Therapieziel / Studie / CAM).
- **Verworfen weil:** unterschiedliche Schreibhoheiten brechen Atomarität — jede Änderung einer Section würde die ganze Composition neu schreiben und kollidiert mit fremder Schreibhoheit. Datenschutz-Trennung nicht abbildbar.

### Alternative B — Nur Therapieziel als Document, Rest als referenzierte lose Ressourcen

- **Beschreibung:** Studienteilnahme über `ResearchSubject`, CAM über `MedicationStatement`, lose in der ePA.
- **Verworfen weil:** lose Ressourcen sind in der ePA nicht einstellbar (ADR-0001).

### Alternative C — Nur Therapieziel-Dokument spezifizieren, alles andere out-of-scope

- **Beschreibung:** strikter Scope-Cut auf den Vertragsgegenstand.
- **Im Konflikt mit dieser ADR aber bleibt als Fallback:** Wenn die gematik-Klärung im Mai negativ ausfällt, fallen wir auf diese Variante zurück — Dokumente 2 und 3 werden in diesem Fall in den IG nur als „Architektur-Vorbild für Folgespezifikationen" eingeführt.

## Offene Punkte

- **Scope-Entscheidung gematik** zu Dokumenten 2 und 3.
- **Datenschutz-Constraint für Studienteilnahme:** Blinding-Sichtbarkeit, Sponsor-Daten in der ePA — eigene rechtliche Prüfung nötig.
- **Verhältnis CAM-Dokument zu eML/eMP** — falls Dokument 3 mitspezifiziert wird, Abgrenzung zum Medikationsstrang explizit lösen.
- **Stakeholderkreis für CAM** (Apothekerkammer, AkdÄ, Heilpraktiker-Verbände, Patientenvertretung) — nicht im aktuellen Workshop-Plan vorgesehen.
