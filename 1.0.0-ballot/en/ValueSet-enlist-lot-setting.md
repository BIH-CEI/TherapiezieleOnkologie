# EnLiST-Setting-Achsen (ValueSet) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## ValueSet: EnLiST setting axes value set 

 
Alle EnLiST-Setting-Achsen. 

 **References** 

* [EnLiST-LoT-Designation (Extension)](StructureDefinition-enlist-lot.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "enlist-lot-setting",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/enlist-lot-setting",
  "version" : "1.0.0-ballot",
  "name" : "EnlistLotSettingVS",
  "title" : "EnLiST-Setting-Achsen (ValueSet)",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "EnLiST setting axes value set"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "draft",
  "date" : "2026-08-02T18:42:01+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Alle EnLiST-Setting-Achsen.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "All EnLiST setting axes."
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
      "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/enlist-lot-setting"
    }]
  }
}

```
