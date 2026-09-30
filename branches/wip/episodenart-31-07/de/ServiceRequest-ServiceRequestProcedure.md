# Geplante Operation vom Tumorboard um den Tumor operativ zu entfernen - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Beispiel ServiceRequest: Geplante Operation vom Tumorboard um den Tumor operativ zu entfernen

-------

**German**

-------

Profile: [Tumorboard ServiceRequest](StructureDefinition-onko-tumorboard-service-request.md)

**status**: Active

**intent**: Proposal

**category**: Tumor board Consult note, Surgical procedure

**code**: Lumpectomy of breast (procedure)

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)



## Resource Content

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "ServiceRequestProcedure",
  "meta" : {
    "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-tumorboard-service-request"]
  },
  "status" : "active",
  "intent" : "proposal",
  "category" : [{
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "85232-7",
      "display" : "Tumor board Consult note"
    }]
  },
  {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "387713003",
      "display" : "Surgical procedure"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "392021009",
      "display" : "Lumpectomy of breast (procedure)"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  }
}

```
