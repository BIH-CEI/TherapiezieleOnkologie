# Therapieziel – Lebensverlängerung & Symptomkontrolle (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Beispiel Goal: Therapieziel – Lebensverlängerung & Symptomkontrolle (Beispiel)

-------

**German**

-------

Profile: [Onkologisches Therapieziel](StructureDefinition-onko-therapy-goal.md)

**Onkologische Therapieintention (Extension)**: Palliativ

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
    "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-intent",
        "code" : "palliativ",
        "display" : "Palliativ"
      }]
    }
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
