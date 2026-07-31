# Therapielinie 1 – neoadjuvante Chemo-/Immuntherapie - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.2

## Example EpisodeOfCare: Therapielinie 1 – neoadjuvante Chemo-/Immuntherapie

-------

**English**

-------

Profile: [Onkologische Therapielinie](StructureDefinition-onko-therapy-line.md)

> **Onkologische Therapieintention (Extension)**
* hauptintention: Neoadjuvant intent
* phase: Curative - procedure intent

> **EnLiST-LoT-Designation (Extension)**
* setting: eLoT — frühes Setting
* line: 1
* modification: 0
* notation: eLoT 1.0
* lineId: `https://bih-cei.de/fhir/therapieziele-onkologie/sid/enlist-line`/mamma-baumann-elot-1

**EnLiST-Zählstatus (Extension)**: Zählt in der LoT-Zählung

**Therapielinie – Medikationsverordnung (Extension)**: [MedicationRequest: extension = New LoT; status = completed; intent = plan; category = Tumor board Consult note; medication[x] = ](MedicationRequest-MedicationRequestPembroChemoNeoadjuvantMamma.md)

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
          "display" : "Neoadjuvant intent"
        }]
      }
    },
    {
      "url" : "phase",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "373808002",
          "display" : "Curative - procedure intent"
        }]
      }
    }],
    "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent"
  },
  {
    "extension" : [{
      "url" : "setting",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/enlist-lot-setting",
          "code" : "eLoT",
          "display" : "eLoT — frühes Setting"
        }]
      }
    },
    {
      "url" : "line",
      "valuePositiveInt" : 1
    },
    {
      "url" : "modification",
      "valueUnsignedInt" : 0
    },
    {
      "url" : "notation",
      "valueString" : "eLoT 1.0"
    },
    {
      "url" : "lineId",
      "valueIdentifier" : {
        "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/sid/enlist-line",
        "value" : "mamma-baumann-elot-1"
      }
    }],
    "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-lot"
  },
  {
    "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-countable",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/enlist-countable",
        "code" : "counted",
        "display" : "Zählt in der LoT-Zählung"
      }]
    }
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
