# Anforderung histopathologische Untersuchung (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Beispiel ServiceRequest: Anforderung histopathologische Untersuchung (Beispiel)

-------

**German**

-------

**status**: Completed

**intent**: Order

**code**: Histopathologische Untersuchung inkl. Rezeptor-/HER2-Status und Ki-67

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**authoredOn**: 2025-09-15

**requester**: [Practitioner Katrin Musterarzt ](Practitioner-OnkologinMamma.md)

**specimen**: [Specimen: status = available; type = Tissue specimen (specimen)](Specimen-SpecimenBiopsieMamma.md)



## Resource Content

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "ServiceRequestPathologieMamma",
  "status" : "completed",
  "intent" : "order",
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "788124003",
      "display" : "Histopathology service (qualifier value)"
    }],
    "text" : "Histopathologische Untersuchung inkl. Rezeptor-/HER2-Status und Ki-67"
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "authoredOn" : "2025-09-15",
  "requester" : {
    "reference" : "Practitioner/OnkologinMamma"
  },
  "specimen" : [{
    "reference" : "Specimen/SpecimenBiopsieMamma"
  }]
}

```
