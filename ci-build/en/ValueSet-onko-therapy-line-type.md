# Onkologische Therapielinie – Art (VS) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## ValueSet: Onkologische Therapielinie – Art (VS) (Experimental) 

 
Art einer onkologischen Therapielinie (Behandlungsmodalität) für `EpisodeOfCare.type`. 
Die Codes wurden gegen SNOMED CT (internationale Edition) recherchiert und stellen ein Beispiel-Set gängiger onkologischer Behandlungsmodalitäten dar. Für Bestrahlung existiert `Radiation therapy care` (385798007), für die ambulante Chemotherapie der spezifische Code `Ambulatory chemotherapy` (315601005). 

 **References** 

* [Onkologische Therapielinie](StructureDefinition-onko-therapy-line.md)

### Logical Definition (CLD)

 

### Expansion

No Expansion for this valueset (not supported by Publication Tooling)

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "onko-therapy-line-type",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-therapy-line-type",
  "version" : "1.0.0-ballot",
  "name" : "OnkoTherapyLineTypeVS",
  "title" : "Onkologische Therapielinie – Art (VS)",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-07-30T15:22:14+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Art einer onkologischen Therapielinie (Behandlungsmodalität) für `EpisodeOfCare.type`.\n\nDie Codes wurden gegen SNOMED CT (internationale Edition) recherchiert und stellen ein\nBeispiel-Set gängiger onkologischer Behandlungsmodalitäten dar. Für Bestrahlung existiert\n`Radiation therapy care` (385798007), für die ambulante Chemotherapie der spezifische Code\n`Ambulatory chemotherapy` (315601005).",
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
      }]
    }]
  }
}

```
