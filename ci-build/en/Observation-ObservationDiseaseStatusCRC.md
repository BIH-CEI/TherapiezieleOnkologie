# Tumoransprechen / Disease Status (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Example Observation: Tumoransprechen / Disease Status (Beispiel)

-------

**English**

-------

**status**: Final

**code**: Cancer disease progression

**subject**: [Erika Musterfrau Female, DoB: 1961-09-12](Patient-PatientinCRC.md)

**effective**: 2026-05-15

**value**: Not detected



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ObservationDiseaseStatusCRC",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "97509-4",
      "display" : "Cancer disease progression"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinCRC"
  },
  "effectiveDateTime" : "2026-05-15",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "260415000",
      "display" : "Not detected"
    }]
  }
}

```
