# Grading G3 (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Beispiel Observation: Grading G3 (Beispiel)

-------

**German**

-------

**status**: Final

**code**: Histology grade [Identifier] in Cancer specimen

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**effective**: 2025-09-15

**value**: G3 – schlecht differenziert (Elston-Ellis)

**specimen**: [Specimen: status = available; type = Tissue specimen (specimen)](Specimen-SpecimenBiopsieMamma.md)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ObsGradingMamma",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "33732-9",
      "display" : "Histology grade [Identifier] in Cancer specimen"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "effectiveDateTime" : "2025-09-15",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-grading",
      "code" : "3",
      "display" : "schlecht differenziert"
    }],
    "text" : "G3 – schlecht differenziert (Elston-Ellis)"
  },
  "specimen" : {
    "reference" : "Specimen/SpecimenBiopsieMamma"
  }
}

```
