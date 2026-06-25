# Anwendungsbeispiel (mCRC palliativ) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Anwendungsbeispiel (mCRC palliativ)

 
There is no translation page available for the current page, so it has been rendered in the default language 

Diese Seite zeigt – in Anlehnung an die [szenariobasierte Darstellung des MII IG Modul Onkologie](https://simplifier.net/guide/MII-IG-Onkologie-DE-v2026/MIIIGModulOnkologie/AnwendungsflleInformationsmodell/BeschreibungvonSzenarienfrdieAnwendungderModule.page.md?version=current) – ein durchgängiges Anwendungsbeispiel für die Profile `OnkoCarePlan` und `OnkoTherapyGoal`.

### Klinische Erzählung

Eine 67-jährige Patientin stellt sich mit einem synchron metastasierten Kolonkarzinom (mCRC, Lebermetastasen) vor. Nach interdisziplinärer Tumorkonferenz wird eine **palliative Systemtherapie** (FOLFOX + Bevacizumab) als Erstlinientherapie festgelegt. Die übergeordneten Therapieziele sind **Lebensverlängerung** und **Symptomkontrolle**. Das Tumoransprechen wird über eine Verlaufs-Observation (Disease Status) erfasst und auf das Therapieziel bezogen ausgewertet.

### Informationsmodell

Das Beispiel bildet das MCC-orientierte Beziehungsmodell ab: Der `OnkoCarePlan` ist das zentrale Steuerobjekt, das die adressierte Erkrankung (`addresses`), das übergeordnete Ziel (`goal`) sowie geplante und durchgeführte Maßnahmen (`activity.reference` / `activity.outcomeReference`) zusammenführt.

Der folgende Referenzgraph zeigt alle FHIR-Referenzen zwischen den Beispiel-Instanzen. Durchgezogene Pfeile sind fachliche Referenzen (mit Feldnamen), gestrichelte Pfeile die `subject`-Referenzen aller Ressourcen auf die Patientin (zu einem „subject-Bus" zusammengefasst). Der Graph ist gerichtet und **zyklenfrei** — jede Referenz verweist vom referenzierenden auf das referenzierte Resource, ohne Rückkanten.

| | | |
| :--- | :--- | :--- |
| Patient:in | `Patient` | [PatientinCRC](Patient-PatientinCRC.md) |
| Tumorerkrankung | `OnkoCondition` | [ConditionCRC](Condition-ConditionCRC.md) |
| Versorgungsplan | `OnkoCarePlan` | [CarePlanCRCPalliativ](CarePlan-CarePlanCRCPalliativ.md) |
| Therapieziel | `OnkoTherapyGoal` | [TherapiezielCRCLebensverlaengerung](Goal-TherapiezielCRCLebensverlaengerung.md) |
| Therapielinie (LoT 1) | `OnkoTherapyLine` | [TherapielinieCRCErstlinie](EpisodeOfCare-TherapielinieCRCErstlinie.md) |
| Geplante Maßnahme | `MedicationRequest` | [MedicationRequestFOLFOX](MedicationRequest-MedicationRequestFOLFOX.md) |
| Tumoransprechen | `Observation` | [ObservationDiseaseStatusCRC](Observation-ObservationDiseaseStatusCRC.md) |

### Verknüpfungen im Beispiel

* **Therapieintention:** `palliativ` (Extension `onko-therapy-intent`) auf CarePlan, Therapieziel und Therapielinie.
* **CarePlan → Erkrankung:** `addresses` referenziert die `OnkoCondition` (geerbt vom [MII-Onkologie-Diagnoseprofil](https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-diagnose-primaertumor), v2026.0.3).
* **CarePlan → Ziel:** `goal` referenziert das `OnkoTherapyGoal` (Kategorien Lebensverlängerung + Symptomkontrolle).
* **Geplant vs. durchgeführt:** `activity.reference` → geplante Systemtherapie (`MedicationRequest`); `activity.outcomeReference` → dokumentiertes Ergebnis (`Observation`).
* **Ziel → Ergebnis:** `Goal.outcomeReference` bindet die Verlaufs-Observation (Disease Status), wodurch der `achievementStatus` (hier `in-progress`) auswertbar wird.

### Aus MCC übernommene Extensions im Beispiel

* **`goal-acceptance`** (MCCGoal): Die Patientin stimmt dem palliativen Ziel mit hoher Priorität zu (`status = agree`).
* **`goal-reasonRejected`** (MCCGoal): Das in der Tumorkonferenz erwogene kurative Ziel ([TherapiezielCRCKurativAbgelehnt](Goal-TherapiezielCRCKurativAbgelehnt.md), `lifecycleStatus = rejected`) trägt die Ablehnungsbegründung (nicht resektable Metastasierung).
* **`goal-relationship`** (MCCGoal): Das palliative Ziel ist als `replacement` mit dem abgelehnten kurativen Ziel verknüpft.
* **`custodian`** (MCC CarePlan, R5-Backport): Das [Tumorzentrum](Organization-TumorzentrumCRC.md) ist als für Pflege und Aktualisierung des Plans verantwortliche Stelle hinterlegt.

