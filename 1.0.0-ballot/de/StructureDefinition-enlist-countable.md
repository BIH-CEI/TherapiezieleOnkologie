# EnLiST-Zählstatus (Extension) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Extension: EnLiST-Zählstatus (Extension) 

Zählstatus der Behandlungslinie nach EnLiST: `counted` — die Linie liegt auf einer EnLiST-Zählachse (eLoT/aLoT/iLoT; Details in der Extension `enlist-lot`); `not-counted` — außerhalb jeder LoT-Zählung, z. B. lokoregionale Behandlungslinie (Chirurgie, Strahlentherapie, Ablation) oder Management-Abschnitt.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Onkologische Therapielinie](StructureDefinition-onko-therapy-line.md)
* Examples for this Extension: [Bundle/BundleCRCPalliativ](Bundle-BundleCRCPalliativ.md), [Bundle/BundleMammaNeoadjuvant](Bundle-BundleMammaNeoadjuvant.md), [EpisodeOfCare/TherapielinieCRCErstlinie](EpisodeOfCare-TherapielinieCRCErstlinie.md), [EpisodeOfCare/TherapielinieChemo](EpisodeOfCare-TherapielinieChemo.md) and [EpisodeOfCare/TherapielinieOperation](EpisodeOfCare-TherapielinieOperation.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.bih-cei.therapieziele-onkologie|current/StructureDefinition/StructureDefinition-enlist-countable.json)

### Formale Ansichten des Extension-Inhalts

 [Beschreibung von Profilen, Differentials, Snapshots und deren Repräsentationen](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Differential-Tabelle](#tabs-diff) 
*  [Snapshot-Tabelle](#tabs-snap) 
*  [Statistiken/Referenzen](#tabs-summ) 
*  [Alle](#tabs-all) 

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

#### Terminology Bindings (Differential)

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

** Summary **

Simple Extension with the type CodeableConcept: Zählstatus der Behandlungslinie nach EnLiST: `counted` — die Linie liegt auf einer EnLiST-Zählachse (eLoT/aLoT/iLoT; Details in der Extension `enlist-lot`); `not-counted` — außerhalb jeder LoT-Zählung, z. B. lokoregionale Behandlungslinie (Chirurgie, Strahlentherapie, Ablation) oder Management-Abschnitt.

 **Differential-AnsichtDifferential View** 

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

#### Terminology Bindings (Differential)

 **Snapshot-Ansicht** 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

** Summary **

Simple Extension with the type CodeableConcept: Zählstatus der Behandlungslinie nach EnLiST: `counted` — die Linie liegt auf einer EnLiST-Zählachse (eLoT/aLoT/iLoT; Details in der Extension `enlist-lot`); `not-counted` — außerhalb jeder LoT-Zählung, z. B. lokoregionale Behandlungslinie (Chirurgie, Strahlentherapie, Ablation) oder Management-Abschnitt.

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-enlist-countable.csv), [Excel](../StructureDefinition-enlist-countable.xlsx), [Schematron](../StructureDefinition-enlist-countable.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "enlist-countable",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-countable",
  "version" : "1.0.0-ballot",
  "name" : "EnlistCountableExt",
  "title" : "EnLiST-Zählstatus (Extension)",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "EnLiST countability extension"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "draft",
  "date" : "2026-07-31T13:38:59+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Zählstatus der Behandlungslinie nach EnLiST: `counted` — die Linie liegt auf\neiner EnLiST-Zählachse (eLoT/aLoT/iLoT; Details in der Extension `enlist-lot`);\n`not-counted` — außerhalb jeder LoT-Zählung, z. B. lokoregionale\nBehandlungslinie (Chirurgie, Strahlentherapie, Ablation) oder\nManagement-Abschnitt.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "EnLiST countability of the treatment line: counted — the line lies on an EnLiST counting axis, detailed in the enlist-lot extension; not-counted — outside any LoT count, e.g. a locoregional treatment line or a management segment."
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
      "short" : "EnLiST-Zählstatus (Extension)",
      "definition" : "Zählstatus der Behandlungslinie nach EnLiST: `counted` — die Linie liegt auf\neiner EnLiST-Zählachse (eLoT/aLoT/iLoT; Details in der Extension `enlist-lot`);\n`not-counted` — außerhalb jeder LoT-Zählung, z. B. lokoregionale\nBehandlungslinie (Chirurgie, Strahlentherapie, Ablation) oder\nManagement-Abschnitt."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-countable"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "short" : "Zählstatus",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Countability"
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
      "min" : 1,
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/enlist-countable"
      }
    }]
  }
}

```
