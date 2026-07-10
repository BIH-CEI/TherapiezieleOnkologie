# Geplante Systemtherapie – Pembrolizumab + Chemotherapie (KEYNOTE-522, Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Beispiel MedicationRequest: Geplante Systemtherapie – Pembrolizumab + Chemotherapie (KEYNOTE-522, Beispiel)

-------

**German**

-------

**status**: Completed

**intent**: Plan

**medication**: Pembrolizumab + Carboplatin/Paclitaxel, gefolgt von Pembrolizumab + Epirubicin/Cyclophosphamid (KEYNOTE-522)

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "MedicationRequestKEYNOTE522",
  "status" : "completed",
  "intent" : "plan",
  "medicationCodeableConcept" : {
    "text" : "Pembrolizumab + Carboplatin/Paclitaxel, gefolgt von Pembrolizumab + Epirubicin/Cyclophosphamid (KEYNOTE-522)"
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  }
}

```
