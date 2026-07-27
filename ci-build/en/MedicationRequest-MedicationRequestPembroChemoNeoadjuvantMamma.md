# Geplante Systemtherapie – Pembrolizumab + Chemotherapie (KEYNOTE-522, Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Example MedicationRequest: Geplante Systemtherapie – Pembrolizumab + Chemotherapie (KEYNOTE-522, Beispiel)

-------

**English**

-------

Profile: [Tumorboard MedicationRequest](StructureDefinition-onko-tumorboard-medication-request.md)

**status**: Completed

**intent**: Plan

**category**: Tumor board Consult note

**medication**: Pembrolizumab + Carboplatin/Paclitaxel, gefolgt von Pembrolizumab + Epirubicin/Cyclophosphamid (KEYNOTE-522)

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "MedicationRequestPembroChemoNeoadjuvantMamma",
  "meta" : {
    "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-tumorboard-medication-request"]
  },
  "status" : "completed",
  "intent" : "plan",
  "category" : [{
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "85232-7",
      "display" : "Tumor board Consult note"
    }]
  }],
  "medicationCodeableConcept" : {
    "text" : "Pembrolizumab + Carboplatin/Paclitaxel, gefolgt von Pembrolizumab + Epirubicin/Cyclophosphamid (KEYNOTE-522)"
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  }
}

```
