# Onkologische Therapieintention (VS) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## ValueSet: Onkologische Therapieintention (VS) (Experimental) 

 
ValueSet der zugelassenen Codes für die Intention einer onkologischen Therapielinie oder eines Behandlungsabschnitts. 

 **References** 

* [Onkologische Therapieintention (Extension)](StructureDefinition-onko-therapy-intent.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "onko-therapy-intent",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-therapy-intent",
  "version" : "0.1.0",
  "name" : "OnkoTherapyIntentVS",
  "title" : "Onkologische Therapieintention (VS)",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-06-15T08:15:17+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "ValueSet der zugelassenen Codes für die Intention einer onkologischen Therapielinie oder eines Behandlungsabschnitts.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-intent"
    }]
  }
}

```
