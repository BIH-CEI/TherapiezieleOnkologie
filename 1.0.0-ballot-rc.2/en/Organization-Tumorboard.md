# Tumorboard - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.2

## Example Organization: Tumorboard

-------

**English**

-------

**identifier**: `https://www.musterklinik.de/fhir/sid/organisationen`/tumorboard-brust-001

**active**: true

**type**: Organizational team

**name**: Zertifiziertes Brustzentrum Musterklinik



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "Tumorboard",
  "identifier" : [{
    "system" : "https://www.musterklinik.de/fhir/sid/organisationen",
    "value" : "tumorboard-brust-001"
  }],
  "active" : true,
  "type" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/organization-type",
      "code" : "team",
      "display" : "Organizational team"
    }]
  }],
  "name" : "Zertifiziertes Brustzentrum Musterklinik"
}

```
