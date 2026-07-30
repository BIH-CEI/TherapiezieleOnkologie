# Histopathologischer Befund (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Example DiagnosticReport: Histopathologischer Befund (Beispiel)

-------

**English**

-------

## Histopathologie Kolonbiopsie 

| | |
| :--- | :--- |
| Subject | Erika Musterfrau Female, DoB: 1961-09-12 |
| Relevant Time | 2026-01-18 |

**Report Details**

Adenokarzinom des Kolons (C18.9), ICD-O-3 M8140/3.



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "DiagnosticReportHistologieCRC",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "60568-3",
      "display" : "Pathology Synoptic report"
    }],
    "text" : "Histopathologie Kolonbiopsie"
  },
  "subject" : {
    "reference" : "Patient/PatientinCRC"
  },
  "effectiveDateTime" : "2026-01-18",
  "conclusion" : "Adenokarzinom des Kolons (C18.9), ICD-O-3 M8140/3."
}

```
