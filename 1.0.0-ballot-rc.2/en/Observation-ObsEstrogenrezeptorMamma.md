# Östrogenrezeptor-Status – negativ (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.2

## Example Observation: Östrogenrezeptor-Status – negativ (Beispiel)

-------

**English**

-------

**status**: Final

**code**: Estrogen receptor Ag [Presence] in Breast cancer specimen by Immune stain

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**effective**: 2025-09-17

**value**: Negative

**note**: 

> 

Immunhistochemie: <1 % positive Kerne → ER-negativ.


**specimen**: [Specimen: status = available; type = Specimen from breast obtained by core needle biopsy](Specimen-SpecimenBiopsieMamma.md)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ObsEstrogenrezeptorMamma",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "85337-4",
      "display" : "Estrogen receptor Ag [Presence] in Breast cancer specimen by Immune stain"
    },
    {
      "system" : "http://snomed.info/sct",
      "code" : "1234806008",
      "display" : "Observation using immunohistochemistry (observable entity)"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "effectiveDateTime" : "2025-09-17",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "LA6577-6",
      "display" : "Negative"
    }]
  },
  "note" : [{
    "text" : "Immunhistochemie: <1 % positive Kerne → ER-negativ."
  }],
  "specimen" : {
    "reference" : "Specimen/SpecimenBiopsieMamma"
  }
}

```
