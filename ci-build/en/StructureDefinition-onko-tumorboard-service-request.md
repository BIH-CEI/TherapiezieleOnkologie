# Tumorboard ServiceRequest - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Resource Profile: Tumorboard ServiceRequest 

 
Strukturierte Empfehlung des Tumorboards auf Basis von `ServiceRequest`. 
Tumorboardspezifische Ergänzung: 
* Im Element `category` muss der LOINC-Code `Tumor board Consult note` (85232-7) enthalten sein, um zu kennzeichnen, dass es sich um eine Empfehlung des Tumorboards handelt. Weitere Categories können zusätzlich angegeben werden.
 

**Usages:**

* Refer to this Profile: [Onkologischer CarePlan](StructureDefinition-onko-care-plan.md)
* Examples for this Profile: [ServiceRequest/ServiceRequestPortCRC](ServiceRequest-ServiceRequestPortCRC.md) and [ServiceRequest/ServiceRequestProcedure](ServiceRequest-ServiceRequestProcedure.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.bih-cei.therapieziele-onkologie|current/StructureDefinition/StructureDefinition-onko-tumorboard-service-request.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-onko-tumorboard-service-request.csv), [Excel](../StructureDefinition-onko-tumorboard-service-request.xlsx), [Schematron](../StructureDefinition-onko-tumorboard-service-request.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "onko-tumorboard-service-request",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-tumorboard-service-request",
  "version" : "0.1.0",
  "name" : "TumorboardServiceRequest",
  "title" : "Tumorboard ServiceRequest",
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
  "description" : "Strukturierte Empfehlung des Tumorboards auf Basis von `ServiceRequest`.\n\nTumorboardspezifische Ergänzung:\n- Im Element `category` muss der LOINC-Code `Tumor board Consult note` (85232-7) enthalten sein, um zu kennzeichnen, dass es sich um eine Empfehlung des Tumorboards handelt. Weitere Categories können zusätzlich angegeben werden.",
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
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
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
    "identity" : "quick",
    "uri" : "http://siframework.org/cqf",
    "name" : "Quality Improvement and Clinical Knowledge (QUICK)"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "ServiceRequest",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/ServiceRequest",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "ServiceRequest",
      "path" : "ServiceRequest"
    },
    {
      "id" : "ServiceRequest.status",
      "path" : "ServiceRequest.status",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.intent",
      "path" : "ServiceRequest.intent",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.category",
      "path" : "ServiceRequest.category",
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
      "id" : "ServiceRequest.category:tumorboardConsult",
      "path" : "ServiceRequest.category",
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
      "id" : "ServiceRequest.code",
      "path" : "ServiceRequest.code",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.subject",
      "path" : "ServiceRequest.subject",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.requester",
      "path" : "ServiceRequest.requester",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.performer",
      "path" : "ServiceRequest.performer",
      "mustSupport" : true
    }]
  }
}

```
