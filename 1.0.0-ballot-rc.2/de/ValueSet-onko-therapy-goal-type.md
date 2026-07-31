# Onkologische Therapieziel-Art (VS) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.2

## ValueSet: Onkologische Therapieziel-Art (VS) (Experimentell) 

 
ValueSet der zugelassenen Codes für die Zielart eines onkologischen Therapieziels. 

 **References** 

* [Onkologisches Therapieziel](StructureDefinition-onko-therapy-goal.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Beschreibung der obigen Tabelle(n)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "onko-therapy-goal-type",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-therapy-goal-type",
  "version" : "1.0.0-ballot-rc.2",
  "name" : "OnkoTherapyGoalTypeVS",
  "title" : "Onkologische Therapieziel-Art (VS)",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-07-31T14:32:24+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "ValueSet der zugelassenen Codes für die Zielart eines onkologischen Therapieziels.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-goal-type"
    }]
  }
}

```
