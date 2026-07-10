# Progesteronrezeptor-Status – negativ (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Example Observation: Progesteronrezeptor-Status – negativ (Beispiel)

-------

**English**

-------

**status**: Final

**code**: Progesterone receptor Ag [Presence] in Breast cancer specimen by Immune stain

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**effective**: 2025-09-17

**value**: Negative

**note**: 

> 

Immunhistochemie: <1 % positive Kerne → PR-negativ.


**specimen**: [Specimen: status = available; type = Tissue specimen (specimen)](Specimen-SpecimenBiopsieMamma.md)



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
