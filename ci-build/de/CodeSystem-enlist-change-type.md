# EnLiST-Änderungstypen - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## CodeSystem: EnLiST-Änderungstypen 

 
Die drei Änderungstypen der EnLiST-Zähllogik: New LoT (X+1, nur bei Progression oder fehlendem Ansprechen), Modified LoT (Y+1, nicht-progressionsbedingte Änderung) und Same LoT (prospektiv geplante Änderung, Designation unverändert). Vorgesehen für die Kennzeichnung von Therapieänderungen auf Request-Ebene. 

Dieses CodeSystem wird in der Definition der folgenden ValueSets referenziert:

* [EnlistChangeTypeVS](ValueSet-enlist-change-type.md)

-------

 [Beschreibung der obigen Tabelle(n)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "enlist-change-type",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/enlist-change-type",
  "version" : "1.0.0-ballot",
  "name" : "EnlistChangeType",
  "title" : "EnLiST-Änderungstypen",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "EnLiST change types"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "draft",
  "date" : "2026-07-31T13:33:02+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Die drei Änderungstypen der EnLiST-Zähllogik: New LoT (X+1, nur bei Progression oder fehlendem Ansprechen), Modified LoT (Y+1, nicht-progressionsbedingte Änderung) und Same LoT (prospektiv geplante Änderung, Designation unverändert). Vorgesehen für die Kennzeichnung von Therapieänderungen auf Request-Ebene.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "The three change types of the EnLiST counting logic: new LoT — X plus one, only on progression or lack of adequate response; modified LoT — Y plus one, non-progression-related change; same LoT — prospectively planned change, designation unchanged. Intended for flagging treatment changes at request level."
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
    "code" : "new",
    "display" : "New LoT",
    "definition" : "Neue Linie (X+1): klinische Progression (cPD) oder fehlendes adäquates Ansprechen."
  },
  {
    "code" : "modified",
    "display" : "Modified LoT",
    "definition" : "Modifizierte Linie (Y+1): nicht-progressionsbedingte Änderung — Intoleranz, Hinzunahme/Wechsel eines Wirkstoffs, finanzielle oder logistische Gründe."
  },
  {
    "code" : "same",
    "display" : "Same LoT",
    "definition" : "Unveränderte Designation: prospektiv geplante Änderungen — Dosis, Zeitplan, Applikationsweg, Erhaltungstherapie, Therapiepause mit unveränderter Reintroduktion."
  }]
}

```
