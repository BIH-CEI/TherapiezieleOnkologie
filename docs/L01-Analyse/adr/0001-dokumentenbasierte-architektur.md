# ADR-0001: Dokumentenbasierte Architektur statt loser FHIR-Ressourcen

- **Status:** accepted
- **Datum:** 2026-05-20
- **Beteiligte:** Sylvia Thun (PL), Thomas Debertshäuser (FHIR-Lead)
- **Bezug:** LG-03 (IG), `01_Dokumentenarchitektur_ePA.md`, ADR-0002, ADR-0005

## Kontext

Die Spezifikation Therapieziel Onkologie soll in die ePA „für alle" einbringbar sein (zusätzlich zu FDZ und Registern). Die ePA akzeptiert strukturierte FHIR-Inhalte über ihre Schreibschnittstelle praktisch ausschließlich in zwei Formen: (a) unstrukturierte Inhalte als `DocumentReference`+`Binary` und (b) strukturierte Inhalte als **FHIR Document Bundle** (`Bundle.type = document`) mit `Composition` als Anker. Lose Ressourcen ohne Document-Wrapper werden vom Schreibinterface nicht angenommen.

Klinisch ist das Therapieziel ein **fortgeschriebener Zusammenfassungs-Gegenstand** — vergleichbar mit Patientenkurzakte, Impfpass, Mutterpass — kein punktueller Einzelbefund. Damit ist das Document-Pattern auch fachlich angemessen.

## Entscheidung

Die Spezifikation wird als **dokumentenbasierte FHIR-Architektur** ausgeliefert. Inhalte werden als FHIR Document Bundle mit Composition als Anker in die ePA eingestellt. Lose Ressourcen-Submission ist nicht vorgesehen. PDF-/Binary-Pfad über `DocumentReference` ist nicht der Primärpfad.

## Konsequenzen

### Positiv

- ePA-anschlussfähig ohne Sonderschnittstelle.
- Klar abgrenzbarer, signierbarer, persistierbarer Inhaltsgegenstand.
- Konsistent mit bestehenden ePA-Modulen (MIOs, Laborbefund, eML als Sonderfall).
- Versionierung über Composition (siehe ADR-0002) möglich.

### Negativ / Trade-offs

- Atomarität des Schreibens: Teil-Updates einzelner Ressourcen sind nicht möglich, jedes Update schreibt ein vollständiges Bundle.
- Mehr Boilerplate gegenüber loser Resource-Submission (Composition + Bundle-Header).
- Closed-world Document: alle referenzierten Ressourcen müssen im Bundle enthalten sein.

### Folgeaufgaben

- LG-03: Composition- und Bundle-Profile spezifizieren.
- IG-Seite „Implementation Notes" mit ePA-Aufnahme-Erwartungen.
- Workshop 1: Schreibhoheit-Modell pro Dokument klären.

## Alternativen

### Alternative A — Lose FHIR-Ressourcen ohne Document-Wrapper

- **Beschreibung:** `Goal`, `CarePlan`, `Condition` etc. einzeln per `POST` an die ePA.
- **Verworfen weil:** ePA-Schreibsemantik akzeptiert das nicht. Kein zusammenhängender, signierbarer Dokumentgegenstand. Versionierung wäre auf Ressourcen-Ebene, nicht auf Dokument-Ebene.

### Alternative B — PDF-/Binary-Pfad über `DocumentReference`

- **Beschreibung:** Therapieziel als generiertes PDF, in der ePA als `DocumentReference`+`Binary` abgelegt.
- **Verworfen weil:** würde den Zweck der Strukturierung verfehlen. Keine maschinelle Auswertbarkeit, kein FDZ-/Register-Anschluss.

### Alternative C — Mischform (Document Bundle + lose Ressourcen)

- **Beschreibung:** Composition als Index, einzelne Ressourcen lose daneben.
- **Verworfen weil:** ePA-Festlegung gibt das nicht her; bricht die Closed-world-Garantie des Document-Patterns.

## Offene Punkte

- Konkrete Endpunkt-Spezifikation der ePA-Schreibschnittstelle für „eigene" Festlegungen — mit gematik im Mai-Status klären.
