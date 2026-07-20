# Anwendungsbeispiel (Mammakarzinom neoadjuvant) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Anwendungsbeispiel (Mammakarzinom neoadjuvant)

Diese Seite zeigt – analog zum [Szenario mCRC (palliativ)](szenario-crc.md) – ein durchgängiges Anwendungsbeispiel für die Profile `OnkoCarePlan` und `OnkoTherapyGoal`, hier für ein **kuratives Behandlungskonzept mit neoadjuvanter Systemtherapie und anschließender Operation**.

### Klinische Erzählung

Eine 48-jährige Patientin stellt sich mit einem tastbaren Knoten in der linken Brust vor. Die Stanzbiopsie sichert ein **invasives Mammakarzinom links (NST, G3)**, klinisch **cT2 cN1 cM0 (UICC IIB)**. Die immunhistochemische Aufarbeitung zeigt ein **triple-negatives Profil** (ER negativ, PR negativ, HER2 negativ) bei hoher Proliferation (Ki-67 70 %); die leitlinienindizierte Keimbahn-Testung (gBRCA1/2) ist unauffällig.

In der interdisziplinären Tumorkonferenz wird – leitlinienkonform für ein frühes triple-negatives Mammakarzinom (TNBC) im Stadium II (S3-Leitlinie Mammakarzinom / AGO-Empfehlungen) – eine **kurative Strategie mit neoadjuvanter Systemtherapie** nach dem **KEYNOTE-522-Schema** (Pembrolizumab + Carboplatin/Paclitaxel, gefolgt von Pembrolizumab + Epirubicin/Cyclophosphamid) und **anschließender Operation** festgelegt. Übergeordnete Therapieziele sind **Heilung** und **Brusterhalt (Funktionserhalt)**.

Nach Abschluss der neoadjuvanten Therapie erfolgt eine **brusterhaltende Operation (BET) links mit Sentinel-Lymphknoten-Biopsie**. Die pathologische Aufarbeitung des Präparats zeigt eine **pathologische Komplettremission (pCR, ypT0 ypN0)**. Das Ansprechen wird über eine Verlaufs-Observation (Disease Status) erfasst und auf das Therapieziel bezogen ausgewertet (`achievementStatus = achieved`).

### Zeitlicher Verlauf

| | | |
| :--- | :--- | :--- |
| 12.09.2025 | Anlage des diagnostischen CarePlans bei Tumorverdacht; Anforderung der Stanzbiopsie | [CarePlanMammaDiagnostik](CarePlan-CarePlanMammaDiagnostik.md),[ServiceRequestBiopsieMamma](ServiceRequest-ServiceRequestBiopsieMamma.md) |
| 15.09.2025 | Stanzbiopsie; Pathologieauftrag und Staging angefordert; Histologie: invasives Karzinom NST (ICD-O-3 8500/3), G3 | [ProcedureBiopsieMamma](Procedure-ProcedureBiopsieMamma.md),[ServiceRequestPathologieMamma](ServiceRequest-ServiceRequestPathologieMamma.md),[ServiceRequestStagingMamma](ServiceRequest-ServiceRequestStagingMamma.md),[ConditionMamma](Condition-ConditionMamma.md),[ObsHistologieMamma](Observation-ObsHistologieMamma.md),[ObsGradingMamma](Observation-ObsGradingMamma.md) |
| 16.09.2025 | Ausbreitungsdiagnostik: klinisches TNM cT2 cN1 cM0 (UICC IIB) | [ObsTNMklinischMamma](Observation-ObsTNMklinischMamma.md) |
| 17.09.2025 | Immunhistochemie: ER negativ, PR negativ, HER2 negativ, Ki-67 70 % | [ObsEstrogenrezeptorMamma](Observation-ObsEstrogenrezeptorMamma.md),[ObsProgesteronrezeptorMamma](Observation-ObsProgesteronrezeptorMamma.md),[ObsHER2Mamma](Observation-ObsHER2Mamma.md),[ObsKi67Mamma](Observation-ObsKi67Mamma.md) |
| 18.09.2025 | Anforderung Keimbahn-Testung gBRCA1/2 | [ServiceRequestGBRCAMamma](ServiceRequest-ServiceRequestGBRCAMamma.md) |
| 22.09.2025 | Interdisziplinäre Tumorkonferenz: kuratives Konzept, OP vom Tumorboard vorgeschlagen, Neoadjuvante Chemo-/Immuntherapie (KEYNOTE-522) von Tumorboard vorgeschlagen; Therapieziel festgelegt | [CarePlanMammaNeoadjuvant](CarePlan-CarePlanMammaNeoadjuvant.md),[TherapiezielMammaHeilung](Goal-TherapiezielMammaHeilung.md),[ServiceRequestProcedure](ServiceRequest-ServiceRequestProcedure.md),[MedicationRequestKEYNOTE522](MedicationRequest-MedicationRequestKEYNOTE522.md) |
| 25.09.2025 | Keimbahn-Panel gBRCA1/2: unauffällig → Abschluss der Diagnostikphase | [ObsGBRCAMamma](Observation-ObsGBRCAMamma.md) |
| 01.10.2025 – 15.03.2026 | Planung Therapielinie 1 | [TherapielinieMammaNeoadjuvant](EpisodeOfCare-TherapielinieMammaNeoadjuvant.md) |
| 02.04.2026 | Brusterhaltende Operation (BET) links + Sentinel-Lymphknoten-Biopsie | [ProcedureOperationMamma](Procedure-ProcedureOperationMamma.md) |
| 07.04.2026 | Pathologie des OP-Präparats: ypT0 ypN0 → pathologische Komplettremission (pCR); Disease Status | [ObsTNMpathologischMamma](Observation-ObsTNMpathologischMamma.md),[ObsDiseaseStatusMamma](Observation-ObsDiseaseStatusMamma.md) |

