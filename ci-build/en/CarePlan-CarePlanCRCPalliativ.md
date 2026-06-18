# Onkologischer CarePlan – mCRC palliativ (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Example CarePlan: Onkologischer CarePlan – mCRC palliativ (Beispiel)

-------

**English**

-------

Profile: [Onkologischer CarePlan](StructureDefinition-onko-care-plan.md)

**Onkologische Therapieintention (Extension)**: Palliativ

**status**: Active

**intent**: Plan

**category**: Cancer care plan

**subject**: [Erika Musterfrau Female, DoB: 1961-09-12](Patient-PatientinCRC.md)

**period**: 2026-02-10 --> (ongoing)

**author**: [Practitioner Petra Musterarzt ](Practitioner-OnkologinCRC.md)

**addresses**: [Condition Bösartige Neubildung: Kolon, nicht näher bezeichnet](Condition-ConditionCRC.md)

**goal**: [Goal: extension = Palliativ; lifecycleStatus = active; achievementStatus = In Progress; category = Lebensverlängerung,Symptomkontrolle / Palliation; priority = High Priority; description = ; start[x] = 2026-02-10](Goal-TherapiezielCRCLebensverlaengerung.md)

### Activities

| | | |
| :--- | :--- | :--- |
| - | **OutcomeReference** | **Reference** |
| * | [Observation Cancer disease progression](Observation-ObservationDiseaseStatusCRC.md) | [MedicationRequest: status = active; intent = plan; medication[x] = ](MedicationRequest-MedicationRequestFOLFOX.md) |



## Resource Content

```json
{
  "resourceType" : "CarePlan",
  "id" : "CarePlanCRCPalliativ",
  "meta" : {
    "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-care-plan"]
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
    "reference" : "Patient/PatientinCRC"
  },
  "period" : {
    "start" : "2026-02-10"
  },
  "author" : {
    "reference" : "Practitioner/OnkologinCRC"
  },
  "addresses" : [{
    "reference" : "Condition/ConditionCRC"
  }],
  "goal" : [{
    "reference" : "Goal/TherapiezielCRCLebensverlaengerung"
  }],
  "activity" : [{
    "outcomeReference" : [{
      "reference" : "Observation/ObservationDiseaseStatusCRC"
    }],
    "reference" : {
      "reference" : "MedicationRequest/MedicationRequestFOLFOX"
    }
  }]
}

```
