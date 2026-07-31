# Onkologische Therapieintention (VS) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## ValueSet: Onkologische Therapieintention (VS) (Experimentell) 

 
Intention (das „Warum") einer onkologischen Therapielinie bzw. eines Behandlungsabschnitts. 
Verwendet aktuelle SNOMED-CT-Codes aus der Hierarchie `362961001 | Procedure by intent`. Als Concept-Display dient der englische SNOMED-Anzeigetext des aktuellen Release (validierbar gegen tx.fhir.org); die deutschen Begriffe stehen in den Label-Texten des Leitfadens. Extensible gebunden – seltene Sonderintentionen dürfen ergänzt werden. 

 **References** 

* [Onkologische Therapieintention (Extension)](StructureDefinition-onko-therapy-intent.md)

### Logical Definition (CLD)

 

### Expansion

No Expansion for this valueset (not supported by Publication Tooling)

-------

 [Beschreibung der obigen Tabelle(n)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "onko-therapy-intent",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-therapy-intent",
  "version" : "1.0.0-ballot",
  "name" : "OnkoTherapyIntentVS",
  "title" : "Onkologische Therapieintention (VS)",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-07-31T12:58:15+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Intention (das „Warum\") einer onkologischen Therapielinie bzw. eines Behandlungsabschnitts.\n\nVerwendet aktuelle SNOMED-CT-Codes aus der Hierarchie `362961001 | Procedure by intent`.\nAls Concept-Display dient der englische SNOMED-Anzeigetext des aktuellen Release (validierbar\ngegen tx.fhir.org); die deutschen Begriffe stehen in den Label-Texten\ndes Leitfadens. Extensible gebunden – seltene Sonderintentionen dürfen ergänzt werden.",
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
        "code" : "373808002",
        "display" : "Curative - procedure intent"
      },
      {
        "code" : "363676003",
        "display" : "Palliative intent"
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
        "code" : "399707004",
        "display" : "Supportive - procedure intent"
      }]
    }]
  }
}

```