### Pathologisches und molekulares Profil

Das prätherapeutische Profil aus der Stanzbiopsie ist – leitlinienkonform – prädiktiv für die Therapieentscheidung: das triple-negative, hochproliferative Profil ohne Fernmetastasierung begründet die neoadjuvante Systemtherapie.

| | | |
| :--- | :--- | :--- |
| Histologie (Morphologie) | Invasives Karzinom, NST | ICD-O-3`8500/3` |
| Grading | G3 – schlecht differenziert | LOINC`33732-9` |
| Klinisches Stadium | cT2 cN1 cM0 – UICC IIB | LOINC`21908-9` |
| Östrogenrezeptor (ER) | negativ (<1 %) | LOINC`40556-3`→`LA6577-6` |
| Progesteronrezeptor (PR) | negativ (<1 %) | LOINC`85339-0`→`LA6577-6` |
| HER2/neu | negativ (IHC 1+) | LOINC`48676-1`→ MII oBDS`N`/ Leitlinie`negativ` |
| Ki-67 | 70 % (hohe Proliferation) | Ki-67 Proliferationsindex,`%` |
| Keimbahn gBRCA1/2 | unauffällig | LOINC`51958-7`→ SNOMED`260385009` |
| Ansprechen (postneoadjuvant) | ypT0 ypN0 – pCR | LOINC`21902-2` |

> Die Rezeptor-/HER2-Kodierung orientiert sich am **MII KDS-Modul Onkologie** (Mamma-Zusatzmodul, v2026.0.3). Die Marker sind hier als eigenständige `Observation`-Instanzen modelliert und über `subject` mit der Patientin verknüpft.

### Informationsmodell

Das Beispiel bildet dasselbe MCC-orientierte Beziehungsmodell ab wie das mCRC-Szenario: Der `OnkoCarePlan` ist das zentrale Steuerobjekt, das die adressierte Erkrankung (`addresses`), das übergeordnete Ziel (`goal`) sowie geplante und durchgeführte Maßnahmen (`activity.reference` / `activity.outcomeReference`) zusammenführt. Die **neoadjuvante Therapielinie** dient dabei dem **kurativen Gesamtziel**: Die `OnkoTherapyLine` trägt die Intention `neoadjuvant`, während `OnkoCarePlan` und `OnkoTherapyGoal` die übergeordnete Intention `kurativ` tragen.

| | | |
| :--- | :--- | :--- |
| Patient:in | `Patient` | [PatientinMamma](Patient-PatientinMamma.md) |
| Tumorerkrankung | `OnkoCondition` | [ConditionMamma](Condition-ConditionMamma.md) |
| Versorgungsplan | `OnkoCarePlan` | [CarePlanMammaNeoadjuvant](CarePlan-CarePlanMammaNeoadjuvant.md) |
| Therapieziel | `OnkoTherapyGoal` | [TherapiezielMammaHeilung](Goal-TherapiezielMammaHeilung.md) |
| Therapielinie (LoT 1) | `OnkoTherapyLine` | [TherapielinieMammaNeoadjuvant](EpisodeOfCare-TherapielinieMammaNeoadjuvant.md) |
| Geplante Maßnahme (Systemtherapie) | `MedicationRequest` | [MedicationRequestKEYNOTE522](MedicationRequest-MedicationRequestKEYNOTE522.md) |
| Durchgeführte Maßnahme (Operation) | `Procedure` | [ProcedureOperationMamma](Procedure-ProcedureOperationMamma.md) |
| Tumoransprechen | `Observation` | [ObsDiseaseStatusMamma](Observation-ObsDiseaseStatusMamma.md) |

### Verknüpfungen im Beispiel

* **Therapieintention:** `kurativ` (Extension `onko-therapy-intent`) auf CarePlan und Therapieziel; die zugehörige Therapielinie trägt `neoadjuvant`.
* **CarePlan → Erkrankung:** `addresses` referenziert die `OnkoCondition` (geerbt vom [MII-Onkologie-Diagnoseprofil](https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-diagnose-primaertumor), v2026.0.3).
* **CarePlan → Ziel:** `goal` referenziert das `OnkoTherapyGoal` (Kategorien Heilung + Funktionserhalt).
* **Geplant vs. durchgeführt:** `activity.reference` → geplante Systemtherapie (`MedicationRequest`); `activity.outcomeReference` → durchgeführte Operation (`Procedure`) und dokumentiertes Ergebnis (`Observation`).
* **Ziel → Ergebnis:** `Goal.outcomeReference` bindet die Verlaufs-Observation (Disease Status, pCR), wodurch der `achievementStatus` (hier `achieved`) auswertbar wird.

### Aus MCC übernommene Extensions im Beispiel

* **`goal-acceptance`** (MCCGoal): Die Patientin stimmt dem kurativen Ziel mit hoher Priorität zu (`status = agree`).
* **`custodian`** (MCC CarePlan, R5-Backport): Das [Brustzentrum](Organization-TumorzentrumMamma.md) ist als für Pflege und Aktualisierung des Plans verantwortliche Stelle hinterlegt.

