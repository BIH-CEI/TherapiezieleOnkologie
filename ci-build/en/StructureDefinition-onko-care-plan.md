# Onkologischer CarePlan - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Resource Profile: Onkologischer CarePlan 

 
Oncological care plan based on CarePlan, architecturally aligned with the HL7 FHIR US MCC eCare Plan. The care plan is the central, consensus-driven steering object bringing together addressed conditions, overarching goals and planned versus performed activities of the care teams. 

**Usages:**

* Examples for this Profile: [CarePlan/CarePlanCRCPalliativ](CarePlan-CarePlanCRCPalliativ.md), [CarePlan/CarePlanMammaNachsorge](CarePlan-CarePlanMammaNachsorge.md) and [CarePlan/CarePlanMammaNeoadjuvant](CarePlan-CarePlanMammaNeoadjuvant.md)

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
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Oncological care plan"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "draft",
  "date" : "2026-07-28T09:41:52+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Onkologischer Versorgungsplan auf Basis von `CarePlan`.\n\nDas Profil ist architektonisch an den **HL7 FHIR US Multiple Chronic Conditions (MCC) eCare Plan**\n([MCCCarePlan](https://build.fhir.org/ig/HL7/fhir-us-mcc/StructureDefinition-mccCarePlan.html))\nangelehnt: Der CarePlan ist das zentrale, konsensbasierte Steuerobjekt, das adressierte\nErkrankungen (`addresses`), übergeordnete Ziele (`goal`) sowie geplante und durchgeführte\nMaßnahmen (`activity`) verschiedener Versorgungsteams zusammenführt.\n\nOnkologiespezifische Ergänzungen gegenüber MCC:\n- Therapieintention über die Extension `onko-therapy-intent` (kurativ, neoadjuvant, adjuvant,\n  Erhaltung, palliativ, supportiv).\n- `goal` referenziert das Profil `OnkoTherapyGoal`.\n- Therapielinien (`OnkoTherapyLine`, Basis `EpisodeOfCare`) werden über `CarePlan.encounter`\n  bzw. die Standard-Extension `workflow-episodeOfCare` verknüpft.\n\nIm Fallback-Pfad (keine computable Leitlinie) ist der CarePlan die führende Repräsentation des\nrealen Versorgungsverlaufs; im Primärpfad referenziert er via `instantiatesCanonical` eine\n`PlanDefinition` aus dem CPG-on-FHIR-Stack.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Oncological care plan based on CarePlan, architecturally aligned with the HL7 FHIR US MCC eCare Plan. The care plan is the central, consensus-driven steering object bringing together addressed conditions, overarching goals and planned versus performed activities of the care teams."
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
      "definition" : "Strukturierte Therapieintention des Versorgungsplans – Hauptintention und optionale Behandlungsphase.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Structured therapy intent of the care plan – main intent and optional treatment phase."
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
      "id" : "CarePlan.extension:custodian",
      "path" : "CarePlan.extension",
      "sliceName" : "custodian",
      "short" : "Custodian",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Custodian"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Für Pflege und Aktualisierung des Plans verantwortliche Stelle – R5-Backport aus MCC.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Party responsible for maintaining the care plan – R5 backport adopted from MCC."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-careplan-custodian"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.instantiatesCanonical",
      "path" : "CarePlan.instantiatesCanonical",
      "short" : "Zugrunde liegende PlanDefinition",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Instantiates canonical"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz auf eine PlanDefinition aus dem CPG-on-FHIR-Stack, die der Plan umsetzt.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Reference to a PlanDefinition from the CPG-on-FHIR stack that the plan instantiates."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.status",
      "path" : "CarePlan.status",
      "short" : "Status",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Status"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Status des Versorgungsplans – z. B. draft, active, completed, revoked.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Status of the care plan – e.g. draft, active, completed, revoked."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.category",
      "path" : "CarePlan.category",
      "short" : "Plan-Kategorie",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Plan category"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Art bzw. Kategorie des Versorgungsplans.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Type or category of the care plan."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.subject",
      "path" : "CarePlan.subject",
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
      "definition" : "Person, für die der Versorgungsplan erstellt wird.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "The person the care plan is created for."
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
      "id" : "CarePlan.period",
      "path" : "CarePlan.period",
      "short" : "Geltungszeitraum",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Period"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Zeitraum, in dem der Versorgungsplan gültig ist.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Period during which the care plan is valid."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    {
      "id" : "CarePlan.author",
      "path" : "CarePlan.author",
      "short" : "Autor/in",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Author"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Für den Plan verantwortliche autorisierende Person oder Stelle.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Person or party responsible for authoring the plan."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    {
      "id" : "CarePlan.contributor",
      "path" : "CarePlan.contributor",
      "short" : "Beteiligte",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Contributor"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Personen oder Organisationen, die zum Plan beigetragen haben.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "People or organizations that contributed to the plan."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.careTeam",
      "path" : "CarePlan.careTeam",
      "short" : "Behandlungsteam",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Care team"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "An der Versorgung beteiligte Teams – z. B. Tumorboard.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Care teams involved in the care – e.g. tumor board."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.addresses",
      "path" : "CarePlan.addresses",
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
      "definition" : "Referenz auf die vom Plan adressierte Tumorerkrankung OnkoCondition.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Reference to the tumor condition addressed by the plan OnkoCondition."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
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
      "short" : "Ergänzende Information",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Supporting information"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Ergänzende Informationen zum Plan – z. B. Verweis auf den Diagnostik-CarePlan.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Supporting information for the plan – e.g. reference to the diagnostic care plan."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.goal",
      "path" : "CarePlan.goal",
      "short" : "Therapieziele",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Goals"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz auf die übergeordneten onkologischen Therapieziele OnkoTherapyGoal.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Reference to the overarching oncological therapy goals OnkoTherapyGoal."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-goal"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.activity",
      "path" : "CarePlan.activity",
      "short" : "Maßnahmen",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Activities"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Geplante bzw. durchgeführte Maßnahmen des Versorgungsplans.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Planned or performed activities of the care plan."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.activity.outcomeReference",
      "path" : "CarePlan.activity.outcomeReference",
      "short" : "Durchgeführte Maßnahme",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Performed activity"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz auf eine durchgeführte Maßnahme bzw. ein dokumentiertes Ergebnis – z. B. Procedure oder Observation.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Reference to a performed activity or documented outcome – e.g. Procedure or Observation."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
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
      "short" : "Geplante Maßnahme",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Planned activity"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz auf eine geplante Maßnahme – z. B. MedicationRequest oder ServiceRequest, auch als Tumorboard-Empfehlung.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Reference to a planned activity – e.g. MedicationRequest or ServiceRequest, also as a tumor board recommendation."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Appointment",
        "http://hl7.org/fhir/StructureDefinition/MedicationRequest",
        "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-tumorboard-medication-request",
        "http://hl7.org/fhir/StructureDefinition/NutritionOrder",
        "http://hl7.org/fhir/StructureDefinition/Task",
        "http://hl7.org/fhir/StructureDefinition/ServiceRequest",
        "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-tumorboard-service-request",
        "http://hl7.org/fhir/StructureDefinition/RequestGroup"]
      }],
      "mustSupport" : true
    }]
  }
}

```
