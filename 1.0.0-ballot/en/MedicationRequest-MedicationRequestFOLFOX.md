# Tumorboard-Empfehlung – FOLFOX + Bevacizumab (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Example MedicationRequest: Tumorboard-Empfehlung – FOLFOX + Bevacizumab (Beispiel)

-------

**English**

-------

Profile: [Tumorboard MedicationRequest](StructureDefinition-onko-tumorboard-medication-request.md)

**status**: Active

**intent**: Plan

**category**: Tumor board Consult note

**medication**: FOLFOX + Bevacizumab

**subject**: [Erika Musterfrau Female, DoB: 1961-09-12](Patient-PatientinCRC.md)

**requester**: [Practitioner Petra Musterarzt ](Practitioner-OnkologinCRC.md)



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "MedicationRequestFOLFOX",
  "meta" : {
    "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-tumorboard-medication-request"]
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
  "medicationCodeableConcept" : {
    "text" : "FOLFOX + Bevacizumab"
  },
  "subject" : {
    "reference" : "Patient/PatientinCRC"
  },
  "requester" : {
    "reference" : "Practitioner/OnkologinCRC"
  }
}

```
