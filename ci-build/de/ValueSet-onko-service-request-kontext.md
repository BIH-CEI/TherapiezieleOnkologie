# Kontext einer Tumorboard-Empfehlung (VS) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## ValueSet: Kontext einer Tumorboard-Empfehlung (VS) (Experimentell) 

 
Zusätzlicher Kontext eines Behandlungsschritts – ergänzend zur Therapieintention – z. B. ob eine Maßnahme lokal begrenzt, symptomatisch, präventiv, definitiv, additiv, intraoperativ, elektiv oder im Notfall erfolgt. Gebunden an die Extension `onko-behandlungs-kontext`. 

 **References** 

* [Kontext (Extension)](StructureDefinition-onko-behandlungs-kontext.md)

### Logical Definition (CLD)

 

### Expansion

No Expansion for this valueset (not supported by Publication Tooling)

-------

 [Beschreibung der obigen Tabelle(n)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "onko-service-request-kontext",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-service-request-kontext",
  "version" : "1.0.0-ballot",
  "name" : "OnkoServiceRequestKontextVS",
  "title" : "Kontext einer Tumorboard-Empfehlung (VS)",
  "status" : "active",
  "experimental" : true,
  "date" : "2026-09-28T12:11:39+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Zusätzlicher Kontext eines Behandlungsschritts – ergänzend zur Therapieintention – z. B. ob eine\nMaßnahme lokal begrenzt, symptomatisch, präventiv, definitiv, additiv, intraoperativ, elektiv\noder im Notfall erfolgt. Gebunden an die Extension `onko-behandlungs-kontext`.",
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
        "code" : "255470001",
        "display" : "Local (qualifier value)"
      },
      {
        "code" : "264931009",
        "display" : "Symptomatic (qualifier value)"
      },
      {
        "code" : "129428001",
        "display" : "Preventive - procedure intent"
      },
      {
        "code" : "261002007",
        "display" : "Definitive (qualifier value)"
      },
      {
        "code" : "260364009",
        "display" : "Additive (qualifier value)"
      },
      {
        "code" : "277671009",
        "display" : "Intraoperative (qualifier value)"
      },
      {
        "code" : "103390000",
        "display" : "Elective (qualifier value)"
      },
      {
        "code" : "25876001",
        "display" : "Emergency (qualifier value)"
      }]
    }]
  }
}

```
