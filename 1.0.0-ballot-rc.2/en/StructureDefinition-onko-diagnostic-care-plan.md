# Diagnostischer CarePlan - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.2

## Resource Profile: Diagnostischer CarePlan 

 
Care plan for tumor diagnostics based on CarePlan. Complementing the therapy care plan, it models the path to diagnosis as a structured process; diagnostic steps are represented as activities whose results are linked via activity.outcomeReference. It addresses the same tumor condition as the therapy care plan. 

**Usages:**

* Examples for this Profile: [CarePlan/CarePlanMammaDiagnostik](CarePlan-CarePlanMammaDiagnostik.md) and [CarePlan/DiagnostikCarePlanCRC](CarePlan-DiagnostikCarePlanCRC.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.bih-cei.therapieziele-onkologie|current/StructureDefinition/StructureDefinition-onko-diagnostic-care-plan.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-onko-diagnostic-care-plan.csv), [Excel](../StructureDefinition-onko-diagnostic-care-plan.xlsx), [Schematron](../StructureDefinition-onko-diagnostic-care-plan.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "onko-diagnostic-care-plan",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-diagnostic-care-plan",
  "version" : "1.0.0-ballot-rc.2",
  "name" : "DiagnosticCarePlan",
  "title" : "Diagnostischer CarePlan",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Diagnostic care plan"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "draft",
  "date" : "2026-07-31T14:32:24+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "CarePlan für die Tumordiagnostik auf Basis von `CarePlan`.\n\nErgänzend zum onkologischen Therapie-CarePlan (`OnkoCarePlan`) bildet dieses Profil den Weg\nzur Diagnosestellung als strukturierten Prozess ab. Die Schritte des Diagnosepfads werden als\nAktivitäten abgebildet, deren Ergebnisse können\nüber `activity.outcomeReference` angebunden werden.\n\nDer diagnostische CarePlan verweist über `addresses` auf die Tumordiagnose (`OnkoCondition`)\nund ist darüber mit dem Therapie-CarePlan verknüpft, der dieselbe Diagnose adressiert.\n\nDiagnostikspezifische Ergänzungen:\n- Der Plan-Typ ist über `category` verpflichtend gekennzeichnet: `category.text`\n  muss den Wert \"Tumordiagnostik\" tragen. Weitere Categories können ergänzt\n  werden. Damit sind diagnostischer und Therapie-CarePlan unterscheidbar.\n\n**Abgrenzung:** Dieses Profil beschreibt den *Prozess* der Diagnosefindung.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Care plan for tumor diagnostics based on CarePlan. Complementing the therapy care plan, it models the path to diagnosis as a structured process; diagnostic steps are represented as activities whose results are linked via activity.outcomeReference. It addresses the same tumor condition as the therapy care plan."
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
      "definition" : "Für Pflege und Aktualisierung des Diagnostik-Plans verantwortliche Stelle – R5-Backport aus MCC.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Party responsible for maintaining the diagnostic care plan – R5 backport adopted from MCC."
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
      "definition" : "Status des Diagnostik-Plans – z. B. active, completed.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Status of the diagnostic care plan – e.g. active, completed."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.intent",
      "path" : "CarePlan.intent",
      "short" : "Planart",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Intent"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Art des Plans – typischerweise plan für den Diagnostikplan.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Kind of plan – typically plan for the diagnostic care plan."
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
      "definition" : "Kennzeichnung des Plan-Typs; category.text trägt verpflichtend den Wert Tumordiagnostik.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Identification of the plan type; category.text is mandatorily set to Tumordiagnostik."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.category.text",
      "path" : "CarePlan.category.text",
      "min" : 1,
      "patternString" : "Tumordiagnostik"
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
      "definition" : "Person, für die die Diagnostik durchgeführt wird.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "The person the diagnostics are performed for."
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
      "short" : "Diagnostikzeitraum",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Diagnostic period"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Zeitraum der Diagnostikphase von Beginn bis Diagnosesicherung.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Period of the diagnostic phase from start to confirmation of diagnosis."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
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
      "definition" : "Personen oder Organisationen, die zur Diagnostik beigetragen haben.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "People or organizations that contributed to the diagnostics."
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
      "definition" : "An der Diagnostik beteiligtes Versorgungsteam.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Care team involved in the diagnostics."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.addresses",
      "path" : "CarePlan.addresses",
      "short" : "Adressierte (Verdachts-)Tumordiagnose",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Addressed suspected tumor diagnosis"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz auf die Tumordiagnose, die der diagnostische CarePlan adressiert. Zu Beginn der Diagnostik ist dies eine Verdachtsdiagnose (Condition mit verificationStatus 'provisional' oder 'unconfirmed'); nach Diagnosesicherung wird dieselbe Condition auf 'confirmed' aktualisiert, sodass die Referenz über den gesamten Verlauf stabil bleibt.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Reference to the tumor diagnosis addressed by the diagnostic care plan. Initially a suspected diagnosis with verificationStatus provisional or unconfirmed; after confirmation the same Condition is updated to confirmed, so the reference stays stable throughout."
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
      "definition" : "Ergänzende Informationen zum Diagnostik-Plan.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Supporting information for the diagnostic care plan."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.goal",
      "path" : "CarePlan.goal",
      "short" : "Diagnoseziel",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Diagnostic goal"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Ziel des Diagnostikplans – z. B. Diagnosesicherung mit Staging und Rezeptorstatus.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Goal of the diagnostic plan – e.g. confirming the diagnosis including staging and receptor status."
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
      "short" : "Diagnostische Maßnahmen",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Diagnostic activities"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Geplante bzw. durchgeführte Schritte des Diagnosepfads.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Planned or performed steps of the diagnostic pathway."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.activity.outcomeReference",
      "path" : "CarePlan.activity.outcomeReference",
      "short" : "Ergebnis",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Outcome"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz auf das Ergebnis der Diagnostik – z. B. DiagnosticReport oder Observation.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Reference to the diagnostic result – e.g. DiagnosticReport or Observation."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/DiagnosticReport",
        "http://hl7.org/fhir/StructureDefinition/Observation",
        "http://hl7.org/fhir/StructureDefinition/Procedure"]
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
      "definition" : "Referenz auf eine geplante diagnostische Maßnahme – z. B. ServiceRequest.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Reference to a planned diagnostic activity – e.g. ServiceRequest."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/ServiceRequest",
        "http://hl7.org/fhir/StructureDefinition/Appointment",
        "http://hl7.org/fhir/StructureDefinition/Task"]
      }],
      "mustSupport" : true
    }]
  }
}

```
