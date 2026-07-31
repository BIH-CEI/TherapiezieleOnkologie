# Therapieziel – Erhaltungstherapie / Stabilisierung (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Example Goal: Therapieziel – Erhaltungstherapie / Stabilisierung (Beispiel)

-------

**English**

-------

Profile: [Onkologisches Therapieziel](StructureDefinition-onko-therapy-goal.md)

> **Onkologische Therapieintention (Extension)**
* hauptintention: Palliative intent
* phase: Maintenance antineoplastic therapy

> **Goal: Related Goal**
* type: Predecessor
* target: [Goal: extension = ,,,; lifecycleStatus = active; achievementStatus = In Progress; category = Lebensverlängerung,Symptomkontrolle / Palliation; priority = High Priority; description = ; start[x] = 2026-02-10](Goal-TherapiezielCRCLebensverlaengerung.md)

**lifecycleStatus**: Proposed

**category**: Lebensverlängerung, Lebensqualität

**description**: Erhalt des Therapieansprechens bei reduzierter Toxizität (Erhaltungstherapie) nach erfolgreicher Induktion.

**subject**: [Erika Musterfrau Female, DoB: 1961-09-12](Patient-PatientinCRC.md)

**expressedBy**: [Practitioner Petra Musterarzt ](Practitioner-OnkologinCRC.md)

**addresses**: [Condition Bösartige Neubildung: Kolon, nicht näher bezeichnet](Condition-ConditionCRC.md)



## Resource Content

```json
{
  "resourceType" : "Goal",
  "id" : "TherapiezielCRCErhaltung",
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
          "code" : "1345242003",
          "display" : "Maintenance antineoplastic therapy"
        }]
      }
    }],
    "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent"
  },
  {
    "extension" : [{
      "url" : "type",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/goal-relationship-type",
          "code" : "predecessor",
          "display" : "Predecessor"
        }]
      }
    },
    {
      "url" : "target",
      "valueReference" : {
        "reference" : "Goal/TherapiezielCRCLebensverlaengerung"
      }
    }],
    "url" : "http://hl7.org/fhir/StructureDefinition/goal-relationship"
  }],
  "lifecycleStatus" : "proposed",
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
      "code" : "lebensqualitaet",
      "display" : "Lebensqualität"
    }]
  }],
  "description" : {
    "text" : "Erhalt des Therapieansprechens bei reduzierter Toxizität (Erhaltungstherapie) nach erfolgreicher Induktion."
  },
  "subject" : {
    "reference" : "Patient/PatientinCRC"
  },
  "expressedBy" : {
    "reference" : "Practitioner/OnkologinCRC"
  },
  "addresses" : [{
    "reference" : "Condition/ConditionCRC"
  }]
}

```
