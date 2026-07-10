# Ki-67 Proliferationsindex (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Beispiel Observation: Ki-67 Proliferationsindex (Beispiel)

-------

**German**

-------

**status**: Final

**code**: Ki-67 Proliferationsindex (MIB-1)

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**effective**: 2025-09-17

**value**: 70 % (Details: UCUM code% = '%')

**specimen**: [Specimen: status = available; type = Tissue specimen (specimen)](Specimen-SpecimenBiopsieMamma.md)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ObsKi67Mamma",
  "status" : "final",
  "code" : {
    "text" : "Ki-67 Proliferationsindex (MIB-1)"
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "effectiveDateTime" : "2025-09-17",
  "valueQuantity" : {
    "value" : 70,
    "unit" : "%",
    "system" : "http://unitsofmeasure.org",
    "code" : "%"
  },
  "specimen" : {
    "reference" : "Specimen/SpecimenBiopsieMamma"
  }
}

```
