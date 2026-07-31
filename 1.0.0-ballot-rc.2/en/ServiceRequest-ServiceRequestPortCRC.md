# Tumorboard-Empfehlung – Portimplantation (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.2

## Example ServiceRequest: Tumorboard-Empfehlung – Portimplantation (Beispiel)

-------

**English**

-------

Profile: [Tumorboard ServiceRequest](StructureDefinition-onko-tumorboard-service-request.md)

**status**: Active

**intent**: Plan

**category**: Tumor board Consult note

**code**: Implantation eines Portkatheters für die systemische Therapie

**subject**: [Erika Musterfrau Female, DoB: 1961-09-12](Patient-PatientinCRC.md)

**requester**: [Practitioner Petra Musterarzt ](Practitioner-OnkologinCRC.md)



## Resource Content

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "ServiceRequestPortCRC",
  "meta" : {
    "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-tumorboard-service-request"]
  },
  "status" : "active",
  "intent" : "plan",
  "category" : [{
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "85232-7",
      "display" : "Tumor board Consult note"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "1255694000",
      "display" : "Implantable venous access port injection"
    }],
    "text" : "Implantation eines Portkatheters für die systemische Therapie"
  },
  "subject" : {
    "reference" : "Patient/PatientinCRC"
  },
  "requester" : {
    "reference" : "Practitioner/OnkologinCRC"
  }
}

```
