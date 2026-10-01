# Kontext einer Tumorboard-Empfehlung (VS) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## ValueSet: Kontext einer Tumorboard-Empfehlung (VS) (Experimental) 

 
Zusätzlicher Kontext eines Behandlungsschritts – ergänzend zur Therapieintention – z. B. ob eine Maßnahme lokal begrenzt, symptomatisch, präventiv, definitiv, additiv, intraoperativ, elektiv oder im Notfall erfolgt. Gebunden an die Extension `onko-behandlungs-kontext`. 
**Stellung zur Operation:** Die Codes `Neoadjuvant intent`, `Adjuvant - intent`, `Additive` und `Intraoperative` decken die Achse ab, die das MII-Modul Onkologie als `mii-cs-onko-therapie-stellungzurop` (A/N/I/Z) führt. Sie stehen hier und nicht in der Intentions-Liste, weil sie die Intention ergänzen statt sie zu ersetzen. 

 **References** 

* [Kontext (Extension)](StructureDefinition-onko-behandlungs-kontext.md)

### Logical Definition (CLD)

 

### Expansion

No Expansion for this valueset (not supported by Publication Tooling)

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



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
  "date" : "2026-10-01T06:38:06+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Zusätzlicher Kontext eines Behandlungsschritts – ergänzend zur Therapieintention – z. B. ob eine\nMaßnahme lokal begrenzt, symptomatisch, präventiv, definitiv, additiv, intraoperativ, elektiv\noder im Notfall erfolgt. Gebunden an die Extension `onko-behandlungs-kontext`.\n\n**Stellung zur Operation:** Die Codes `Neoadjuvant intent`, `Adjuvant - intent`, `Additive` und\n`Intraoperative` decken die Achse ab, die das MII-Modul Onkologie als\n`mii-cs-onko-therapie-stellungzurop` (A/N/I/Z) führt. Sie stehen hier und nicht in der\nIntentions-Liste, weil sie die Intention ergänzen statt sie zu ersetzen.",
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
        "code" : "373847000",
        "display" : "Neoadjuvant intent"
      },
      {
        "code" : "373846009",
        "display" : "Adjuvant - intent"
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
