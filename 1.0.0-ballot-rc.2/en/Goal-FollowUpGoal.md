# Verbesserung und Erhaltung der QoL nach der onkologischen Behandlung - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.2

## Example Goal: Verbesserung und Erhaltung der QoL nach der onkologischen Behandlung

-------

**English**

-------

Profile: [Onkologisches Therapieziel](StructureDefinition-onko-therapy-goal.md)

> **Goal acceptance**
* individual: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)
* status: agree
* priority: High Priority

> **Goal: Related Goal**
* type: Predecessor
* target: [Goal: extension = ; lifecycleStatus = active; achievementStatus = In Progress; category = Diagnostic intent; priority = High Priority; description = ; start[x] = 2025-09-12](Goal-DiagnosticGoal.md)

> **Goal: Related Goal**
* type: Predecessor
* target: [Goal: extension = ,,,; lifecycleStatus = active; achievementStatus = Achieved; category = Heilung,Funktionserhalt; priority = High Priority; description = ; start[x] = 2025-09-22](Goal-TherapiezielMammaHeilung.md)

**lifecycleStatus**: Planned

**achievementStatus**: In Progress

**category**: Lebensqualität

**priority**: High Priority

**description**: Monitoring der Lebensqualität und des Krankheitsstatus nach der onkologischen Erkrankung und Therapie

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**start**: 2026-08-15

> **target****measure**: Cancer outcome status**detail**: Kein Hinweis auf Lokalrezidiv oder Fernmetastasen**due**: 2026-11-15

> **target****measure**: Mammografie**detail**: Unauffällige Nachsorge-Mammographie (jährlich), kein Rezidivnachweis**due**: 2027-04-15

> **target****measure**: Arm-/Schulterfunktion und Lymphödem-Status nach axillärem Eingriff**detail**: Kein manifestes Lymphödem, erhaltene Schulterbeweglichkeit

> **target****measure**: Gesundheitsbezogene Lebensqualität (PROM, EORTC QLQ-C30 / BR23) – MII PRO-Modul**detail**: Stabile bis verbesserte Lebensqualität im Verlauf

**expressedBy**: [Practitioner Katrin Musterarzt ](Practitioner-OnkologinMamma.md)

**addresses**: [Condition Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse](Condition-ConditionMamma.md)

**outcomeReference**: [Observation Cancer disease progression](Observation-ObsDiseaseStatusMamma.md)



## Resource Content

```json
{
  "resourceType" : "Goal",
  "id" : "FollowUpGoal",
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
          "code" : "predecessor",
          "display" : "Predecessor"
        }]
      }
    },
    {
      "url" : "target",
      "valueReference" : {
        "reference" : "Goal/TherapiezielMammaHeilung"
      }
    }],
    "url" : "http://hl7.org/fhir/StructureDefinition/goal-relationship"
  }],
  "lifecycleStatus" : "planned",
  "achievementStatus" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/goal-achievement",
      "code" : "in-progress",
      "display" : "In Progress"
    }]
  },
  "category" : [{
    "coding" : [{
      "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-goal-type",
      "code" : "lebensqualitaet",
      "display" : "Lebensqualität"
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
    "text" : "Monitoring der Lebensqualität und des Krankheitsstatus nach der onkologischen Erkrankung und Therapie"
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "startDate" : "2026-08-15",
  "target" : [{
    "measure" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "21976-6",
        "display" : "Cancer outcome status"
      }]
    },
    "detailCodeableConcept" : {
      "text" : "Kein Hinweis auf Lokalrezidiv oder Fernmetastasen"
    },
    "dueDate" : "2026-11-15"
  },
  {
    "measure" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "24606-6",
        "display" : "Mammografie"
      }]
    },
    "detailCodeableConcept" : {
      "text" : "Unauffällige Nachsorge-Mammographie (jährlich), kein Rezidivnachweis"
    },
    "dueDate" : "2027-04-15"
  },
  {
    "measure" : {
      "text" : "Arm-/Schulterfunktion und Lymphödem-Status nach axillärem Eingriff"
    },
    "detailCodeableConcept" : {
      "text" : "Kein manifestes Lymphödem, erhaltene Schulterbeweglichkeit"
    }
  },
  {
    "measure" : {
      "text" : "Gesundheitsbezogene Lebensqualität (PROM, EORTC QLQ-C30 / BR23) – MII PRO-Modul"
    },
    "detailCodeableConcept" : {
      "text" : "Stabile bis verbesserte Lebensqualität im Verlauf"
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
