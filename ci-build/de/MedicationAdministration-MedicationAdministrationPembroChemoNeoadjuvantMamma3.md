# Verabreichte Systemtherapie – Pembrolizumab + Carboplatin/Paclitaxel, Zyklus 3/4 (KEYNOTE-522, Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Beispiel MedicationAdministration: Verabreichte Systemtherapie – Pembrolizumab + Carboplatin/Paclitaxel, Zyklus 3/4 (KEYNOTE-522, Beispiel)

-------

**German**

-------

**status**: Completed

**medication**: Pembrolizumab + Carboplatin (q3w), Paclitaxel wöchentlich begleitend (KEYNOTE-522, Phase 1)

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**effective**: 2026-02-10

**request**: [MedicationRequest: status = completed; intent = plan; category = Tumor board Consult note; medication[x] = ](MedicationRequest-MedicationRequestPembroChemoNeoadjuvantMamma.md)

**note**: 

> 

Zyklus 3 von 4 (Pembro/Carbo q3w); begleitend wöchentliche Paclitaxel-Gaben, hier nicht einzeln erfasst




## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "MedicationAdministrationPembroChemoNeoadjuvantMamma3",
  "status" : "completed",
  "medicationCodeableConcept" : {
    "text" : "Pembrolizumab + Carboplatin (q3w), Paclitaxel wöchentlich begleitend (KEYNOTE-522, Phase 1)"
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "effectiveDateTime" : "2026-02-10",
  "request" : {
    "reference" : "MedicationRequest/MedicationRequestPembroChemoNeoadjuvantMamma"
  },
  "note" : [{
    "text" : "Zyklus 3 von 4 (Pembro/Carbo q3w); begleitend wöchentliche Paclitaxel-Gaben, hier nicht einzeln erfasst"
  }]
}

```
