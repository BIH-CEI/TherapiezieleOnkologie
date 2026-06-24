# Onkologische Diagnose (Condition) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Resource Profile: Onkologische Diagnose (Condition) 

 
Onkologische Tumorerkrankung auf Basis des **MII Kerndatensatz-Moduls Onkologie** ([MII PR Onkologie Diagnose Primärtumor](https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-diagnose-primaertumor), Version 2026.0.3). 
Dieses Profil erbt das vollständige onkologische Diagnosemodell des MII KDS (ICD-10-GM, ICD-O-3 Topographie/Morphologie, Diagnosesicherung gemäß oBDS, Seitenlokalisation, Feststellungsdatum) und dient als adressierte Erkrankung (`addresses`) für `OnkoCarePlan` und `OnkoTherapyGoal`. Damit wird die Therapieziel-Spezifikation an den nationalen Onkologie-Kerndatensatz angeschlossen, statt ein eigenes Condition-Modell zu definieren. 
Für die Therapieziel-Domäne werden keine zusätzlichen Einschränkungen vorgenommen; das Profil dokumentiert lediglich die explizite Wiederverwendung und stellt einen stabilen lokalen Canonical bereit, auf den die übrigen Profile referenzieren. 

**Usages:**

* Refer to this Profile: [Onkologischer CarePlan](StructureDefinition-onko-care-plan.md), [Onkologisches Therapieziel](StructureDefinition-onko-therapy-goal.md) and [Onkologische Therapielinie](StructureDefinition-onko-therapy-line.md)
* Examples for this Profile: [Condition/ConditionCRC](Condition-ConditionCRC.md)

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
  "description" : "Onkologische Tumorerkrankung auf Basis des **MII Kerndatensatz-Moduls Onkologie**\n([MII PR Onkologie Diagnose Primärtumor](https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-diagnose-primaertumor),\nVersion 2026.0.3).\n\nDieses Profil erbt das vollständige onkologische Diagnosemodell des MII KDS (ICD-10-GM,\nICD-O-3 Topographie/Morphologie, Diagnosesicherung gemäß oBDS, Seitenlokalisation,\nFeststellungsdatum) und dient als adressierte Erkrankung (`addresses`) für `OnkoCarePlan`\nund `OnkoTherapyGoal`. Damit wird die Therapieziel-Spezifikation an den nationalen\nOnkologie-Kerndatensatz angeschlossen, statt ein eigenes Condition-Modell zu definieren.\n\nFür die Therapieziel-Domäne werden keine zusätzlichen Einschränkungen vorgenommen; das\nProfil dokumentiert lediglich die explizite Wiederverwendung und stellt einen stabilen\nlokalen Canonical bereit, auf den die übrigen Profile referenzieren.",
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
