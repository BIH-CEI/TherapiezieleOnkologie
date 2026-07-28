# Onkologische Diagnose (Condition) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Resource Profile: Onkologische Diagnose (Condition) 

 
Oncological tumor condition based on the MII core data set module Oncology – MII PR Onkologie Diagnose Primärtumor, version 2026.0.3. The profile inherits the full oncological diagnosis model – ICD-10-GM, ICD-O-3 topography and morphology, diagnostic certainty per oBDS, laterality, date of diagnosis – and serves as the addressed condition for OnkoCarePlan and OnkoTherapyGoal. No additional constraints are added for the therapy-goal domain. 

**Usages:**

* Refer to this Profile: [Onkologischer CarePlan](StructureDefinition-onko-care-plan.md), [Diagnostischer CarePlan](StructureDefinition-onko-diagnostic-care-plan.md), [Onkologisches Therapieziel](StructureDefinition-onko-therapy-goal.md) and [Onkologische Therapielinie](StructureDefinition-onko-therapy-line.md)
* Examples for this Profile: [Condition/ConditionCRC](Condition-ConditionCRC.md) and [Condition/ConditionMamma](Condition-ConditionMamma.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.bih-cei.therapieziele-onkologie|current/StructureDefinition/StructureDefinition-onko-condition.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-onko-condition.csv), [Excel](../StructureDefinition-onko-condition.xlsx), [Schematron](../StructureDefinition-onko-condition.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "onko-condition",
  "extension" : [{
    "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-ex-meta-license-codeable",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://hl7.org/fhir/spdx-license",
        "code" : "CC-BY-4.0",
        "display" : "Creative Commons Attribution 4.0 International"
      }]
    }
  }],
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-condition",
  "version" : "0.1.0",
  "name" : "OnkoCondition",
  "title" : "Onkologische Diagnose (Condition)",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Oncological diagnosis condition"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "draft",
  "date" : "2026-07-28T00:29:57+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Onkologische Tumorerkrankung auf Basis des **MII Kerndatensatz-Moduls Onkologie**\n([MII PR Onkologie Diagnose Primärtumor](https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-diagnose-primaertumor),\nVersion 2026.0.3).\n\nDieses Profil erbt das vollständige onkologische Diagnosemodell des MII KDS (ICD-10-GM,\nICD-O-3 Topographie/Morphologie, Diagnosesicherung gemäß oBDS, Seitenlokalisation,\nFeststellungsdatum) und dient als adressierte Erkrankung (`addresses`) für `OnkoCarePlan`\nund `OnkoTherapyGoal`. Damit wird die Therapieziel-Spezifikation an den nationalen\nOnkologie-Kerndatensatz angeschlossen, statt ein eigenes Condition-Modell zu definieren.\n\nFür die Therapieziel-Domäne werden keine zusätzlichen Einschränkungen vorgenommen; das\nProfil dokumentiert lediglich die explizite Wiederverwendung und stellt einen stabilen\nlokalen Canonical bereit, auf den die übrigen Profile referenzieren.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Oncological tumor condition based on the MII core data set module Oncology – MII PR Onkologie Diagnose Primärtumor, version 2026.0.3. The profile inherits the full oncological diagnosis model – ICD-10-GM, ICD-O-3 topography and morphology, diagnostic certainty per oBDS, laterality, date of diagnosis – and serves as the addressed condition for OnkoCarePlan and OnkoTherapyGoal. No additional constraints are added for the therapy-goal domain."
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "MII-FHIR-to-MVGenomSeq",
    "name" : "Onkologie LogicalModel MII Onkologie Mapping"
  },
  {
    "identity" : "oBDS",
    "name" : "Mapping FHIR zu oBDS"
  },
  {
    "identity" : "LogicalModel",
    "name" : "FHIR-Profil zu LogicalModel Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Condition",
  "baseDefinition" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-diagnose-primaertumor",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Condition",
      "path" : "Condition"
    }]
  }
}

```
