# Histologie / Morphologie (ICD-O-3, Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Example Observation: Histologie / Morphologie (ICD-O-3, Beispiel)

-------

**English**

-------

**status**: Final

**code**: Histology [Type] in Cancer specimen Qualitative

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**effective**: 2025-09-15

**value**: Invasives Mammakarzinom, NST (ICD-O-3 8500/3)

**specimen**: [Specimen: status = available; type = Tissue specimen (specimen)](Specimen-SpecimenBiopsieMamma.md)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ObsHistologieMamma",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "59847-4",
      "display" : "Histology [Type] in Cancer specimen Qualitative"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "effectiveDateTime" : "2025-09-15",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "urn:oid:2.16.840.1.113883.6.43.1",
      "code" : "8500/3",
      "display" : "Invasives duktales Karzinom / Karzinom ohne speziellen Typ (NST)"
    }],
    "text" : "Invasives Mammakarzinom, NST (ICD-O-3 8500/3)"
  },
  "specimen" : {
    "reference" : "Specimen/SpecimenBiopsieMamma"
  }
}

```
