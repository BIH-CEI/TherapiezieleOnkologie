# Anforderung Koloskopie mit Biopsie (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Beispiel ServiceRequest: Anforderung Koloskopie mit Biopsie (Beispiel)

-------

**German**

-------

**status**: Completed

**intent**: Order

**code**: Koloskopie mit Biopsieentnahme

**subject**: [Erika Musterfrau Female, DoB: 1961-09-12](Patient-PatientinCRC.md)



## Resource Content

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "ServiceRequestKoloskopieCRC",
  "status" : "completed",
  "intent" : "order",
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "73761001",
      "display" : "Colonoscopy"
    }],
    "text" : "Koloskopie mit Biopsieentnahme"
  },
  "subject" : {
    "reference" : "Patient/PatientinCRC"
  }
}

```
