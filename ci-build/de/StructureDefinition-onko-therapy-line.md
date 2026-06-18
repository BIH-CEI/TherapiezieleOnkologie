# Onkologische Therapielinie - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Ressourcenprofil: Onkologische Therapielinie 

 
Eine onkologische Therapielinie (Line of Therapy, LoT) auf Basis von `EpisodeOfCare`, EnLiST-konform. Eine Therapielinie ist ein Behandlungsabschnitt mit einer bestimmten Intention und einer definierten Tumorerkrankung, der durch ein klinisches Ereignis (Progress, Toxizität, Patientenwunsch, Studienende, geplanter Wechsel) beendet wird. Die Verbindung zu einem `OnkoCarePlan` erfolgt über `CarePlan.encounter` → `Encounter.episodeOfCare` oder die Standard-Extension `workflow-episodeOfCare`. 

**Usages:**

* This Profile is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.bih-cei.therapieziele-onkologie|current/StructureDefinition/StructureDefinition-onko-therapy-line.json)

### Formale Ansichten des Profilinhalts

 [Beschreibung von Profilen, Differentials, Snapshots und deren Repräsentationen](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Schlüsselelemente-Tabelle](#tabs-key) 
*  [Differential-Tabelle](#tabs-diff) 
*  [Snapshot-Tabelle](#tabs-snap) 
*  [Statistiken/Referenzen](#tabs-summ) 
*  [Alle](#tabs-all) 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [EpisodeOfCare](http://hl7.org/fhir/R4/episodeofcare.html) 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [EpisodeOfCare](http://hl7.org/fhir/R4/episodeofcare.html) 

** Summary **

Mandatory: 4 elements
 Must-Support: 11 elements

**Extensions**

This structure refers to these extensions:

* [https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent](StructureDefinition-onko-therapy-intent.md)

 **Schlüsselelemente-Ansicht** 

#### Terminology Bindings

#### Constraints

 **Differential-Ansicht** 

Diese Struktur ist abgeleitet von [EpisodeOfCare](http://hl7.org/fhir/R4/episodeofcare.html) 

 **Snapshot-AnsichtView** 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [EpisodeOfCare](http://hl7.org/fhir/R4/episodeofcare.html) 

** Summary **

Mandatory: 4 elements
 Must-Support: 11 elements

**Extensions**

This structure refers to these extensions:

* [https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent](StructureDefinition-onko-therapy-intent.md)

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-onko-therapy-line.csv), [Excel](../StructureDefinition-onko-therapy-line.xlsx), [Schematron](../StructureDefinition-onko-therapy-line.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "onko-therapy-line",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-line",
  "version" : "0.1.0",
  "name" : "OnkoTherapyLine",
  "title" : "Onkologische Therapielinie",
  "status" : "draft",
  "date" : "2026-06-18T08:56:30+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Eine onkologische Therapielinie (Line of Therapy, LoT) auf Basis von `EpisodeOfCare`, EnLiST-konform. Eine Therapielinie ist ein Behandlungsabschnitt mit einer bestimmten Intention und einer definierten Tumorerkrankung, der durch ein klinisches Ereignis (Progress, Toxizität, Patientenwunsch, Studienende, geplanter Wechsel) beendet wird. Die Verbindung zu einem `OnkoCarePlan` erfolgt über `CarePlan.encounter` → `Encounter.episodeOfCare` oder die Standard-Extension `workflow-episodeOfCare`.",
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
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "EpisodeOfCare",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/EpisodeOfCare",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "EpisodeOfCare",
      "path" : "EpisodeOfCare"
    },
    {
      "id" : "EpisodeOfCare.extension",
      "path" : "EpisodeOfCare.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      },
      "min" : 1
    },
    {
      "id" : "EpisodeOfCare.extension:therapyIntent",
      "path" : "EpisodeOfCare.extension",
      "sliceName" : "therapyIntent",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "EpisodeOfCare.status",
      "path" : "EpisodeOfCare.status",
      "mustSupport" : true
    },
    {
      "id" : "EpisodeOfCare.diagnosis",
      "path" : "EpisodeOfCare.diagnosis",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "EpisodeOfCare.diagnosis.condition",
      "path" : "EpisodeOfCare.diagnosis.condition",
      "mustSupport" : true
    },
    {
      "id" : "EpisodeOfCare.diagnosis.role",
      "path" : "EpisodeOfCare.diagnosis.role",
      "mustSupport" : true
    },
    {
      "id" : "EpisodeOfCare.diagnosis.rank",
      "path" : "EpisodeOfCare.diagnosis.rank",
      "mustSupport" : true
    },
    {
      "id" : "EpisodeOfCare.patient",
      "path" : "EpisodeOfCare.patient",
      "mustSupport" : true
    },
    {
      "id" : "EpisodeOfCare.managingOrganization",
      "path" : "EpisodeOfCare.managingOrganization",
      "mustSupport" : true
    },
    {
      "id" : "EpisodeOfCare.period",
      "path" : "EpisodeOfCare.period",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "EpisodeOfCare.careManager",
      "path" : "EpisodeOfCare.careManager",
      "mustSupport" : true
    },
    {
      "id" : "EpisodeOfCare.team",
      "path" : "EpisodeOfCare.team",
      "mustSupport" : true
    }]
  }
}

```
