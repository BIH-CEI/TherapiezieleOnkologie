# EnLiST-Zählstatus (ValueSet) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.2

## ValueSet: EnLiST-Zählstatus (ValueSet) 

 
Alle Zählstatus-Werte nach EnLiST. 

 **References** 

* [EnLiST-Zählstatus (Extension)](StructureDefinition-enlist-countable.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Beschreibung der obigen Tabelle(n)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "enlist-countable",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/enlist-countable",
  "version" : "1.0.0-ballot-rc.2",
  "name" : "EnlistCountableVS",
  "title" : "EnLiST-Zählstatus (ValueSet)",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "EnLiST countability value set"
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
  "description" : "Alle Zählstatus-Werte nach EnLiST.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "All EnLiST countability values."
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
      "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/enlist-countable"
    }]
  }
}

```
