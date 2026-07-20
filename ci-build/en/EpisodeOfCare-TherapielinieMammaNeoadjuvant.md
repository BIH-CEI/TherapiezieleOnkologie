# Therapielinie 1 – neoadjuvante Chemo-/Immuntherapie (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Example EpisodeOfCare: Therapielinie 1 – neoadjuvante Chemo-/Immuntherapie (Beispiel)

-------

**English**

-------

Profile: [Onkologische Therapielinie](StructureDefinition-onko-therapy-line.md)

> **Onkologische Therapieintention (Extension)**
* hauptintention: Neoadjuvant

**status**: Finished

**type**: Chemotherapy care

### Diagnoses

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Condition** | **Role** | **Rank** |
| * | [Condition Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse](Condition-ConditionMamma.md) | Chief complaint | 1 |

**patient**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**period**: 2025-10-01 --> 2026-03-15



## Resource Content

```json
{
  "resourceType" : "EpisodeOfCare",
  "id" : "TherapielinieMammaNeoadjuvant",
  "meta" : {
    "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-line"]
  },
  "extension" : [{
    "extension" : [{
      "url" : "hauptintention",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "373847000",
          "display" : "Neoadjuvant"
        }]
      }
    }],
    "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent"
  }],
  "status" : "finished",
  "type" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "385786002",
      "display" : "Chemotherapy care"
    }]
  }],
  "diagnosis" : [{
    "condition" : {
      "reference" : "Condition/ConditionMamma"
    },
    "role" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/diagnosis-role",
        "code" : "CC",
        "display" : "Chief complaint"
      }]
    },
    "rank" : 1
  }],
  "patient" : {
    "reference" : "Patient/PatientinMamma"
  },
  "period" : {
    "start" : "2025-10-01",
    "end" : "2026-03-15"
  }
}

```
