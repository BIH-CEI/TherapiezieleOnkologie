# Tumorboard MedicationRequest - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Resource Profile: Tumorboard MedicationRequest 

 
Strukturierte Empfehlung des Tumorboards auf Basis von `MedicationRequest`. 
Tumorboardspezifische Ergänzung: 
* Im Element `category` muss der LOINC-Code `Tumor board Consult note` (85232-7) enthalten sein, um zu kennzeichnen, dass es sich um eine Empfehlung des Tumorboards handelt. Weitere Categories können zusätzlich angegeben werden.
 

**Usages:**

* Refer to this Profile: [Onkologischer CarePlan](StructureDefinition-onko-care-plan.md)
* Examples for this Profile: [MedicationRequest/MedicationRequestFOLFOX](MedicationRequest-MedicationRequestFOLFOX.md) and [MedicationRequest/MedicationRequestKEYNOTE522](MedicationRequest-MedicationRequestKEYNOTE522.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.bih-cei.therapieziele-onkologie|current/StructureDefinition/StructureDefinition-onko-tumorboard-medication-request.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-onko-tumorboard-medication-request.csv), [Excel](../StructureDefinition-onko-tumorboard-medication-request.xlsx), [Schematron](../StructureDefinition-onko-tumorboard-medication-request.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "onko-tumorboard-medication-request",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-tumorboard-medication-request",
  "version" : "0.1.0",
  "name" : "TumorboardMedicationRequest",
  "title" : "Tumorboard MedicationRequest",
  "status" : "draft",
  "date" : "2026-07-20T12:02:06+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Strukturierte Empfehlung des Tumorboards auf Basis von `MedicationRequest`.\n\nTumorboardspezifische Ergänzung:\n- Im Element `category` muss der LOINC-Code `Tumor board Consult note` (85232-7) enthalten sein, um zu kennzeichnen, dass es sich um eine Empfehlung des Tumorboards handelt. Weitere Categories können zusätzlich angegeben werden.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "script10.6",
    "uri" : "http://ncpdp.org/SCRIPT10_6",
    "name" : "Mapping to NCPDP SCRIPT 10.6"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "MedicationRequest",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/MedicationRequest",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "MedicationRequest",
      "path" : "MedicationRequest"
    },
    {
      "id" : "MedicationRequest.status",
      "path" : "MedicationRequest.status",
      "mustSupport" : true
    },
    {
      "id" : "MedicationRequest.intent",
      "path" : "MedicationRequest.intent",
      "mustSupport" : true
    },
    {
      "id" : "MedicationRequest.category",
      "path" : "MedicationRequest.category",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "rules" : "open"
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "MedicationRequest.category:tumorboardConsult",
      "path" : "MedicationRequest.category",
      "sliceName" : "tumorboardConsult",
      "min" : 1,
      "max" : "1",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "85232-7",
          "display" : "Tumor board Consult note"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "MedicationRequest.medication[x]",
      "path" : "MedicationRequest.medication[x]",
      "mustSupport" : true
    },
    {
      "id" : "MedicationRequest.subject",
      "path" : "MedicationRequest.subject",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "MedicationRequest.requester",
      "path" : "MedicationRequest.requester",
      "mustSupport" : true
    },
    {
      "id" : "MedicationRequest.performer",
      "path" : "MedicationRequest.performer",
      "mustSupport" : true
    }]
  }
}

```
