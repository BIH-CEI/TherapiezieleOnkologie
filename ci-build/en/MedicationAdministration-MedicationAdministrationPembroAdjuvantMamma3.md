# Verabreichte adjuvante Systemtherapie – Pembrolizumab-Monotherapie, Zyklus 3/~9 (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Example MedicationAdministration: Verabreichte adjuvante Systemtherapie – Pembrolizumab-Monotherapie, Zyklus 3/~9 (Beispiel)

-------

**English**

-------

**status**: Completed

**medication**: Pembrolizumab-Monotherapie (adjuvant, KEYNOTE-522), q3w

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**effective**: 2026-06-05

**request**: [MedicationRequest: extension = Same LoT; status = active; intent = plan; category = Tumor board Consult note; medication[x] = ](MedicationRequest-MedicationRequestPembroAdjuvantMamma.md)

**note**: 

> 

Zyklus 3 von ~9 (q3w), ambulant; Therapie läuft weiter




## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "MedicationAdministrationPembroAdjuvantMamma3",
  "status" : "completed",
  "medicationCodeableConcept" : {
    "text" : "Pembrolizumab-Monotherapie (adjuvant, KEYNOTE-522), q3w"
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "effectiveDateTime" : "2026-06-05",
  "request" : {
    "reference" : "MedicationRequest/MedicationRequestPembroAdjuvantMamma"
  },
  "note" : [{
    "text" : "Zyklus 3 von ~9 (q3w), ambulant; Therapie läuft weiter"
  }]
}

```
