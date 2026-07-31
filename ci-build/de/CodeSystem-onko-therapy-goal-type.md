# Onkologische Therapieziel-Art - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## CodeSystem: Onkologische Therapieziel-Art (Experimentell) 

 
Codiert die Art eines onkologischen Therapieziels (Heilung, Lebensverlängerung, Symptomkontrolle, Lebensqualität, Funktionserhalt). Studienteilnahme ist bewusst keine Zielart: Sie ist ein Mittel (investigationale Therapielinie, iLoT nach EnLiST), kein patientenseitiger Zielzustand (vgl. ADR-0015). 

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
  "version" : "1.0.0-ballot",
  "name" : "OnkoTherapyGoalType",
  "title" : "Onkologische Therapieziel-Art",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-07-31T13:26:52+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Codiert die Art eines onkologischen Therapieziels (Heilung, Lebensverlängerung, Symptomkontrolle, Lebensqualität, Funktionserhalt). Studienteilnahme ist bewusst keine Zielart: Sie ist ein Mittel (investigationale Therapielinie, iLoT nach EnLiST), kein patientenseitiger Zielzustand (vgl. ADR-0015).",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 5,
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
    "definition" : "Zielzustand einer definierten Symptomlast; symptombezogen erfasst — über Symptomskala oder erfragte Symptomlast."
  },
  {
    "code" : "lebensqualitaet",
    "display" : "Lebensqualität",
    "definition" : "Erhalt oder Verbesserung der globalen, patientenberichteten Lebensqualität; erfasst per standardisiertem PROM oder strukturiertem Interview (z. B. SEIQoL-DW, Zielklärungsgespräch)."
  },
  {
    "code" : "funktionserhalt",
    "display" : "Funktionserhalt",
    "definition" : "Erhalt einer konkret benannten Körperfunktion oder -struktur (z. B. Brusterhalt, Kontinenz, Fertilität); patientenpriorisiertes Ziel, das die Maßnahmenwahl in beide Richtungen steuert und eigenständig nachgehalten wird."
  }]
}

```
