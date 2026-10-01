# Behandlungsmodalität (Extension) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Extension: Behandlungsmodalität (Extension) (Experimentell) 

Behandlungsmodalität der Behandlungsepisode — z. B. Chemotherapie, Immuntherapie, Hormontherapie, Bestrahlung, Operation. Eigenes Merkmal neben der Episodenart (`EpisodeOfCare.type`); mehrere Modalitäten je Episode sind zulässig (z. B. Radiochemotherapie).

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Onkologische Behandlungsepisode](StructureDefinition-onko-behandlungsepisode.md)
* Examples for this Extension: [Bundle/BundleCRCPalliativ](Bundle-BundleCRCPalliativ.md), [Bundle/BundleMammaNeoadjuvant](Bundle-BundleMammaNeoadjuvant.md), [EpisodeOfCare/TherapielinieCRCErstlinie](EpisodeOfCare-TherapielinieCRCErstlinie.md), [EpisodeOfCare/TherapielinieChemo](EpisodeOfCare-TherapielinieChemo.md)... Show 2 more, [EpisodeOfCare/TherapielinieOperation](EpisodeOfCare-TherapielinieOperation.md) and [EpisodeOfCare/TherapieliniePembroAdjuvant](EpisodeOfCare-TherapieliniePembroAdjuvant.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.bih-cei.therapieziele-onkologie|current/StructureDefinition/StructureDefinition-onko-modalitaet.json)

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

Simple Extension with the type CodeableConcept: Behandlungsmodalität der Behandlungsepisode — z. B. Chemotherapie, Immuntherapie, Hormontherapie, Bestrahlung, Operation. Eigenes Merkmal neben der Episodenart (`EpisodeOfCare.type`); mehrere Modalitäten je Episode sind zulässig (z. B. Radiochemotherapie).

 **Differential-AnsichtDifferential View** 

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

#### Terminology Bindings (Differential)

 **Snapshot-Ansicht** 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

** Summary **

Simple Extension with the type CodeableConcept: Behandlungsmodalität der Behandlungsepisode — z. B. Chemotherapie, Immuntherapie, Hormontherapie, Bestrahlung, Operation. Eigenes Merkmal neben der Episodenart (`EpisodeOfCare.type`); mehrere Modalitäten je Episode sind zulässig (z. B. Radiochemotherapie).

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-onko-modalitaet.csv), [Excel](../StructureDefinition-onko-modalitaet.xlsx), [Schematron](../StructureDefinition-onko-modalitaet.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "onko-modalitaet",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-modalitaet",
  "version" : "1.0.0-ballot",
  "name" : "OnkoModalitaetExt",
  "title" : "Behandlungsmodalität (Extension)",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Treatment modality extension"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-10-01T08:23:16+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Behandlungsmodalität der Behandlungsepisode — z. B. Chemotherapie, Immuntherapie, Hormontherapie, Bestrahlung, Operation. Eigenes Merkmal neben der Episodenart (`EpisodeOfCare.type`); mehrere Modalitäten je Episode sind zulässig (z. B. Radiochemotherapie).",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Treatment modality of the care episode — e.g. chemotherapy, immunotherapy, hormone therapy, radiotherapy, surgery. A characteristic of its own next to the episode type; multiple modalities per episode are allowed, e.g. radiochemotherapy."
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
      "short" : "Behandlungsmodalität (Extension)",
      "definition" : "Behandlungsmodalität der Behandlungsepisode — z. B. Chemotherapie, Immuntherapie, Hormontherapie, Bestrahlung, Operation. Eigenes Merkmal neben der Episodenart (`EpisodeOfCare.type`); mehrere Modalitäten je Episode sind zulässig (z. B. Radiochemotherapie)."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-modalitaet"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "short" : "Behandlungsmodalität",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Treatment modality"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Modalität der Behandlung — z. B. Chemotherapie, Immuntherapie, Bestrahlung, Operation.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Modality of treatment — e.g. chemotherapy, immunotherapy, radiotherapy, surgery."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "example",
        "valueSet" : "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-behandlungsmodalitaet"
      }
    }]
  }
}

```
