# Onkologischer CarePlan – Mamma neoadjuvant/kurativ (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.2

## Example CarePlan: Onkologischer CarePlan – Mamma neoadjuvant/kurativ (Beispiel)

-------

**English**

-------

Profile: [Onkologischer CarePlan](StructureDefinition-onko-care-plan.md)

**CarePlan Custodian (Extension)**: [Organization Zertifiziertes Brustzentrum Musterklinik](Organization-TumorzentrumMamma.md)

**status**: Active

**intent**: Plan

**category**: Cancer care plan

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**period**: 2025-09-22 --> (ongoing)

**author**: [Practitioner Katrin Musterarzt ](Practitioner-OnkologinMamma.md)

**addresses**: [Condition Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse](Condition-ConditionMamma.md)

**goal**: [Goal: extension = ,,,; lifecycleStatus = active; achievementStatus = Achieved; category = Heilung,Funktionserhalt; priority = High Priority; description = ; start[x] = 2025-09-22](Goal-TherapiezielMammaHeilung.md)

> **activity****outcomeReference**: 
* [MedicationAdministration: status = completed; medication[x] = ; effective[x] = 2025-10-01; note = Zyklus 1 von 4 (Pembro/Carbo q3w); begleitend wöchentliche Paclitaxel-Gaben, hier nicht einzeln erfasst](MedicationAdministration-MedicationAdministrationPembroChemoNeoadjuvantMamma1.md)
* [MedicationAdministration: status = completed; medication[x] = ; effective[x] = 2025-11-01; note = Zyklus 2 von 4 (Pembro/Carbo q3w); begleitend wöchentliche Paclitaxel-Gaben, hier nicht einzeln erfasst](MedicationAdministration-MedicationAdministrationPembroChemoNeoadjuvantMamma2.md)
* [MedicationAdministration: status = completed; medication[x] = ; effective[x] = 2026-02-10; note = Zyklus 3 von 4 (Pembro/Carbo q3w); begleitend wöchentliche Paclitaxel-Gaben, hier nicht einzeln erfasst](MedicationAdministration-MedicationAdministrationPembroChemoNeoadjuvantMamma3.md)
* [MedicationAdministration: status = completed; medication[x] = ; effective[x] = 2026-03-15; note = Zyklus 4 von 4 (Pembro/Carbo q3w); begleitend wöchentliche Paclitaxel-Gaben, hier nicht einzeln erfasst](MedicationAdministration-MedicationAdministrationPembroChemoNeoadjuvantMamma4.md)
**reference**: [MedicationRequest: extension = New LoT; status = completed; intent = plan; category = Tumor board Consult note; medication[x] = ](MedicationRequest-MedicationRequestPembroChemoNeoadjuvantMamma.md)

> **activity****outcomeReference**: [Procedure Lumpectomy of breast (procedure)](Procedure-ProcedureOperationMamma.md)**reference**: [ServiceRequest Lumpectomy of breast (procedure)](ServiceRequest-ServiceRequestProcedure.md)

> **activity****reference**: [MedicationRequest: extension = Same LoT; status = active; intent = plan; category = Tumor board Consult note; medication[x] = ](MedicationRequest-MedicationRequestPembroAdjuvantMamma.md)

> **activity****outcomeReference**: [Observation Cancer disease progression](Observation-ObsDiseaseStatusMamma.md)



## Resource Content

```json
{
  "resourceType" : "CarePlan",
  "id" : "CarePlanMammaNeoadjuvant",
  "meta" : {
    "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-care-plan"]
  },
  "extension" : [{
    "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-careplan-custodian",
    "valueReference" : {
      "reference" : "Organization/TumorzentrumMamma"
    }
  }],
  "status" : "active",
  "intent" : "plan",
  "category" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "736252007",
      "display" : "Cancer care plan"
    }]
  }],
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "period" : {
    "start" : "2025-09-22"
  },
  "author" : {
    "reference" : "Practitioner/OnkologinMamma"
  },
  "addresses" : [{
    "reference" : "Condition/ConditionMamma"
  }],
  "goal" : [{
    "reference" : "Goal/TherapiezielMammaHeilung"
  }],
  "activity" : [{
    "outcomeReference" : [{
      "reference" : "MedicationAdministration/MedicationAdministrationPembroChemoNeoadjuvantMamma1"
    },
    {
      "reference" : "MedicationAdministration/MedicationAdministrationPembroChemoNeoadjuvantMamma2"
    },
    {
      "reference" : "MedicationAdministration/MedicationAdministrationPembroChemoNeoadjuvantMamma3"
    },
    {
      "reference" : "MedicationAdministration/MedicationAdministrationPembroChemoNeoadjuvantMamma4"
    }],
    "reference" : {
      "reference" : "MedicationRequest/MedicationRequestPembroChemoNeoadjuvantMamma"
    }
  },
  {
    "outcomeReference" : [{
      "reference" : "Procedure/ProcedureOperationMamma"
    }],
    "reference" : {
      "reference" : "ServiceRequest/ServiceRequestProcedure"
    }
  },
  {
    "reference" : {
      "reference" : "MedicationRequest/MedicationRequestPembroAdjuvantMamma"
    }
  },
  {
    "outcomeReference" : [{
      "reference" : "Observation/ObsDiseaseStatusMamma"
    }]
  }]
}

```
