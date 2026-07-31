# EnLiST-Zählstatus - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## CodeSystem: EnLiST-Zählstatus 

 
Zählstatus einer Behandlungslinie nach EnLiST (Saini et al., Ann Oncol 2026): in der LoT-Zählung, außerhalb der Zählung oder investigationale Studientherapie (iLoT). 

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
  "date" : "2026-07-31T12:58:15+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Zählstatus einer Behandlungslinie nach EnLiST (Saini et al., Ann Oncol 2026): in der LoT-Zählung, außerhalb der Zählung oder investigationale Studientherapie (iLoT).",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Countability of a treatment line per EnLiST: within the LoT count, outside the count, or investigational study therapy — iLoT."
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
    "code" : "counted",
    "display" : "Zählt in der LoT-Zählung",
    "definition" : "Systemische Therapielinie, die nach EnLiST in die Linien-Zählung eingeht."
  },
  {
    "code" : "not-counted",
    "display" : "Zählt nicht",
    "definition" : "Behandlungslinie außerhalb der EnLiST-Zählung — z. B. lokoregionale Behandlungslinie (Chirurgie, Strahlentherapie, Ablation)."
  },
  {
    "code" : "investigational",
    "display" : "iLoT — Studientherapie",
    "definition" : "Investigational Line of Therapy nach EnLiST: Studientherapie, separat notiert statt regulär gezählt."
  }]
}

```
