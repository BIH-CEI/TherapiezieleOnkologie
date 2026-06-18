# Kolorektales Karzinom, metastasiert (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Beispiel Condition: Kolorektales Karzinom, metastasiert (Beispiel)

-------

**German**

-------

**clinicalStatus**: Active

**verificationStatus**: Confirmed

**code**: Metastasiertes Kolonkarzinom (mCRC) mit Lebermetastasen

**subject**: [Erika Beispiel Female, DoB: 1958-09-12](Patient-PatientinKRK.md)

**onset**: 2026-01-20



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "ConditionKRK",
  "clinicalStatus" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
      "code" : "active"
    }]
  },
  "verificationStatus" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/condition-ver-status",
      "code" : "confirmed"
    }]
  },
  "code" : {
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
      "code" : "C18.9",
      "display" : "Bösartige Neubildung: Kolon, nicht näher bezeichnet"
    }],
    "text" : "Metastasiertes Kolonkarzinom (mCRC) mit Lebermetastasen"
  },
  "subject" : {
    "reference" : "Patient/PatientinKRK"
  },
  "onsetDateTime" : "2026-01-20"
}

```
