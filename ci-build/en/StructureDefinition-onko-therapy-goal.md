# Onkologisches Therapieziel - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Resource Profile: Onkologisches Therapieziel 

 
Strukturiertes onkologisches Therapieziel auf Basis von `Goal`. Die Zielart wird über `category` codiert (Heilung, Lebensverlängerung, Symptomkontrolle, Lebensqualität, Funktionserhalt, Studienteilnahme). Über die Extension `onko-therapy-intent` kann zusätzlich die Therapieintention der zugehörigen Behandlungslinie hinterlegt werden. Das Ziel referenziert über `addresses` die adressierte Tumorerkrankung und kann über `Goal.outcomeReference` an Verlaufs-Observations (z. B. mCODE CancerDiseaseStatus) gebunden werden. 

**Usages:**

* Refer to this Profile: [Onkologischer CarePlan](StructureDefinition-onko-care-plan.md) and [Onkologische Therapielinie](StructureDefinition-onko-therapy-line.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.bih-cei.therapieziele-onkologie|current/StructureDefinition/StructureDefinition-onko-therapy-goal.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-onko-therapy-goal.csv), [Excel](../StructureDefinition-onko-therapy-goal.xlsx), [Schematron](../StructureDefinition-onko-therapy-goal.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "onko-therapy-goal",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-goal",
  "version" : "0.1.0",
  "name" : "OnkoTherapyGoal",
  "title" : "Onkologisches Therapieziel",
  "status" : "draft",
  "date" : "2026-06-15T08:15:17+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Strukturiertes onkologisches Therapieziel auf Basis von `Goal`. Die Zielart wird über `category` codiert (Heilung, Lebensverlängerung, Symptomkontrolle, Lebensqualität, Funktionserhalt, Studienteilnahme). Über die Extension `onko-therapy-intent` kann zusätzlich die Therapieintention der zugehörigen Behandlungslinie hinterlegt werden. Das Ziel referenziert über `addresses` die adressierte Tumorerkrankung und kann über `Goal.outcomeReference` an Verlaufs-Observations (z. B. mCODE CancerDiseaseStatus) gebunden werden.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
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
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Goal",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Goal",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Goal",
      "path" : "Goal"
    },
    {
      "id" : "Goal.extension",
      "path" : "Goal.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Goal.extension:therapyIntent",
      "path" : "Goal.extension",
      "sliceName" : "therapyIntent",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent"]
      }]
    },
    {
      "id" : "Goal.lifecycleStatus",
      "path" : "Goal.lifecycleStatus",
      "mustSupport" : true
    },
    {
      "id" : "Goal.category",
      "path" : "Goal.category",
      "min" : 1,
      "mustSupport" : true,
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-therapy-goal-type"
      }
    },
    {
      "id" : "Goal.description",
      "path" : "Goal.description",
      "mustSupport" : true
    },
    {
      "id" : "Goal.subject",
      "path" : "Goal.subject",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Goal.start[x]",
      "path" : "Goal.start[x]",
      "mustSupport" : true
    },
    {
      "id" : "Goal.target",
      "path" : "Goal.target",
      "mustSupport" : true
    },
    {
      "id" : "Goal.addresses",
      "path" : "Goal.addresses",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Condition"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Goal.outcomeCode",
      "path" : "Goal.outcomeCode",
      "mustSupport" : true
    },
    {
      "id" : "Goal.outcomeReference",
      "path" : "Goal.outcomeReference",
      "mustSupport" : true
    }]
  }
}

```
