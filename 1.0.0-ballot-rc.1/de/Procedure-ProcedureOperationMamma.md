# Brusterhaltende Operation + Sentinel-Lymphknoten-Biopsie (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.1

## Beispiel Procedure: Brusterhaltende Operation + Sentinel-Lymphknoten-Biopsie (Beispiel)

-------

**German**

-------

**status**: Completed

**code**: Brusterhaltende Operation (BET) links + Sentinel-Lymphknoten-Biopsie

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**performed**: 2026-04-02



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "ProcedureOperationMamma",
  "status" : "completed",
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "392021009",
      "display" : "Lumpectomy of breast (procedure)"
    }],
    "text" : "Brusterhaltende Operation (BET) links + Sentinel-Lymphknoten-Biopsie"
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "performedDateTime" : "2026-04-02"
}

```
