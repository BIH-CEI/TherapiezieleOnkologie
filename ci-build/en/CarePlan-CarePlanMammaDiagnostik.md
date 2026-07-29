# Diagnostischer CarePlan - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Example CarePlan: Diagnostischer CarePlan

-------

**English**

-------

Profile: [Diagnostischer CarePlan](StructureDefinition-onko-diagnostic-care-plan.md)

**status**: Active

**intent**: Plan

**category**: Tumordiagnostik

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**author**: [Practitioner Katrin Musterarzt ](Practitioner-OnkologinMamma.md)

**addresses**: [Condition Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse](Condition-ConditionMamma.md)

**goal**: [Goal: extension = ; lifecycleStatus = active; achievementStatus = In Progress; category = Diagnostic intent; priority = High Priority; description = ; start[x] = 2025-09-12](Goal-DiagnosticGoal.md)

> **activity****outcomeReference**: [Procedure Core needle biopsy of breast (procedure)](Procedure-ProcedureBiopsieMamma.md)**reference**: [ServiceRequest Core needle biopsy of breast (procedure)](ServiceRequest-ServiceRequestBiopsieMamma.md)

> **activity****outcomeReference**: 
* [Observation Histology and Behavior ICD-O-3 Cancer](Observation-ObsHistologieMamma.md)
* [Observation Histologic grade [Score] in Breast cancer specimen by Nottingham](Observation-ObsGradingMamma.md)
* [Observation Estrogen receptor Ag [Presence] in Breast cancer specimen by Immune stain](Observation-ObsEstrogenrezeptorMamma.md)
* [Observation Progesterone receptor Ag [Presence] in Breast cancer specimen by Immune stain](Observation-ObsProgesteronrezeptorMamma.md)
* [Observation HER2 [Interpretation] in Tissue](Observation-ObsHER2Mamma.md)
* [Observation Cells.Ki-67 nuclear Ag/cells in Breast cancer specimen by Immune stain](Observation-ObsKi67Mamma.md)
**reference**: [ServiceRequest Histopathology service (qualifier value)](ServiceRequest-ServiceRequestPathologieMamma.md)

> **activity****outcomeReference**: [Observation Stage group.clinical Cancer](Observation-ObsTNMklinischMamma.md)**reference**: [ServiceRequest ](ServiceRequest-ServiceRequestStagingMamma.md)

> **activity****outcomeReference**: [Observation BRCA1 gene mutations tested for in Blood or Tissue by Molecular genetics method Nominal](Observation-ObsGBRCAMamma.md)**reference**: [ServiceRequest BRCA1 gene mutations tested for in Blood or Tissue by Molecular genetics method Nominal](ServiceRequest-ServiceRequestGBRCAMamma.md)



## Resource Content

```json
{
  "resourceType" : "CarePlan",
  "id" : "CarePlanMammaDiagnostik",
  "meta" : {
    "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-diagnostic-care-plan"]
  },
  "status" : "active",
  "intent" : "plan",
  "category" : [{
    "text" : "Tumordiagnostik"
  }],
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "author" : {
    "reference" : "Practitioner/OnkologinMamma"
  },
  "addresses" : [{
    "reference" : "Condition/ConditionMamma"
  }],
  "goal" : [{
    "reference" : "Goal/DiagnosticGoal"
  }],
  "activity" : [{
    "outcomeReference" : [{
      "reference" : "Procedure/ProcedureBiopsieMamma"
    }],
    "reference" : {
      "reference" : "ServiceRequest/ServiceRequestBiopsieMamma"
    }
  },
  {
    "outcomeReference" : [{
      "reference" : "Observation/ObsHistologieMamma"
    },
    {
      "reference" : "Observation/ObsGradingMamma"
    },
    {
      "reference" : "Observation/ObsEstrogenrezeptorMamma"
    },
    {
      "reference" : "Observation/ObsProgesteronrezeptorMamma"
    },
    {
      "reference" : "Observation/ObsHER2Mamma"
    },
    {
      "reference" : "Observation/ObsKi67Mamma"
    }],
    "reference" : {
      "reference" : "ServiceRequest/ServiceRequestPathologieMamma"
    }
  },
  {
    "outcomeReference" : [{
      "reference" : "Observation/ObsTNMklinischMamma"
    }],
    "reference" : {
      "reference" : "ServiceRequest/ServiceRequestStagingMamma"
    }
  },
  {
    "outcomeReference" : [{
      "reference" : "Observation/ObsGBRCAMamma"
    }],
    "reference" : {
      "reference" : "ServiceRequest/ServiceRequestGBRCAMamma"
    }
  }]
}

```
