# EnLiST-Liniennummer (Extension) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Extension: EnLiST line number extension 

Number of the systemic line of therapy per EnLiST notation — 1 first line, 2 second line and so on. Only for lines that enter the LoT count; the number is recorded, not computed.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Onkologische Therapielinie](StructureDefinition-onko-therapy-line.md)
* Examples for this Extension: [Bundle/BundleCRCPalliativ](Bundle-BundleCRCPalliativ.md) and [EpisodeOfCare/TherapielinieCRCErstlinie](EpisodeOfCare-TherapielinieCRCErstlinie.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.bih-cei.therapieziele-onkologie|current/StructureDefinition/StructureDefinition-enlist-linenumber.json)

### Formal Views of Extension Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-enlist-linenumber.csv), [Excel](../StructureDefinition-enlist-linenumber.xlsx), [Schematron](../StructureDefinition-enlist-linenumber.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "enlist-linenumber",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-linenumber",
  "version" : "1.0.0-ballot",
  "name" : "EnlistLineNumberExt",
  "title" : "EnLiST-Liniennummer (Extension)",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "EnLiST line number extension"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "draft",
  "date" : "2026-07-31T12:58:15+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Nummer der systemischen Therapielinie (Line of Therapy, LoT) nach EnLiST-Notation\n(1 = Erstlinie, 2 = Zweitlinie, …). Nur für Linien, die in die Zählung eingehen\n(`enlist-countable = counted`); die Nummer wird dokumentiert erfasst, nicht aus den\nDaten berechnet — die EnLiST-Zählregeln sind Konvention des Leitfadens.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Number of the systemic line of therapy per EnLiST notation — 1 first line, 2 second line and so on. Only for lines that enter the LoT count; the number is recorded, not computed."
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
    "expression" : "EpisodeOfCare"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "EnLiST-Liniennummer (Extension)",
      "definition" : "Nummer der systemischen Therapielinie (Line of Therapy, LoT) nach EnLiST-Notation\n(1 = Erstlinie, 2 = Zweitlinie, …). Nur für Linien, die in die Zählung eingehen\n(`enlist-countable = counted`); die Nummer wird dokumentiert erfasst, nicht aus den\nDaten berechnet — die EnLiST-Zählregeln sind Konvention des Leitfadens."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-linenumber"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "short" : "Liniennummer",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Line number"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Nummer der Therapielinie nach EnLiST — 1 = Erstlinie, 2 = Zweitlinie, …",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Number of the line of therapy per EnLiST — 1 first line, 2 second line, and so on."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "type" : [{
        "code" : "positiveInt"
      }]
    }]
  }
}

```
