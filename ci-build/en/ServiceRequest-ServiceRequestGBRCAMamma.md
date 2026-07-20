# Anforderung Keimbahn-Testung gBRCA1 (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Example ServiceRequest: Anforderung Keimbahn-Testung gBRCA1 (Beispiel)

-------

**English**

-------

**status**: Completed

**intent**: Order

**code**: BRCA1 gene mutations tested for in Blood or Tissue by Molecular genetics method Nominal

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**authoredOn**: 2025-09-18

**requester**: [Practitioner Katrin Musterarzt ](Practitioner-OnkologinMamma.md)



## Resource Content

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "ServiceRequestGBRCAMamma",
  "status" : "completed",
  "intent" : "order",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "21639-0",
      "display" : "BRCA1 gene mutations tested for in Blood or Tissue by Molecular genetics method Nominal"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "authoredOn" : "2025-09-18",
  "requester" : {
    "reference" : "Practitioner/OnkologinMamma"
  }
}

```
