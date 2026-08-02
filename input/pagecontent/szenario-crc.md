Diese Seite zeigt – in Anlehnung an die [szenariobasierte Darstellung des MII IG Modul Onkologie](https://simplifier.net/guide/MII-IG-Onkologie-DE-v2026/MIIIGModulOnkologie/AnwendungsflleInformationsmodell/BeschreibungvonSzenarienfrdieAnwendungderModule.page.md?version=current) – ein durchgängiges Anwendungsbeispiel, das alle Profile dieses Leitfadens nutzt: `OnkoCondition`, `DiagnosticCarePlan`, `OnkoCarePlan`, `OnkoTherapyLine`, `OnkoTherapyGoal`, `TumorboardMedicationRequest` und `TumorboardServiceRequest`.

### Klinische Erzählung

Eine 67-jährige Patientin stellt sich mit einem synchron metastasierten Kolonkarzinom (mCRC, Lebermetastasen) vor. Der **Diagnostikpfad** – Koloskopie mit Biopsie und histopathologische Sicherung – wird über einen `DiagnosticCarePlan` abgebildet und mündet in die gesicherte Diagnose (`OnkoCondition`). Das interdisziplinäre **Tumorboard** (`CareTeam`) empfiehlt eine **palliative Systemtherapie** (FOLFOX + Bevacizumab, `TumorboardMedicationRequest`) sowie die Anlage eines **Portkatheters** (`TumorboardServiceRequest`). Die übergeordneten Therapieziele sind **Lebensverlängerung** und **Symptomkontrolle**. Das Tumoransprechen wird über eine Verlaufs-Observation (Disease Status) erfasst und auf das Therapieziel bezogen ausgewertet.

### Informationsmodell

Das Beispiel bildet das MCC-orientierte Beziehungsmodell ab: Der `OnkoCarePlan` ist das zentrale Steuerobjekt, das die adressierte Erkrankung (`addresses`), das übergeordnete Ziel (`goal`) sowie geplante und durchgeführte Maßnahmen (`activity.reference` / `activity.outcomeReference`) zusammenführt.

Der folgende Referenzgraph zeigt die **Kernbeziehungen des Therapie-CarePlan** (die vollständige Ressourcenliste inkl. Diagnostikpfad und Tumorboard steht in der Tabelle unten). Durchgezogene Pfeile sind fachliche Referenzen (mit Feldnamen), gestrichelte Pfeile die `subject`-Referenzen aller Ressourcen auf die Patientin (zu einem „subject-Bus" zusammengefasst). Der Graph ist gerichtet und **zyklenfrei** — jede Referenz verweist vom referenzierenden auf das referenzierte Resource, ohne Rückkanten.

{% include beispiel-referenzgraph.svg %}

| Element | Ressource / Profil | Beispiel-Instanz |
|---|---|---|
| Patient:in | `Patient` | [PatientinCRC](Patient-PatientinCRC.html) |
| Tumorerkrankung | `OnkoCondition` | [ConditionCRC](Condition-ConditionCRC.html) |
| Diagnostik-Plan | `DiagnosticCarePlan` | [DiagnostikCarePlanCRC](CarePlan-DiagnostikCarePlanCRC.html) |
| Diagnostik-Anforderung | `ServiceRequest` | [ServiceRequestKoloskopieCRC](ServiceRequest-ServiceRequestKoloskopieCRC.html) |
| Diagnostik-Ergebnis | `DiagnosticReport` | [DiagnosticReportHistologieCRC](DiagnosticReport-DiagnosticReportHistologieCRC.html) |
| Therapie-Plan | `OnkoCarePlan` | [CarePlanCRCPalliativ](CarePlan-CarePlanCRCPalliativ.html) |
| Therapielinie (aLoT 1.0) | `OnkoTherapyLine` | [TherapielinieCRCErstlinie](EpisodeOfCare-TherapielinieCRCErstlinie.html) |
| Therapieziel (palliativ) | `OnkoTherapyGoal` | [TherapiezielCRCLebensverlaengerung](Goal-TherapiezielCRCLebensverlaengerung.html) |
| Therapieziel (abgelehnt) | `OnkoTherapyGoal` | [TherapiezielCRCKurativAbgelehnt](Goal-TherapiezielCRCKurativAbgelehnt.html) |
| Therapieziel (Erhaltung) | `OnkoTherapyGoal` | [TherapiezielCRCErhaltung](Goal-TherapiezielCRCErhaltung.html) |
| Tumorboard | `CareTeam` | [TumorboardCRC](CareTeam-TumorboardCRC.html) |
| Empfehlung Systemtherapie | `TumorboardMedicationRequest` | [MedicationRequestFOLFOX](MedicationRequest-MedicationRequestFOLFOX.html) |
| Empfehlung Portanlage | `TumorboardServiceRequest` | [ServiceRequestPortCRC](ServiceRequest-ServiceRequestPortCRC.html) |
| Tumoransprechen | `Observation` | [ObservationDiseaseStatusCRC](Observation-ObservationDiseaseStatusCRC.html) |
| Custodian / Zentrum | `Organization` | [TumorzentrumCRC](Organization-TumorzentrumCRC.html) |
| Behandlerin | `Practitioner` | [OnkologinCRC](Practitioner-OnkologinCRC.html) |

**EnLiST-Sicht:** Die Erstlinie ist eine systemische Linie im fortgeschrittenen
Setting — Designation **`aLoT 1.0`** (`enlist-lot` an der Therapielinie;
Führung und Ausführung fallen hier in einer Episode zusammen,
`enlist-countable = counted`). Der Empfehlungs-Request trägt den Änderungstyp
*New LoT* (Linieneröffnung). Siehe [Behandlungsepisoden](behandlungsepisode.html).

### Verknüpfungen im Beispiel

- **Diagnostikpfad:** Der `DiagnosticCarePlan` (`category.text = "Tumordiagnostik"`) adressiert dieselbe `OnkoCondition` und führt geplante Anforderung (`activity.reference` → `ServiceRequest` Koloskopie) und Ergebnis (`activity.outcomeReference` → `DiagnosticReport` Histologie) zusammen. Der Therapie-CarePlan verweist über `supportingInfo` auf den Diagnostik-CarePlan.
- **Tumorboard:** Die Empfehlungen (`TumorboardMedicationRequest`, `TumorboardServiceRequest`) tragen im `category` den LOINC-Code `85232-7` (Tumor board Consult note); das `CareTeam` ist als `careTeam` am Therapie-CarePlan und als `team` an der Therapielinie hinterlegt.
- **Therapieintention (zwei Achsen):** Die Extension `onko-therapy-intent` codiert `hauptintention` (hier `palliativ`, SNOMED `363676003`) und optional `phase` (hier `Induktionstherapie`, SNOMED `450827009`). So ist „palliativ + Induktionsphase" gleichzeitig ausdrückbar; die Codes sind extensible gebunden.
- **CarePlan → Erkrankung:** `addresses` referenziert die `OnkoCondition` (geerbt vom [MII-Onkologie-Diagnoseprofil](https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-diagnose-primaertumor), v2026.0.3).
- **CarePlan → Ziel:** `goal` referenziert das `OnkoTherapyGoal` (Kategorien Lebensverlängerung + Symptomkontrolle).
- **Geplant vs. durchgeführt:** `activity.reference` → geplante Maßnahmen (Tumorboard-Empfehlungen); `activity.outcomeReference` → dokumentiertes Ergebnis (`Observation`).
- **Ziel → Ergebnis:** `Goal.outcomeReference` bindet die Verlaufs-Observation (Disease Status), wodurch der `achievementStatus` (hier `in-progress`) auswertbar wird.

### Aus MCC übernommene Extensions im Beispiel

- **`goal-acceptance`** (MCCGoal): Die Patientin stimmt dem palliativen Ziel mit hoher Priorität zu (`status = agree`).
- **`goal-reasonRejected`** (MCCGoal): Das in der Tumorkonferenz erwogene kurative Ziel ([TherapiezielCRCKurativAbgelehnt](Goal-TherapiezielCRCKurativAbgelehnt.html), `lifecycleStatus = rejected`) trägt die Ablehnungsbegründung (nicht resektable Metastasierung).
- **`goal-relationship`** (MCCGoal): Das Induktionsziel ([TherapiezielCRCLebensverlaengerung](Goal-TherapiezielCRCLebensverlaengerung.html)) ist gleich zweifach verknüpft — als `replacement` mit dem abgelehnten kurativen Ziel und als `successor` mit dem nachgelagerten Erhaltungsziel ([TherapiezielCRCErhaltung](Goal-TherapiezielCRCErhaltung.html)), das seinerseits als `predecessor` zurückverweist.
- **`custodian`** (MCC CarePlan, R5-Backport): Das [Tumorzentrum](Organization-TumorzentrumCRC.html) ist als für Pflege und Aktualisierung des Plans verantwortliche Stelle hinterlegt.

#### `goal-relationship` – Bedeutung der Beziehungstypen

Codesystem `http://terminology.hl7.org/CodeSystem/goal-relationship-type`. Die Beziehung wird immer aus Sicht des *Quell-Ziels* (das die Extension trägt) auf das *Ziel-Ziel* (`target`) angegeben:

| Typ | Bedeutung | im Beispiel |
|---|---|---|
| `predecessor` | Das Ziel-Ziel muss **vorher** erreicht werden. | Erhaltungsziel → predecessor → Induktionsziel |
| `successor` | Das Ziel-Ziel ist das angestrebte Ziel, **nachdem** dieses erreicht ist. | Induktionsziel → successor → Erhaltungsziel |
| `replacement` | Dieses Ziel wurde **durch** das Ziel-Ziel **ersetzt**. | palliatives Ziel → replacement → abgelehntes kuratives Ziel |
| `milestone` | Das Ziel-Ziel ist ein **Teilschritt** dieses Ziels. | (nicht im Beispiel) |

`predecessor` und `successor` sind zueinander invers: Induktions- und Erhaltungsziel verweisen wechselseitig aufeinander und bilden so die zeitliche Sequenz ab.
