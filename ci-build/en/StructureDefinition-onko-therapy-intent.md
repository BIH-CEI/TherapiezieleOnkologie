# Onkologische Therapieintention (Extension) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Extension: Onkologische Therapieintention (Extension) 

Strukturierte Codierung der Therapieintention (kurativ, neoadjuvant, adjuvant, Erhaltung, palliativ, supportiv). Verwendet in OnkoCarePlan und OnkoTherapyLine. Konzeptionell anschlussfähig an mCODE `procedure-intent`.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Onkologischer CarePlan](StructureDefinition-onko-care-plan.md), [Onkologisches Therapieziel](StructureDefinition-onko-therapy-goal.md) and [Onkologische Therapielinie](StructureDefinition-onko-therapy-line.md)
* Examples for this Extension: [CarePlan/CarePlanCRCPalliativ](CarePlan-CarePlanCRCPalliativ.md), [EpisodeOfCare/TherapielinieCRCErstlinie](EpisodeOfCare-TherapielinieCRCErstlinie.md) and [Goal/TherapiezielCRCLebensverlaengerung](Goal-TherapiezielCRCLebensverlaengerung.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.bih-cei.therapieziele-onkologie|current/StructureDefinition/StructureDefinition-onko-therapy-intent.json)

### Formal Views of Extension Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-onko-therapy-intent.csv), [Excel](../StructureDefinition-onko-therapy-intent.xlsx), [Schematron](../StructureDefinition-onko-therapy-intent.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "onko-therapy-intent",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent",
  "version" : "0.1.0",
  "name" : "OnkoTherapyIntentExt",
  "title" : "Onkologische Therapieintention (Extension)",
  "status" : "draft",
  "date" : "2026-06-24T07:38:46+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Strukturierte Codierung der Therapieintention (kurativ, neoadjuvant, adjuvant, Erhaltung, palliativ, supportiv). Verwendet in OnkoCarePlan und OnkoTherapyLine. Konzeptionell anschlussfähig an mCODE `procedure-intent`.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "CarePlan"
  },
  {
    "type" : "element",
    "expression" : "Goal"
  },
  {
    "type" : "element",
    "expression" : "EpisodeOfCare"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Onkologische Therapieintention (Extension)",
      "definition" : "Strukturierte Codierung der Therapieintention (kurativ, neoadjuvant, adjuvant, Erhaltung, palliativ, supportiv). Verwendet in OnkoCarePlan und OnkoTherapyLine. Konzeptionell anschlussfähig an mCODE `procedure-intent`."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-therapy-intent"
      }
    }]
  }
}

```
