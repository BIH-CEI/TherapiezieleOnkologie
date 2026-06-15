# Onkologische Therapieintention - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## CodeSystem: Onkologische Therapieintention (Experimentell) 

 
Codiert die Intention einer onkologischen Therapielinie oder eines Behandlungsabschnitts (kurativ, neoadjuvant, adjuvant, palliativ, Erhaltung, supportiv). 

Dieses CodeSystem wird in der Definition der folgenden ValueSets referenziert:

* [OnkoTherapyIntentVS](ValueSet-onko-therapy-intent.md)

-------

 [Beschreibung der obigen Tabelle(n)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "onko-therapy-intent",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-intent",
  "version" : "0.1.0",
  "name" : "OnkoTherapyIntent",
  "title" : "Onkologische Therapieintention",
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
  "description" : "Codiert die Intention einer onkologischen Therapielinie oder eines Behandlungsabschnitts (kurativ, neoadjuvant, adjuvant, palliativ, Erhaltung, supportiv).",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 6,
  "concept" : [{
    "code" : "kurativ",
    "display" : "Kurativ",
    "definition" : "Heilungsabsicht."
  },
  {
    "code" : "neoadjuvant",
    "display" : "Neoadjuvant",
    "definition" : "Vor lokaler Therapie zur Tumorverkleinerung."
  },
  {
    "code" : "adjuvant",
    "display" : "Adjuvant",
    "definition" : "Nach lokaler Therapie zur Rezidivprophylaxe."
  },
  {
    "code" : "erhaltung",
    "display" : "Erhaltungstherapie",
    "definition" : "Stabilisierung nach Ansprechen, Maintenance."
  },
  {
    "code" : "palliativ",
    "display" : "Palliativ",
    "definition" : "Symptomatische / lebensverlängernde Therapie ohne kurative Absicht."
  },
  {
    "code" : "supportiv",
    "display" : "Supportiv",
    "definition" : "Begleitende Therapie zur Linderung therapie- oder tumorbedingter Beschwerden."
  }]
}

```
