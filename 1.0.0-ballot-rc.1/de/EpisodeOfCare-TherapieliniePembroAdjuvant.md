# Therapielinie 3 – adjuvante Immuntherapie (Pembrolizumab), ambulant - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.1

## Beispiel EpisodeOfCare: Therapielinie 3 – adjuvante Immuntherapie (Pembrolizumab), ambulant

-------

**German**

-------

Profile: [Onkologische Therapielinie](StructureDefinition-onko-therapy-line.md)

> **Onkologische Therapieintention (Extension)**
* hauptintention: Adjuvant - intent
* phase: Maintenance antineoplastic therapy

**Therapielinie – Medikationsverordnung (Extension)**: [MedicationRequest: status = active; intent = plan; category = Tumor board Consult note; medication[x] = ](MedicationRequest-MedicationRequestPembroAdjuvantMamma.md)

**status**: Active

**type**: Ambulante adjuvante Immuntherapie – Pembrolizumab-Monotherapie

### Diagnoses

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Condition** | **Role** | **Rank** |
| * | [Condition Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse](Condition-ConditionMamma.md) | Chief complaint | 1 |

**patient**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**managingOrganization**: [Organization Zertifiziertes Brustzentrum Musterklinik](Organization-Tumorboard.md)

**period**: 2026-04-24 --> (ongoing)

**careManager**: [Practitioner Katrin Musterarzt ](Practitioner-OnkologinMamma.md)



## Resource Content

```json
{
  "resourceType" : "EpisodeOfCare",
  "id" : "TherapieliniePembroAdjuvant",
  "meta" : {
    "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-line"]
  },
  "extension" : [{
    "extension" : [{
      "url" : "hauptintention",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "373846009",
          "display" : "Adjuvant - intent"
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
    "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-line-medication-request",
    "valueReference" : {
      "reference" : "MedicationRequest/MedicationRequestPembroAdjuvantMamma"
    }
  }],
  "status" : "active",
  "type" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "76334006",
      "display" : "Immunological therapy"
    }],
    "text" : "Ambulante adjuvante Immuntherapie – Pembrolizumab-Monotherapie"
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
    "start" : "2026-04-24"
  },
  "careManager" : {
    "reference" : "Practitioner/OnkologinMamma"
  }
}

```
