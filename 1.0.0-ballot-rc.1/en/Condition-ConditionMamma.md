# Mammakarzinom links, triple-negativ (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.1

## Example Condition: Mammakarzinom links, triple-negativ (Beispiel)

-------

**English**

-------

Profile: [Onkologische Diagnose (Condition)](StructureDefinition-onko-condition.md)

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
    "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-condition"]
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
