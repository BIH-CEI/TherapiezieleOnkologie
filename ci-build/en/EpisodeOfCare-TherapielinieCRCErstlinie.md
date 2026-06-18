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
| * | [Condition Bösartige Neubildung: Kolon, nicht näher bezeichnet](Condition-ConditionCRC.md) | 1 |

**patient**: [Erika Musterfrau Female, DoB: 1961-09-12](Patient-PatientinCRC.md)

**period**: 2026-02-10 --> (ongoing)



## Resource Content

```json
{
  "resourceType" : "EpisodeOfCare",
  "id" : "TherapielinieCRCErstlinie",
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
      "reference" : "Condition/ConditionCRC"
    },
    "rank" : 1
  }],
  "patient" : {
    "reference" : "Patient/PatientinCRC"
  },
  "period" : {
    "start" : "2026-02-10"
  }
}

```
