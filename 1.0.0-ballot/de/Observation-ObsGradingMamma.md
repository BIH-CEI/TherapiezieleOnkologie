# Grading G3 (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Beispiel Observation: Grading G3 (Beispiel)

-------

**German**

-------

**status**: Final

**code**: Histologic grade [Score] in Breast cancer specimen by Nottingham

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**effective**: 2025-09-15

**value**: G3 – schlecht differenziert (Elston-Ellis)

**specimen**: [Specimen: status = available; type = Specimen from breast obtained by core needle biopsy](Specimen-SpecimenBiopsieMamma.md)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ObsGradingMamma",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "44648-4",
      "display" : "Histologic grade [Score] in Breast cancer specimen by Nottingham"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "effectiveDateTime" : "2025-09-15",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "1155704001",
      "display" : "G3: Poorly differentiated"
    },
    {
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
