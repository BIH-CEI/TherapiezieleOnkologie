# Diagnostischer CarePlan - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Resource Profile: Diagnostischer CarePlan 

 
CarePlan für die Tumordiagnostik auf Basis von `CarePlan`. 
Ergänzend zum onkologischen Therapie-CarePlan (`OnkoCarePlan`) bildet dieses Profil den Weg zur Diagnosestellung als strukturierten Prozess ab. Die Schritte des Diagnosepfads werden als Aktivitäten abgebildet, deren Ergebnisse können über `activity.outcomeReference` angebunden werden. 
Der diagnostische CarePlan verweist über `addresses` auf die Tumordiagnose (`OnkoCondition`) und ist darüber mit dem Therapie-CarePlan verknüpft, der dieselbe Diagnose adressiert. 
Diagnostikspezifische Ergänzungen: 
* Der Plan-Typ ist über `category` verpflichtend gekennzeichnet: `category.text` muss den Wert "Tumordiagnostik" tragen. Weitere Categories können ergänzt werden. Damit sind diagnostischer und Therapie-CarePlan unterscheidbar.
 
**Abgrenzung:** Dieses Profil beschreibt den **Prozess** der Diagnosefindung. 

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
  "version" : "0.1.0",
  "name" : "DiagnosticCarePlan",
  "title" : "Diagnostischer CarePlan",
  "status" : "draft",
  "date" : "2026-07-20T12:02:06+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "CarePlan für die Tumordiagnostik auf Basis von `CarePlan`.\n\nErgänzend zum onkologischen Therapie-CarePlan (`OnkoCarePlan`) bildet dieses Profil den Weg\nzur Diagnosestellung als strukturierten Prozess ab. Die Schritte des Diagnosepfads werden als\nAktivitäten abgebildet, deren Ergebnisse können\nüber `activity.outcomeReference` angebunden werden.\n\nDer diagnostische CarePlan verweist über `addresses` auf die Tumordiagnose (`OnkoCondition`)\nund ist darüber mit dem Therapie-CarePlan verknüpft, der dieselbe Diagnose adressiert.\n\nDiagnostikspezifische Ergänzungen:\n- Der Plan-Typ ist über `category` verpflichtend gekennzeichnet: `category.text`\n  muss den Wert \"Tumordiagnostik\" tragen. Weitere Categories können ergänzt\n  werden. Damit sind diagnostischer und Therapie-CarePlan unterscheidbar.\n\n**Abgrenzung:** Dieses Profil beschreibt den *Prozess* der Diagnosefindung.",
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
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.category",
      "path" : "CarePlan.category",
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
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.period",
      "path" : "CarePlan.period",
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
      "short" : "Adressierte (Verdachts-)Tumordiagnose",
      "definition" : "Referenz auf die Tumordiagnose, die der diagnostische CarePlan adressiert. Zu Beginn der Diagnostik ist dies eine Verdachtsdiagnose (Condition mit verificationStatus 'provisional' oder 'unconfirmed'); nach Diagnosesicherung wird dieselbe Condition auf 'confirmed' aktualisiert, sodass die Referenz über den gesamten Verlauf stabil bleibt.",
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
      "id" : "CarePlan.activity",
      "path" : "CarePlan.activity",
      "mustSupport" : true
    },
    {
      "id" : "CarePlan.activity.outcomeReference",
      "path" : "CarePlan.activity.outcomeReference",
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
