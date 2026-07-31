# Transaction-Bundle – mCRC palliativ (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.1

## Beispiel Bundle: Transaction-Bundle – mCRC palliativ (Beispiel)



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "BundleCRCPalliativ",
  "type" : "transaction",
  "entry" : [{
    "fullUrl" : "http://example.org/fhir/Patient/PatientinCRC",
    "resource" : {
      "resourceType" : "Patient",
      "id" : "PatientinCRC",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Patient_PatientinCRC\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Patient PatientinCRC</b></p><a name=\"PatientinCRC\"> </a><a name=\"hcPatientinCRC\"> </a><p style=\"border: 1px #661aff solid; background-color: #e6e6ff; padding: 10px;\">Erika Musterfrau  Female, DoB: 1961-09-12</p><hr/></div></div>"
      },
      "name" : [{
        "family" : "Musterfrau",
        "given" : ["Erika"]
      }],
      "gender" : "female",
      "birthDate" : "1961-09-12"
    },
    "request" : {
      "method" : "POST",
      "url" : "Patient"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/Practitioner/OnkologinCRC",
    "resource" : {
      "resourceType" : "Practitioner",
      "id" : "OnkologinCRC",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Practitioner_OnkologinCRC\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Practitioner OnkologinCRC</b></p><a name=\"OnkologinCRC\"> </a><a name=\"hcOnkologinCRC\"> </a><p><b>name</b>: Petra Musterarzt </p></div></div>"
      },
      "name" : [{
        "family" : "Musterarzt",
        "given" : ["Petra"]
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "Practitioner"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/Organization/TumorzentrumCRC",
    "resource" : {
      "resourceType" : "Organization",
      "id" : "TumorzentrumCRC",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Organization_TumorzentrumCRC\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Organization TumorzentrumCRC</b></p><a name=\"TumorzentrumCRC\"> </a><a name=\"hcTumorzentrumCRC\"> </a><p><b>name</b>: Onkologisches Zentrum Musterklinik</p></div></div>"
      },
      "name" : "Onkologisches Zentrum Musterklinik"
    },
    "request" : {
      "method" : "POST",
      "url" : "Organization"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/CareTeam/TumorboardCRC",
    "resource" : {
      "resourceType" : "CareTeam",
      "id" : "TumorboardCRC",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"CareTeam_TumorboardCRC\"> </a><p class=\"res-header-id\"><b>Generated Narrative: CareTeam TumorboardCRC</b></p><a name=\"TumorboardCRC\"> </a><a name=\"hcTumorboardCRC\"> </a><p><b>status</b>: Active</p><p><b>name</b>: Interdisziplinäres Tumorboard Kolorektales Karzinom</p><p><b>subject</b>: <a href=\"Patient-PatientinCRC.html\">Erika Musterfrau  Female, DoB: 1961-09-12</a></p><h3>Participants</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Member</b></td></tr><tr><td style=\"display: none\">*</td><td><a href=\"Practitioner-OnkologinCRC.html\">Practitioner Petra Musterarzt </a></td></tr></table><p><b>managingOrganization</b>: <a href=\"Organization-TumorzentrumCRC.html\">Organization Onkologisches Zentrum Musterklinik</a></p></div></div>"
      },
      "status" : "active",
      "name" : "Interdisziplinäres Tumorboard Kolorektales Karzinom",
      "subject" : {
        "reference" : "Patient/PatientinCRC"
      },
      "participant" : [{
        "member" : {
          "reference" : "Practitioner/OnkologinCRC"
        }
      }],
      "managingOrganization" : [{
        "reference" : "Organization/TumorzentrumCRC"
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "CareTeam"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/Condition/ConditionCRC",
    "resource" : {
      "resourceType" : "Condition",
      "id" : "ConditionCRC",
      "meta" : {
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-condition"]
      },
      "text" : {
        "status" : "extensions",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Condition_ConditionCRC\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Condition ConditionCRC</b></p><a name=\"ConditionCRC\"> </a><a name=\"hcConditionCRC\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-onko-condition.html\">Onkologische Diagnose (Condition)</a></p></div><p><b>Condition Asserted Date</b>: 2026-01-20</p><p><b>clinicalStatus</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/condition-clinical active}\">Active</span></p><p><b>verificationStatus</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/condition-ver-status confirmed}\">Confirmed</span></p><p><b>category</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/condition-category encounter-diagnosis}\">Encounter Diagnosis</span></p><p><b>code</b>: <span title=\"Codes:{http://fhir.de/CodeSystem/bfarm/icd-10-gm C18.9}\">Metastasiertes Kolonkarzinom (mCRC) mit Lebermetastasen</span></p><p><b>subject</b>: <a href=\"Patient-PatientinCRC.html\">Erika Musterfrau  Female, DoB: 1961-09-12</a></p><p><b>onset</b>: 2026-01-20</p><p><b>recordedDate</b>: 2026-01-20</p></div></div>"
      },
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/condition-assertedDate",
        "valueDateTime" : "2026-01-20"
      }],
      "clinicalStatus" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
          "code" : "active"
        }]
      },
      "verificationStatus" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/condition-ver-status",
          "code" : "confirmed"
        }]
      },
      "category" : [{
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/condition-category",
          "code" : "encounter-diagnosis"
        }]
      }],
      "code" : {
        "coding" : [{
          "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
          "version" : "2026",
          "code" : "C18.9",
          "display" : "Bösartige Neubildung: Kolon, nicht näher bezeichnet"
        }],
        "text" : "Metastasiertes Kolonkarzinom (mCRC) mit Lebermetastasen"
      },
      "subject" : {
        "reference" : "Patient/PatientinCRC"
      },
      "onsetDateTime" : "2026-01-20",
      "recordedDate" : "2026-01-20"
    },
    "request" : {
      "method" : "POST",
      "url" : "Condition"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/CarePlan/DiagnostikCarePlanCRC",
    "resource" : {
      "resourceType" : "CarePlan",
      "id" : "DiagnostikCarePlanCRC",
      "meta" : {
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-diagnostic-care-plan"]
      },
      "text" : {
        "status" : "extensions",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"CarePlan_DiagnostikCarePlanCRC\"> </a><p class=\"res-header-id\"><b>Generated Narrative: CarePlan DiagnostikCarePlanCRC</b></p><a name=\"DiagnostikCarePlanCRC\"> </a><a name=\"hcDiagnostikCarePlanCRC\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-onko-diagnostic-care-plan.html\">Diagnostischer CarePlan</a></p></div><p><b>CarePlan Custodian (Extension)</b>: <a href=\"Organization-TumorzentrumCRC.html\">Organization Onkologisches Zentrum Musterklinik</a></p><p><b>status</b>: Completed</p><p><b>intent</b>: Plan</p><p><b>category</b>: <span title=\"Codes:\">Tumordiagnostik</span></p><p><b>subject</b>: <a href=\"Patient-PatientinCRC.html\">Erika Musterfrau  Female, DoB: 1961-09-12</a></p><p><b>period</b>: 2026-01-05 --&gt; 2026-01-20</p><p><b>careTeam</b>: <a href=\"CareTeam-TumorboardCRC.html\">CareTeam Interdisziplinäres Tumorboard Kolorektales Karzinom</a></p><p><b>addresses</b>: <a href=\"Condition-ConditionCRC.html\">Condition Bösartige Neubildung: Kolon, nicht näher bezeichnet</a></p><h3>Activities</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>OutcomeReference</b></td><td><b>Reference</b></td></tr><tr><td style=\"display: none\">*</td><td><a href=\"DiagnosticReport-DiagnosticReportHistologieCRC.html\">Diagnostic Report for 'Pathology Synoptic report' for '-&gt;Erika Musterfrau  Female, DoB: 1961-09-12'</a></td><td><a href=\"ServiceRequest-ServiceRequestKoloskopieCRC.html\">ServiceRequest Colonoscopy</a></td></tr></table></div></div>"
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
    },
    "request" : {
      "method" : "POST",
      "url" : "CarePlan"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/ServiceRequest/ServiceRequestKoloskopieCRC",
    "resource" : {
      "resourceType" : "ServiceRequest",
      "id" : "ServiceRequestKoloskopieCRC",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"ServiceRequest_ServiceRequestKoloskopieCRC\"> </a><p class=\"res-header-id\"><b>Generated Narrative: ServiceRequest ServiceRequestKoloskopieCRC</b></p><a name=\"ServiceRequestKoloskopieCRC\"> </a><a name=\"hcServiceRequestKoloskopieCRC\"> </a><p><b>status</b>: Completed</p><p><b>intent</b>: Order</p><p><b>code</b>: <span title=\"Codes:{http://snomed.info/sct 73761001}\">Koloskopie mit Biopsieentnahme</span></p><p><b>subject</b>: <a href=\"Patient-PatientinCRC.html\">Erika Musterfrau  Female, DoB: 1961-09-12</a></p></div></div>"
      },
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
    },
    "request" : {
      "method" : "POST",
      "url" : "ServiceRequest"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/DiagnosticReport/DiagnosticReportHistologieCRC",
    "resource" : {
      "resourceType" : "DiagnosticReport",
      "id" : "DiagnosticReportHistologieCRC",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"DiagnosticReport_DiagnosticReportHistologieCRC\"> </a><p class=\"res-header-id\"><b>Generated Narrative: DiagnosticReport DiagnosticReportHistologieCRC</b></p><a name=\"DiagnosticReportHistologieCRC\"> </a><a name=\"hcDiagnosticReportHistologieCRC\"> </a><h2><span title=\"Codes:{http://loinc.org 60568-3}\">Histopathologie Kolonbiopsie</span> </h2><table class=\"grid\"><tr><td>Subject</td><td>Erika Musterfrau  Female, DoB: 1961-09-12</td></tr><tr><td>Relevant Time</td><td>2026-01-18</td></tr></table><p><b>Report Details</b></p><p>Adenokarzinom des Kolons (C18.9), ICD-O-3 M8140/3.</p></div></div>"
      },
      "status" : "final",
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "60568-3",
          "display" : "Pathology Synoptic report"
        }],
        "text" : "Histopathologie Kolonbiopsie"
      },
      "subject" : {
        "reference" : "Patient/PatientinCRC"
      },
      "effectiveDateTime" : "2026-01-18",
      "conclusion" : "Adenokarzinom des Kolons (C18.9), ICD-O-3 M8140/3."
    },
    "request" : {
      "method" : "POST",
      "url" : "DiagnosticReport"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/EpisodeOfCare/TherapielinieCRCErstlinie",
    "resource" : {
      "resourceType" : "EpisodeOfCare",
      "id" : "TherapielinieCRCErstlinie",
      "meta" : {
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-line"]
      },
      "text" : {
        "status" : "extensions",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"EpisodeOfCare_TherapielinieCRCErstlinie\"> </a><p class=\"res-header-id\"><b>Generated Narrative: EpisodeOfCare TherapielinieCRCErstlinie</b></p><a name=\"TherapielinieCRCErstlinie\"> </a><a name=\"hcTherapielinieCRCErstlinie\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-onko-therapy-line.html\">Onkologische Therapielinie</a></p></div><blockquote><p><b>Onkologische Therapieintention (Extension)</b></p><ul><li>hauptintention: <span title=\"Codes:{http://snomed.info/sct 363676003}\">Palliative intent</span></li><li>phase: <span title=\"Codes:{http://snomed.info/sct 450827009}\">Induction chemotherapy</span></li></ul></blockquote><blockquote><p><b>EnLiST-LoT-Designation (Extension)</b></p><ul><li>setting: <span title=\"Codes:{https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/enlist-lot-setting aLoT}\">aLoT — fortgeschrittenes Setting</span></li><li>line: 1</li><li>modification: 0</li><li>notation: aLoT 1.0</li></ul></blockquote><p><b>EnLiST-Zählstatus (Extension)</b>: <span title=\"Codes:{https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/enlist-countable counted}\">Zählt in der LoT-Zählung</span></p><p><b>status</b>: Active</p><p><b>type</b>: <span title=\"Codes:{http://snomed.info/sct 315601005}\">Ambulatory chemotherapy</span></p><h3>Diagnoses</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Condition</b></td><td><b>Role</b></td><td><b>Rank</b></td></tr><tr><td style=\"display: none\">*</td><td><a href=\"Condition-ConditionCRC.html\">Condition Bösartige Neubildung: Kolon, nicht näher bezeichnet</a></td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/diagnosis-role CC}\">Chief complaint</span></td><td>1</td></tr></table><p><b>patient</b>: <a href=\"Patient-PatientinCRC.html\">Erika Musterfrau  Female, DoB: 1961-09-12</a></p><p><b>managingOrganization</b>: <a href=\"Organization-TumorzentrumCRC.html\">Organization Onkologisches Zentrum Musterklinik</a></p><p><b>period</b>: 2026-02-10 --&gt; (ongoing)</p><p><b>careManager</b>: <a href=\"Practitioner-OnkologinCRC.html\">Practitioner Petra Musterarzt </a></p><p><b>team</b>: <a href=\"CareTeam-TumorboardCRC.html\">CareTeam Interdisziplinäres Tumorboard Kolorektales Karzinom</a></p></div></div>"
      },
      "extension" : [{
        "extension" : [{
          "url" : "hauptintention",
          "valueCodeableConcept" : {
            "coding" : [{
              "system" : "http://snomed.info/sct",
              "code" : "363676003",
              "display" : "Palliative intent"
            }]
          }
        },
        {
          "url" : "phase",
          "valueCodeableConcept" : {
            "coding" : [{
              "system" : "http://snomed.info/sct",
              "code" : "450827009",
              "display" : "Induction chemotherapy"
            }]
          }
        }],
        "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent"
      },
      {
        "extension" : [{
          "url" : "setting",
          "valueCodeableConcept" : {
            "coding" : [{
              "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/enlist-lot-setting",
              "code" : "aLoT",
              "display" : "aLoT — fortgeschrittenes Setting"
            }]
          }
        },
        {
          "url" : "line",
          "valuePositiveInt" : 1
        },
        {
          "url" : "modification",
          "valueUnsignedInt" : 0
        },
        {
          "url" : "notation",
          "valueString" : "aLoT 1.0"
        }],
        "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-lot"
      },
      {
        "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-countable",
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/enlist-countable",
            "code" : "counted",
            "display" : "Zählt in der LoT-Zählung"
          }]
        }
      }],
      "status" : "active",
      "type" : [{
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "315601005",
          "display" : "Ambulatory chemotherapy"
        }]
      }],
      "diagnosis" : [{
        "condition" : {
          "reference" : "Condition/ConditionCRC"
        },
        "role" : {
          "coding" : [{
            "system" : "http://terminology.hl7.org/CodeSystem/diagnosis-role",
            "code" : "CC",
            "display" : "Chief complaint"
          }]
        },
        "rank" : 1
      }],
      "patient" : {
        "reference" : "Patient/PatientinCRC"
      },
      "managingOrganization" : {
        "reference" : "Organization/TumorzentrumCRC"
      },
      "period" : {
        "start" : "2026-02-10"
      },
      "careManager" : {
        "reference" : "Practitioner/OnkologinCRC"
      },
      "team" : [{
        "reference" : "CareTeam/TumorboardCRC"
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "EpisodeOfCare"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/Goal/TherapiezielCRCLebensverlaengerung",
    "resource" : {
      "resourceType" : "Goal",
      "id" : "TherapiezielCRCLebensverlaengerung",
      "meta" : {
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-goal"]
      },
      "text" : {
        "status" : "extensions",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Goal_TherapiezielCRCLebensverlaengerung\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Goal TherapiezielCRCLebensverlaengerung</b></p><a name=\"TherapiezielCRCLebensverlaengerung\"> </a><a name=\"hcTherapiezielCRCLebensverlaengerung\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-onko-therapy-goal.html\">Onkologisches Therapieziel</a></p></div><blockquote><p><b>Onkologische Therapieintention (Extension)</b></p><ul><li>hauptintention: <span title=\"Codes:{http://snomed.info/sct 363676003}\">Palliative intent</span></li><li>phase: <span title=\"Codes:{http://snomed.info/sct 450827009}\">Induction chemotherapy</span></li></ul></blockquote><blockquote><p><b>Goal acceptance</b></p><ul><li>individual: <a href=\"Patient-PatientinCRC.html\">Erika Musterfrau  Female, DoB: 1961-09-12</a></li><li>status: agree</li><li>priority: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/goal-priority high-priority}\">High Priority</span></li></ul></blockquote><blockquote><p><b>Goal: Related Goal</b></p><ul><li>type: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/goal-relationship-type replacement}\">Replacement</span></li><li>target: <a href=\"Goal-TherapiezielCRCKurativAbgelehnt.html\">Goal: extension = ,; lifecycleStatus = rejected; category = Heilung; description = </a></li></ul></blockquote><blockquote><p><b>Goal: Related Goal</b></p><ul><li>type: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/goal-relationship-type successor}\">Successor</span></li><li>target: <a href=\"Goal-TherapiezielCRCErhaltung.html\">Goal: extension = ,; lifecycleStatus = proposed; category = Lebensverlängerung,Lebensqualität; description = </a></li></ul></blockquote><p><b>lifecycleStatus</b>: Active</p><p><b>achievementStatus</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/goal-achievement in-progress}\">In Progress</span></p><p><b>category</b>: <span title=\"Codes:{https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-goal-type lebensverlaengerung}\">Lebensverlängerung</span>, <span title=\"Codes:{https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-goal-type symptomkontrolle}\">Symptomkontrolle / Palliation</span></p><p><b>priority</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/goal-priority high-priority}\">High Priority</span></p><p><b>description</b>: <span title=\"Codes:\">Verlängerung des Gesamtüberlebens und Kontrolle tumorbedingter Symptome unter palliativer Systemtherapie.</span></p><p><b>subject</b>: <a href=\"Patient-PatientinCRC.html\">Erika Musterfrau  Female, DoB: 1961-09-12</a></p><p><b>start</b>: 2026-02-10</p><h3>Targets</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Measure</b></td><td><b>Due[x]</b></td></tr><tr><td style=\"display: none\">*</td><td><span title=\"Codes:{http://loinc.org 21908-9}\">Stage group.clinical Cancer</span></td><td>2026-08-10</td></tr></table><p><b>expressedBy</b>: <a href=\"Practitioner-OnkologinCRC.html\">Practitioner Petra Musterarzt </a></p><p><b>addresses</b>: <a href=\"Condition-ConditionCRC.html\">Condition Bösartige Neubildung: Kolon, nicht näher bezeichnet</a></p><p><b>outcomeReference</b>: <a href=\"Observation-ObservationDiseaseStatusCRC.html\">Observation Cancer disease progression</a></p></div></div>"
      },
      "extension" : [{
        "extension" : [{
          "url" : "hauptintention",
          "valueCodeableConcept" : {
            "coding" : [{
              "system" : "http://snomed.info/sct",
              "code" : "363676003",
              "display" : "Palliative intent"
            }]
          }
        },
        {
          "url" : "phase",
          "valueCodeableConcept" : {
            "coding" : [{
              "system" : "http://snomed.info/sct",
              "code" : "450827009",
              "display" : "Induction chemotherapy"
            }]
          }
        }],
        "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent"
      },
      {
        "extension" : [{
          "url" : "individual",
          "valueReference" : {
            "reference" : "Patient/PatientinCRC"
          }
        },
        {
          "url" : "status",
          "valueCode" : "agree"
        },
        {
          "url" : "priority",
          "valueCodeableConcept" : {
            "coding" : [{
              "system" : "http://terminology.hl7.org/CodeSystem/goal-priority",
              "code" : "high-priority",
              "display" : "High Priority"
            }]
          }
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/goal-acceptance"
      },
      {
        "extension" : [{
          "url" : "type",
          "valueCodeableConcept" : {
            "coding" : [{
              "system" : "http://terminology.hl7.org/CodeSystem/goal-relationship-type",
              "code" : "replacement",
              "display" : "Replacement"
            }]
          }
        },
        {
          "url" : "target",
          "valueReference" : {
            "reference" : "Goal/TherapiezielCRCKurativAbgelehnt"
          }
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/goal-relationship"
      },
      {
        "extension" : [{
          "url" : "type",
          "valueCodeableConcept" : {
            "coding" : [{
              "system" : "http://terminology.hl7.org/CodeSystem/goal-relationship-type",
              "code" : "successor",
              "display" : "Successor"
            }]
          }
        },
        {
          "url" : "target",
          "valueReference" : {
            "reference" : "Goal/TherapiezielCRCErhaltung"
          }
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/goal-relationship"
      }],
      "lifecycleStatus" : "active",
      "achievementStatus" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/goal-achievement",
          "code" : "in-progress",
          "display" : "In Progress"
        }]
      },
      "category" : [{
        "coding" : [{
          "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-goal-type",
          "code" : "lebensverlaengerung",
          "display" : "Lebensverlängerung"
        }]
      },
      {
        "coding" : [{
          "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-goal-type",
          "code" : "symptomkontrolle",
          "display" : "Symptomkontrolle / Palliation"
        }]
      }],
      "priority" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/goal-priority",
          "code" : "high-priority",
          "display" : "High Priority"
        }]
      },
      "description" : {
        "text" : "Verlängerung des Gesamtüberlebens und Kontrolle tumorbedingter Symptome unter palliativer Systemtherapie."
      },
      "subject" : {
        "reference" : "Patient/PatientinCRC"
      },
      "startDate" : "2026-02-10",
      "target" : [{
        "measure" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "21908-9",
            "display" : "Stage group.clinical Cancer"
          }]
        },
        "dueDate" : "2026-08-10"
      }],
      "expressedBy" : {
        "reference" : "Practitioner/OnkologinCRC"
      },
      "addresses" : [{
        "reference" : "Condition/ConditionCRC"
      }],
      "outcomeReference" : [{
        "reference" : "Observation/ObservationDiseaseStatusCRC"
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "Goal"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/Goal/TherapiezielCRCKurativAbgelehnt",
    "resource" : {
      "resourceType" : "Goal",
      "id" : "TherapiezielCRCKurativAbgelehnt",
      "meta" : {
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-goal"]
      },
      "text" : {
        "status" : "extensions",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Goal_TherapiezielCRCKurativAbgelehnt\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Goal TherapiezielCRCKurativAbgelehnt</b></p><a name=\"TherapiezielCRCKurativAbgelehnt\"> </a><a name=\"hcTherapiezielCRCKurativAbgelehnt\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-onko-therapy-goal.html\">Onkologisches Therapieziel</a></p></div><blockquote><p><b>Onkologische Therapieintention (Extension)</b></p><ul><li>hauptintention: <span title=\"Codes:{http://snomed.info/sct 373808002}\">Curative - procedure intent</span></li></ul></blockquote><p><b>Goal Reason Rejected</b>: <span title=\"Codes:\">Nicht resektable Fernmetastasierung — kuratives Ziel nicht erreichbar.</span></p><p><b>lifecycleStatus</b>: Rejected</p><p><b>category</b>: <span title=\"Codes:{https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-goal-type heilung}\">Heilung</span></p><p><b>description</b>: <span title=\"Codes:\">Kurative Resektion des Primärtumors mit kurativer Absicht.</span></p><p><b>subject</b>: <a href=\"Patient-PatientinCRC.html\">Erika Musterfrau  Female, DoB: 1961-09-12</a></p><p><b>expressedBy</b>: <a href=\"Practitioner-OnkologinCRC.html\">Practitioner Petra Musterarzt </a></p><p><b>addresses</b>: <a href=\"Condition-ConditionCRC.html\">Condition Bösartige Neubildung: Kolon, nicht näher bezeichnet</a></p></div></div>"
      },
      "extension" : [{
        "extension" : [{
          "url" : "hauptintention",
          "valueCodeableConcept" : {
            "coding" : [{
              "system" : "http://snomed.info/sct",
              "code" : "373808002",
              "display" : "Curative - procedure intent"
            }]
          }
        }],
        "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/goal-reasonRejected",
        "valueCodeableConcept" : {
          "text" : "Nicht resektable Fernmetastasierung — kuratives Ziel nicht erreichbar."
        }
      }],
      "lifecycleStatus" : "rejected",
      "category" : [{
        "coding" : [{
          "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-goal-type",
          "code" : "heilung",
          "display" : "Heilung"
        }]
      }],
      "description" : {
        "text" : "Kurative Resektion des Primärtumors mit kurativer Absicht."
      },
      "subject" : {
        "reference" : "Patient/PatientinCRC"
      },
      "expressedBy" : {
        "reference" : "Practitioner/OnkologinCRC"
      },
      "addresses" : [{
        "reference" : "Condition/ConditionCRC"
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "Goal"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/Goal/TherapiezielCRCErhaltung",
    "resource" : {
      "resourceType" : "Goal",
      "id" : "TherapiezielCRCErhaltung",
      "meta" : {
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-goal"]
      },
      "text" : {
        "status" : "extensions",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Goal_TherapiezielCRCErhaltung\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Goal TherapiezielCRCErhaltung</b></p><a name=\"TherapiezielCRCErhaltung\"> </a><a name=\"hcTherapiezielCRCErhaltung\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-onko-therapy-goal.html\">Onkologisches Therapieziel</a></p></div><blockquote><p><b>Onkologische Therapieintention (Extension)</b></p><ul><li>hauptintention: <span title=\"Codes:{http://snomed.info/sct 363676003}\">Palliative intent</span></li><li>phase: <span title=\"Codes:{http://snomed.info/sct 1345242003}\">Maintenance antineoplastic therapy</span></li></ul></blockquote><blockquote><p><b>Goal: Related Goal</b></p><ul><li>type: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/goal-relationship-type predecessor}\">Predecessor</span></li><li>target: <a href=\"Goal-TherapiezielCRCLebensverlaengerung.html\">Goal: extension = ,,,; lifecycleStatus = active; achievementStatus = In Progress; category = Lebensverlängerung,Symptomkontrolle / Palliation; priority = High Priority; description = ; start[x] = 2026-02-10</a></li></ul></blockquote><p><b>lifecycleStatus</b>: Proposed</p><p><b>category</b>: <span title=\"Codes:{https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-goal-type lebensverlaengerung}\">Lebensverlängerung</span>, <span title=\"Codes:{https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-goal-type lebensqualitaet}\">Lebensqualität</span></p><p><b>description</b>: <span title=\"Codes:\">Erhalt des Therapieansprechens bei reduzierter Toxizität (Erhaltungstherapie) nach erfolgreicher Induktion.</span></p><p><b>subject</b>: <a href=\"Patient-PatientinCRC.html\">Erika Musterfrau  Female, DoB: 1961-09-12</a></p><p><b>expressedBy</b>: <a href=\"Practitioner-OnkologinCRC.html\">Practitioner Petra Musterarzt </a></p><p><b>addresses</b>: <a href=\"Condition-ConditionCRC.html\">Condition Bösartige Neubildung: Kolon, nicht näher bezeichnet</a></p></div></div>"
      },
      "extension" : [{
        "extension" : [{
          "url" : "hauptintention",
          "valueCodeableConcept" : {
            "coding" : [{
              "system" : "http://snomed.info/sct",
              "code" : "363676003",
              "display" : "Palliative intent"
            }]
          }
        },
        {
          "url" : "phase",
          "valueCodeableConcept" : {
            "coding" : [{
              "system" : "http://snomed.info/sct",
              "code" : "1345242003",
              "display" : "Maintenance antineoplastic therapy"
            }]
          }
        }],
        "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent"
      },
      {
        "extension" : [{
          "url" : "type",
          "valueCodeableConcept" : {
            "coding" : [{
              "system" : "http://terminology.hl7.org/CodeSystem/goal-relationship-type",
              "code" : "predecessor",
              "display" : "Predecessor"
            }]
          }
        },
        {
          "url" : "target",
          "valueReference" : {
            "reference" : "Goal/TherapiezielCRCLebensverlaengerung"
          }
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/goal-relationship"
      }],
      "lifecycleStatus" : "proposed",
      "category" : [{
        "coding" : [{
          "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-goal-type",
          "code" : "lebensverlaengerung",
          "display" : "Lebensverlängerung"
        }]
      },
      {
        "coding" : [{
          "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-goal-type",
          "code" : "lebensqualitaet",
          "display" : "Lebensqualität"
        }]
      }],
      "description" : {
        "text" : "Erhalt des Therapieansprechens bei reduzierter Toxizität (Erhaltungstherapie) nach erfolgreicher Induktion."
      },
      "subject" : {
        "reference" : "Patient/PatientinCRC"
      },
      "expressedBy" : {
        "reference" : "Practitioner/OnkologinCRC"
      },
      "addresses" : [{
        "reference" : "Condition/ConditionCRC"
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "Goal"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/MedicationRequest/MedicationRequestFOLFOX",
    "resource" : {
      "resourceType" : "MedicationRequest",
      "id" : "MedicationRequestFOLFOX",
      "meta" : {
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-tumorboard-medication-request"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"MedicationRequest_MedicationRequestFOLFOX\"> </a><p class=\"res-header-id\"><b>Generated Narrative: MedicationRequest MedicationRequestFOLFOX</b></p><a name=\"MedicationRequestFOLFOX\"> </a><a name=\"hcMedicationRequestFOLFOX\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-onko-tumorboard-medication-request.html\">Tumorboard MedicationRequest</a></p></div><p><b>status</b>: Active</p><p><b>intent</b>: Plan</p><p><b>category</b>: <span title=\"Codes:{http://loinc.org 85232-7}\">Tumor board Consult note</span></p><p><b>medication</b>: <span title=\"Codes:\">FOLFOX + Bevacizumab</span></p><p><b>subject</b>: <a href=\"Patient-PatientinCRC.html\">Erika Musterfrau  Female, DoB: 1961-09-12</a></p><p><b>requester</b>: <a href=\"Practitioner-OnkologinCRC.html\">Practitioner Petra Musterarzt </a></p></div></div>"
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
    },
    "request" : {
      "method" : "POST",
      "url" : "MedicationRequest"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/ServiceRequest/ServiceRequestPortCRC",
    "resource" : {
      "resourceType" : "ServiceRequest",
      "id" : "ServiceRequestPortCRC",
      "meta" : {
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-tumorboard-service-request"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"ServiceRequest_ServiceRequestPortCRC\"> </a><p class=\"res-header-id\"><b>Generated Narrative: ServiceRequest ServiceRequestPortCRC</b></p><a name=\"ServiceRequestPortCRC\"> </a><a name=\"hcServiceRequestPortCRC\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-onko-tumorboard-service-request.html\">Tumorboard ServiceRequest</a></p></div><p><b>status</b>: Active</p><p><b>intent</b>: Plan</p><p><b>category</b>: <span title=\"Codes:{http://loinc.org 85232-7}\">Tumor board Consult note</span></p><p><b>code</b>: <span title=\"Codes:{http://snomed.info/sct 1255694000}\">Implantation eines Portkatheters für die systemische Therapie</span></p><p><b>subject</b>: <a href=\"Patient-PatientinCRC.html\">Erika Musterfrau  Female, DoB: 1961-09-12</a></p><p><b>requester</b>: <a href=\"Practitioner-OnkologinCRC.html\">Practitioner Petra Musterarzt </a></p></div></div>"
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
    },
    "request" : {
      "method" : "POST",
      "url" : "ServiceRequest"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/Observation/ObservationDiseaseStatusCRC",
    "resource" : {
      "resourceType" : "Observation",
      "id" : "ObservationDiseaseStatusCRC",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Observation_ObservationDiseaseStatusCRC\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Observation ObservationDiseaseStatusCRC</b></p><a name=\"ObservationDiseaseStatusCRC\"> </a><a name=\"hcObservationDiseaseStatusCRC\"> </a><p><b>status</b>: Final</p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 97509-4}\">Cancer disease progression</span></p><p><b>subject</b>: <a href=\"Patient-PatientinCRC.html\">Erika Musterfrau  Female, DoB: 1961-09-12</a></p><p><b>effective</b>: 2026-05-15</p><p><b>value</b>: <span title=\"Codes:{http://snomed.info/sct 260415000}\">Not detected</span></p></div></div>"
      },
      "status" : "final",
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "97509-4",
          "display" : "Cancer disease progression"
        }]
      },
      "subject" : {
        "reference" : "Patient/PatientinCRC"
      },
      "effectiveDateTime" : "2026-05-15",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "260415000",
          "display" : "Not detected"
        }]
      }
    },
    "request" : {
      "method" : "POST",
      "url" : "Observation"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/CarePlan/CarePlanCRCPalliativ",
    "resource" : {
      "resourceType" : "CarePlan",
      "id" : "CarePlanCRCPalliativ",
      "meta" : {
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-care-plan"]
      },
      "text" : {
        "status" : "extensions",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"CarePlan_CarePlanCRCPalliativ\"> </a><p class=\"res-header-id\"><b>Generated Narrative: CarePlan CarePlanCRCPalliativ</b></p><a name=\"CarePlanCRCPalliativ\"> </a><a name=\"hcCarePlanCRCPalliativ\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-onko-care-plan.html\">Onkologischer CarePlan</a></p></div><blockquote><p><b>Onkologische Therapieintention (Extension)</b></p><ul><li>hauptintention: <span title=\"Codes:{http://snomed.info/sct 363676003}\">Palliative intent</span></li></ul></blockquote><p><b>CarePlan Custodian (Extension)</b>: <a href=\"Organization-TumorzentrumCRC.html\">Organization Onkologisches Zentrum Musterklinik</a></p><p><b>status</b>: Active</p><p><b>intent</b>: Plan</p><p><b>category</b>: <span title=\"Codes:{http://snomed.info/sct 736252007}\">Cancer care plan</span></p><p><b>subject</b>: <a href=\"Patient-PatientinCRC.html\">Erika Musterfrau  Female, DoB: 1961-09-12</a></p><p><b>period</b>: 2026-02-10 --&gt; (ongoing)</p><p><b>author</b>: <a href=\"Practitioner-OnkologinCRC.html\">Practitioner Petra Musterarzt </a></p><p><b>careTeam</b>: <a href=\"CareTeam-TumorboardCRC.html\">CareTeam Interdisziplinäres Tumorboard Kolorektales Karzinom</a></p><p><b>addresses</b>: <a href=\"Condition-ConditionCRC.html\">Condition Bösartige Neubildung: Kolon, nicht näher bezeichnet</a></p><p><b>supportingInfo</b>: <a href=\"CarePlan-DiagnostikCarePlanCRC.html\">CarePlan: extension = -&gt;Organization Onkologisches Zentrum Musterklinik; status = completed; intent = plan; category = ; period = 2026-01-05 --&gt; 2026-01-20</a></p><p><b>goal</b>: <a href=\"Goal-TherapiezielCRCLebensverlaengerung.html\">Goal: extension = ,,,; lifecycleStatus = active; achievementStatus = In Progress; category = Lebensverlängerung,Symptomkontrolle / Palliation; priority = High Priority; description = ; start[x] = 2026-02-10</a></p><blockquote><p><b>activity</b></p><p><b>outcomeReference</b>: <a href=\"Observation-ObservationDiseaseStatusCRC.html\">Observation Cancer disease progression</a></p><p><b>reference</b>: <a href=\"MedicationRequest-MedicationRequestFOLFOX.html\">MedicationRequest: status = active; intent = plan; category = Tumor board Consult note; medication[x] = </a></p></blockquote><blockquote><p><b>activity</b></p><p><b>reference</b>: <a href=\"ServiceRequest-ServiceRequestPortCRC.html\">ServiceRequest Implantable venous access port injection</a></p></blockquote></div></div>"
      },
      "extension" : [{
        "extension" : [{
          "url" : "hauptintention",
          "valueCodeableConcept" : {
            "coding" : [{
              "system" : "http://snomed.info/sct",
              "code" : "363676003",
              "display" : "Palliative intent"
            }]
          }
        }],
        "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent"
      },
      {
        "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-careplan-custodian",
        "valueReference" : {
          "reference" : "Organization/TumorzentrumCRC"
        }
      }],
      "status" : "active",
      "intent" : "plan",
      "category" : [{
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "736252007",
          "display" : "Cancer care plan"
        }]
      }],
      "subject" : {
        "reference" : "Patient/PatientinCRC"
      },
      "period" : {
        "start" : "2026-02-10"
      },
      "author" : {
        "reference" : "Practitioner/OnkologinCRC"
      },
      "careTeam" : [{
        "reference" : "CareTeam/TumorboardCRC"
      }],
      "addresses" : [{
        "reference" : "Condition/ConditionCRC"
      }],
      "supportingInfo" : [{
        "reference" : "CarePlan/DiagnostikCarePlanCRC"
      }],
      "goal" : [{
        "reference" : "Goal/TherapiezielCRCLebensverlaengerung"
      }],
      "activity" : [{
        "outcomeReference" : [{
          "reference" : "Observation/ObservationDiseaseStatusCRC"
        }],
        "reference" : {
          "reference" : "MedicationRequest/MedicationRequestFOLFOX"
        }
      },
      {
        "reference" : {
          "reference" : "ServiceRequest/ServiceRequestPortCRC"
        }
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "CarePlan"
    }
  }]
}

```
