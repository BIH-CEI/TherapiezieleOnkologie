# ADR-0024: Zielart-Taxonomie — zwei Achsen, Kategorie folgt Erfassungsebene, Studienteilnahme entfällt

- **Status:** accepted
- **Datum:** 2026-07-31
- **Beteiligte:** Thomas Debertshäuser (Entscheidung im Arbeitsgespräch; Umsetzung im Profilsatz gleichzeitig erfolgt)
- **Bezug:** ADR-0015 (löst dessen offenen Punkt „Bindung/Terminologie der Zielart" und den Punkt „Studienteilnahme als Zielart fraglich"), ADR-0010 (EnLiST/iLoT), ADR-0023 (target.measure leitlinienversioniert), `ConceptMapOnkoTherapyGoalTypeSct`, Konzeptseite *Therapieziele* (Abschnitt „Zielart ist nicht Therapieintention")

## Kontext

`OnkoTherapyGoalTypeVS` (an `Goal.category`) enthielt sechs Zielarten: Heilung,
Lebensverlängerung, Symptomkontrolle, Lebensqualität, Funktionserhalt,
Studienteilnahme. Drei Probleme:

1. **Überlappung:** Symptomkontrolle, Lebensqualität und Funktionserhalt wirken als
   disjunkte Klassen austauschbar — jedes Symptomziel „verbessert auch" die
   Lebensqualität. Als exklusive Kategorien sind sie nicht trennscharf.
2. **Achsen-Vermengung:** Die Zielart (angestrebter *Zustand*, Patientensicht) wurde
   in Texten und Schaubildern mit der Therapieintention (Behandlungs-*Modus*,
   SNOMED `362961001 | Procedure by intent`) vermischt.
3. **Studienteilnahme:** primär ein *Mittel* (investigationale Therapielinie, iLoT
   nach EnLiST) bzw. eigener Dokumenttyp — kein patientenseitiger Zielzustand.
   Die SNOMED-Recherche bestätigt das: Als Mapping-Ziel bietet SNOMED nur das
   Person-Konzept `428024001 | Clinical trial participant` an, keinen Zielzustand.

Die Trias Symptomkontrolle/Funktion/Überleben entspricht den klassischen
Outcome-Prioritäten der Goals-of-Care-Literatur (Fried et al.: *survival — comfort —
function*); Lebensqualität ist das globale, patientenberichtete Konstrukt darüber.

## Entscheidung

Die Zielarten bilden **zwei Achsen**: eine Überlebens-Achse (`heilung`,
`lebensverlaengerung`) und eine patientenzentrierte Achse (`symptomkontrolle`,
`funktionserhalt`, `lebensqualitaet`), unterschieden nach **Erfassungsebene, nicht
Instrument**: symptombezogen (Skala oder erfragte Symptomlast) → Symptomkontrolle;
konkrete, benennbare Funktion/Struktur → Funktionserhalt; global patientenberichtet
(standardisiertes PROM *oder* strukturiertes Interview, z. B. SEIQoL-DW) →
Lebensqualität. Für ein gegebenes `target` ist damit genau eine Kategorie richtig;
mehrere Kategorien an einem Ziel bleiben zulässig, wo tatsächlich mehrere
Zielzustände verfolgt werden (Heilung **und** Brusterhalt). **`studienteilnahme`
wird ersatzlos gestrichen**; Studienteilnahme wird als Episodenart (iLoT) bzw. — wo
die Patient:in sie ausdrücklich als Anliegen benennt — als Freitextziel mit
`expressedBy = Patient` abgebildet. Die semantische Verankerung in SNOMED CT erfolgt
per **ConceptMap auf Zielzustands-Konzepte** (nicht auf Intent-Qualifier), mit
ehrlicher Beziehungsqualität (`equivalent`/`relatedto`/`unmatched`).

## Konsequenzen

### Positiv

- Trennschärfe über die Erfassungsebene statt scheinbar disjunkter Klassen;
  interviewbasierte Erfassung ist gleichberechtigter Erfassungsweg (palliative
  Realität), nicht Sonderfall.
- **Funktionserhalt** ist als patientenpriorisiertes Ziel definiert, das die
  Maßnahmenwahl in *beide* Richtungen steuert (Deeskalation der OP ebenso wie
  Intensivierung der Vortherapie) und eigenständig scheitern kann
  (`not-achieved` bei fortbestehendem kurativem Ziel) — Shared Decision Making
  wird auditierbar.
- Achsentrennung Zielart ↔ Intention ist auf der Konzeptseite und im
  Startseiten-Schaubild konsistent; die ConceptMap dokumentiert die
  SNOMED-Semantik, ohne die Achsen zu kollabieren.

### Negativ / Trade-offs

- Lebensqualität bleibt semantischer „Schirm" über den anderen patientenzentrierten
  Zielarten — die Entdopplung hängt an der Disziplin, die Kategorie nach der
  Erfassungsebene des `target.measure` zu wählen.
- Für `lebensverlaengerung` und `funktionserhalt` existiert kein
  SNOMED-Zielzustandskonzept (`relatedto` auf die Messgröße bzw. `unmatched`);
  die Annotation ist dort bewusst unvollständig.

### Folgeaufgaben

- ~~ValueSet/CodeSystem bereinigen, ConceptMap anlegen, Konzeptseite ergänzen,
  Schaubilder korrigieren~~ (mit diesem ADR umgesetzt).
- Konzeptdefinitionen im CodeSystem um die Erfassungsebene schärfen.
- Fachliche Review der ConceptMap-Zuordnungen (MapQual: bislang Einzelvalidierung).

## Alternativen

### Alternative A — Sechs disjunkte Klassen beibehalten (Status quo)

- **Beschreibung:** Taxonomie unverändert, Überlappung dokumentarisch ignorieren.
- **Verworfen weil:** nicht trennscharf; Studienteilnahme kategorial falsch;
  offener Punkt aus ADR-0015 bliebe ungelöst.

### Alternative B — Radikale Reduktion auf zwei Kategorien (Überleben / patientenzentriert)

- **Beschreibung:** nur zwei Codes, alle Differenzierung in `target.measure`.
- **Verworfen weil:** verliert die schnelle Lesbarkeit im Tumorboard-Kontext und
  die auditierbare Eigenständigkeit von Funktionserhalt-Zielen.

### Alternative C — Zielart direkt an SNOMED binden statt eigenes CodeSystem

- **Beschreibung:** `Goal.category` direkt aus SNOMED codieren.
- **Verworfen weil:** SNOMED bietet für zwei der fünf Zielarten kein
  Zielzustandskonzept (siehe ConceptMap `unmatched`/`relatedto`); die
  Intent-Qualifier wären die falsche Achse.

## Offene Punkte

- **Erfassungsart als eigenes Element** (`zielwert.erfassungsart`: labor |
  bildgebung | funktion | prom | interview): bewusst zurückgestellt.
  Trigger: sobald Auswertungen „alle interviewbasierten Ziele" real gebraucht
  werden. Bis dahin steckt die Erfassungsart implizit in `target.measure`
  (LOINC-Klasse bzw. `measure.text`).
- PCO-IG-Anbindung für patientenberichtete Endpunkte (statt Eigenmodellierung)
  weiterverfolgen.
