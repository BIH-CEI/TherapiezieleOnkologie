# Postneoadjuvantes TNM / pCR (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Example Observation: Postneoadjuvantes TNM / pCR (Beispiel)

-------

**English**

-------

**status**: Final

**code**: Stage group.pathology Cancer

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**effective**: 2026-04-07

**value**: ypT0 ypN0 – pathologische Komplettremission (pCR)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ObsTNMpathologischMamma",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "21902-2",
      "display" : "Stage group.pathology Cancer"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "effectiveDateTime" : "2026-04-07",
  "valueCodeableConcept" : {
    "text" : "ypT0 ypN0 – pathologische Komplettremission (pCR)"
  }
}

```
