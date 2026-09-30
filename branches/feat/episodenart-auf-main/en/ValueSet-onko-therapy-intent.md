# Onkologische Therapieintention (VS) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## ValueSet: Onkologische Therapieintention (VS) (Experimental) 

 
Intention (das „Warum") einer onkologischen Behandlungsepisode bzw. eines Behandlungsabschnitts: **wozu** behandelt wird. 
Verwendet aktuelle SNOMED-CT-Codes aus der Hierarchie `362981000 | Qualifier value`. 
Nicht hier abgebildet sind **neoadjuvant** und **adjuvant**: Sie beantworten nicht das „Wozu", sondern beschreiben die Stellung einer Maßnahme zur Operation — eine neoadjuvante Therapie ist in aller Regel kurativ intendiert. Sie sind daher mit der Intention kombinierbar statt zu ihr alternativ und stehen in der Kontext-Achse (`onko-service-request-kontext`). Als Concept-Display dient der englische SNOMED-Anzeigetext des aktuellen Release (validierbar gegen tx.fhir.org); die deutschen Begriffe stehen in den Label-Texten des Leitfadens. Extensible gebunden – seltene Sonderintentionen dürfen ergänzt werden. 

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
  "id" : "onko-therapy-intent",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-therapy-intent",
  "version" : "1.0.0-ballot",
  "name" : "OnkoTherapyIntentVS",
  "title" : "Onkologische Therapieintention (VS)",
  "status" : "active",
  "experimental" : true,
  "date" : "2026-09-30T20:03:55+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Intention (das „Warum\") einer onkologischen Behandlungsepisode bzw. eines Behandlungsabschnitts:\n**wozu** behandelt wird.\n\nVerwendet aktuelle SNOMED-CT-Codes aus der Hierarchie `362981000 | Qualifier value`.\n\nNicht hier abgebildet sind **neoadjuvant** und **adjuvant**: Sie beantworten nicht das „Wozu\",\nsondern beschreiben die Stellung einer Maßnahme zur Operation — eine neoadjuvante Therapie ist\nin aller Regel kurativ intendiert. Sie sind daher mit der Intention kombinierbar statt zu ihr\nalternativ und stehen in der Kontext-Achse (`onko-service-request-kontext`).\nAls Concept-Display dient der englische SNOMED-Anzeigetext des aktuellen Release (validierbar\ngegen tx.fhir.org); die deutschen Begriffe stehen in den Label-Texten\ndes Leitfadens. Extensible gebunden – seltene Sonderintentionen dürfen ergänzt werden.",
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
        "code" : "399707004",
        "display" : "Supportive - procedure intent"
      }]
    }]
  }
}

```
