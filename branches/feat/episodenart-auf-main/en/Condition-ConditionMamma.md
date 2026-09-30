# Mammakarzinom links, triple-negativ (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Example Condition: Mammakarzinom links, triple-negativ (Beispiel)

-------

**English**

-------

Profile: [MII PR Onkologie Diagnose Primärtumor](https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.onkologie@2026.0.3&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-diagnose-primaertumor)

**Condition Asserted Date**: 2025-09-15

**clinicalStatus**: Active

**verificationStatus**: Confirmed

**category**: Encounter Diagnosis

**code**: Invasives Mammakarzinom links, oberer äußerer Quadrant (NST), triple-negativ

**bodySite**: Mamma links, oberer äußerer Quadrant

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**onset**: 2025-09-15

**recordedDate**: 2025-09-15



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "ConditionMamma",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-diagnose-primaertumor"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/condition-assertedDate",
    "valueDateTime" : "2025-09-15"
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
      "code" : "C50.4",
      "display" : "Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse"
    }],
    "text" : "Invasives Mammakarzinom links, oberer äußerer Quadrant (NST), triple-negativ"
  },
  "bodySite" : [{
    "text" : "Mamma links, oberer äußerer Quadrant"
  }],
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "onsetDateTime" : "2025-09-15",
  "recordedDate" : "2025-09-15"
}

```
