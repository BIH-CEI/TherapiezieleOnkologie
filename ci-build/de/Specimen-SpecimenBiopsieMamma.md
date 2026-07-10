# Stanzbiopsat Mamma links (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Beispiel Specimen: Stanzbiopsat Mamma links (Beispiel)

-------

**German**

-------

**status**: Available

**type**: Stanzbiopsat (Gewebeprobe) Mamma links

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

### Collections

| | | |
| :--- | :--- | :--- |
| - | **Collected[x]** | **BodySite** |
| * | 2025-09-15 | Mamma links, oberer äußerer Quadrant |



## Resource Content

```json
{
  "resourceType" : "Specimen",
  "id" : "SpecimenBiopsieMamma",
  "status" : "available",
  "type" : {
    "coding" : [{
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
    "bodySite" : {
      "text" : "Mamma links, oberer äußerer Quadrant"
    }
  }
}

```
