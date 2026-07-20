# Anforderung klinisches Staging (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Example ServiceRequest: Anforderung klinisches Staging (Beispiel)

-------

**English**

-------

**status**: Completed

**intent**: Order

**code**: Klinische Ausbreitungsdiagnostik / TNM-Staging

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**authoredOn**: 2025-09-15

**requester**: [Practitioner Katrin Musterarzt ](Practitioner-OnkologinMamma.md)



## Resource Content

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "ServiceRequestStagingMamma",
  "status" : "completed",
  "intent" : "order",
  "code" : {
    "text" : "Klinische Ausbreitungsdiagnostik / TNM-Staging"
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "authoredOn" : "2025-09-15",
  "requester" : {
    "reference" : "Practitioner/OnkologinMamma"
  }
}

```
