# Progesteronrezeptor-Status – negativ (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.2

## Beispiel Observation: Progesteronrezeptor-Status – negativ (Beispiel)

-------

**German**

-------

**status**: Final

**code**: Progesterone receptor Ag [Presence] in Breast cancer specimen by Immune stain

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**effective**: 2025-09-17

**value**: Negative

**note**: 

> 

Immunhistochemie: <1 % positive Kerne → PR-negativ.


**specimen**: [Specimen: status = available; type = Specimen from breast obtained by core needle biopsy](Specimen-SpecimenBiopsieMamma.md)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ObsProgesteronrezeptorMamma",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "85339-0",
      "display" : "Progesterone receptor Ag [Presence] in Breast cancer specimen by Immune stain"
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
    "text" : "Immunhistochemie: <1 % positive Kerne → PR-negativ."
  }],
  "specimen" : {
    "reference" : "Specimen/SpecimenBiopsieMamma"
  }
}

```
