# Onkologisches Therapieziel - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Ressourcenprofil: Onkologisches Therapieziel 

 
Strukturiertes onkologisches Therapieziel auf Basis von `Goal`. 
Das Profil ist an den **HL7 FHIR US Multiple Chronic Conditions (MCC) eCare Plan** ([MCCGoal](https://build.fhir.org/ig/HL7/fhir-us-mcc/StructureDefinition-MCCGoal.html)) angelehnt: Das Therapieziel ist eine eigenständige, referenzbasierte Ressource, die über `addresses` mit den adressierten Erkrankungen und über `outcomeReference` mit beobachteten Ergebnissen (Verlaufs-Observations) verknüpft wird. 
Onkologiespezifische Ergänzungen gegenüber MCC: 
* Die Zielart wird über `category` aus `OnkoTherapyGoalTypeVS` codiert (Heilung, Lebensverlängerung, Symptomkontrolle, Lebensqualität, Funktionserhalt, Studienteilnahme).
* Über die Extension `onko-therapy-intent` kann zusätzlich die Therapieintention der zugehörigen Behandlungslinie hinterlegt werden.
* `outcomeReference` bindet das Ziel an Verlaufs-Observations (z. B. mCODE CancerDiseaseStatus / Response Assessment), wodurch das Tumoransprechen auf das Ziel bezogen ausgewertet werden kann.
 
`achievementStatus` bildet — analog MCC — den Erreichungsgrad bzw. die Zielakzeptanz ab (z. B. erreicht, in Bearbeitung, nicht erreicht). 

**Usages:**

* Refer to this Profile: [Onkologischer CarePlan](StructureDefinition-onko-care-plan.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.bih-cei.therapieziele-onkologie|current/StructureDefinition/StructureDefinition-onko-therapy-goal.json)

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

#### Terminology Bindings (Differential)

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Goal](http://hl7.org/fhir/R4/goal.html) 

** Summary **

Mandatory: 1 element
 Must-Support: 13 elements

**Extensions**

This structure refers to these extensions:

* [https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent](StructureDefinition-onko-therapy-intent.md)

 **Schlüsselelemente-Ansicht** 

#### Terminology Bindings

#### Constraints

 **Differential-Ansicht** 

Diese Struktur ist abgeleitet von [Goal](http://hl7.org/fhir/R4/goal.html) 

#### Terminology Bindings (Differential)

 **Snapshot-AnsichtView** 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Goal](http://hl7.org/fhir/R4/goal.html) 

** Summary **

Mandatory: 1 element
 Must-Support: 13 elements

**Extensions**

This structure refers to these extensions:

* [https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent](StructureDefinition-onko-therapy-intent.md)

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-onko-therapy-goal.csv), [Excel](../StructureDefinition-onko-therapy-goal.xlsx), [Schematron](../StructureDefinition-onko-therapy-goal.sch) 



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
  "date" : "2026-06-18T08:56:30+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Strukturiertes onkologisches Therapieziel auf Basis von `Goal`.\n\nDas Profil ist an den **HL7 FHIR US Multiple Chronic Conditions (MCC) eCare Plan**\n([MCCGoal](https://build.fhir.org/ig/HL7/fhir-us-mcc/StructureDefinition-MCCGoal.html))\nangelehnt: Das Therapieziel ist eine eigenständige, referenzbasierte Ressource, die über\n`addresses` mit den adressierten Erkrankungen und über `outcomeReference` mit beobachteten\nErgebnissen (Verlaufs-Observations) verknüpft wird.\n\nOnkologiespezifische Ergänzungen gegenüber MCC:\n- Die Zielart wird über `category` aus `OnkoTherapyGoalTypeVS` codiert (Heilung,\n  Lebensverlängerung, Symptomkontrolle, Lebensqualität, Funktionserhalt, Studienteilnahme).\n- Über die Extension `onko-therapy-intent` kann zusätzlich die Therapieintention der\n  zugehörigen Behandlungslinie hinterlegt werden.\n- `outcomeReference` bindet das Ziel an Verlaufs-Observations (z. B. mCODE\n  CancerDiseaseStatus / Response Assessment), wodurch das Tumoransprechen auf das Ziel\n  bezogen ausgewertet werden kann.\n\n`achievementStatus` bildet — analog MCC — den Erreichungsgrad bzw. die Zielakzeptanz ab\n(z. B. erreicht, in Bearbeitung, nicht erreicht).",
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
      "id" : "Goal.achievementStatus",
      "path" : "Goal.achievementStatus",
      "mustSupport" : true
    },
    {
      "id" : "Goal.category",
      "path" : "Goal.category",
      "min" : 1,
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-therapy-goal-type"
      }
    },
    {
      "id" : "Goal.priority",
      "path" : "Goal.priority",
      "mustSupport" : true
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
      "id" : "Goal.target.measure",
      "path" : "Goal.target.measure",
      "mustSupport" : true
    },
    {
      "id" : "Goal.target.detail[x]",
      "path" : "Goal.target.detail[x]",
      "mustSupport" : true
    },
    {
      "id" : "Goal.target.due[x]",
      "path" : "Goal.target.due[x]",
      "mustSupport" : true
    },
    {
      "id" : "Goal.expressedBy",
      "path" : "Goal.expressedBy",
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
      "id" : "Goal.outcomeReference",
      "path" : "Goal.outcomeReference",
      "mustSupport" : true
    }]
  }
}

```
