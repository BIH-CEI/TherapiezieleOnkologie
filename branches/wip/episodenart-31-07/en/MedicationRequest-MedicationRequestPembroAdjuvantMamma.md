# Adjuvante Systemtherapie – Pembrolizumab-Monotherapie (KEYNOTE-522, Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Example MedicationRequest: Adjuvante Systemtherapie – Pembrolizumab-Monotherapie (KEYNOTE-522, Beispiel)

-------

**English**

-------

Profile: [Tumorboard MedicationRequest](StructureDefinition-onko-tumorboard-medication-request.md)

**EnLiST-Änderungstyp (Extension)**: Same LoT

**status**: Active

**intent**: Plan

**category**: Tumor board Consult note

**medication**: Pembrolizumab-Monotherapie (adjuvant, KEYNOTE-522), ambulant, ~9 Zyklen q3w

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "MedicationRequestPembroAdjuvantMamma",
  "meta" : {
    "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-tumorboard-medication-request"]
  },
  "extension" : [{
    "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-change",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/enlist-change-type",
        "code" : "same",
        "display" : "Same LoT"
      }]
    }
  }],
  "status" : "active",
  "intent" : "plan",
  "category" : [{
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "85232-7",
      "display" : "Tumor board Consult note"
    }]
  }],
  "medicationCodeableConcept" : {
    "text" : "Pembrolizumab-Monotherapie (adjuvant, KEYNOTE-522), ambulant, ~9 Zyklen q3w"
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  }
}

```
