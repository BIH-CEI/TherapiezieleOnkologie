# Onkologische Therapieintention (VS) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## ValueSet: Onkologische Therapieintention (VS) (Experimental) 

 
Intention (das „Warum") einer onkologischen Therapielinie bzw. eines Behandlungsabschnitts. 
Verwendet aktuelle SNOMED-CT-Codes aus der Hierarchie `362961001 | Procedure by intent`. Die deutschen Anzeigetexte sind als Concept-Display hinterlegt (Übersetzung der englischen SNOMED-FSN). Extensible gebunden – seltene Sonderintentionen dürfen ergänzt werden. 

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
  "version" : "0.1.0",
  "name" : "OnkoTherapyIntentVS",
  "title" : "Onkologische Therapieintention (VS)",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-07-27T15:55:12+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Intention (das „Warum\") einer onkologischen Therapielinie bzw. eines Behandlungsabschnitts.\n\nVerwendet aktuelle SNOMED-CT-Codes aus der Hierarchie `362961001 | Procedure by intent`.\nDie deutschen Anzeigetexte sind als Concept-Display hinterlegt (Übersetzung der englischen\nSNOMED-FSN). Extensible gebunden – seltene Sonderintentionen dürfen ergänzt werden.",
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
        "display" : "Kurativ"
      },
      {
        "code" : "363676003",
        "display" : "Palliativ"
      },
      {
        "code" : "373847000",
        "display" : "Neoadjuvant"
      },
      {
        "code" : "373846009",
        "display" : "Adjuvant"
      },
      {
        "code" : "399707004",
        "display" : "Supportiv"
      }]
    }]
  }
}

```
