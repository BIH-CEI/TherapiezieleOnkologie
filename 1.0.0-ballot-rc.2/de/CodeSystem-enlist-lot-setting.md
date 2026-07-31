# EnLiST-Setting-Achsen - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.2

## CodeSystem: EnLiST-Setting-Achsen 

 
Die drei getrennt gezählten Setting-Achsen der EnLiST-Notation: eLoT (early), aLoT (advanced), iLoT (investigational). 

Dieses CodeSystem wird in der Definition der folgenden ValueSets referenziert:

* [EnlistLotSettingVS](ValueSet-enlist-lot-setting.md)

-------

 [Beschreibung der obigen Tabelle(n)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "enlist-lot-setting",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/enlist-lot-setting",
  "version" : "1.0.0-ballot-rc.2",
  "name" : "EnlistLotSetting",
  "title" : "EnLiST-Setting-Achsen",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "EnLiST setting axes"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "draft",
  "date" : "2026-07-31T14:18:27+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Die drei getrennt gezählten Setting-Achsen der EnLiST-Notation: eLoT (early), aLoT (advanced), iLoT (investigational).",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "The three separately counted setting axes of the EnLiST notation: eLoT early, aLoT advanced, iLoT investigational."
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
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 3,
  "concept" : [{
    "code" : "eLoT",
    "display" : "eLoT — frühes Setting",
    "definition" : "Early-stage Line of Therapy: resektable Situation — neoadjuvante, adjuvante und perioperative Systemtherapie."
  },
  {
    "code" : "aLoT",
    "display" : "aLoT — fortgeschrittenes Setting",
    "definition" : "Advanced-stage Line of Therapy: lokal fortgeschrittene oder metastasierte Situation."
  },
  {
    "code" : "iLoT",
    "display" : "iLoT — investigational",
    "definition" : "Investigational Line of Therapy: Systemtherapie mit ausschließlich nicht EMA/FDA-zugelassenen Komponenten, unabhängig vom Setting; eigene Zählachse."
  }]
}

```
