# Onkologischer CarePlan – mCRC palliativ (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.2

## Example CarePlan: Onkologischer CarePlan – mCRC palliativ (Beispiel)

-------

**English**

-------

Profile: [Onkologischer CarePlan](StructureDefinition-onko-care-plan.md)

> **Onkologische Therapieintention (Extension)**
* hauptintention: Palliative intent

**CarePlan Custodian (Extension)**: [Organization Onkologisches Zentrum Musterklinik](Organization-TumorzentrumCRC.md)

**status**: Active

**intent**: Plan

**category**: Cancer care plan

**subject**: [Erika Musterfrau Female, DoB: 1961-09-12](Patient-PatientinCRC.md)

**period**: 2026-02-10 --> (ongoing)

**author**: [Practitioner Petra Musterarzt ](Practitioner-OnkologinCRC.md)

**careTeam**: [CareTeam Interdisziplinäres Tumorboard Kolorektales Karzinom](CareTeam-TumorboardCRC.md)

**addresses**: [Condition Bösartige Neubildung: Kolon, nicht näher bezeichnet](Condition-ConditionCRC.md)

**supportingInfo**: [CarePlan: extension = ->Organization Onkologisches Zentrum Musterklinik; status = completed; intent = plan; category = ; period = 2026-01-05 --> 2026-01-20](CarePlan-DiagnostikCarePlanCRC.md)

**goal**: [Goal: extension = ,,,; lifecycleStatus = active; achievementStatus = In Progress; category = Lebensverlängerung,Symptomkontrolle / Palliation; priority = High Priority; description = ; start[x] = 2026-02-10](Goal-TherapiezielCRCLebensverlaengerung.md)

> **activity****outcomeReference**: [Observation Cancer disease progression](Observation-ObservationDiseaseStatusCRC.md)**reference**: [MedicationRequest: status = active; intent = plan; category = Tumor board Consult note; medication[x] = ](MedicationRequest-MedicationRequestFOLFOX.md)

> **activity****reference**: [ServiceRequest Implantable venous access port injection](ServiceRequest-ServiceRequestPortCRC.md)



## Resource Content

```json
{
  "resourceType" : "CarePlan",
  "id" : "CarePlanCRCPalliativ",
  "meta" : {
    "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-care-plan"]
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
    }],
    "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent"
  },
  {
    "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-careplan-custodian",
    "valueReference" : {
      "reference" : "Organization/TumorzentrumCRC"
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
  "careTeam" : [{
    "reference" : "CareTeam/TumorboardCRC"
  }],
  "addresses" : [{
    "reference" : "Condition/ConditionCRC"
  }],
  "supportingInfo" : [{
    "reference" : "CarePlan/DiagnostikCarePlanCRC"
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
  },
  {
    "reference" : {
      "reference" : "ServiceRequest/ServiceRequestPortCRC"
    }
  }]
}

```
