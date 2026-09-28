# Onkologischer CarePlan – Therapieabschnitt (VS) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## ValueSet: Onkologischer CarePlan – Therapieabschnitt (VS) (Experimental) 

 
Kennzeichnet, ob ein `OnkoCarePlan` den diagnostischen oder den therapeutischen Abschnitt der onkologischen Versorgung abbildet. Gebunden an `category` (Slice `therapieabschnitt`); ersetzt die vormalige Unterscheidung über zwei separate Profile (`OnkoCarePlan` / `DiagnosticCarePlan`). 

 **References** 

* [Onkologischer CarePlan](StructureDefinition-onko-care-plan.md)

### Logical Definition (CLD)

 

### Expansion

No Expansion for this valueset (not supported by Publication Tooling)

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "onko-care-plan-phase",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-care-plan-phase",
  "version" : "1.0.0-ballot",
  "name" : "OnkoCarePlanPhaseVS",
  "title" : "Onkologischer CarePlan – Therapieabschnitt (VS)",
  "status" : "active",
  "experimental" : true,
  "date" : "2026-09-28T21:01:12+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Kennzeichnet, ob ein `OnkoCarePlan` den diagnostischen oder den therapeutischen Abschnitt der\nonkologischen Versorgung abbildet. Gebunden an `category` (Slice `therapieabschnitt`); ersetzt\ndie vormalige Unterscheidung über zwei separate Profile (`OnkoCarePlan` / `DiagnosticCarePlan`).",
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
        "code" : "261004008",
        "display" : "Diagnostic intent (qualifier value)"
      },
      {
        "code" : "262202000",
        "display" : "Therapeutic intent (qualifier value)"
      },
      {
        "code" : "363676003",
        "display" : "Palliative - procedure intent (qualifier value)"
      }]
    }]
  }
}

```
