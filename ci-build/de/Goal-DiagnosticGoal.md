# Onkologisches Diagnosezeil - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Beispiel Goal: Onkologisches Diagnosezeil

-------

**German**

-------

Profile: [Onkologisches Therapieziel](StructureDefinition-onko-therapy-goal.md)

> **Goal acceptance**
* individual: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)
* status: agree
* priority: High Priority

**lifecycleStatus**: Active

**achievementStatus**: In Progress

**category**: Diagnostic intent

**priority**: High Priority

**description**: Diagnosesicherung für die Verdachtsdiagnose

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**start**: 2025-09-12

> **target****measure**: Primary tumor.clinical [Class] Cancer

> **target****measure**: Regional lymph nodes.clinical [Class] Cancer

> **target****measure**: Distant metastases.clinical [Class] Cancer

> **target****measure**: Stage group.clinical Cancer

> **target****measure**: Estrogen receptor Ag [Presence] in Tissue by Immune stain

> **target****measure**: Progesterone receptor Ag [Presence] in Breast cancer specimen by Immune stain

> **target****measure**: HER2 Ag [Interpretation] in Tissue

> **target****measure**: Primary site Cancer

> **target****measure**: Histologic grade [Score] in Breast cancer specimen by Nottingham

> **target****measure**: Histology grade [Identifier] in Cancer specimen

> **target****measure**: Sentinel lymph nodes examined [#] in Cancer specimen by Light microscopy

**expressedBy**: [Practitioner Katrin Musterarzt ](Practitioner-OnkologinMamma.md)

**addresses**: [Condition Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse](Condition-ConditionMamma.md)

**outcomeReference**: [Observation Cancer disease progression](Observation-ObsDiseaseStatusMamma.md)



## Resource Content

```json
{
  "resourceType" : "Goal",
  "id" : "DiagnosticGoal",
  "meta" : {
    "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-goal"]
  },
  "extension" : [{
    "extension" : [{
      "url" : "individual",
      "valueReference" : {
        "reference" : "Patient/PatientinMamma"
      }
    },
    {
      "url" : "status",
      "valueCode" : "agree"
    },
    {
      "url" : "priority",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/goal-priority",
          "code" : "high-priority",
          "display" : "High Priority"
        }]
      }
    }],
    "url" : "http://hl7.org/fhir/StructureDefinition/goal-acceptance"
  }],
  "lifecycleStatus" : "active",
  "achievementStatus" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/goal-achievement",
      "code" : "in-progress",
      "display" : "In Progress"
    }]
  },
  "category" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "261004008",
      "display" : "Diagnostic intent"
    }]
  }],
  "priority" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/goal-priority",
      "code" : "high-priority",
      "display" : "High Priority"
    }]
  },
  "description" : {
    "text" : "Diagnosesicherung für die Verdachtsdiagnose"
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "startDate" : "2025-09-12",
  "target" : [{
    "measure" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "21905-5",
        "display" : "Primary tumor.clinical [Class] Cancer"
      }]
    }
  },
  {
    "measure" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "21906-3",
        "display" : "Regional lymph nodes.clinical [Class] Cancer"
      }]
    }
  },
  {
    "measure" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "21907-1",
        "display" : "Distant metastases.clinical [Class] Cancer"
      }]
    }
  },
  {
    "measure" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "21908-9",
        "display" : "Stage group.clinical Cancer"
      }]
    }
  },
  {
    "measure" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "40556-3",
        "display" : "Estrogen receptor Ag [Presence] in Tissue by Immune stain"
      }]
    }
  },
  {
    "measure" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "85339-0",
        "display" : "Progesterone receptor Ag [Presence] in Breast cancer specimen by Immune stain"
      }]
    }
  },
  {
    "measure" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "48676-1",
        "display" : "HER2 Ag [Interpretation] in Tissue"
      }]
    }
  },
  {
    "measure" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "21855-2",
        "display" : "Primary site Cancer"
      }]
    }
  },
  {
    "measure" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "44648-4",
        "display" : "Histologic grade [Score] in Breast cancer specimen by Nottingham"
      }]
    }
  },
  {
    "measure" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "33732-9",
        "display" : "Histology grade [Identifier] in Cancer specimen"
      }]
    }
  },
  {
    "measure" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "85347-3",
        "display" : "Sentinel lymph nodes examined [#] in Cancer specimen by Light microscopy"
      }]
    }
  }],
  "expressedBy" : {
    "reference" : "Practitioner/OnkologinMamma"
  },
  "addresses" : [{
    "reference" : "Condition/ConditionMamma"
  }],
  "outcomeReference" : [{
    "reference" : "Observation/ObsDiseaseStatusMamma"
  }]
}

```
