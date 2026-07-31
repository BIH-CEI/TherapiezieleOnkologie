# Tumoransprechen / Disease Status – Komplettremission (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.2

## Example Observation: Tumoransprechen / Disease Status – Komplettremission (Beispiel)

-------

**English**

-------

**status**: Final

**code**: Cancer disease progression

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**effective**: 2026-04-07

**value**: Not detected

**note**: 

> 

Pathologische Komplettremission (pCR, ypT0 ypN0) nach neoadjuvanter Systemtherapie.




## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ObsDiseaseStatusMamma",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "97509-4",
      "display" : "Cancer disease progression"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "effectiveDateTime" : "2026-04-07",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "260415000",
      "display" : "Not detected"
    }]
  },
  "note" : [{
    "text" : "Pathologische Komplettremission (pCR, ypT0 ypN0) nach neoadjuvanter Systemtherapie."
  }]
}

```
