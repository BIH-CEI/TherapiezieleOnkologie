# Östrogenrezeptor-Status – negativ (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Beispiel Observation: Östrogenrezeptor-Status – negativ (Beispiel)

-------

**German**

-------

**status**: Final

**code**: Estrogen receptor Ag [Presence] in Tissue by Immune stain

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**effective**: 2025-09-17

**value**: Negative

**note**: 

> 

Immunhistochemie: <1 % positive Kerne → ER-negativ.


**specimen**: [Specimen: status = available; type = Tissue specimen (specimen)](Specimen-SpecimenBiopsieMamma.md)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ObsEstrogenrezeptorMamma",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "40556-3",
      "display" : "Estrogen receptor Ag [Presence] in Tissue by Immune stain"
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
