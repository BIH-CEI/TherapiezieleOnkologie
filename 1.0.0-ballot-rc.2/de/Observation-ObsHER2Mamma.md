# HER2/neu-Status – negativ (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.2

## Beispiel Observation: HER2/neu-Status – negativ (Beispiel)

-------

**German**

-------

**status**: Final

**code**: HER2 Ag [Interpretation] in Tissue

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**effective**: 2025-09-17

**value**: Negative

**note**: 

> 

Immunhistochemie 1+ → HER2-negativ; keine In-situ-Hybridisierung erforderlich.


**specimen**: [Specimen: status = available; type = Specimen from breast obtained by core needle biopsy](Specimen-SpecimenBiopsieMamma.md)



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
      "display" : "HER2 Ag [Interpretation] in Tissue"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "effectiveDateTime" : "2025-09-17",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "LA6577-6",
      "display" : "Negative"
    },
    {
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
