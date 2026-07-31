# Klinisches TNM / UICC-Stadium (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.2

## Example Observation: Klinisches TNM / UICC-Stadium (Beispiel)

-------

**English**

-------

**status**: Final

**code**: Stage group.clinical Cancer

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**effective**: 2025-09-16

**value**: cT2 cN1 cM0 – UICC IIB



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ObsTNMklinischMamma",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "21908-9",
      "display" : "Stage group.clinical Cancer"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "effectiveDateTime" : "2025-09-16",
  "valueCodeableConcept" : {
    "text" : "cT2 cN1 cM0 – UICC IIB"
  }
}

```
