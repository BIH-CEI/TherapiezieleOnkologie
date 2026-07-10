# HER2/neu-Status – negativ (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Example Observation: HER2/neu-Status – negativ (Beispiel)

-------

**English**

-------

**status**: Final

**code**: HER2 [Interpretation] in Tissue

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**effective**: 2025-09-17

**value**: negativ

**note**: 

> 

Immunhistochemie 1+ → HER2-negativ; keine In-situ-Hybridisierung erforderlich.


**specimen**: [Specimen: status = available; type = Tissue specimen (specimen)](Specimen-SpecimenBiopsieMamma.md)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ObsHER2Mamma",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "48676-1",
      "display" : "HER2 [Interpretation] in Tissue"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "effectiveDateTime" : "2025-09-17",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-her2neu-status-obds",
      "code" : "N",
      "display" : "negativ"
    },
    {
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-her2neu-status-leitlinie",
      "code" : "negativ",
      "display" : "HER2-negativ"
    }]
  },
  "note" : [{
    "text" : "Immunhistochemie 1+ → HER2-negativ; keine In-situ-Hybridisierung erforderlich."
  }],
  "specimen" : {
    "reference" : "Specimen/SpecimenBiopsieMamma"
  }
}

```
