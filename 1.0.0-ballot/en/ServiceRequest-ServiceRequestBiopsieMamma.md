# Anforderung Stanzbiopsie Mamma (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Example ServiceRequest: Anforderung Stanzbiopsie Mamma (Beispiel)

-------

**English**

-------

**status**: Completed

**intent**: Order

**code**: Core needle biopsy of breast (procedure)

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**authoredOn**: 2025-09-12

**requester**: [Practitioner Katrin Musterarzt ](Practitioner-OnkologinMamma.md)



## Resource Content

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "ServiceRequestBiopsieMamma",
  "status" : "completed",
  "intent" : "order",
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "44578009",
      "display" : "Core needle biopsy of breast (procedure)"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "authoredOn" : "2025-09-12",
  "requester" : {
    "reference" : "Practitioner/OnkologinMamma"
  }
}

```
