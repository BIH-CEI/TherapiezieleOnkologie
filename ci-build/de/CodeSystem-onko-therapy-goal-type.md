# Onkologische Therapieziel-Art - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## CodeSystem: Onkologische Therapieziel-Art (Experimentell) 

 
Codiert die Art eines onkologischen Therapieziels (Heilung, Lebensverlängerung, Symptomkontrolle, Lebensqualität, gemeinsame Entscheidung). 

Dieses CodeSystem wird in der Definition der folgenden ValueSets referenziert:

* [OnkoTherapyGoalTypeVS](ValueSet-onko-therapy-goal-type.md)

-------

 [Beschreibung der obigen Tabelle(n)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "onko-therapy-goal-type",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-goal-type",
  "version" : "0.1.0",
  "name" : "OnkoTherapyGoalType",
  "title" : "Onkologische Therapieziel-Art",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-06-18T08:53:27+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Codiert die Art eines onkologischen Therapieziels (Heilung, Lebensverlängerung, Symptomkontrolle, Lebensqualität, gemeinsame Entscheidung).",
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
    "code" : "heilung",
    "display" : "Heilung",
    "definition" : "Kuratives Ziel — vollständige Remission angestrebt."
  },
  {
    "code" : "lebensverlaengerung",
    "display" : "Lebensverlängerung",
    "definition" : "Verlängerung des Gesamtüberlebens, wenn Heilung unwahrscheinlich ist."
  },
  {
    "code" : "symptomkontrolle",
    "display" : "Symptomkontrolle / Palliation",
    "definition" : "Linderung von Symptomen und Krankheitslast."
  },
  {
    "code" : "lebensqualitaet",
    "display" : "Lebensqualität",
    "definition" : "Erhalt oder Verbesserung von Funktion und Lebensqualität."
  },
  {
    "code" : "funktionserhalt",
    "display" : "Funktionserhalt",
    "definition" : "Erhalt körperlicher oder kognitiver Funktion."
  },
  {
    "code" : "studienteilnahme",
    "display" : "Studienteilnahme",
    "definition" : "Teilnahme an einer klinischen Studie als explizites Ziel."
  }]
}

```
