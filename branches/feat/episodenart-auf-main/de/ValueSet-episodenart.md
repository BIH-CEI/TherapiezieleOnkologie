# Episodenart (ValueSet) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## ValueSet: Episodenart (ValueSet) (Experimentell) 

 
Alle Episodenarten des Startsatzes; die Bindung ist extensible — entitätsspezifische Arten dürfen ergänzt werden. 

 **References** 

* [Onkologische Behandlungsepisode](StructureDefinition-onko-behandlungsepisode.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Beschreibung der obigen Tabelle(n)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "episodenart",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/episodenart",
  "version" : "1.0.0-ballot",
  "name" : "EpisodenartVS",
  "title" : "Episodenart (ValueSet)",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Episode type value set"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "active",
  "experimental" : true,
  "date" : "2026-09-30T19:48:43+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Alle Episodenarten des Startsatzes; die Bindung ist extensible — entitätsspezifische Arten dürfen ergänzt werden.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "All starter-set episode types; the binding is extensible — entity-specific types may be added."
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
      "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/episodenart"
    }]
  }
}

```
