# Keimbahn-Testung gBRCA1 – unauffällig (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.1

## Example Observation: Keimbahn-Testung gBRCA1 – unauffällig (Beispiel)

-------

**English**

-------

**status**: Final

**code**: BRCA1 gene mutations tested for in Blood or Tissue by Molecular genetics method Nominal

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**effective**: 2025-09-25

**value**: Negative

**note**: 

> 

gBRCA1/2: keine (wahrscheinlich) pathogene Variante (Klasse 4/5) nachgewiesen.




## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ObsGBRCAMamma",
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "21639-0",
      "display" : "BRCA1 gene mutations tested for in Blood or Tissue by Molecular genetics method Nominal"
    }]
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "effectiveDateTime" : "2025-09-25",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "260385009",
      "display" : "Negative"
    }]
  },
  "note" : [{
    "text" : "gBRCA1/2: keine (wahrscheinlich) pathogene Variante (Klasse 4/5) nachgewiesen."
  }]
}

```
