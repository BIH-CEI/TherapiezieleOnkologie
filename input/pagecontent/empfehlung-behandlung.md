### Empfehlungs- und Behandlungsplan

Auf der [vorigen Seite](therapieziele.html) wurde deutlich: die Therapieintention
entsteht **bei der Empfehlung** (Tumorboard). Daraus folgt eine Unterscheidung, die
für die gesamte Modellierung tragend ist — **das Empfohlene und das tatsächlich
Erbrachte sind verschiedene Gegenstände**.

### Zwei Rollen des `CarePlan`

- **EmpfehlungsCarePlan** — die vom Tumorboard nach abgeschlossener Diagnostik
  synthetisierte **Empfehlungsliste**. Sie enthält die empfohlenen Maßnahmen als
  Vorschläge ([`TumorboardMedicationRequest`](StructureDefinition-onko-tumorboard-medication-request.html),
  [`TumorboardServiceRequest`](StructureDefinition-onko-tumorboard-service-request.html),
  jeweils mit `intent = proposal`) und trägt das **übergeordnete Behandlungsziel**.
- **BehandlungsCarePlan** — der Plan der **tatsächlich erbrachten** Versorgung eines
  konkreten Behandlungsabschnitts. Er trägt das jeweilige **Episodenziel** und die
  real durchgeführten bzw. konkret geplanten Maßnahmen.

### Unterschiedliche Detailtiefe

Der Empfehlungsplan ist bewusst **grobkörnig**: „welche Strategie, welche Modalitäten,
welches Ziel". Der Behandlungsplan ist **feinkörnig**: „welche Substanz in welcher
Dosis, welcher Eingriff, an welcher Einrichtung, mit welchem Ergebnis". Ein und
dieselbe Board-Empfehlung („neoadjuvante Systemtherapie, dann Operation") kann sich in
**mehreren** Behandlungsplänen niederschlagen.

### Zeitliche und organisatorische Entkopplung

Empfehlung und Umsetzung fallen **zeitlich** auseinander (die Empfehlung entsteht am
Board-Termin, die Umsetzung zieht sich über Wochen bis Monate und mehrere Phasen) und
**organisatorisch** (die Umsetzung erfolgt ggf. an anderen Einrichtungen als der
diagnostizierenden — Klinik, niedergelassene Onkologie, Reha). Jeder Behandlungsplan
trägt daher seine **eigene verantwortliche Stelle** (`custodian`).

### Verknüpfung: `basedOn`, nicht `partOf`

Der Behandlungsplan **erfüllt** die Empfehlung — er ist ihr nicht untergeordnet.
Modelliert wird das über **`CarePlan.basedOn`** (Behandlung → Empfehlung), die
Umsetzung *einzelner* Empfehlungen zusätzlich auf Request-Ebene (der ausgeführte
`ServiceRequest`/`MedicationRequest` trägt `.basedOn` → den Empfehlungs-Request).

Bewusst **nicht** verwendet wird `CarePlan.partOf`: Dieses würde eine **zentrale
Steuerinstanz** unterstellen, die in der deutschen **intersektoralen** Versorgung
nicht existiert. Autonome Leistungserbringer planen eigenständig und *erfüllen* die
Empfehlung — sie sind keinem Masterplan untergeordnet.

> **Zielmodell.** Die Trennung in `EmpfehlungsCarePlan` und `BehandlungsCarePlan` ist
> architektonisch festgelegt und wird im laufenden Ausbau des Profilsatzes umgesetzt.
> Aktuell bildet der [`OnkoCarePlan`](StructureDefinition-onko-care-plan.html) das
> zentrale Steuerobjekt; die Board-Empfehlungen sind bereits über die
> Tumorboard-Request-Profile ausgezeichnet (LOINC `85232-7`, Tumor board Consult note).

### Beispiele

- [mCRC (palliativ)](szenario-crc.html) — Board-Empfehlung (FOLFOX + Bevacizumab,
  Portanlage) und übergeordnetes Ziel im Zusammenspiel.
- [Mammakarzinom (neoadjuvant)](szenario-mamma.html) — Empfehlung neoadjuvante
  Systemtherapie + Operation, umgesetzt über mehrere Abschnitte.

→ Weiter: [Behandlungsepisoden (EpisodeOfCare)](behandlungsepisode.html)
