# Therapielinie 2 – Operation - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.1

## Beispiel EpisodeOfCare: Therapielinie 2 – Operation

-------

**German**

-------

Profile: [Onkologische Therapielinie](StructureDefinition-onko-therapy-line.md)

> **Onkologische Therapieintention (Extension)**
* hauptintention: Curative - procedure intent

**EnLiST-Zählstatus (Extension)**: Zählt nicht

**status**: Finished

**type**: Surgical procedure

### Diagnoses

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Condition** | **Role** | **Rank** |
| * | [Condition Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse](Condition-ConditionMamma.md) | Chief complaint | 1 |

**patient**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**managingOrganization**: [Organization Zertifiziertes Brustzentrum Musterklinik](Organization-Tumorboard.md)

**period**: 2026-03-20 --> 2026-04-06

**referralRequest**: [ServiceRequest Lumpectomy of breast (procedure)](ServiceRequest-ServiceRequestProcedure.md)

**careManager**: [Practitioner Katrin Musterarzt ](Practitioner-OnkologinMamma.md)



## Resource Content

```json
{
  "resourceType" : "EpisodeOfCare",
  "id" : "TherapielinieOperation",
  "meta" : {
    "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-line"]
  },
  "extension" : [{
    "extension" : [{
      "url" : "hauptintention",
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
    "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-countable",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/enlist-countable",
        "code" : "not-counted",
        "display" : "Zählt nicht"
      }]
    }
  }],
  "status" : "finished",
  "type" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "387713003",
      "display" : "Surgical procedure"
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
    "start" : "2026-03-20",
    "end" : "2026-04-06"
  },
  "referralRequest" : [{
    "reference" : "ServiceRequest/ServiceRequestProcedure"
  }],
  "careManager" : {
    "reference" : "Practitioner/OnkologinMamma"
  }
}

```
