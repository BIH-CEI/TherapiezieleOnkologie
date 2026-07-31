# Diagnostischer CarePlan – Tumordiagnostik (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.1

## Example CarePlan: Diagnostischer CarePlan – Tumordiagnostik (Beispiel)

-------

**English**

-------

Profile: [Diagnostischer CarePlan](StructureDefinition-onko-diagnostic-care-plan.md)

**CarePlan Custodian (Extension)**: [Organization Onkologisches Zentrum Musterklinik](Organization-TumorzentrumCRC.md)

**status**: Completed

**intent**: Plan

**category**: Tumordiagnostik

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
    "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-diagnostic-care-plan"]
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
    "text" : "Tumordiagnostik"
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
