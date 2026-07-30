# Therapieziel – Heilung & Brusterhalt (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Example Goal: Therapieziel – Heilung & Brusterhalt (Beispiel)

-------

**English**

-------

Profile: [Onkologisches Therapieziel](StructureDefinition-onko-therapy-goal.md)

> **Onkologische Therapieintention (Extension)**
* hauptintention: Kurativ

> **Goal acceptance**
* individual: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)
* status: agree
* priority: High Priority

> **Goal: Related Goal**
* type: Predecessor
* target: [Goal: extension = ; lifecycleStatus = active; achievementStatus = In Progress; category = Diagnostic intent; priority = High Priority; description = ; start[x] = 2025-09-12](Goal-DiagnosticGoal.md)

> **Goal: Related Goal**
* type: Successor
* target: [Goal: extension = ,,; lifecycleStatus = planned; achievementStatus = In Progress; category = Lebensqualität; priority = High Priority; description = ; start[x] = 2026-08-15](Goal-FollowUpGoal.md)

**lifecycleStatus**: Active

**achievementStatus**: Achieved

**category**: Heilung, Funktionserhalt

**priority**: High Priority

**description**: Kurative Behandlung des frühen triple-negativen Mammakarzinoms mittels neoadjuvanter Systemtherapie und brusterhaltender Operation; Erreichen einer pathologischen Komplettremission (pCR).

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**start**: 2025-09-22

### Targets

| | | |
| :--- | :--- | :--- |
| - | **Measure** | **Due[x]** |
| * | Stage group.clinical Cancer | 2026-04-15 |

**expressedBy**: [Practitioner Katrin Musterarzt ](Practitioner-OnkologinMamma.md)

**addresses**: [Condition Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse](Condition-ConditionMamma.md)

**outcomeReference**: [Observation Cancer disease progression](Observation-ObsDiseaseStatusMamma.md)



## Resource Content

```json
{
  "resourceType" : "Goal",
  "id" : "TherapiezielMammaHeilung",
  "meta" : {
    "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-goal"]
  },
  "extension" : [{
    "extension" : [{
      "url" : "hauptintention",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "373808002",
          "display" : "Kurativ"
        }]
      }
    }],
    "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent"
  },
  {
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
  },
  {
    "extension" : [{
      "url" : "type",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://hl7.org/fhir/goal-relationship-type",
          "code" : "predecessor",
          "display" : "Predecessor"
        }]
      }
    },
    {
      "url" : "target",
      "valueReference" : {
        "reference" : "Goal/DiagnosticGoal"
      }
    }],
    "url" : "http://hl7.org/fhir/StructureDefinition/goal-relationship"
  },
  {
    "extension" : [{
      "url" : "type",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://hl7.org/fhir/goal-relationship-type",
          "code" : "successor",
          "display" : "Successor"
        }]
      }
    },
    {
      "url" : "target",
      "valueReference" : {
        "reference" : "Goal/FollowUpGoal"
      }
    }],
    "url" : "http://hl7.org/fhir/StructureDefinition/goal-relationship"
  }],
  "lifecycleStatus" : "active",
  "achievementStatus" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/goal-achievement",
      "code" : "achieved",
      "display" : "Achieved"
    }]
  },
  "category" : [{
    "coding" : [{
      "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-goal-type",
      "code" : "heilung",
      "display" : "Heilung"
    }]
  },
  {
    "coding" : [{
      "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-goal-type",
      "code" : "funktionserhalt",
      "display" : "Funktionserhalt"
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
    "text" : "Kurative Behandlung des frühen triple-negativen Mammakarzinoms mittels neoadjuvanter Systemtherapie und brusterhaltender Operation; Erreichen einer pathologischen Komplettremission (pCR)."
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "startDate" : "2025-09-22",
  "target" : [{
    "measure" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "21908-9",
        "display" : "Stage group.clinical Cancer"
      }]
    },
    "dueDate" : "2026-04-15"
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
