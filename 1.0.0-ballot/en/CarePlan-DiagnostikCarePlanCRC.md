# Onkologischer CarePlan – Tumordiagnostik (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Example CarePlan: Onkologischer CarePlan – Tumordiagnostik (Beispiel)

-------

**English**

-------

Profile: [Onkologischer CarePlan](StructureDefinition-onko-care-plan.md)

**CarePlan Custodian (Extension)**: [Organization Onkologisches Zentrum Musterklinik](Organization-TumorzentrumCRC.md)

**status**: Completed

**intent**: Plan

**category**: Bösartige Neubildung: Kolon, nicht näher bezeichnet, Diagnostic intent (qualifier value)

**subject**: [Erika Musterfrau Female, DoB: 1961-09-12](Patient-PatientinCRC.md)

**period**: 2026-01-05 --> 2026-01-20

**careTeam**: [CareTeam Interdisziplinäres Tumorboard Kolorektales Karzinom](CareTeam-TumorboardCRC.md)

**addresses**: [Condition Bösartige Neubildung: Kolon, nicht näher bezeichnet](Condition-ConditionCRC.md)

### Activities

| | | |
| :--- | :--- | :--- |
| - | **OutcomeReference** | **Reference** |
| * | [Diagnostic Report for 'Pathology Synoptic report' for '->Erika Musterfrau Female, DoB: 1961-09-12'](DiagnosticReport-DiagnosticReportHistologieCRC.md) | [ServiceRequest Colonoscopy](ServiceRequest-ServiceRequestKoloskopieCRC.md) |



## Resource Content

```json
{
  "resourceType" : "CarePlan",
  "id" : "DiagnostikCarePlanCRC",
  "meta" : {
    "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-care-plan"]
  },
  "extension" : [{
    "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-careplan-custodian",
    "valueReference" : {
      "reference" : "Organization/TumorzentrumCRC"
    }
  }],
  "status" : "completed",
  "intent" : "plan",
  "category" : [{
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
      "code" : "C18.9",
      "display" : "Bösartige Neubildung: Kolon, nicht näher bezeichnet"
    }]
  },
  {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "261004008",
      "display" : "Diagnostic intent (qualifier value)"
    }]
  }],
  "subject" : {
    "reference" : "Patient/PatientinCRC"
  },
  "period" : {
    "start" : "2026-01-05",
    "end" : "2026-01-20"
  },
  "careTeam" : [{
    "reference" : "CareTeam/TumorboardCRC"
  }],
  "addresses" : [{
    "reference" : "Condition/ConditionCRC"
  }],
  "activity" : [{
    "outcomeReference" : [{
      "reference" : "DiagnosticReport/DiagnosticReportHistologieCRC"
    }],
    "reference" : {
      "reference" : "ServiceRequest/ServiceRequestKoloskopieCRC"
    }
  }]
}

```
