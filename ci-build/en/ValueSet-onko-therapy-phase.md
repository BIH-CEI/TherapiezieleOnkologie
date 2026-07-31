# Onkologische Therapiephase / Unter-Intention (VS) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## ValueSet: Onkologische Therapiephase / Unter-Intention (VS) (Experimental) 

 
Sequenzielle Phase (Unter-Intention) innerhalb eines Behandlungskonzepts – ergänzend zur Haupt-Therapieintention. In SNOMED CT liegen diese Konzepte nicht in der Intent-Hierarchie, sondern als Behandlungsformen unter `716872004 | Antineoplastic chemotherapy regimen`. Als Concept-Display dient der englische SNOMED-Anzeigetext des aktuellen Release; die deutschen Begriffe stehen in den Label-Texten des Leitfadens. Extensible gebunden (z. B. Konsolidierung ergänzbar). 

 **References** 

* [Onkologische Therapieintention (Extension)](StructureDefinition-onko-therapy-intent.md)

### Logical Definition (CLD)

 

### Expansion

No Expansion for this valueset (not supported by Publication Tooling)

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "onko-therapy-phase",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-therapy-phase",
  "version" : "1.0.0-ballot",
  "name" : "OnkoTherapyPhaseVS",
  "title" : "Onkologische Therapiephase / Unter-Intention (VS)",
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
  "description" : "Sequenzielle Phase (Unter-Intention) innerhalb eines Behandlungskonzepts – ergänzend zur\nHaupt-Therapieintention. In SNOMED CT liegen diese Konzepte nicht in der Intent-Hierarchie,\nsondern als Behandlungsformen unter `716872004 | Antineoplastic chemotherapy regimen`.\nAls Concept-Display dient der englische SNOMED-Anzeigetext des aktuellen Release; die deutschen\nBegriffe stehen in den Label-Texten des Leitfadens. Extensible gebunden (z. B.\nKonsolidierung ergänzbar).",
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
        "code" : "450827009",
        "display" : "Induction chemotherapy"
      },
      {
        "code" : "816151001",
        "display" : "Consolidation antineoplastic chemotherapy"
      },
      {
        "code" : "1254741007",
        "display" : "Intensification antineoplastic therapy regimen"
      },
      {
        "code" : "1345242003",
        "display" : "Maintenance antineoplastic therapy"
      }]
    }]
  }
}

```
