# Kontext (Extension) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Extension: Context extension (Experimental) 

Additional context of a treatment step that, complementing the therapy intent, indicates for example whether a measure is local, symptomatic, preventive, definitive, additive, intraoperative, elective or an emergency. This field is intended to give individual treatment steps further context beyond the therapy intent. The extension can be used on ServiceRequest, Procedure, MedicationRequest and MedicationAdministration.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Tumorboard MedicationRequest](StructureDefinition-onko-tumorboard-medication-request.md) and [Tumorboard ServiceRequest](StructureDefinition-onko-tumorboard-service-request.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.bih-cei.therapieziele-onkologie|current/StructureDefinition/StructureDefinition-onko-behandlungs-kontext.json)

### Formal Views of Extension Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-onko-behandlungs-kontext.csv), [Excel](../StructureDefinition-onko-behandlungs-kontext.xlsx), [Schematron](../StructureDefinition-onko-behandlungs-kontext.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "onko-behandlungs-kontext",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-behandlungs-kontext",
  "version" : "1.0.0-ballot",
  "name" : "OnkoBehandlungsKontextExt",
  "title" : "Kontext (Extension)",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Context extension"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-10-01T11:19:09+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Zusätzlicher Kontext eines Behandlungsschritts, der – ergänzend zur Therapieintention – z. B.\nkennzeichnet, ob eine Maßnahme lokal begrenzt, symptomatisch, präventiv, definitiv, additiv,\nintraoperativ, elektiv oder im Notfall erfolgt.\n\nDieses Feld soll dazu dienen, neben der Therapieintention einzelnen Behandlungsschritten\nweiteren Kontext zu geben. Die Extension kann an ServiceRequest, Procedure, MedicationRequest\nund MedicationAdministration verwendet werden.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Additional context of a treatment step that, complementing the therapy intent, indicates for example whether a measure is local, symptomatic, preventive, definitive, additive, intraoperative, elective or an emergency. This field is intended to give individual treatment steps further context beyond the therapy intent. The extension can be used on ServiceRequest, Procedure, MedicationRequest and MedicationAdministration."
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
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "ServiceRequest"
  },
  {
    "type" : "element",
    "expression" : "Procedure"
  },
  {
    "type" : "element",
    "expression" : "MedicationRequest"
  },
  {
    "type" : "element",
    "expression" : "MedicationAdministration"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Kontext (Extension)",
      "definition" : "Zusätzlicher Kontext eines Behandlungsschritts, der – ergänzend zur Therapieintention – z. B.\nkennzeichnet, ob eine Maßnahme lokal begrenzt, symptomatisch, präventiv, definitiv, additiv,\nintraoperativ, elektiv oder im Notfall erfolgt.\n\nDieses Feld soll dazu dienen, neben der Therapieintention einzelnen Behandlungsschritten\nweiteren Kontext zu geben. Die Extension kann an ServiceRequest, Procedure, MedicationRequest\nund MedicationAdministration verwendet werden."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-behandlungs-kontext"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "short" : "Kontext",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Context"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Dieses Feld soll dazu dienen, neben der Therapieintention einzelnen Behandlungsschritten weiteren Kontext zu geben.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "This field is intended to give individual treatment steps further context beyond the therapy intent."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-service-request-kontext"
      }
    }]
  }
}

```
