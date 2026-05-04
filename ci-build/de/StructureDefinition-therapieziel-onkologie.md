# Therapieziel Onkologie - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Ressourcenprofil: Therapieziel Onkologie 

 
TODO 

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.bih-cei.therapieziele-onkologie|current/StructureDefinition/therapieziel-onkologie)

### Formale Ansichten des Profilinhalts

 [Beschreibung von Profilen, Differentials, Snapshots und deren Repräsentationen](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Schlüsselelemente-Tabelle](#tabs-key) 
*  [Differential-Tabelle](#tabs-diff) 
*  [Snapshot-Tabelle](#tabs-snap) 
*  [Statistiken/Referenzen](#tabs-summ) 
*  [Alle](#tabs-all) 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Goal](http://hl7.org/fhir/R4/goal.html) 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Goal](http://hl7.org/fhir/R4/goal.html) 

** Summary **

 **Schlüsselelemente-Ansicht** 

#### Terminology Bindings

#### Constraints

 **Differential-Ansicht** 

Diese Struktur ist abgeleitet von [Goal](http://hl7.org/fhir/R4/goal.html) 

 **Snapshot-AnsichtView** 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Goal](http://hl7.org/fhir/R4/goal.html) 

** Summary **

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-therapieziel-onkologie.csv), [Excel](../StructureDefinition-therapieziel-onkologie.xlsx), [Schematron](../StructureDefinition-therapieziel-onkologie.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "therapieziel-onkologie",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/therapieziel-onkologie",
  "version" : "0.1.0",
  "name" : "TherapiezielOnkologie",
  "title" : "Therapieziel Onkologie",
  "status" : "draft",
  "date" : "2026-05-04T08:07:29+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "TODO",
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
    }]
  }
}

```
