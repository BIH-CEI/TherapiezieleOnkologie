# Behandlungsmodalität (VS) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## ValueSet: Behandlungsmodalität (VS) (Experimentell) 

 
Behandlungsmodalität einer onkologischen Behandlungsepisode — Beispiel-Set gängiger Modalitäten, systemisch (Chemo-, Immun-, Hormontherapie) wie lokoregional (Bestrahlung, Operation). 
Die Codes wurden gegen SNOMED CT (internationale Edition) recherchiert. Für Bestrahlung existiert `Radiation therapy care` (385798007), für die ambulante Chemotherapie der spezifische Code `Ambulatory chemotherapy` (315601005). 

 **References** 

* [Behandlungsmodalität (Extension)](StructureDefinition-onko-modalitaet.md)

### Logical Definition (CLD)

 

### Expansion

No Expansion for this valueset (not supported by Publication Tooling)

-------

 [Beschreibung der obigen Tabelle(n)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "onko-behandlungsmodalitaet",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-behandlungsmodalitaet",
  "version" : "1.0.0-ballot",
  "name" : "BehandlungsmodalitaetVS",
  "title" : "Behandlungsmodalität (VS)",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Treatment modality value set"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-09-30T19:52:44+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Behandlungsmodalität einer onkologischen Behandlungsepisode — Beispiel-Set\ngängiger Modalitäten, systemisch (Chemo-, Immun-, Hormontherapie) wie\nlokoregional (Bestrahlung, Operation).\n\nDie Codes wurden gegen SNOMED CT (internationale Edition) recherchiert. Für\nBestrahlung existiert `Radiation therapy care` (385798007), für die ambulante\nChemotherapie der spezifische Code `Ambulatory chemotherapy` (315601005).",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Treatment modality of an oncological care episode — an example set of common systemic and locoregional modalities, researched against SNOMED CT international edition."
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
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "385786002",
        "display" : "Chemotherapy care"
      },
      {
        "code" : "315601005",
        "display" : "Ambulatory chemotherapy"
      },
      {
        "code" : "385798007",
        "display" : "Radiation therapy care"
      },
      {
        "code" : "76334006",
        "display" : "Immunological therapy"
      },
      {
        "code" : "169413002",
        "display" : "Hormone therapy"
      },
      {
        "code" : "387713003",
        "display" : "Surgical procedure"
      }]
    }]
  }
}

```
