# Therapielinie 1 – neoadjuvante Chemo-/Immuntherapie - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Example EpisodeOfCare: Therapielinie 1 – neoadjuvante Chemo-/Immuntherapie

-------

**English**

-------

Profile: [Onkologische Therapielinie](StructureDefinition-onko-therapy-line.md)

> **Onkologische Therapieintention (Extension)**
* hauptintention: Neoadjuvant
* phase: Kurativ

**Therapielinie – Medikationsverordnung (Extension)**: [MedicationRequest: status = completed; intent = plan; category = Tumor board Consult note; medication[x] = ](MedicationRequest-MedicationRequestPembroChemoNeoadjuvantMamma.md)

**status**: Finished

**type**: Chemotherapy care

### Diagnoses

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Condition** | **Role** | **Rank** |
| * | [Condition Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse](Condition-ConditionMamma.md) | Chief complaint | 1 |

**patient**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**managingOrganization**: [Organization Zertifiziertes Brustzentrum Musterklinik](Organization-Tumorboard.md)

**period**: 2025-10-01 --> 2026-03-15

**careManager**: [Practitioner Katrin Musterarzt ](Practitioner-OnkologinMamma.md)



## Resource Content

```json
{
  "resourceType" : "EpisodeOfCare",
  "id" : "TherapielinieChemo",
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
    },
    {
      "url" : "phase",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "373808002",
          "display" : "Kurativ"
        }]
      }
    }],
    "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent"
  },
  {
    "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-line-medication-request",
    "valueReference" : {
      "reference" : "MedicationRequest/MedicationRequestPembroChemoNeoadjuvantMamma"
    }
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
  "managingOrganization" : {
    "reference" : "Organization/Tumorboard"
  },
  "period" : {
    "start" : "2025-10-01",
    "end" : "2026-03-15"
  },
  "careManager" : {
    "reference" : "Practitioner/OnkologinMamma"
  }
}

```
