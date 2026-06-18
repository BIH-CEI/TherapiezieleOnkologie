# Geplante Systemtherapie – FOLFOX + Bevacizumab (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Example MedicationRequest: Geplante Systemtherapie – FOLFOX + Bevacizumab (Beispiel)

-------

**English**

-------

**status**: Active

**intent**: Plan

**medication**: FOLFOX + Bevacizumab

**subject**: [Erika Beispiel Female, DoB: 1958-09-12](Patient-PatientinKRK.md)



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "MedicationRequestFOLFOX",
  "status" : "active",
  "intent" : "plan",
  "medicationCodeableConcept" : {
    "text" : "FOLFOX + Bevacizumab"
  },
  "subject" : {
    "reference" : "Patient/PatientinKRK"
  }
}

```
