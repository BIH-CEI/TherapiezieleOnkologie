# Therapielinie 1 – neoadjuvante Chemo-/Immuntherapie (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Example EpisodeOfCare: Therapielinie 1 – neoadjuvante Chemo-/Immuntherapie (Beispiel)

-------

**English**

-------

Profile: [Onkologische Therapielinie](StructureDefinition-onko-therapy-line.md)

**Onkologische Therapieintention (Extension)**: Neoadjuvant

**status**: Finished

### Diagnoses

| | | |
| :--- | :--- | :--- |
| - | **Condition** | **Rank** |
| * | [Condition Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse](Condition-ConditionMamma.md) | 1 |

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
    "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-intent",
        "code" : "neoadjuvant",
        "display" : "Neoadjuvant"
      }]
    }
  }],
  "status" : "finished",
  "diagnosis" : [{
    "condition" : {
      "reference" : "Condition/ConditionMamma"
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
