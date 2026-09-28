# Kolorektales Karzinom, metastasiert (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Beispiel Condition: Kolorektales Karzinom, metastasiert (Beispiel)

-------

**German**

-------

Profile: [MII PR Onkologie Diagnose Primärtumor](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.onkologie@2026.0.3&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-diagnose-primaertumor)

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
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-diagnose-primaertumor"]
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
