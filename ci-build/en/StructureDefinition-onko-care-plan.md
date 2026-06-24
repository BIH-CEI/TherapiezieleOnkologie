# Onkologischer CarePlan - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Resource Profile: Onkologischer CarePlan 

 
Onkologischer Versorgungsplan auf Basis von `CarePlan`. 
Das Profil ist architektonisch an den **HL7 FHIR US Multiple Chronic Conditions (MCC) eCare Plan** ([MCCCarePlan](https://build.fhir.org/ig/HL7/fhir-us-mcc/StructureDefinition-mccCarePlan.html)) angelehnt: Der CarePlan ist das zentrale, konsensbasierte Steuerobjekt, das adressierte Erkrankungen (`addresses`), übergeordnete Ziele (`goal`) sowie geplante und durchgeführte Maßnahmen (`activity`) verschiedener Versorgungsteams zusammenführt. 
Onkologiespezifische Ergänzungen gegenüber MCC: 
* Therapieintention über die Extension `onko-therapy-intent` (kurativ, neoadjuvant, adjuvant, Erhaltung, palliativ, supportiv).
* `goal` referenziert das Profil `OnkoTherapyGoal`.
* Therapielinien (`OnkoTherapyLine`, Basis `EpisodeOfCare`) werden über `CarePlan.encounter` bzw. die Standard-Extension `workflow-episodeOfCare` verknüpft.
 
Im Fallback-Pfad (keine computable Leitlinie) ist der CarePlan die führende Repräsentation des realen Versorgungsverlaufs; im Primärpfad referenziert er via `instantiatesCanonical` eine `PlanDefinition` aus dem CPG-on-FHIR-Stack. 

**Usages:**

* Examples for this Profile: [CarePlan/CarePlanCRCPalliativ](CarePlan-CarePlanCRCPalliativ.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.bih-cei.therapieziele-onkologie|current/StructureDefinition/StructureDefinition-onko-care-plan.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-onko-care-plan.csv), [Excel](../StructureDefinition-onko-care-plan.xlsx), [Schematron](../StructureDefinition-onko-care-plan.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "onko-care-plan",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-care-plan",
  "version" : "0.1.0",
  "name" : "OnkoCarePlan",
  "title" : "Onkologischer CarePlan",
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
  "description" : "Onkologischer Versorgungsplan auf Basis von `CarePlan`.\n\nDas Profil ist architektonisch an den **HL7 FHIR US Multiple Chronic Conditions (MCC) eCare Plan**\n([MCCCarePlan](https://build.fhir.org/ig/HL7/fhir-us-mcc/StructureDefinition-mccCarePlan.html))\nangelehnt: Der CarePlan ist das zentrale, konsensbasierte Steuerobjekt, das adressierte\nErkrankungen (`addresses`), übergeordnete Ziele (`goal`) sowie geplante und durchgeführte\nMaßnahmen (`activity`) verschiedener Versorgungsteams zusammenführt.\n\nOnkologiespezifische Ergänzungen gegenüber MCC:\n- Therapieintention über die Extension `onko-therapy-intent` (kurativ, neoadjuvant, adjuvant,\n  Erhaltung, palliativ, supportiv).\n- `goal` referenziert das Profil `OnkoTherapyGoal`.\n- Therapielinien (`OnkoTherapyLine`, Basis `EpisodeOfCare`) werden über `CarePlan.encounter`\n  bzw. die Standard-Extension `workflow-episodeOfCare` verknüpft.\n\nIm Fallback-Pfad (keine computable Leitlinie) ist der CarePlan die führende Repräsentation des\nrealen Versorgungsverlaufs; im Primärpfad referenziert er via `instantiatesCanonical` eine\n`PlanDefinition` aus dem CPG-on-FHIR-Stack.",
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
  "type" : "CarePlan",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/CarePlan",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "CarePlan",
      "path" : "CarePlan"
    },
    {
      "id" : "CarePlan.extension",
      "path" : "CarePlan.extension",
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
      "id" : "CarePlan.extension:therapyIntent",
      "path" : "CarePlan.extension",
      "sliceName" : "therapyIntent",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent"]
      }]
    },
    {
      "id" : "CarePlan.instantiatesCanonical",
      "path" : "CarePlan.instantiatesCanonical",
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.status",
      "path" : "CarePlan.status",
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.category",
      "path" : "CarePlan.category",
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.subject",
      "path" : "CarePlan.subject",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.contributor",
      "path" : "CarePlan.contributor",
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.careTeam",
      "path" : "CarePlan.careTeam",
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.addresses",
      "path" : "CarePlan.addresses",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-condition"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.supportingInfo",
      "path" : "CarePlan.supportingInfo",
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.goal",
      "path" : "CarePlan.goal",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-goal"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.activity",
      "path" : "CarePlan.activity",
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.activity.outcomeReference",
      "path" : "CarePlan.activity.outcomeReference",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Procedure",
        "http://hl7.org/fhir/StructureDefinition/Observation",
        "http://hl7.org/fhir/StructureDefinition/MedicationAdministration",
        "http://hl7.org/fhir/StructureDefinition/DiagnosticReport"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.activity.reference",
      "path" : "CarePlan.activity.reference",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Appointment",
        "http://hl7.org/fhir/StructureDefinition/MedicationRequest",
        "http://hl7.org/fhir/StructureDefinition/NutritionOrder",
        "http://hl7.org/fhir/StructureDefinition/Task",
        "http://hl7.org/fhir/StructureDefinition/ServiceRequest",
        "http://hl7.org/fhir/StructureDefinition/RequestGroup"]
      }],
      "mustSupport" : true
    }]
  }
}

```
