# Zielarten → SNOMED CT (Zielzustände) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## ConceptMap: Zielarten → SNOMED CT (Zielzustände) (Experimental) 

 
Semantische Annotation der onkologischen Zielarten (`OnkoTherapyGoalType`) mit SNOMED-CT-Konzepten des jeweils angestrebten Zielzustands. Die Beziehungsqualität (`equivalence`) dokumentiert ehrlich, wo SNOMED nur verwandte Konzepte (Messgröße, Regime) oder gar kein Konzept anbietet. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "ConceptMapOnkoTherapyGoalTypeSct",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/ConceptMap/ConceptMapOnkoTherapyGoalTypeSct",
  "version" : "1.0.0-ballot",
  "title" : "Zielarten → SNOMED CT (Zielzustände)",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-07-31T13:33:02+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Semantische Annotation der onkologischen Zielarten (`OnkoTherapyGoalType`) mit SNOMED-CT-Konzepten des jeweils angestrebten Zielzustands. Die Beziehungsqualität (`equivalence`) dokumentiert ehrlich, wo SNOMED nur verwandte Konzepte (Messgröße, Regime) oder gar kein Konzept anbietet.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "sourceCanonical" : "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-therapy-goal-type",
  "targetCanonical" : "http://snomed.info/sct?fhir_vs",
  "group" : [{
    "source" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-goal-type",
    "target" : "http://snomed.info/sct",
    "element" : [{
      "code" : "heilung",
      "display" : "Heilung",
      "target" : [{
        "code" : "371001000",
        "display" : "Patient cured",
        "equivalence" : "equivalent",
        "comment" : "Zielzustand exakt abgebildet (Finding). Alternative Zustandscodes für Zwischenziele: 103338009 |In full remission|, 103337004 |In partial remission|."
      }]
    },
    {
      "code" : "lebensverlaengerung",
      "display" : "Lebensverlängerung",
      "target" : [{
        "code" : "445320007",
        "display" : "Survival time",
        "equivalence" : "relatedto",
        "comment" : "SNOMED kennt keinen Zielzustand 'verlängertes Leben'; annotiert ist die Messgröße (Observable). Verwandt: 445397003 |Duration of recurrence-free survival|."
      }]
    },
    {
      "code" : "symptomkontrolle",
      "display" : "Symptomkontrolle / Palliation",
      "target" : [{
        "code" : "1149243003",
        "display" : "Managing to control symptoms",
        "equivalence" : "relatedto",
        "comment" : "Finding aus dem Selbstmanagement-Kontext; nächstliegender Zustandscode."
      },
      {
        "code" : "225353007",
        "display" : "Symptom control",
        "equivalence" : "relatedto",
        "comment" : "Regime/Therapy — das Mittel, nicht der Zielzustand."
      }]
    },
    {
      "code" : "lebensqualitaet",
      "display" : "Lebensqualität",
      "target" : [{
        "code" : "1156447008",
        "display" : "Good quality of life",
        "equivalence" : "equivalent",
        "comment" : "Zielzustand als Finding. Messgröße dazu: 405152002 |Quality of life satisfaction (observable entity)| — Erfassung per PROM oder Interview, siehe Zielwerte-Seite."
      }]
    },
    {
      "code" : "funktionserhalt",
      "display" : "Funktionserhalt",
      "target" : [{
        "equivalence" : "unmatched",
        "comment" : "Kein generisches SNOMED-Konzept 'Funktionserhalt als Zielzustand'. Die konkrete Funktion wird je Ziel über target.measure benannt (z. B. 284773001 |Ability to perform personal care activity|, Fertilität via 389093003 |Fertility care|); ein Sammel-Mapping wäre irreführend."
      }]
    }]
  }]
}

```
