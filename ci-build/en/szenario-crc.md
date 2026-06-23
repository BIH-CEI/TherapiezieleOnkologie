# Anwendungsbeispiel (mCRC palliativ) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Anwendungsbeispiel (mCRC palliativ)

 
There is no translation page available for the current page, so it has been rendered in the default language 

Diese Seite zeigt – in Anlehnung an die [szenariobasierte Darstellung des MII IG Modul Onkologie](https://simplifier.net/guide/MII-IG-Onkologie-DE-v2026/MIIIGModulOnkologie/AnwendungsflleInformationsmodell/BeschreibungvonSzenarienfrdieAnwendungderModule.page.md?version=current) – ein durchgängiges Anwendungsbeispiel für die Profile `OnkoCarePlan` und `OnkoTherapyGoal`.

### Klinische Erzählung

Eine 67-jährige Patientin stellt sich mit einem synchron metastasierten Kolonkarzinom (mCRC, Lebermetastasen) vor. Nach interdisziplinärer Tumorkonferenz wird eine **palliative Systemtherapie** (FOLFOX + Bevacizumab) als Erstlinientherapie festgelegt. Die übergeordneten Therapieziele sind **Lebensverlängerung** und **Symptomkontrolle**. Das Tumoransprechen wird über eine Verlaufs-Observation (Disease Status) erfasst und auf das Therapieziel bezogen ausgewertet.

### Informationsmodell

Das Beispiel bildet das MCC-orientierte Beziehungsmodell ab: Der `OnkoCarePlan` ist das zentrale Steuerobjekt, das die adressierte Erkrankung (`addresses`), das übergeordnete Ziel (`goal`) sowie geplante und durchgeführte Maßnahmen (`activity.reference` / `activity.outcomeReference`) zusammenführt.

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

