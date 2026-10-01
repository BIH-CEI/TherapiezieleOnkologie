# Episodenart - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## CodeSystem: Episodenart (Experimental) 

 
Type of an oncological care episode. Open starter set: systemic line of therapy — EnLiST/LoT; locoregional treatment line — surgery, radiotherapy, ablation, not EnLiST; diagnostic line; active surveillance; watchful waiting. Entity-specific types may be added without changing the framework. 

This Code system is referenced in the definition of the following value sets:

* [Episode type value set](ValueSet-episodenart.md)

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "episodenart",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/episodenart",
  "version" : "1.0.0-ballot",
  "name" : "Episodenart",
  "title" : "Episodenart",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Episode type"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "active",
  "experimental" : true,
  "date" : "2026-10-01T11:19:09+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Art einer onkologischen Behandlungsepisode. Offener Startsatz: systemische Therapielinie (EnLiST/LoT), lokoregionale Behandlungslinie (Chirurgie, Strahlentherapie, Ablation — nicht EnLiST), Diagnostiklinie, Active Surveillance und Watchful Waiting; entitätsspezifische Arten werden ergänzt, ohne das Framework zu ändern.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Type of an oncological care episode. Open starter set: systemic line of therapy — EnLiST/LoT; locoregional treatment line — surgery, radiotherapy, ablation, not EnLiST; diagnostic line; active surveillance; watchful waiting. Entity-specific types may be added without changing the framework."
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
  "count" : 5,
  "concept" : [{
    "code" : "systemische-therapielinie",
    "display" : "Systemische Therapielinie",
    "definition" : "Abschnitt aktiver systemischer Therapie (Line of Therapy, LoT) — EnLiST-konform und in die LoT-Zählung aufgenommen."
  },
  {
    "code" : "lokoregionale-behandlungslinie",
    "display" : "Lokoregionale Behandlungslinie",
    "definition" : "Nicht-systemische Behandlungslinie: Chirurgie, Strahlentherapie, Ablation — von EnLiST nicht abgedeckt, nicht in der LoT-Zählung."
  },
  {
    "code" : "diagnostiklinie",
    "display" : "Diagnostiklinie",
    "definition" : "Abgegrenzter diagnostischer Abschnitt (Grading, Staging, molekulare Charakterisierung) als Grundlage einer Tumorboard-Empfehlung; nicht-therapeutisch."
  },
  {
    "code" : "active-surveillance",
    "display" : "Active Surveillance",
    "definition" : "Aktive Überwachung mit kurativer Rückfallebene — engmaschiges Monitoring statt sofortiger Therapie."
  },
  {
    "code" : "watchful-waiting",
    "display" : "Watchful Waiting",
    "definition" : "Abwartendes Beobachten — symptomorientiertes Vorgehen ohne kurative Rückfallebene."
  }]
}

```
