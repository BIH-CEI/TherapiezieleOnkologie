# Kolorektales Karzinom, metastasiert (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Example Condition: Kolorektales Karzinom, metastasiert (Beispiel)

-------

**English**

-------

Profile: [Onkologische Diagnose (Condition)](StructureDefinition-onko-condition.md)

**Condition Asserted Date**: 2026-01-20

**clinicalStatus**: Active

**verificationStatus**: Confirmed

**category**: Encounter Diagnosis

**code**: Metastasiertes Kolonkarzinom (mCRC) mit Lebermetastasen

**subject**: [Erika Musterfrau Female, DoB: 1961-09-12](Patient-PatientinCRC.md)

**onset**: 2026-01-20

**recordedDate**: 2026-01-20



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "ConditionCRC",
  "meta" : {
    "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-condition"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/condition-assertedDate",
    "valueDateTime" : "2026-01-20"
  }],
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
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/condition-category",
      "code" : "encounter-diagnosis"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
      "version" : "2026",
      "code" : "C18.9",
      "display" : "Bösartige Neubildung: Kolon, nicht näher bezeichnet"
    }],
    "text" : "Metastasiertes Kolonkarzinom (mCRC) mit Lebermetastasen"
  },
  "subject" : {
    "reference" : "Patient/PatientinCRC"
  },
  "onsetDateTime" : "2026-01-20",
  "recordedDate" : "2026-01-20"
}

```
