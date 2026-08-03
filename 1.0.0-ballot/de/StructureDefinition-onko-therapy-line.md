# Onkologische Therapielinie - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Ressourcenprofil: Onkologische Therapielinie 

 
Eine onkologische Therapielinie (Line of Therapy, LoT) auf Basis von `EpisodeOfCare`, EnLiST-konform. Eine Therapielinie ist ein **fachliches Kontinuum** mit definierter Intention und Tumorerkrankung, das durch ein klinisches Ereignis (Progress, Toxizität, Patientenwunsch, Studienende, geplanter Wechsel) beendet wird — und das organisatorisch in mehrere Episoden zerfallen kann, da `EpisodeOfCare` organisationsgebunden ist. Die EnLiST-Designation (`enlist-lot`) trägt je Linie **genau eine führende Episode** (main contributor); ausführende Einrichtungen dokumentieren eigene Episoden als Segmente (`enlist-line-segment`) mit gemeinsamer `lineId`. Bei gleichem Ort/Sektor fallen Führung und Ausführung in einer einzigen Episode zusammen. Die Verbindung zu einem `OnkoCarePlan` erfolgt über die Standard-Extension `workflow-episodeOfCare`. 

**Usages:**

* Examples for this Profile: [EpisodeOfCare/TherapielinieCRCErstlinie](EpisodeOfCare-TherapielinieCRCErstlinie.md), [EpisodeOfCare/TherapielinieChemo](EpisodeOfCare-TherapielinieChemo.md), [EpisodeOfCare/TherapielinieOperation](EpisodeOfCare-TherapielinieOperation.md) and [EpisodeOfCare/TherapieliniePembroAdjuvant](EpisodeOfCare-TherapieliniePembroAdjuvant.md)

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

#### Terminology Bindings (Differential)

