# Onkologisches Zielbeginn-Ereignis (VS) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## ValueSet: Onkologisches Zielbeginn-Ereignis (VS) (Experimental) 

 
Codierte Ereignisse für den Beginn eines onkologischen Therapieziels (`Goal.startCodeableConcept`). Übernimmt das HL7-Basis-ValueSet [GoalStartEvent](http://hl7.org/fhir/ValueSet/goal-start-event) und ergänzt onkologisch relevante SNOMED-CT-Qualifier für den Zielbeginn nach Bestrahlung, Chemotherapie oder Operation. Example-Bindung – die Codes dienen als Anregung, sind aber nicht verpflichtend. 

 **References** 

* [Onkologisches Therapieziel](StructureDefinition-onko-therapy-goal.md)

### Logical Definition (CLD)

 

### Expansion

No Expansion for this valueset (Unknown Code System)

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "onko-goal-start-event",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-goal-start-event",
  "version" : "1.0.0-ballot",
  "name" : "OnkoGoalStartEventVS",
  "title" : "Onkologisches Zielbeginn-Ereignis (VS)",
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
  "description" : "Codierte Ereignisse für den Beginn eines onkologischen Therapieziels (`Goal.startCodeableConcept`).\nÜbernimmt das HL7-Basis-ValueSet [GoalStartEvent](http://hl7.org/fhir/ValueSet/goal-start-event) und\nergänzt onkologisch relevante SNOMED-CT-Qualifier für den Zielbeginn nach Bestrahlung, Chemotherapie\noder Operation. Example-Bindung – die Codes dienen als Anregung, sind aber nicht verpflichtend.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "compose" : {
    "include" : [{
      "valueSet" : ["http://hl7.org/fhir/ValueSet/goal-start-event"]
    },
    {
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "264908009",
        "display" : "Post-radiation (qualifier value)"
      },
      {
        "code" : "262502001",
        "display" : "Post-chemotherapy (qualifier value)"
      },
      {
        "code" : "262061000",
        "display" : "Postoperative period (qualifier value)"
      },
      {
        "code" : "406151001",
        "display" : "Post-discharge follow-up (finding)"
      },
      {
        "code" : "183665006",
        "display" : "Discharged from hospital (finding)"
      }]
    }]
  }
}

```
