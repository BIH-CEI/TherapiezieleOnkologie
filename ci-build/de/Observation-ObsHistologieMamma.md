# Histologie / Morphologie (ICD-O-3, Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Beispiel Observation: Histologie / Morphologie (ICD-O-3, Beispiel)

-------

**German**

-------

**status**: Final

**code**: Histology and Behavior ICD-O-3 Cancer

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**effective**: 2025-09-15

**value**: Invasives Mammakarzinom, NST (ICD-O-3 8500/3)

**specimen**: [Specimen: status = available; type = Specimen from breast obtained by core needle biopsy](Specimen-SpecimenBiopsieMamma.md)



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
      "display" : "Histology and Behavior ICD-O-3 Cancer"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "effectiveDateTime" : "2025-09-15",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "82711006",
      "display" : "Infiltrating duct carcinoma"
    },
    {
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