#### Constraints

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [EpisodeOfCare](http://hl7.org/fhir/R4/episodeofcare.html) 

** Summary **

Mandatory: 5 elements
 Must-Support: 18 elements

**Structures**

This structure refers to these other structures:

* [Onkologische Diagnose (Condition) (https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-condition)](StructureDefinition-onko-condition.md)

**Extensions**

This structure refers to these extensions:

* [https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent](StructureDefinition-onko-therapy-intent.md)
* [https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-line-medication-request](StructureDefinition-onko-therapy-line-medication-request.md)
* [https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-lot](StructureDefinition-enlist-lot.md)
* [https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-line-segment](StructureDefinition-enlist-line-segment.md)
* [https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-countable](StructureDefinition-enlist-countable.md)

 **Schlüsselelemente-Ansicht** 

#### Terminology Bindings

#### Constraints

 **Differential-Ansicht** 

Diese Struktur ist abgeleitet von [EpisodeOfCare](http://hl7.org/fhir/R4/episodeofcare.html) 

#### Terminology Bindings (Differential)

#### Constraints

 **Snapshot-AnsichtView** 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [EpisodeOfCare](http://hl7.org/fhir/R4/episodeofcare.html) 

** Summary **

Mandatory: 5 elements
 Must-Support: 18 elements

**Structures**

This structure refers to these other structures:

* [Onkologische Diagnose (Condition) (https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-condition)](StructureDefinition-onko-condition.md)

**Extensions**

This structure refers to these extensions:

* [https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent](StructureDefinition-onko-therapy-intent.md)
* [https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-line-medication-request](StructureDefinition-onko-therapy-line-medication-request.md)
* [https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-lot](StructureDefinition-enlist-lot.md)
* [https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-line-segment](StructureDefinition-enlist-line-segment.md)
* [https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-countable](StructureDefinition-enlist-countable.md)

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-onko-therapy-line.csv), [Excel](../StructureDefinition-onko-therapy-line.xlsx), [Schematron](../StructureDefinition-onko-therapy-line.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "onko-therapy-line",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-line",
  "version" : "1.0.0-ballot",
  "name" : "OnkoTherapyLine",
  "title" : "Onkologische Therapielinie",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Oncological line of therapy"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "draft",
  "date" : "2026-08-03T05:20:25+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Eine onkologische Therapielinie (Line of Therapy, LoT) auf Basis von `EpisodeOfCare`, EnLiST-konform. Eine Therapielinie ist ein **fachliches Kontinuum** mit definierter Intention und Tumorerkrankung, das durch ein klinisches Ereignis (Progress, Toxizität, Patientenwunsch, Studienende, geplanter Wechsel) beendet wird — und das organisatorisch in mehrere Episoden zerfallen kann, da `EpisodeOfCare` organisationsgebunden ist. Die EnLiST-Designation (`enlist-lot`) trägt je Linie **genau eine führende Episode** (main contributor); ausführende Einrichtungen dokumentieren eigene Episoden als Segmente (`enlist-line-segment`) mit gemeinsamer `lineId`. Bei gleichem Ort/Sektor fallen Führung und Ausführung in einer einzigen Episode zusammen. Die Verbindung zu einem `OnkoCarePlan` erfolgt über die Standard-Extension `workflow-episodeOfCare`.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "An oncological line of therapy based on EpisodeOfCare, EnLiST-conformant. A line of therapy is a treatment segment with a defined intent and a defined tumor condition, ended by a clinical event such as progression, toxicity, patient wish, end of study or planned switch."
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
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "EpisodeOfCare",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/EpisodeOfCare",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "EpisodeOfCare",
      "path" : "EpisodeOfCare",
      "constraint" : [{
        "key" : "onko-enlist-1",
        "severity" : "error",
        "human" : "Eine EnLiST-LoT-Designation (enlist-lot) darf nur vorliegen, wenn der Zählstatus (enlist-countable) 'counted' ist.",
        "expression" : "extension.where(url = 'https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-lot').exists() implies extension.where(url = 'https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-countable').value.ofType(CodeableConcept).coding.where(code = 'counted').exists()",
        "source" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-line"
      },
      {
        "key" : "onko-enlist-3",
        "severity" : "error",
        "human" : "Zählstatus 'counted' erfordert eine EnLiST-Designation (enlist-lot, führende Episode) oder einen Segment-Marker (enlist-line-segment, ausführende Episode).",
        "expression" : "extension.where(url = 'https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-countable').value.ofType(CodeableConcept).coding.where(code = 'counted').exists() implies (extension.where(url = 'https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-lot').exists() or extension.where(url = 'https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-line-segment').exists())",
        "source" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-line"
      },
      {
        "key" : "onko-enlist-4",
        "severity" : "error",
        "human" : "enlist-lot (führende Episode) und enlist-line-segment (ausführendes Segment) dürfen nicht an derselben Episode vorliegen.",
        "expression" : "(extension.where(url = 'https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-lot').exists() and extension.where(url = 'https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-line-segment').exists()).not()",
        "source" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-line"
      }]
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
      "definition" : "Strukturierte Therapieintention der Behandlungslinie – Hauptintention und optionale Behandlungsphase.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Structured therapy intent of the line of therapy – main intent and optional treatment phase."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "EpisodeOfCare.extension:medicationRequest",
      "path" : "EpisodeOfCare.extension",
      "sliceName" : "medicationRequest",
      "short" : "Medikationsverordnung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Medication request"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz auf Medikationsverordnungen, die den Anlass für diese Therapielinie bilden – Ergänzung zu referralRequest, das auf ServiceRequest beschränkt ist.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Reference to the medication requests giving rise to this line of therapy – complements referralRequest, which is restricted to ServiceRequest."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-line-medication-request"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "EpisodeOfCare.extension:lot",
      "path" : "EpisodeOfCare.extension",
      "sliceName" : "lot",
      "short" : "EnLiST-LoT-Designation",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "EnLiST LoT designation"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "X.Y-Designation je Setting-Achse — eLoT, aLoT oder iLoT — nach EnLiST.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "X.Y designation per setting axis — eLoT, aLoT or iLoT — per EnLiST."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-lot"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "EpisodeOfCare.extension:lineSegment",
      "path" : "EpisodeOfCare.extension",
      "sliceName" : "lineSegment",
      "short" : "EnLiST-Linien-Segment",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "EnLiST line segment"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Segment-Marker einer ausführenden Einrichtung — gemeinsame lineId, keine eigene Designation.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Segment marker of an executing organisation — shared lineId, no designation of its own."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-line-segment"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "EpisodeOfCare.extension:countable",
      "path" : "EpisodeOfCare.extension",
      "sliceName" : "countable",
      "short" : "EnLiST-Zählstatus",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "EnLiST countability"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Zählstatus nach EnLiST — counted oder not-counted.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "EnLiST countability — counted or not-counted."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-countable"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "EpisodeOfCare.status",
      "path" : "EpisodeOfCare.status",
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
      "definition" : "Status der Therapielinie – z. B. active, onhold, finished, cancelled.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Status of the line of therapy – e.g. active, onhold, finished, cancelled."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "EpisodeOfCare.statusHistory",
      "path" : "EpisodeOfCare.statusHistory",
      "short" : "Statusverlauf",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Status history"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Historie der Statuswechsel der Therapielinie mit jeweiligem Zeitraum.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "History of status changes of the line of therapy, each with its period."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "EpisodeOfCare.type",
      "path" : "EpisodeOfCare.type",
      "short" : "Art der Therapielinie",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Type of line of therapy"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Behandlungsmodalität der Therapielinie – z. B. ambulante Chemotherapie, Bestrahlung, Immun- oder Hormontherapie.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Treatment modality of the line of therapy – e.g. ambulatory chemotherapy, radiation therapy, immunotherapy or hormone therapy."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true,
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-therapy-line-type"
      }
    },
    {
      "id" : "EpisodeOfCare.diagnosis",
      "path" : "EpisodeOfCare.diagnosis",
      "short" : "Diagnosebezug",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Diagnosis"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Der Therapielinie zugrunde liegende Tumordiagnose bzw. Tumordiagnosen.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Tumor diagnosis or diagnoses underlying the line of therapy."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "EpisodeOfCare.diagnosis.condition",
      "path" : "EpisodeOfCare.diagnosis.condition",
      "short" : "Diagnose",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Condition"
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
      "id" : "EpisodeOfCare.diagnosis.role",
      "path" : "EpisodeOfCare.diagnosis.role",
      "short" : "Diagnoserolle",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Diagnosis role"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Rolle der Diagnose in dieser Episode – fest auf chief complaint als Hauptbehandlungsgrund.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Role of the diagnosis in this episode – fixed to chief complaint."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/diagnosis-role",
          "code" : "CC",
          "display" : "Chief complaint"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "EpisodeOfCare.diagnosis.rank",
      "path" : "EpisodeOfCare.diagnosis.rank",
      "short" : "Rangfolge",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Rank"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Rangfolge der Diagnose bei mehreren Diagnosen.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Rank of the diagnosis when several diagnoses are present."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "EpisodeOfCare.patient",
      "path" : "EpisodeOfCare.patient",
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
      "definition" : "Person, die in dieser Therapielinie behandelt wird.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "The person treated within this line of therapy."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "EpisodeOfCare.managingOrganization",
      "path" : "EpisodeOfCare.managingOrganization",
      "short" : "Behandelnde Organisation",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Managing organization"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Organisation, die diese Episode of Care – die Therapielinie – verantwortlich behandelt bzw. steuert.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Organization responsible for treating or managing this episode of care."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "EpisodeOfCare.period",
      "path" : "EpisodeOfCare.period",
      "short" : "Behandlungszeitraum",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Treatment period"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Zeitraum der Therapielinie von Beginn bis Ende des Behandlungsabschnitts.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Period of the line of therapy from start to end of the treatment segment."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "EpisodeOfCare.referralRequest",
      "path" : "EpisodeOfCare.referralRequest",
      "short" : "Anforderung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Referral request"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Der Therapielinie zugrunde liegende Anforderung oder Anforderungen, z. B. Überweisung oder Prozedur-Anforderung.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Requests giving rise to this line of therapy, e.g. a referral or procedure request."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "EpisodeOfCare.careManager",
      "path" : "EpisodeOfCare.careManager",
      "short" : "Fallverantwortliche/r",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Care manager"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Für die Therapielinie fallverantwortliche behandelnde Person.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Practitioner responsible for managing the line of therapy."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "EpisodeOfCare.team",
      "path" : "EpisodeOfCare.team",
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
      "definition" : "An der Therapielinie beteiligtes Versorgungsteam, z. B. Tumorboard.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Care team involved in the line of therapy, e.g. tumor board."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    }]
  }
}

```
