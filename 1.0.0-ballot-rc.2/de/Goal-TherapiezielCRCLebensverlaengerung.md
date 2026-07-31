# Therapieziel – Lebensverlängerung & Symptomkontrolle (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.2

## Beispiel Goal: Therapieziel – Lebensverlängerung & Symptomkontrolle (Beispiel)

-------

**German**

-------

Profile: [Onkologisches Therapieziel](StructureDefinition-onko-therapy-goal.md)

> **Onkologische Therapieintention (Extension)**
* hauptintention: Palliative intent
* phase: Induction chemotherapy

> **Goal acceptance**
* individual: [Erika Musterfrau Female, DoB: 1961-09-12](Patient-PatientinCRC.md)
* status: agree
* priority: High Priority

> **Goal: Related Goal**
* type: Replacement
* target: [Goal: extension = ,; lifecycleStatus = rejected; category = Heilung; description = ](Goal-TherapiezielCRCKurativAbgelehnt.md)

> **Goal: Related Goal**
* type: Successor
* target: [Goal: extension = ,; lifecycleStatus = proposed; category = Lebensverlängerung,Lebensqualität; description = ](Goal-TherapiezielCRCErhaltung.md)

**lifecycleStatus**: Active

**achievementStatus**: In Progress

**category**: Lebensverlängerung, Symptomkontrolle / Palliation

**priority**: High Priority

**description**: Verlängerung des Gesamtüberlebens und Kontrolle tumorbedingter Symptome unter palliativer Systemtherapie.

**subject**: [Erika Musterfrau Female, DoB: 1961-09-12](Patient-PatientinCRC.md)

**start**: 2026-02-10

### Targets

| | | |
| :--- | :--- | :--- |
| - | **Measure** | **Due[x]** |
| * | Stage group.clinical Cancer | 2026-08-10 |

**expressedBy**: [Practitioner Petra Musterarzt ](Practitioner-OnkologinCRC.md)

**addresses**: [Condition Bösartige Neubildung: Kolon, nicht näher bezeichnet](Condition-ConditionCRC.md)

**outcomeReference**: [Observation Cancer disease progression](Observation-ObservationDiseaseStatusCRC.md)



## Resource Content

```json
{
  "resourceType" : "Goal",
  "id" : "TherapiezielCRCLebensverlaengerung",
  "meta" : {
    "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-goal"]
  },
  "extension" : [{
    "extension" : [{
      "url" : "hauptintention",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "363676003",
          "display" : "Palliative intent"
        }]
      }
    },
    {
      "url" : "phase",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "450827009",
          "display" : "Induction chemotherapy"
        }]
      }
    }],
    "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent"
  },
  {
    "extension" : [{
      "url" : "individual",
      "valueReference" : {
        "reference" : "Patient/PatientinCRC"
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
          "system" : "http://terminology.hl7.org/CodeSystem/goal-relationship-type",
          "code" : "replacement",
          "display" : "Replacement"
        }]
      }
    },
    {
      "url" : "target",
      "valueReference" : {
        "reference" : "Goal/TherapiezielCRCKurativAbgelehnt"
      }
    }],
    "url" : "http://hl7.org/fhir/StructureDefinition/goal-relationship"
  },
  {
    "extension" : [{
      "url" : "type",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/goal-relationship-type",
          "code" : "successor",
          "display" : "Successor"
        }]
      }
    },
    {
      "url" : "target",
      "valueReference" : {
        "reference" : "Goal/TherapiezielCRCErhaltung"
      }
    }],
    "url" : "http://hl7.org/fhir/StructureDefinition/goal-relationship"
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
      "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-goal-type",
      "code" : "lebensverlaengerung",
      "display" : "Lebensverlängerung"
    }]
  },
  {
    "coding" : [{
      "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-goal-type",
      "code" : "symptomkontrolle",
      "display" : "Symptomkontrolle / Palliation"
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
    "text" : "Verlängerung des Gesamtüberlebens und Kontrolle tumorbedingter Symptome unter palliativer Systemtherapie."
  },
  "subject" : {
    "reference" : "Patient/PatientinCRC"
  },
  "startDate" : "2026-02-10",
  "target" : [{
    "measure" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "21908-9",
        "display" : "Stage group.clinical Cancer"
      }]
    },
    "dueDate" : "2026-08-10"
  }],
  "expressedBy" : {
    "reference" : "Practitioner/OnkologinCRC"
  },
  "addresses" : [{
    "reference" : "Condition/ConditionCRC"
  }],
  "outcomeReference" : [{
    "reference" : "Observation/ObservationDiseaseStatusCRC"
  }]
}

```
