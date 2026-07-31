# Onkologisches Therapieziel - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.1

## Ressourcenprofil: Onkologisches Therapieziel 

 
Strukturiertes onkologisches Therapieziel auf Basis von `Goal`. 
Das Profil ist an den **HL7 FHIR US Multiple Chronic Conditions (MCC) eCare Plan** ([MCCGoal](https://build.fhir.org/ig/HL7/fhir-us-mcc/StructureDefinition-MCCGoal.html)) angelehnt: Das Therapieziel ist eine eigenständige, referenzbasierte Ressource, die über `addresses` mit den adressierten Erkrankungen und über `outcomeReference` mit beobachteten Ergebnissen (Verlaufs-Observations) verknüpft wird. 
Onkologiespezifische Ergänzungen gegenüber MCC: 
* Die Zielart wird über `category` aus `OnkoTherapyGoalTypeVS` codiert (Heilung, Lebensverlängerung, Symptomkontrolle, Lebensqualität, Funktionserhalt).
* Über die Extension `onko-therapy-intent` kann zusätzlich die Therapieintention der zugehörigen Behandlungslinie hinterlegt werden.
* `outcomeReference` bindet das Ziel an Verlaufs-Observations (z. B. mCODE CancerDiseaseStatus / Response Assessment), wodurch das Tumoransprechen auf das Ziel bezogen ausgewertet werden kann.
 
`achievementStatus` bildet — analog MCC — den Erreichungsgrad bzw. die Zielakzeptanz ab (z. B. erreicht, in Bearbeitung, nicht erreicht). 

**Usages:**

* Refer to this Profile: [Onkologischer CarePlan](StructureDefinition-onko-care-plan.md) and [Diagnostischer CarePlan](StructureDefinition-onko-diagnostic-care-plan.md)
* Examples for this Profile: [Goal/DiagnosticGoal](Goal-DiagnosticGoal.md), [Goal/FollowUpGoal](Goal-FollowUpGoal.md), [Goal/TherapiezielCRCErhaltung](Goal-TherapiezielCRCErhaltung.md), [Goal/TherapiezielCRCKurativAbgelehnt](Goal-TherapiezielCRCKurativAbgelehnt.md)... Show 2 more, [Goal/TherapiezielCRCLebensverlaengerung](Goal-TherapiezielCRCLebensverlaengerung.md) and [Goal/TherapiezielMammaHeilung](Goal-TherapiezielMammaHeilung.md)

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
 Must-Support: 19 elements

**Structures**

This structure refers to these other structures:

* [Onkologische Diagnose (Condition) (https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-condition)](StructureDefinition-onko-condition.md)

**Extensions**

This structure refers to these extensions:

* [https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent](StructureDefinition-onko-therapy-intent.md)
* [http://hl7.org/fhir/StructureDefinition/goal-acceptance](http://hl7.org/fhir/extensions/5.3.0/StructureDefinition-goal-acceptance.html)
* [http://hl7.org/fhir/StructureDefinition/goal-reasonRejected](http://hl7.org/fhir/extensions/5.3.0/StructureDefinition-goal-reasonRejected.html)
* [http://hl7.org/fhir/StructureDefinition/goal-relationship](http://hl7.org/fhir/extensions/5.3.0/StructureDefinition-goal-relationship.html)

**Slices**

This structure defines the following [Slices](http://hl7.org/fhir/R4/profiling.html#slices):

* The element 1 is sliced based on the value of Goal.start[x]

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
 Must-Support: 19 elements

**Structures**

This structure refers to these other structures:

* [Onkologische Diagnose (Condition) (https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-condition)](StructureDefinition-onko-condition.md)

**Extensions**

This structure refers to these extensions:

* [https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent](StructureDefinition-onko-therapy-intent.md)
* [http://hl7.org/fhir/StructureDefinition/goal-acceptance](http://hl7.org/fhir/extensions/5.3.0/StructureDefinition-goal-acceptance.html)
* [http://hl7.org/fhir/StructureDefinition/goal-reasonRejected](http://hl7.org/fhir/extensions/5.3.0/StructureDefinition-goal-reasonRejected.html)
* [http://hl7.org/fhir/StructureDefinition/goal-relationship](http://hl7.org/fhir/extensions/5.3.0/StructureDefinition-goal-relationship.html)

**Slices**

This structure defines the following [Slices](http://hl7.org/fhir/R4/profiling.html#slices):

* The element 1 is sliced based on the value of Goal.start[x]

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-onko-therapy-goal.csv), [Excel](../StructureDefinition-onko-therapy-goal.xlsx), [Schematron](../StructureDefinition-onko-therapy-goal.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "onko-therapy-goal",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-goal",
  "version" : "1.0.0-ballot-rc.1",
  "name" : "OnkoTherapyGoal",
  "title" : "Onkologisches Therapieziel",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Oncological therapy goal"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "draft",
  "date" : "2026-07-31T13:52:27+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Strukturiertes onkologisches Therapieziel auf Basis von `Goal`.\n\nDas Profil ist an den **HL7 FHIR US Multiple Chronic Conditions (MCC) eCare Plan**\n([MCCGoal](https://build.fhir.org/ig/HL7/fhir-us-mcc/StructureDefinition-MCCGoal.html))\nangelehnt: Das Therapieziel ist eine eigenständige, referenzbasierte Ressource, die über\n`addresses` mit den adressierten Erkrankungen und über `outcomeReference` mit beobachteten\nErgebnissen (Verlaufs-Observations) verknüpft wird.\n\nOnkologiespezifische Ergänzungen gegenüber MCC:\n- Die Zielart wird über `category` aus `OnkoTherapyGoalTypeVS` codiert (Heilung,\n  Lebensverlängerung, Symptomkontrolle, Lebensqualität, Funktionserhalt).\n- Über die Extension `onko-therapy-intent` kann zusätzlich die Therapieintention der\n  zugehörigen Behandlungslinie hinterlegt werden.\n- `outcomeReference` bindet das Ziel an Verlaufs-Observations (z. B. mCODE\n  CancerDiseaseStatus / Response Assessment), wodurch das Tumoransprechen auf das Ziel\n  bezogen ausgewertet werden kann.\n\n`achievementStatus` bildet — analog MCC — den Erreichungsgrad bzw. die Zielakzeptanz ab\n(z. B. erreicht, in Bearbeitung, nicht erreicht).",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Structured oncological therapy goal based on Goal, aligned with the HL7 FHIR US MCC eCare Plan MCCGoal. The goal is a standalone reference-based resource linked to the addressed condition via addresses and to progress observations via outcomeReference."
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
      "short" : "Therapieintention",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Therapy intent"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Strukturierte Therapieintention – Hauptintention und optionale Behandlungsphase.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Structured therapy intent – main intent and optional treatment phase."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent"]
      }]
    },
    {
      "id" : "Goal.extension:acceptance",
      "path" : "Goal.extension",
      "sliceName" : "acceptance",
      "short" : "Zielakzeptanz",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Goal acceptance"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Akzeptanz und relative Priorität des Ziels durch Patient und Behandler – MCC goal-acceptance.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Acceptance and relative priority of the goal by patient and practitioners – MCC goal-acceptance."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/goal-acceptance"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Goal.extension:reasonRejected",
      "path" : "Goal.extension",
      "sliceName" : "reasonRejected",
      "short" : "Ablehnungsgrund",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Reason rejected"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Begründung, warum das Ziel nicht akzeptiert bzw. abgelehnt wurde.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Reason why the goal was not accepted or was rejected."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/goal-reasonRejected"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Goal.extension:relatedGoal",
      "path" : "Goal.extension",
      "sliceName" : "relatedGoal",
      "short" : "Zielbeziehung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Goal relationship"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Beziehung zu anderen Zielen – predecessor, successor, replacement, milestone.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Relationship to other goals – predecessor, successor, replacement, milestone."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/goal-relationship"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Goal.lifecycleStatus",
      "path" : "Goal.lifecycleStatus",
      "short" : "Lebenszyklus-Status",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Lifecycle status"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Status des Ziels im Lebenszyklus, z. B. proposed, active, completed, rejected.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "State of the goal within its lifecycle, e.g. proposed, active, completed, rejected."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Goal.achievementStatus",
      "path" : "Goal.achievementStatus",
      "short" : "Erreichungsgrad",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Achievement status"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Grad der Zielerreichung, z. B. erreicht, in Bearbeitung, nicht erreicht.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Degree of goal achievement, e.g. achieved, in progress, not achieved."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Goal.category",
      "path" : "Goal.category",
      "short" : "Zielart",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Goal category"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Art des onkologischen Therapieziels – Heilung, Lebensverlängerung, Symptomkontrolle, Lebensqualität, Funktionserhalt.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Type of oncological therapy goal – cure, life prolongation, symptom control, quality of life, preservation of function."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "mustSupport" : true,
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-therapy-goal-type"
      }
    },
    {
      "id" : "Goal.priority",
      "path" : "Goal.priority",
      "short" : "Priorität",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Priority"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Relative Priorität des Ziels bei mehreren konkurrierenden Zielen.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Relative priority of the goal among several competing goals."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Goal.description",
      "path" : "Goal.description",
      "short" : "Zielbeschreibung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Goal description"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Klartext-Beschreibung des angestrebten Ziels.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Human-readable description of the intended goal."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Goal.subject",
      "path" : "Goal.subject",
      "short" : "Patientin/Patient",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Patient"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Person, für die das Therapieziel gilt.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "The person the therapy goal applies to."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Goal.start[x]",
      "path" : "Goal.start[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      },
      "short" : "Zielbeginn",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Goal start"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Beginn des angestrebten Ziels als Datum oder codiertes Ereignis.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Start of the goal as a date or a coded event."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Goal.start[x]:startDate",
      "path" : "Goal.start[x]",
      "sliceName" : "startDate",
      "short" : "Zielbeginn als Datum",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Goal start as date"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Beginn des Ziels als Datum.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Start of the goal expressed as a date."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Goal.start[x]:startCodeableConcept",
      "path" : "Goal.start[x]",
      "sliceName" : "startCodeableConcept",
      "short" : "Zielbeginn als Code",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Goal start as code"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Beginn des Ziels als codiertes Ereignis.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Start of the goal expressed as a coded event."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Goal.target",
      "path" : "Goal.target",
      "short" : "Zielwert",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Target"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Angestrebter messbarer Zielzustand.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Intended measurable target state."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Goal.target.measure",
      "path" : "Goal.target.measure",
      "short" : "Zielparameter",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Target measure"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Parameter bzw. Messgröße, an der die Zielerreichung gemessen wird.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Parameter or measure used to assess goal attainment."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Goal.target.detail[x]",
      "path" : "Goal.target.detail[x]",
      "short" : "Zielwert-Ausprägung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Target detail"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Angestrebter Wert bzw. Wertebereich des Zielparameters.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Intended value or range of the target measure."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Goal.target.due[x]",
      "path" : "Goal.target.due[x]",
      "short" : "Zieltermin",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Target due"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Zeitpunkt bzw. Frist, bis zu der das Ziel erreicht werden soll.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Point in time or deadline by which the goal should be met."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Goal.expressedBy",
      "path" : "Goal.expressedBy",
      "short" : "Verfasser",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Expressed by"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Person, die das Ziel formuliert hat – Behandler oder Patient.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Person who expressed the goal – practitioner or patient."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Goal.addresses",
      "path" : "Goal.addresses",
      "short" : "Adressierte Erkrankung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Addressed condition"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz auf die adressierte Tumorerkrankung OnkoCondition.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Reference to the addressed tumor condition OnkoCondition."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-condition"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Goal.note",
      "path" : "Goal.note",
      "short" : "Hinweis",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Note"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Ergänzende Anmerkungen zum Ziel.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Additional comments on the goal."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    {
      "id" : "Goal.outcomeCode",
      "path" : "Goal.outcomeCode",
      "short" : "Ergebnis-Code",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Outcome code"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Codiertes Ergebnis der Zielverfolgung.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Coded outcome of pursuing the goal."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    {
      "id" : "Goal.outcomeReference",
      "path" : "Goal.outcomeReference",
      "short" : "Ergebnis-Referenz",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Outcome reference"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz auf Verlaufs-Observations, die das Tumoransprechen dokumentieren.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Reference to progress observations documenting tumor response."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    }]
  }
}

```
