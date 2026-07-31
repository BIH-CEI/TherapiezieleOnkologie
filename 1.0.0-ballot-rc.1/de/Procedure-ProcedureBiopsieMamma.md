# Sonografisch gesteuerte Stanzbiopsie der Mamma (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.1

## Beispiel Procedure: Sonografisch gesteuerte Stanzbiopsie der Mamma (Beispiel)

-------

**German**

-------

**status**: Completed

**category**: Diagnostic procedure (procedure)

**code**: Sonografisch gesteuerte Stanzbiopsie der Mamma links

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**performed**: 2025-09-15

**reasonReference**: [Condition Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse](Condition-ConditionMamma.md)

**bodySite**: Mamma links, oberer äußerer Quadrant



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "ProcedureBiopsieMamma",
  "status" : "completed",
  "category" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "103693007",
      "display" : "Diagnostic procedure (procedure)"
    }]
  },
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "44578009",
      "display" : "Core needle biopsy of breast (procedure)"
    }],
    "text" : "Sonografisch gesteuerte Stanzbiopsie der Mamma links"
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "performedDateTime" : "2025-09-15",
  "reasonReference" : [{
    "reference" : "Condition/ConditionMamma"
  }],
  "bodySite" : [{
    "text" : "Mamma links, oberer äußerer Quadrant"
  }]
}

```
