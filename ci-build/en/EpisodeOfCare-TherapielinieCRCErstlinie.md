# Therapielinie 1 – FOLFOX + Bevacizumab (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Example EpisodeOfCare: Therapielinie 1 – FOLFOX + Bevacizumab (Beispiel)

-------

**English**

-------

Profile: [Onkologische Therapielinie](StructureDefinition-onko-therapy-line.md)

> **Onkologische Therapieintention (Extension)**
* hauptintention: Palliativ
* phase: Induktionstherapie

**status**: Active

**type**: Ambulatory chemotherapy

### Diagnoses

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Condition** | **Role** | **Rank** |
| * | [Condition Bösartige Neubildung: Kolon, nicht näher bezeichnet](Condition-ConditionCRC.md) | Chief complaint | 1 |

**patient**: [Erika Musterfrau Female, DoB: 1961-09-12](Patient-PatientinCRC.md)

**managingOrganization**: [Organization Onkologisches Zentrum Musterklinik](Organization-TumorzentrumCRC.md)

**period**: 2026-02-10 --> (ongoing)

**careManager**: [Practitioner Petra Musterarzt ](Practitioner-OnkologinCRC.md)

**team**: [CareTeam Interdisziplinäres Tumorboard Kolorektales Karzinom](CareTeam-TumorboardCRC.md)



## Resource Content

```json
{
  "resourceType" : "EpisodeOfCare",
  "id" : "TherapielinieCRCErstlinie",
  "meta" : {
    "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-line"]
  },
  "extension" : [{
    "extension" : [{
      "url" : "hauptintention",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "363676003",
          "display" : "Palliativ"
        }]
      }
    },
    {
      "url" : "phase",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "450827009",
          "display" : "Induktionstherapie"
        }]
      }
    }],
    "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent"
  }],
  "status" : "active",
  "type" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "315601005",
      "display" : "Ambulatory chemotherapy"
    }]
  }],
  "diagnosis" : [{
    "condition" : {
      "reference" : "Condition/ConditionCRC"
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
    "reference" : "Patient/PatientinCRC"
  },
  "managingOrganization" : {
    "reference" : "Organization/TumorzentrumCRC"
  },
  "period" : {
    "start" : "2026-02-10"
  },
  "careManager" : {
    "reference" : "Practitioner/OnkologinCRC"
  },
  "team" : [{
    "reference" : "CareTeam/TumorboardCRC"
  }]
}

```
