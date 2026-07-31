# EnLiST-Zählstatus - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## CodeSystem: EnLiST-Zählstatus 

 
Zählstatus einer Behandlungslinie nach EnLiST: auf einer LoT-Zählachse (counted) oder außerhalb jeder Zählung (not-counted, z. B. lokoregionale Behandlungslinie). 

Dieses CodeSystem wird in der Definition der folgenden ValueSets referenziert:

* [EnlistCountableVS](ValueSet-enlist-countable.md)

-------

 [Beschreibung der obigen Tabelle(n)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "enlist-countable",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/enlist-countable",
  "version" : "1.0.0-ballot",
  "name" : "EnlistCountable",
  "title" : "EnLiST-Zählstatus",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "EnLiST countability"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "draft",
  "date" : "2026-07-31T13:45:11+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Zählstatus einer Behandlungslinie nach EnLiST: auf einer LoT-Zählachse (counted) oder außerhalb jeder Zählung (not-counted, z. B. lokoregionale Behandlungslinie).",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Countability of a treatment line per EnLiST: on a LoT counting axis — counted — or outside any count — not-counted, e.g. a locoregional treatment line."
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
  "count" : 2,
  "concept" : [{
    "code" : "counted",
    "display" : "Zählt in der LoT-Zählung",
    "definition" : "Systemische Therapielinie auf einer EnLiST-Zählachse (eLoT, aLoT oder iLoT); die Designation steht in der Extension enlist-lot."
  },
  {
    "code" : "not-counted",
    "display" : "Zählt nicht",
    "definition" : "Behandlungslinie außerhalb jeder EnLiST-Zählachse — z. B. lokoregionale Behandlungslinie (Chirurgie, Strahlentherapie, Ablation) oder Management-Abschnitt."
  }]
}

```
