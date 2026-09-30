# Stanzbiopsat Mamma links (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Beispiel Specimen: Stanzbiopsat Mamma links (Beispiel)

-------

**German**

-------

**status**: Available

**type**: Stanzbiopsat (Gewebeprobe) Mamma links

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

### Collections

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Collected[x]** | **Method** | **BodySite** |
| * | 2025-09-15 | Core needle biopsy | Mamma links, oberer äußerer Quadrant |



## Resource Content

```json
{
  "resourceType" : "Specimen",
  "id" : "SpecimenBiopsieMamma",
  "status" : "available",
  "type" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "122737001",
      "display" : "Specimen from breast obtained by core needle biopsy"
    },
    {
      "system" : "http://snomed.info/sct",
      "code" : "119376003",
      "display" : "Tissue specimen (specimen)"
    }],
    "text" : "Stanzbiopsat (Gewebeprobe) Mamma links"
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "collection" : {
    "collectedDateTime" : "2025-09-15",
    "method" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "9911007",
        "display" : "Core needle biopsy"
      }]
    },
    "bodySite" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "76365002",
        "display" : "Structure of upper outer quadrant of breast"
      }],
      "text" : "Mamma links, oberer äußerer Quadrant"
    }
  }
}

```
