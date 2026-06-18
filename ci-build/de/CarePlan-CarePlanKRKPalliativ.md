# Onkologischer CarePlan – mCRC palliativ (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Beispiel CarePlan: Onkologischer CarePlan – mCRC palliativ (Beispiel)

-------

**German**

-------

Profile: [Onkologischer CarePlan](StructureDefinition-onko-care-plan.md)

**Onkologische Therapieintention (Extension)**: Palliativ

**status**: Active

**intent**: Plan

**category**: Cancer care plan

**subject**: [Erika Beispiel Female, DoB: 1958-09-12](Patient-PatientinKRK.md)

**period**: 2026-02-10 --> (ongoing)

**author**: [Practitioner Petra Musterarzt ](Practitioner-OnkologinKRK.md)

**addresses**: [Condition Bösartige Neubildung: Kolon, nicht näher bezeichnet](Condition-ConditionKRK.md)

**goal**: [Goal: extension = Palliativ; lifecycleStatus = active; achievementStatus = In Progress; category = Lebensverlängerung,Symptomkontrolle / Palliation; priority = High Priority; description = ; start[x] = 2026-02-10](Goal-TherapiezielKRKLebensverlaengerung.md)

### Activities

| | | |
| :--- | :--- | :--- |
| - | **OutcomeReference** | **Reference** |
| * | [Observation Cancer disease status](Observation-ObservationDiseaseStatusKRK.md) | [MedicationRequest: status = active; intent = plan; medication[x] = ](MedicationRequest-MedicationRequestFOLFOX.md) |



## Resource Content

```json
{
  "resourceType" : "CarePlan",
  "id" : "CarePlanKRKPalliativ",
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
      "code" : "395082007",
      "display" : "Cancer care plan"
    }]
  }],
  "subject" : {
    "reference" : "Patient/PatientinKRK"
  },
  "period" : {
    "start" : "2026-02-10"
  },
  "author" : {
    "reference" : "Practitioner/OnkologinKRK"
  },
  "addresses" : [{
    "reference" : "Condition/ConditionKRK"
  }],
  "goal" : [{
    "reference" : "Goal/TherapiezielKRKLebensverlaengerung"
  }],
  "activity" : [{
    "outcomeReference" : [{
      "reference" : "Observation/ObservationDiseaseStatusKRK"
    }],
    "reference" : {
      "reference" : "MedicationRequest/MedicationRequestFOLFOX"
    }
  }]
}

```
