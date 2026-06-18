# Therapielinie 1 – FOLFOX + Bevacizumab (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Example EpisodeOfCare: Therapielinie 1 – FOLFOX + Bevacizumab (Beispiel)

-------

**English**

-------

Profile: [Onkologische Therapielinie](StructureDefinition-onko-therapy-line.md)

**Onkologische Therapieintention (Extension)**: Palliativ

**status**: Active

### Diagnoses

| | | |
| :--- | :--- | :--- |
| - | **Condition** | **Rank** |
| * | [Condition Bösartige Neubildung: Kolon, nicht näher bezeichnet](Condition-ConditionKRK.md) | 1 |

**patient**: [Erika Beispiel Female, DoB: 1958-09-12](Patient-PatientinKRK.md)

**period**: 2026-02-10 --> (ongoing)



## Resource Content

```json
{
  "resourceType" : "EpisodeOfCare",
  "id" : "TherapielinieKRKErstlinie",
  "meta" : {
    "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-line"]
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
  "diagnosis" : [{
    "condition" : {
      "reference" : "Condition/ConditionKRK"
    },
    "rank" : 1
  }],
  "patient" : {
    "reference" : "Patient/PatientinKRK"
  },
  "period" : {
    "start" : "2026-02-10"
  }
}

```
