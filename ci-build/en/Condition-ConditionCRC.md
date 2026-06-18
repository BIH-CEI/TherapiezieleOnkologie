# Kolorektales Karzinom, metastasiert (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Example Condition: Kolorektales Karzinom, metastasiert (Beispiel)

-------

**English**

-------

**clinicalStatus**: Active

**verificationStatus**: Confirmed

**code**: Metastasiertes Kolonkarzinom (mCRC) mit Lebermetastasen

**subject**: [Erika Musterfrau Female, DoB: 1961-09-12](Patient-PatientinCRC.md)

**onset**: 2026-01-20



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "ConditionCRC",
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
    "reference" : "Patient/PatientinCRC"
  },
  "onsetDateTime" : "2026-01-20"
}

```
