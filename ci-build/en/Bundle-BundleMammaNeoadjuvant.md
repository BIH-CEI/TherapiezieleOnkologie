# Transaction-Bundle – Mammakarzinom neoadjuvant (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Example Bundle: Transaction-Bundle – Mammakarzinom neoadjuvant (Beispiel)



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "BundleMammaNeoadjuvant",
  "type" : "transaction",
  "entry" : [{
    "fullUrl" : "http://example.org/fhir/Patient/PatientinMamma",
    "resource" : {
      "resourceType" : "Patient",
      "id" : "PatientinMamma",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Patient_PatientinMamma\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Patient PatientinMamma</b></p><a name=\"PatientinMamma\"> </a><a name=\"hcPatientinMamma\"> </a><p style=\"border: 1px #661aff solid; background-color: #e6e6ff; padding: 10px;\">Sabine Baumann  Female, DoB: 1977-06-24</p><hr/></div></div>"
      },
      "name" : [{
        "family" : "Baumann",
        "given" : ["Sabine"]
      }],
      "gender" : "female",
      "birthDate" : "1977-06-24"
    },
    "request" : {
      "method" : "POST",
      "url" : "Patient"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/Practitioner/OnkologinMamma",
    "resource" : {
      "resourceType" : "Practitioner",
      "id" : "OnkologinMamma",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Practitioner_OnkologinMamma\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Practitioner OnkologinMamma</b></p><a name=\"OnkologinMamma\"> </a><a name=\"hcOnkologinMamma\"> </a><p><b>name</b>: Katrin Musterarzt </p></div></div>"
      },
      "name" : [{
        "family" : "Musterarzt",
        "given" : ["Katrin"]
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "Practitioner"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/Organization/TumorzentrumMamma",
    "resource" : {
      "resourceType" : "Organization",
      "id" : "TumorzentrumMamma",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Organization_TumorzentrumMamma\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Organization TumorzentrumMamma</b></p><a name=\"TumorzentrumMamma\"> </a><a name=\"hcTumorzentrumMamma\"> </a><p><b>name</b>: Zertifiziertes Brustzentrum Musterklinik</p></div></div>"
      },
      "name" : "Zertifiziertes Brustzentrum Musterklinik"
    },
    "request" : {
      "method" : "POST",
      "url" : "Organization"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/Organization/Tumorboard",
    "resource" : {
      "resourceType" : "Organization",
      "id" : "Tumorboard",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Organization_Tumorboard\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Organization Tumorboard</b></p><a name=\"Tumorboard\"> </a><a name=\"hcTumorboard\"> </a><p><b>identifier</b>: <code>https://www.musterklinik.de/fhir/sid/organisationen</code>/tumorboard-brust-001</p><p><b>active</b>: true</p><p><b>type</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/organization-type team}\">Organizational team</span></p><p><b>name</b>: Zertifiziertes Brustzentrum Musterklinik</p></div></div>"
      },
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
    },
    "request" : {
      "method" : "POST",
      "url" : "Organization"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/ServiceRequest/ServiceRequestBiopsieMamma",
    "resource" : {
      "resourceType" : "ServiceRequest",
      "id" : "ServiceRequestBiopsieMamma",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"ServiceRequest_ServiceRequestBiopsieMamma\"> </a><p class=\"res-header-id\"><b>Generated Narrative: ServiceRequest ServiceRequestBiopsieMamma</b></p><a name=\"ServiceRequestBiopsieMamma\"> </a><a name=\"hcServiceRequestBiopsieMamma\"> </a><p><b>status</b>: Completed</p><p><b>intent</b>: Order</p><p><b>code</b>: <span title=\"Codes:{http://snomed.info/sct 44578009}\">Core needle biopsy of breast (procedure)</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>authoredOn</b>: 2025-09-12</p><p><b>requester</b>: <a href=\"Practitioner-OnkologinMamma.html\">Practitioner Katrin Musterarzt </a></p></div></div>"
      },
      "status" : "completed",
      "intent" : "order",
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "44578009",
          "display" : "Core needle biopsy of breast (procedure)"
        }]
      },
      "subject" : {
        "reference" : "Patient/PatientinMamma"
      },
      "authoredOn" : "2025-09-12",
      "requester" : {
        "reference" : "Practitioner/OnkologinMamma"
      }
    },
    "request" : {
      "method" : "POST",
      "url" : "ServiceRequest"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/ServiceRequest/ServiceRequestPathologieMamma",
    "resource" : {
      "resourceType" : "ServiceRequest",
      "id" : "ServiceRequestPathologieMamma",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"ServiceRequest_ServiceRequestPathologieMamma\"> </a><p class=\"res-header-id\"><b>Generated Narrative: ServiceRequest ServiceRequestPathologieMamma</b></p><a name=\"ServiceRequestPathologieMamma\"> </a><a name=\"hcServiceRequestPathologieMamma\"> </a><p><b>status</b>: Completed</p><p><b>intent</b>: Order</p><p><b>code</b>: <span title=\"Codes:{http://snomed.info/sct 788124003}\">Histopathologische Untersuchung inkl. Rezeptor-/HER2-Status und Ki-67</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>authoredOn</b>: 2025-09-15</p><p><b>requester</b>: <a href=\"Practitioner-OnkologinMamma.html\">Practitioner Katrin Musterarzt </a></p><p><b>specimen</b>: <a href=\"Specimen-SpecimenBiopsieMamma.html\">Specimen: status = available; type = Specimen from breast obtained by core needle biopsy</a></p></div></div>"
      },
      "status" : "completed",
      "intent" : "order",
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "788124003",
          "display" : "Histopathology service (qualifier value)"
        }],
        "text" : "Histopathologische Untersuchung inkl. Rezeptor-/HER2-Status und Ki-67"
      },
      "subject" : {
        "reference" : "Patient/PatientinMamma"
      },
      "authoredOn" : "2025-09-15",
      "requester" : {
        "reference" : "Practitioner/OnkologinMamma"
      },
      "specimen" : [{
        "reference" : "Specimen/SpecimenBiopsieMamma"
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "ServiceRequest"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/ServiceRequest/ServiceRequestStagingMamma",
    "resource" : {
      "resourceType" : "ServiceRequest",
      "id" : "ServiceRequestStagingMamma",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"ServiceRequest_ServiceRequestStagingMamma\"> </a><p class=\"res-header-id\"><b>Generated Narrative: ServiceRequest ServiceRequestStagingMamma</b></p><a name=\"ServiceRequestStagingMamma\"> </a><a name=\"hcServiceRequestStagingMamma\"> </a><p><b>status</b>: Completed</p><p><b>intent</b>: Order</p><p><b>code</b>: <span title=\"Codes:\">Klinische Ausbreitungsdiagnostik / TNM-Staging</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>authoredOn</b>: 2025-09-15</p><p><b>requester</b>: <a href=\"Practitioner-OnkologinMamma.html\">Practitioner Katrin Musterarzt </a></p></div></div>"
      },
      "status" : "completed",
      "intent" : "order",
      "code" : {
        "text" : "Klinische Ausbreitungsdiagnostik / TNM-Staging"
      },
      "subject" : {
        "reference" : "Patient/PatientinMamma"
      },
      "authoredOn" : "2025-09-15",
      "requester" : {
        "reference" : "Practitioner/OnkologinMamma"
      }
    },
    "request" : {
      "method" : "POST",
      "url" : "ServiceRequest"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/ServiceRequest/ServiceRequestGBRCAMamma",
    "resource" : {
      "resourceType" : "ServiceRequest",
      "id" : "ServiceRequestGBRCAMamma",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"ServiceRequest_ServiceRequestGBRCAMamma\"> </a><p class=\"res-header-id\"><b>Generated Narrative: ServiceRequest ServiceRequestGBRCAMamma</b></p><a name=\"ServiceRequestGBRCAMamma\"> </a><a name=\"hcServiceRequestGBRCAMamma\"> </a><p><b>status</b>: Completed</p><p><b>intent</b>: Order</p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 21639-0}\">BRCA1 gene mutations tested for in Blood or Tissue by Molecular genetics method Nominal</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>authoredOn</b>: 2025-09-18</p><p><b>requester</b>: <a href=\"Practitioner-OnkologinMamma.html\">Practitioner Katrin Musterarzt </a></p></div></div>"
      },
      "status" : "completed",
      "intent" : "order",
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
      "authoredOn" : "2025-09-18",
      "requester" : {
        "reference" : "Practitioner/OnkologinMamma"
      }
    },
    "request" : {
      "method" : "POST",
      "url" : "ServiceRequest"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/CarePlan/CarePlanMammaDiagnostik",
    "resource" : {
      "resourceType" : "CarePlan",
      "id" : "CarePlanMammaDiagnostik",
      "meta" : {
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-diagnostic-care-plan"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"CarePlan_CarePlanMammaDiagnostik\"> </a><p class=\"res-header-id\"><b>Generated Narrative: CarePlan CarePlanMammaDiagnostik</b></p><a name=\"CarePlanMammaDiagnostik\"> </a><a name=\"hcCarePlanMammaDiagnostik\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-onko-diagnostic-care-plan.html\">Diagnostischer CarePlan</a></p></div><p><b>status</b>: Active</p><p><b>intent</b>: Plan</p><p><b>category</b>: <span title=\"Codes:\">Tumordiagnostik</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>author</b>: <a href=\"Practitioner-OnkologinMamma.html\">Practitioner Katrin Musterarzt </a></p><p><b>addresses</b>: <a href=\"Condition-ConditionMamma.html\">Condition Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse</a></p><p><b>goal</b>: <a href=\"Goal-DiagnosticGoal.html\">Goal: extension = ; lifecycleStatus = active; achievementStatus = In Progress; category = Diagnostic intent; priority = High Priority; description = ; start[x] = 2025-09-12</a></p><blockquote><p><b>activity</b></p><p><b>outcomeReference</b>: <a href=\"Procedure-ProcedureBiopsieMamma.html\">Procedure Core needle biopsy of breast (procedure)</a></p><p><b>reference</b>: <a href=\"ServiceRequest-ServiceRequestBiopsieMamma.html\">ServiceRequest Core needle biopsy of breast (procedure)</a></p></blockquote><blockquote><p><b>activity</b></p><p><b>outcomeReference</b>: </p><ul><li><a href=\"Observation-ObsHistologieMamma.html\">Observation Histology and Behavior ICD-O-3 Cancer</a></li><li><a href=\"Observation-ObsGradingMamma.html\">Observation Histologic grade [Score] in Breast cancer specimen by Nottingham</a></li><li><a href=\"Observation-ObsEstrogenrezeptorMamma.html\">Observation Estrogen receptor Ag [Presence] in Breast cancer specimen by Immune stain</a></li><li><a href=\"Observation-ObsProgesteronrezeptorMamma.html\">Observation Progesterone receptor Ag [Presence] in Breast cancer specimen by Immune stain</a></li><li><a href=\"Observation-ObsHER2Mamma.html\">Observation HER2 [Interpretation] in Tissue</a></li><li><a href=\"Observation-ObsKi67Mamma.html\">Observation Cells.Ki-67 nuclear Ag/cells in Breast cancer specimen by Immune stain</a></li></ul><p><b>reference</b>: <a href=\"ServiceRequest-ServiceRequestPathologieMamma.html\">ServiceRequest Histopathology service (qualifier value)</a></p></blockquote><blockquote><p><b>activity</b></p><p><b>outcomeReference</b>: <a href=\"Observation-ObsTNMklinischMamma.html\">Observation Stage group.clinical Cancer</a></p><p><b>reference</b>: <a href=\"ServiceRequest-ServiceRequestStagingMamma.html\">ServiceRequest </a></p></blockquote><blockquote><p><b>activity</b></p><p><b>outcomeReference</b>: <a href=\"Observation-ObsGBRCAMamma.html\">Observation BRCA1 gene mutations tested for in Blood or Tissue by Molecular genetics method Nominal</a></p><p><b>reference</b>: <a href=\"ServiceRequest-ServiceRequestGBRCAMamma.html\">ServiceRequest BRCA1 gene mutations tested for in Blood or Tissue by Molecular genetics method Nominal</a></p></blockquote></div></div>"
      },
      "status" : "active",
      "intent" : "plan",
      "category" : [{
        "text" : "Tumordiagnostik"
      }],
      "subject" : {
        "reference" : "Patient/PatientinMamma"
      },
      "author" : {
        "reference" : "Practitioner/OnkologinMamma"
      },
      "addresses" : [{
        "reference" : "Condition/ConditionMamma"
      }],
      "goal" : [{
        "reference" : "Goal/DiagnosticGoal"
      }],
      "activity" : [{
        "outcomeReference" : [{
          "reference" : "Procedure/ProcedureBiopsieMamma"
        }],
        "reference" : {
          "reference" : "ServiceRequest/ServiceRequestBiopsieMamma"
        }
      },
      {
        "outcomeReference" : [{
          "reference" : "Observation/ObsHistologieMamma"
        },
        {
          "reference" : "Observation/ObsGradingMamma"
        },
        {
          "reference" : "Observation/ObsEstrogenrezeptorMamma"
        },
        {
          "reference" : "Observation/ObsProgesteronrezeptorMamma"
        },
        {
          "reference" : "Observation/ObsHER2Mamma"
        },
        {
          "reference" : "Observation/ObsKi67Mamma"
        }],
        "reference" : {
          "reference" : "ServiceRequest/ServiceRequestPathologieMamma"
        }
      },
      {
        "outcomeReference" : [{
          "reference" : "Observation/ObsTNMklinischMamma"
        }],
        "reference" : {
          "reference" : "ServiceRequest/ServiceRequestStagingMamma"
        }
      },
      {
        "outcomeReference" : [{
          "reference" : "Observation/ObsGBRCAMamma"
        }],
        "reference" : {
          "reference" : "ServiceRequest/ServiceRequestGBRCAMamma"
        }
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "CarePlan"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/Goal/DiagnosticGoal",
    "resource" : {
      "resourceType" : "Goal",
      "id" : "DiagnosticGoal",
      "meta" : {
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-goal"]
      },
      "text" : {
        "status" : "extensions",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Goal_DiagnosticGoal\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Goal DiagnosticGoal</b></p><a name=\"DiagnosticGoal\"> </a><a name=\"hcDiagnosticGoal\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-onko-therapy-goal.html\">Onkologisches Therapieziel</a></p></div><blockquote><p><b>Goal acceptance</b></p><ul><li>individual: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></li><li>status: agree</li><li>priority: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/goal-priority high-priority}\">High Priority</span></li></ul></blockquote><p><b>lifecycleStatus</b>: Active</p><p><b>achievementStatus</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/goal-achievement in-progress}\">In Progress</span></p><p><b>category</b>: <span title=\"Codes:{http://snomed.info/sct 261004008}\">Diagnostic intent</span></p><p><b>priority</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/goal-priority high-priority}\">High Priority</span></p><p><b>description</b>: <span title=\"Codes:\">Diagnosesicherung für die Verdachtsdiagnose</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>start</b>: 2025-09-12</p><blockquote><p><b>target</b></p><p><b>measure</b>: <span title=\"Codes:{http://loinc.org 21905-5}\">Primary tumor.clinical [Class] Cancer</span></p></blockquote><blockquote><p><b>target</b></p><p><b>measure</b>: <span title=\"Codes:{http://loinc.org 21906-3}\">Regional lymph nodes.clinical [Class] Cancer</span></p></blockquote><blockquote><p><b>target</b></p><p><b>measure</b>: <span title=\"Codes:{http://loinc.org 21907-1}\">Distant metastases.clinical [Class] Cancer</span></p></blockquote><blockquote><p><b>target</b></p><p><b>measure</b>: <span title=\"Codes:{http://loinc.org 21908-9}\">Stage group.clinical Cancer</span></p></blockquote><blockquote><p><b>target</b></p><p><b>measure</b>: <span title=\"Codes:{http://loinc.org 40556-3}\">Estrogen receptor Ag [Presence] in Tissue by Immune stain</span></p></blockquote><blockquote><p><b>target</b></p><p><b>measure</b>: <span title=\"Codes:{http://loinc.org 85339-0}\">Progesterone receptor Ag [Presence] in Breast cancer specimen by Immune stain</span></p></blockquote><blockquote><p><b>target</b></p><p><b>measure</b>: <span title=\"Codes:{http://loinc.org 48676-1}\">HER2 Ag [Interpretation] in Tissue</span></p></blockquote><blockquote><p><b>target</b></p><p><b>measure</b>: <span title=\"Codes:{http://loinc.org 21855-2}\">Primary site Cancer</span></p></blockquote><blockquote><p><b>target</b></p><p><b>measure</b>: <span title=\"Codes:{http://loinc.org 44648-4}\">Histologic grade [Score] in Breast cancer specimen by Nottingham</span></p></blockquote><blockquote><p><b>target</b></p><p><b>measure</b>: <span title=\"Codes:{http://loinc.org 33732-9}\">Histology grade [Identifier] in Cancer specimen</span></p></blockquote><blockquote><p><b>target</b></p><p><b>measure</b>: <span title=\"Codes:{http://loinc.org 85347-3}\">Sentinel lymph nodes examined [#] in Cancer specimen by Light microscopy</span></p></blockquote><p><b>expressedBy</b>: <a href=\"Practitioner-OnkologinMamma.html\">Practitioner Katrin Musterarzt </a></p><p><b>addresses</b>: <a href=\"Condition-ConditionMamma.html\">Condition Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse</a></p><p><b>outcomeReference</b>: <a href=\"Observation-ObsDiseaseStatusMamma.html\">Observation Cancer disease progression</a></p></div></div>"
      },
      "extension" : [{
        "extension" : [{
          "url" : "individual",
          "valueReference" : {
            "reference" : "Patient/PatientinMamma"
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
          "system" : "http://snomed.info/sct",
          "code" : "261004008",
          "display" : "Diagnostic intent"
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
        "text" : "Diagnosesicherung für die Verdachtsdiagnose"
      },
      "subject" : {
        "reference" : "Patient/PatientinMamma"
      },
      "startDate" : "2025-09-12",
      "target" : [{
        "measure" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "21905-5",
            "display" : "Primary tumor.clinical [Class] Cancer"
          }]
        }
      },
      {
        "measure" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "21906-3",
            "display" : "Regional lymph nodes.clinical [Class] Cancer"
          }]
        }
      },
      {
        "measure" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "21907-1",
            "display" : "Distant metastases.clinical [Class] Cancer"
          }]
        }
      },
      {
        "measure" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "21908-9",
            "display" : "Stage group.clinical Cancer"
          }]
        }
      },
      {
        "measure" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "40556-3",
            "display" : "Estrogen receptor Ag [Presence] in Tissue by Immune stain"
          }]
        }
      },
      {
        "measure" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "85339-0",
            "display" : "Progesterone receptor Ag [Presence] in Breast cancer specimen by Immune stain"
          }]
        }
      },
      {
        "measure" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "48676-1",
            "display" : "HER2 Ag [Interpretation] in Tissue"
          }]
        }
      },
      {
        "measure" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "21855-2",
            "display" : "Primary site Cancer"
          }]
        }
      },
      {
        "measure" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "44648-4",
            "display" : "Histologic grade [Score] in Breast cancer specimen by Nottingham"
          }]
        }
      },
      {
        "measure" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "33732-9",
            "display" : "Histology grade [Identifier] in Cancer specimen"
          }]
        }
      },
      {
        "measure" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "85347-3",
            "display" : "Sentinel lymph nodes examined [#] in Cancer specimen by Light microscopy"
          }]
        }
      }],
      "expressedBy" : {
        "reference" : "Practitioner/OnkologinMamma"
      },
      "addresses" : [{
        "reference" : "Condition/ConditionMamma"
      }],
      "outcomeReference" : [{
        "reference" : "Observation/ObsDiseaseStatusMamma"
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "Goal"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/Condition/ConditionMamma",
    "resource" : {
      "resourceType" : "Condition",
      "id" : "ConditionMamma",
      "meta" : {
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-condition"]
      },
      "text" : {
        "status" : "extensions",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Condition_ConditionMamma\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Condition ConditionMamma</b></p><a name=\"ConditionMamma\"> </a><a name=\"hcConditionMamma\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-onko-condition.html\">Onkologische Diagnose (Condition)</a></p></div><p><b>Condition Asserted Date</b>: 2025-09-15</p><p><b>clinicalStatus</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/condition-clinical active}\">Active</span></p><p><b>verificationStatus</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/condition-ver-status confirmed}\">Confirmed</span></p><p><b>category</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/condition-category encounter-diagnosis}\">Encounter Diagnosis</span></p><p><b>code</b>: <span title=\"Codes:{http://fhir.de/CodeSystem/bfarm/icd-10-gm C50.4}\">Invasives Mammakarzinom links, oberer äußerer Quadrant (NST), triple-negativ</span></p><p><b>bodySite</b>: <span title=\"Codes:\">Mamma links, oberer äußerer Quadrant</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>onset</b>: 2025-09-15</p><p><b>recordedDate</b>: 2025-09-15</p></div></div>"
      },
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/condition-assertedDate",
        "valueDateTime" : "2025-09-15"
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
          "code" : "C50.4",
          "display" : "Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse"
        }],
        "text" : "Invasives Mammakarzinom links, oberer äußerer Quadrant (NST), triple-negativ"
      },
      "bodySite" : [{
        "text" : "Mamma links, oberer äußerer Quadrant"
      }],
      "subject" : {
        "reference" : "Patient/PatientinMamma"
      },
      "onsetDateTime" : "2025-09-15",
      "recordedDate" : "2025-09-15"
    },
    "request" : {
      "method" : "POST",
      "url" : "Condition"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/Procedure/ProcedureBiopsieMamma",
    "resource" : {
      "resourceType" : "Procedure",
      "id" : "ProcedureBiopsieMamma",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Procedure_ProcedureBiopsieMamma\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Procedure ProcedureBiopsieMamma</b></p><a name=\"ProcedureBiopsieMamma\"> </a><a name=\"hcProcedureBiopsieMamma\"> </a><p><b>status</b>: Completed</p><p><b>category</b>: <span title=\"Codes:{http://snomed.info/sct 103693007}\">Diagnostic procedure (procedure)</span></p><p><b>code</b>: <span title=\"Codes:{http://snomed.info/sct 44578009}\">Sonografisch gesteuerte Stanzbiopsie der Mamma links</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>performed</b>: 2025-09-15</p><p><b>reasonReference</b>: <a href=\"Condition-ConditionMamma.html\">Condition Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse</a></p><p><b>bodySite</b>: <span title=\"Codes:\">Mamma links, oberer äußerer Quadrant</span></p></div></div>"
      },
      "status" : "completed",
      "category" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "103693007",
          "display" : "Diagnostic procedure (procedure)"
        }]
      },
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "44578009",
          "display" : "Core needle biopsy of breast (procedure)"
        }],
        "text" : "Sonografisch gesteuerte Stanzbiopsie der Mamma links"
      },
      "subject" : {
        "reference" : "Patient/PatientinMamma"
      },
      "performedDateTime" : "2025-09-15",
      "reasonReference" : [{
        "reference" : "Condition/ConditionMamma"
      }],
      "bodySite" : [{
        "text" : "Mamma links, oberer äußerer Quadrant"
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "Procedure"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/Specimen/SpecimenBiopsieMamma",
    "resource" : {
      "resourceType" : "Specimen",
      "id" : "SpecimenBiopsieMamma",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Specimen_SpecimenBiopsieMamma\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Specimen SpecimenBiopsieMamma</b></p><a name=\"SpecimenBiopsieMamma\"> </a><a name=\"hcSpecimenBiopsieMamma\"> </a><p><b>status</b>: Available</p><p><b>type</b>: <span title=\"Codes:{http://snomed.info/sct 122737001}, {http://snomed.info/sct 119376003}\">Stanzbiopsat (Gewebeprobe) Mamma links</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><h3>Collections</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Collected[x]</b></td><td><b>Method</b></td><td><b>BodySite</b></td></tr><tr><td style=\"display: none\">*</td><td>2025-09-15</td><td><span title=\"Codes:{http://snomed.info/sct 9911007}\">Core needle biopsy</span></td><td><span title=\"Codes:{http://snomed.info/sct 76365002}\">Mamma links, oberer äußerer Quadrant</span></td></tr></table></div></div>"
      },
      "status" : "available",
      "type" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "122737001",
          "display" : "Specimen from breast obtained by core needle biopsy"
        },
        {
          "system" : "http://snomed.info/sct",
          "code" : "119376003",
          "display" : "Tissue specimen (specimen)"
        }],
        "text" : "Stanzbiopsat (Gewebeprobe) Mamma links"
      },
      "subject" : {
        "reference" : "Patient/PatientinMamma"
      },
      "collection" : {
        "collectedDateTime" : "2025-09-15",
        "method" : {
          "coding" : [{
            "system" : "http://snomed.info/sct",
            "code" : "9911007",
            "display" : "Core needle biopsy"
          }]
        },
        "bodySite" : {
          "coding" : [{
            "system" : "http://snomed.info/sct",
            "code" : "76365002",
            "display" : "Structure of upper outer quadrant of breast"
          }],
          "text" : "Mamma links, oberer äußerer Quadrant"
        }
      }
    },
    "request" : {
      "method" : "POST",
      "url" : "Specimen"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/Observation/ObsHistologieMamma",
    "resource" : {
      "resourceType" : "Observation",
      "id" : "ObsHistologieMamma",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Observation_ObsHistologieMamma\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Observation ObsHistologieMamma</b></p><a name=\"ObsHistologieMamma\"> </a><a name=\"hcObsHistologieMamma\"> </a><p><b>status</b>: Final</p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 59847-4}\">Histology and Behavior ICD-O-3 Cancer</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>effective</b>: 2025-09-15</p><p><b>value</b>: <span title=\"Codes:{http://snomed.info/sct 82711006}, {urn:oid:2.16.840.1.113883.6.43.1 8500/3}\">Invasives Mammakarzinom, NST (ICD-O-3 8500/3)</span></p><p><b>specimen</b>: <a href=\"Specimen-SpecimenBiopsieMamma.html\">Specimen: status = available; type = Specimen from breast obtained by core needle biopsy</a></p></div></div>"
      },
      "status" : "final",
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "59847-4",
          "display" : "Histology and Behavior ICD-O-3 Cancer"
        }]
      },
      "subject" : {
        "reference" : "Patient/PatientinMamma"
      },
      "effectiveDateTime" : "2025-09-15",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "82711006",
          "display" : "Infiltrating duct carcinoma"
        },
        {
          "system" : "urn:oid:2.16.840.1.113883.6.43.1",
          "code" : "8500/3",
          "display" : "Invasives duktales Karzinom / Karzinom ohne speziellen Typ (NST)"
        }],
        "text" : "Invasives Mammakarzinom, NST (ICD-O-3 8500/3)"
      },
      "specimen" : {
        "reference" : "Specimen/SpecimenBiopsieMamma"
      }
    },
    "request" : {
      "method" : "POST",
      "url" : "Observation"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/Observation/ObsGradingMamma",
    "resource" : {
      "resourceType" : "Observation",
      "id" : "ObsGradingMamma",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Observation_ObsGradingMamma\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Observation ObsGradingMamma</b></p><a name=\"ObsGradingMamma\"> </a><a name=\"hcObsGradingMamma\"> </a><p><b>status</b>: Final</p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 44648-4}\">Histologic grade [Score] in Breast cancer specimen by Nottingham</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>effective</b>: 2025-09-15</p><p><b>value</b>: <span title=\"Codes:{http://snomed.info/sct 1155704001}, {https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-grading 3}\">G3 – schlecht differenziert (Elston-Ellis)</span></p><p><b>specimen</b>: <a href=\"Specimen-SpecimenBiopsieMamma.html\">Specimen: status = available; type = Specimen from breast obtained by core needle biopsy</a></p></div></div>"
      },
      "status" : "final",
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "44648-4",
          "display" : "Histologic grade [Score] in Breast cancer specimen by Nottingham"
        }]
      },
      "subject" : {
        "reference" : "Patient/PatientinMamma"
      },
      "effectiveDateTime" : "2025-09-15",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "1155704001",
          "display" : "G3: Poorly differentiated"
        },
        {
          "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-grading",
          "code" : "3",
          "display" : "schlecht differenziert"
        }],
        "text" : "G3 – schlecht differenziert (Elston-Ellis)"
      },
      "specimen" : {
        "reference" : "Specimen/SpecimenBiopsieMamma"
      }
    },
    "request" : {
      "method" : "POST",
      "url" : "Observation"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/Observation/ObsTNMklinischMamma",
    "resource" : {
      "resourceType" : "Observation",
      "id" : "ObsTNMklinischMamma",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Observation_ObsTNMklinischMamma\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Observation ObsTNMklinischMamma</b></p><a name=\"ObsTNMklinischMamma\"> </a><a name=\"hcObsTNMklinischMamma\"> </a><p><b>status</b>: Final</p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 21908-9}\">Stage group.clinical Cancer</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>effective</b>: 2025-09-16</p><p><b>value</b>: <span title=\"Codes:\">cT2 cN1 cM0 – UICC IIB</span></p></div></div>"
      },
      "status" : "final",
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "21908-9",
          "display" : "Stage group.clinical Cancer"
        }]
      },
      "subject" : {
        "reference" : "Patient/PatientinMamma"
      },
      "effectiveDateTime" : "2025-09-16",
      "valueCodeableConcept" : {
        "text" : "cT2 cN1 cM0 – UICC IIB"
      }
    },
    "request" : {
      "method" : "POST",
      "url" : "Observation"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/Observation/ObsEstrogenrezeptorMamma",
    "resource" : {
      "resourceType" : "Observation",
      "id" : "ObsEstrogenrezeptorMamma",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Observation_ObsEstrogenrezeptorMamma\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Observation ObsEstrogenrezeptorMamma</b></p><a name=\"ObsEstrogenrezeptorMamma\"> </a><a name=\"hcObsEstrogenrezeptorMamma\"> </a><p><b>status</b>: Final</p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 85337-4}, {http://snomed.info/sct 1234806008}\">Estrogen receptor Ag [Presence] in Breast cancer specimen by Immune stain</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>effective</b>: 2025-09-17</p><p><b>value</b>: <span title=\"Codes:{http://loinc.org LA6577-6}\">Negative</span></p><p><b>note</b>: </p><blockquote><div><p>Immunhistochemie: &lt;1 % positive Kerne → ER-negativ.</p>\n</div></blockquote><p><b>specimen</b>: <a href=\"Specimen-SpecimenBiopsieMamma.html\">Specimen: status = available; type = Specimen from breast obtained by core needle biopsy</a></p></div></div>"
      },
      "status" : "final",
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "85337-4",
          "display" : "Estrogen receptor Ag [Presence] in Breast cancer specimen by Immune stain"
        },
        {
          "system" : "http://snomed.info/sct",
          "code" : "1234806008",
          "display" : "Observation using immunohistochemistry (observable entity)"
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
        }]
      },
      "note" : [{
        "text" : "Immunhistochemie: <1 % positive Kerne → ER-negativ."
      }],
      "specimen" : {
        "reference" : "Specimen/SpecimenBiopsieMamma"
      }
    },
    "request" : {
      "method" : "POST",
      "url" : "Observation"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/Observation/ObsProgesteronrezeptorMamma",
    "resource" : {
      "resourceType" : "Observation",
      "id" : "ObsProgesteronrezeptorMamma",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Observation_ObsProgesteronrezeptorMamma\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Observation ObsProgesteronrezeptorMamma</b></p><a name=\"ObsProgesteronrezeptorMamma\"> </a><a name=\"hcObsProgesteronrezeptorMamma\"> </a><p><b>status</b>: Final</p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 85339-0}, {http://snomed.info/sct 1234806008}\">Progesterone receptor Ag [Presence] in Breast cancer specimen by Immune stain</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>effective</b>: 2025-09-17</p><p><b>value</b>: <span title=\"Codes:{http://loinc.org LA6577-6}\">Negative</span></p><p><b>note</b>: </p><blockquote><div><p>Immunhistochemie: &lt;1 % positive Kerne → PR-negativ.</p>\n</div></blockquote><p><b>specimen</b>: <a href=\"Specimen-SpecimenBiopsieMamma.html\">Specimen: status = available; type = Specimen from breast obtained by core needle biopsy</a></p></div></div>"
      },
      "status" : "final",
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "85339-0",
          "display" : "Progesterone receptor Ag [Presence] in Breast cancer specimen by Immune stain"
        },
        {
          "system" : "http://snomed.info/sct",
          "code" : "1234806008",
          "display" : "Observation using immunohistochemistry (observable entity)"
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
        }]
      },
      "note" : [{
        "text" : "Immunhistochemie: <1 % positive Kerne → PR-negativ."
      }],
      "specimen" : {
        "reference" : "Specimen/SpecimenBiopsieMamma"
      }
    },
    "request" : {
      "method" : "POST",
      "url" : "Observation"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/Observation/ObsHER2Mamma",
    "resource" : {
      "resourceType" : "Observation",
      "id" : "ObsHER2Mamma",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Observation_ObsHER2Mamma\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Observation ObsHER2Mamma</b></p><a name=\"ObsHER2Mamma\"> </a><a name=\"hcObsHER2Mamma\"> </a><p><b>status</b>: Final</p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 48676-1}\">HER2 [Interpretation] in Tissue</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>effective</b>: 2025-09-17</p><p><b>value</b>: <span title=\"Codes:{http://loinc.org LA6577-6}, {https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-her2neu-status-obds N}, {https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-her2neu-status-leitlinie negativ}\">Negative</span></p><p><b>note</b>: </p><blockquote><div><p>Immunhistochemie 1+ → HER2-negativ; keine In-situ-Hybridisierung erforderlich.</p>\n</div></blockquote><p><b>specimen</b>: <a href=\"Specimen-SpecimenBiopsieMamma.html\">Specimen: status = available; type = Specimen from breast obtained by core needle biopsy</a></p></div></div>"
      },
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
    },
    "request" : {
      "method" : "POST",
      "url" : "Observation"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/Observation/ObsKi67Mamma",
    "resource" : {
      "resourceType" : "Observation",
      "id" : "ObsKi67Mamma",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Observation_ObsKi67Mamma\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Observation ObsKi67Mamma</b></p><a name=\"ObsKi67Mamma\"> </a><a name=\"hcObsKi67Mamma\"> </a><p><b>status</b>: Final</p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 85330-9}, {http://snomed.info/sct 1234806008}\">Ki-67 Proliferationsindex (MIB-1)</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>effective</b>: 2025-09-17</p><p><b>value</b>: 70 %<span style=\"background: LightGoldenRodYellow\"> (Details: UCUM  code% = '%')</span></p><p><b>specimen</b>: <a href=\"Specimen-SpecimenBiopsieMamma.html\">Specimen: status = available; type = Specimen from breast obtained by core needle biopsy</a></p></div></div>"
      },
      "status" : "final",
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "85330-9",
          "display" : "Cells.Ki-67 nuclear Ag/cells in Breast cancer specimen by Immune stain"
        },
        {
          "system" : "http://snomed.info/sct",
          "code" : "1234806008",
          "display" : "Observation using immunohistochemistry (observable entity)"
        }],
        "text" : "Ki-67 Proliferationsindex (MIB-1)"
      },
      "subject" : {
        "reference" : "Patient/PatientinMamma"
      },
      "effectiveDateTime" : "2025-09-17",
      "valueQuantity" : {
        "value" : 70,
        "unit" : "%",
        "system" : "http://unitsofmeasure.org",
        "code" : "%"
      },
      "specimen" : {
        "reference" : "Specimen/SpecimenBiopsieMamma"
      }
    },
    "request" : {
      "method" : "POST",
      "url" : "Observation"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/Observation/ObsGBRCAMamma",
    "resource" : {
      "resourceType" : "Observation",
      "id" : "ObsGBRCAMamma",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Observation_ObsGBRCAMamma\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Observation ObsGBRCAMamma</b></p><a name=\"ObsGBRCAMamma\"> </a><a name=\"hcObsGBRCAMamma\"> </a><p><b>status</b>: Final</p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 21639-0}\">BRCA1 gene mutations tested for in Blood or Tissue by Molecular genetics method Nominal</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>effective</b>: 2025-09-25</p><p><b>value</b>: <span title=\"Codes:{http://snomed.info/sct 260385009}\">Negative</span></p><p><b>note</b>: </p><blockquote><div><p>gBRCA1/2: keine (wahrscheinlich) pathogene Variante (Klasse 4/5) nachgewiesen.</p>\n</div></blockquote></div></div>"
      },
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
    },
    "request" : {
      "method" : "POST",
      "url" : "Observation"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/EpisodeOfCare/TherapielinieChemo",
    "resource" : {
      "resourceType" : "EpisodeOfCare",
      "id" : "TherapielinieChemo",
      "meta" : {
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-line"]
      },
      "text" : {
        "status" : "extensions",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"EpisodeOfCare_TherapielinieChemo\"> </a><p class=\"res-header-id\"><b>Generated Narrative: EpisodeOfCare TherapielinieChemo</b></p><a name=\"TherapielinieChemo\"> </a><a name=\"hcTherapielinieChemo\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-onko-therapy-line.html\">Onkologische Therapielinie</a></p></div><blockquote><p><b>Onkologische Therapieintention (Extension)</b></p><ul><li>hauptintention: <span title=\"Codes:{http://snomed.info/sct 373847000}\">Neoadjuvant</span></li><li>phase: <span title=\"Codes:{http://snomed.info/sct 373808002}\">Kurativ</span></li></ul></blockquote><p><b>Therapielinie – Medikationsverordnung (Extension)</b>: <a href=\"MedicationRequest-MedicationRequestPembroChemoNeoadjuvantMamma.html\">MedicationRequest: status = completed; intent = plan; category = Tumor board Consult note; medication[x] = </a></p><p><b>status</b>: Finished</p><p><b>type</b>: <span title=\"Codes:{http://snomed.info/sct 385786002}\">Chemotherapy care</span></p><h3>Diagnoses</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Condition</b></td><td><b>Role</b></td><td><b>Rank</b></td></tr><tr><td style=\"display: none\">*</td><td><a href=\"Condition-ConditionMamma.html\">Condition Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse</a></td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/diagnosis-role CC}\">Chief complaint</span></td><td>1</td></tr></table><p><b>patient</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>managingOrganization</b>: <a href=\"Organization-Tumorboard.html\">Organization Zertifiziertes Brustzentrum Musterklinik</a></p><p><b>period</b>: 2025-10-01 --&gt; 2026-03-15</p><p><b>careManager</b>: <a href=\"Practitioner-OnkologinMamma.html\">Practitioner Katrin Musterarzt </a></p></div></div>"
      },
      "extension" : [{
        "extension" : [{
          "url" : "hauptintention",
          "valueCodeableConcept" : {
            "coding" : [{
              "system" : "http://snomed.info/sct",
              "code" : "373847000",
              "display" : "Neoadjuvant"
            }]
          }
        },
        {
          "url" : "phase",
          "valueCodeableConcept" : {
            "coding" : [{
              "system" : "http://snomed.info/sct",
              "code" : "373808002",
              "display" : "Kurativ"
            }]
          }
        }],
        "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent"
      },
      {
        "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-line-medication-request",
        "valueReference" : {
          "reference" : "MedicationRequest/MedicationRequestPembroChemoNeoadjuvantMamma"
        }
      }],
      "status" : "finished",
      "type" : [{
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "385786002",
          "display" : "Chemotherapy care"
        }]
      }],
      "diagnosis" : [{
        "condition" : {
          "reference" : "Condition/ConditionMamma"
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
        "reference" : "Patient/PatientinMamma"
      },
      "managingOrganization" : {
        "reference" : "Organization/Tumorboard"
      },
      "period" : {
        "start" : "2025-10-01",
        "end" : "2026-03-15"
      },
      "careManager" : {
        "reference" : "Practitioner/OnkologinMamma"
      }
    },
    "request" : {
      "method" : "POST",
      "url" : "EpisodeOfCare"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/EpisodeOfCare/TherapielinieOperation",
    "resource" : {
      "resourceType" : "EpisodeOfCare",
      "id" : "TherapielinieOperation",
      "meta" : {
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-line"]
      },
      "text" : {
        "status" : "extensions",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"EpisodeOfCare_TherapielinieOperation\"> </a><p class=\"res-header-id\"><b>Generated Narrative: EpisodeOfCare TherapielinieOperation</b></p><a name=\"TherapielinieOperation\"> </a><a name=\"hcTherapielinieOperation\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-onko-therapy-line.html\">Onkologische Therapielinie</a></p></div><blockquote><p><b>Onkologische Therapieintention (Extension)</b></p><ul><li>hauptintention: <span title=\"Codes:{http://snomed.info/sct 373808002}\">Kurativ</span></li></ul></blockquote><p><b>status</b>: Finished</p><p><b>type</b>: <span title=\"Codes:{http://snomed.info/sct 1345242003}\">Erhaltungstherapie</span></p><h3>Diagnoses</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Condition</b></td><td><b>Role</b></td><td><b>Rank</b></td></tr><tr><td style=\"display: none\">*</td><td><a href=\"Condition-ConditionMamma.html\">Condition Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse</a></td><td><span title=\"Codes:{http://terminology.hl7.org/CodeSystem/diagnosis-role CC}\">Chief complaint</span></td><td>1</td></tr></table><p><b>patient</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>managingOrganization</b>: <a href=\"Organization-Tumorboard.html\">Organization Zertifiziertes Brustzentrum Musterklinik</a></p><p><b>period</b>: 2026-03-20 --&gt; 2026-04-06</p><p><b>referralRequest</b>: <a href=\"ServiceRequest-ServiceRequestProcedure.html\">ServiceRequest Lumpectomy of breast (procedure)</a></p><p><b>careManager</b>: <a href=\"Practitioner-OnkologinMamma.html\">Practitioner Katrin Musterarzt </a></p></div></div>"
      },
      "extension" : [{
        "extension" : [{
          "url" : "hauptintention",
          "valueCodeableConcept" : {
            "coding" : [{
              "system" : "http://snomed.info/sct",
              "code" : "373808002",
              "display" : "Kurativ"
            }]
          }
        }],
        "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent"
      }],
      "status" : "finished",
      "type" : [{
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "1345242003",
          "display" : "Erhaltungstherapie"
        }]
      }],
      "diagnosis" : [{
        "condition" : {
          "reference" : "Condition/ConditionMamma"
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
        "reference" : "Patient/PatientinMamma"
      },
      "managingOrganization" : {
        "reference" : "Organization/Tumorboard"
      },
      "period" : {
        "start" : "2026-03-20",
        "end" : "2026-04-06"
      },
      "referralRequest" : [{
        "reference" : "ServiceRequest/ServiceRequestProcedure"
      }],
      "careManager" : {
        "reference" : "Practitioner/OnkologinMamma"
      }
    },
    "request" : {
      "method" : "POST",
      "url" : "EpisodeOfCare"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/Goal/TherapiezielMammaHeilung",
    "resource" : {
      "resourceType" : "Goal",
      "id" : "TherapiezielMammaHeilung",
      "meta" : {
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-goal"]
      },
      "text" : {
        "status" : "extensions",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Goal_TherapiezielMammaHeilung\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Goal TherapiezielMammaHeilung</b></p><a name=\"TherapiezielMammaHeilung\"> </a><a name=\"hcTherapiezielMammaHeilung\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-onko-therapy-goal.html\">Onkologisches Therapieziel</a></p></div><blockquote><p><b>Onkologische Therapieintention (Extension)</b></p><ul><li>hauptintention: <span title=\"Codes:{http://snomed.info/sct 373808002}\">Kurativ</span></li></ul></blockquote><blockquote><p><b>Goal acceptance</b></p><ul><li>individual: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></li><li>status: agree</li><li>priority: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/goal-priority high-priority}\">High Priority</span></li></ul></blockquote><blockquote><p><b>Goal: Related Goal</b></p><ul><li>type: <span title=\"Codes:{http://hl7.org/fhir/goal-relationship-type predecessor}\">Predecessor</span></li><li>target: <a href=\"Goal-DiagnosticGoal.html\">Goal: extension = ; lifecycleStatus = active; achievementStatus = In Progress; category = Diagnostic intent; priority = High Priority; description = ; start[x] = 2025-09-12</a></li></ul></blockquote><blockquote><p><b>Goal: Related Goal</b></p><ul><li>type: <span title=\"Codes:{http://hl7.org/fhir/goal-relationship-type successor}\">Successor</span></li><li>target: <a href=\"Goal-FollowUpGoal.html\">Goal: extension = ,,; lifecycleStatus = planned; achievementStatus = In Progress; category = Lebensqualität; priority = High Priority; description = ; start[x] = 2026-08-15</a></li></ul></blockquote><p><b>lifecycleStatus</b>: Active</p><p><b>achievementStatus</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/goal-achievement achieved}\">Achieved</span></p><p><b>category</b>: <span title=\"Codes:{https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-goal-type heilung}\">Heilung</span>, <span title=\"Codes:{https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-goal-type funktionserhalt}\">Funktionserhalt</span></p><p><b>priority</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/goal-priority high-priority}\">High Priority</span></p><p><b>description</b>: <span title=\"Codes:\">Kurative Behandlung des frühen triple-negativen Mammakarzinoms mittels neoadjuvanter Systemtherapie und brusterhaltender Operation; Erreichen einer pathologischen Komplettremission (pCR).</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>start</b>: 2025-09-22</p><h3>Targets</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Measure</b></td><td><b>Due[x]</b></td></tr><tr><td style=\"display: none\">*</td><td><span title=\"Codes:{http://loinc.org 21908-9}\">Stage group.clinical Cancer</span></td><td>2026-04-15</td></tr></table><p><b>expressedBy</b>: <a href=\"Practitioner-OnkologinMamma.html\">Practitioner Katrin Musterarzt </a></p><p><b>addresses</b>: <a href=\"Condition-ConditionMamma.html\">Condition Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse</a></p><p><b>outcomeReference</b>: <a href=\"Observation-ObsDiseaseStatusMamma.html\">Observation Cancer disease progression</a></p></div></div>"
      },
      "extension" : [{
        "extension" : [{
          "url" : "hauptintention",
          "valueCodeableConcept" : {
            "coding" : [{
              "system" : "http://snomed.info/sct",
              "code" : "373808002",
              "display" : "Kurativ"
            }]
          }
        }],
        "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent"
      },
      {
        "extension" : [{
          "url" : "individual",
          "valueReference" : {
            "reference" : "Patient/PatientinMamma"
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
              "system" : "http://hl7.org/fhir/goal-relationship-type",
              "code" : "predecessor",
              "display" : "Predecessor"
            }]
          }
        },
        {
          "url" : "target",
          "valueReference" : {
            "reference" : "Goal/DiagnosticGoal"
          }
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/goal-relationship"
      },
      {
        "extension" : [{
          "url" : "type",
          "valueCodeableConcept" : {
            "coding" : [{
              "system" : "http://hl7.org/fhir/goal-relationship-type",
              "code" : "successor",
              "display" : "Successor"
            }]
          }
        },
        {
          "url" : "target",
          "valueReference" : {
            "reference" : "Goal/FollowUpGoal"
          }
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/goal-relationship"
      }],
      "lifecycleStatus" : "active",
      "achievementStatus" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/goal-achievement",
          "code" : "achieved",
          "display" : "Achieved"
        }]
      },
      "category" : [{
        "coding" : [{
          "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-goal-type",
          "code" : "heilung",
          "display" : "Heilung"
        }]
      },
      {
        "coding" : [{
          "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-goal-type",
          "code" : "funktionserhalt",
          "display" : "Funktionserhalt"
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
        "text" : "Kurative Behandlung des frühen triple-negativen Mammakarzinoms mittels neoadjuvanter Systemtherapie und brusterhaltender Operation; Erreichen einer pathologischen Komplettremission (pCR)."
      },
      "subject" : {
        "reference" : "Patient/PatientinMamma"
      },
      "startDate" : "2025-09-22",
      "target" : [{
        "measure" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "21908-9",
            "display" : "Stage group.clinical Cancer"
          }]
        },
        "dueDate" : "2026-04-15"
      }],
      "expressedBy" : {
        "reference" : "Practitioner/OnkologinMamma"
      },
      "addresses" : [{
        "reference" : "Condition/ConditionMamma"
      }],
      "outcomeReference" : [{
        "reference" : "Observation/ObsDiseaseStatusMamma"
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "Goal"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/ServiceRequest/ServiceRequestProcedure",
    "resource" : {
      "resourceType" : "ServiceRequest",
      "id" : "ServiceRequestProcedure",
      "meta" : {
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-tumorboard-service-request"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"ServiceRequest_ServiceRequestProcedure\"> </a><p class=\"res-header-id\"><b>Generated Narrative: ServiceRequest ServiceRequestProcedure</b></p><a name=\"ServiceRequestProcedure\"> </a><a name=\"hcServiceRequestProcedure\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-onko-tumorboard-service-request.html\">Tumorboard ServiceRequest</a></p></div><p><b>status</b>: Active</p><p><b>intent</b>: Proposal</p><p><b>category</b>: <span title=\"Codes:{http://loinc.org 85232-7}\">Tumor board Consult note</span>, <span title=\"Codes:{http://snomed.info/sct 387713003}\">Surgical procedure</span></p><p><b>code</b>: <span title=\"Codes:{http://snomed.info/sct 392021009}\">Lumpectomy of breast (procedure)</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p></div></div>"
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
    },
    "request" : {
      "method" : "POST",
      "url" : "ServiceRequest"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/MedicationRequest/MedicationRequestPembroChemoNeoadjuvantMamma",
    "resource" : {
      "resourceType" : "MedicationRequest",
      "id" : "MedicationRequestPembroChemoNeoadjuvantMamma",
      "meta" : {
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-tumorboard-medication-request"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"MedicationRequest_MedicationRequestPembroChemoNeoadjuvantMamma\"> </a><p class=\"res-header-id\"><b>Generated Narrative: MedicationRequest MedicationRequestPembroChemoNeoadjuvantMamma</b></p><a name=\"MedicationRequestPembroChemoNeoadjuvantMamma\"> </a><a name=\"hcMedicationRequestPembroChemoNeoadjuvantMamma\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-onko-tumorboard-medication-request.html\">Tumorboard MedicationRequest</a></p></div><p><b>status</b>: Completed</p><p><b>intent</b>: Plan</p><p><b>category</b>: <span title=\"Codes:{http://loinc.org 85232-7}\">Tumor board Consult note</span></p><p><b>medication</b>: <span title=\"Codes:\">Pembrolizumab + Carboplatin/Paclitaxel, gefolgt von Pembrolizumab + Epirubicin/Cyclophosphamid (KEYNOTE-522)</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p></div></div>"
      },
      "status" : "completed",
      "intent" : "plan",
      "category" : [{
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "85232-7",
          "display" : "Tumor board Consult note"
        }]
      }],
      "medicationCodeableConcept" : {
        "text" : "Pembrolizumab + Carboplatin/Paclitaxel, gefolgt von Pembrolizumab + Epirubicin/Cyclophosphamid (KEYNOTE-522)"
      },
      "subject" : {
        "reference" : "Patient/PatientinMamma"
      }
    },
    "request" : {
      "method" : "POST",
      "url" : "MedicationRequest"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/MedicationAdministration/MedicationAdministrationPembroChemoNeoadjuvantMamma1",
    "resource" : {
      "resourceType" : "MedicationAdministration",
      "id" : "MedicationAdministrationPembroChemoNeoadjuvantMamma1",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"MedicationAdministration_MedicationAdministrationPembroChemoNeoadjuvantMamma1\"> </a><p class=\"res-header-id\"><b>Generated Narrative: MedicationAdministration MedicationAdministrationPembroChemoNeoadjuvantMamma1</b></p><a name=\"MedicationAdministrationPembroChemoNeoadjuvantMamma1\"> </a><a name=\"hcMedicationAdministrationPembroChemoNeoadjuvantMamma1\"> </a><p><b>status</b>: Completed</p><p><b>medication</b>: <span title=\"Codes:\">Pembrolizumab + Carboplatin (q3w), Paclitaxel wöchentlich begleitend (KEYNOTE-522, Phase 1)</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>effective</b>: 2025-10-01</p><p><b>request</b>: <a href=\"MedicationRequest-MedicationRequestPembroChemoNeoadjuvantMamma.html\">MedicationRequest: status = completed; intent = plan; category = Tumor board Consult note; medication[x] = </a></p><p><b>note</b>: </p><blockquote><div><p>Zyklus 1 von 4 (Pembro/Carbo q3w); begleitend wöchentliche Paclitaxel-Gaben, hier nicht einzeln erfasst</p>\n</div></blockquote></div></div>"
      },
      "status" : "completed",
      "medicationCodeableConcept" : {
        "text" : "Pembrolizumab + Carboplatin (q3w), Paclitaxel wöchentlich begleitend (KEYNOTE-522, Phase 1)"
      },
      "subject" : {
        "reference" : "Patient/PatientinMamma"
      },
      "effectiveDateTime" : "2025-10-01",
      "request" : {
        "reference" : "MedicationRequest/MedicationRequestPembroChemoNeoadjuvantMamma"
      },
      "note" : [{
        "text" : "Zyklus 1 von 4 (Pembro/Carbo q3w); begleitend wöchentliche Paclitaxel-Gaben, hier nicht einzeln erfasst"
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "MedicationAdministration"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/MedicationAdministration/MedicationAdministrationPembroChemoNeoadjuvantMamma2",
    "resource" : {
      "resourceType" : "MedicationAdministration",
      "id" : "MedicationAdministrationPembroChemoNeoadjuvantMamma2",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"MedicationAdministration_MedicationAdministrationPembroChemoNeoadjuvantMamma2\"> </a><p class=\"res-header-id\"><b>Generated Narrative: MedicationAdministration MedicationAdministrationPembroChemoNeoadjuvantMamma2</b></p><a name=\"MedicationAdministrationPembroChemoNeoadjuvantMamma2\"> </a><a name=\"hcMedicationAdministrationPembroChemoNeoadjuvantMamma2\"> </a><p><b>status</b>: Completed</p><p><b>medication</b>: <span title=\"Codes:\">Pembrolizumab + Carboplatin (q3w), Paclitaxel wöchentlich begleitend (KEYNOTE-522, Phase 1)</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>effective</b>: 2025-11-01</p><p><b>request</b>: <a href=\"MedicationRequest-MedicationRequestPembroChemoNeoadjuvantMamma.html\">MedicationRequest: status = completed; intent = plan; category = Tumor board Consult note; medication[x] = </a></p><p><b>note</b>: </p><blockquote><div><p>Zyklus 2 von 4 (Pembro/Carbo q3w); begleitend wöchentliche Paclitaxel-Gaben, hier nicht einzeln erfasst</p>\n</div></blockquote></div></div>"
      },
      "status" : "completed",
      "medicationCodeableConcept" : {
        "text" : "Pembrolizumab + Carboplatin (q3w), Paclitaxel wöchentlich begleitend (KEYNOTE-522, Phase 1)"
      },
      "subject" : {
        "reference" : "Patient/PatientinMamma"
      },
      "effectiveDateTime" : "2025-11-01",
      "request" : {
        "reference" : "MedicationRequest/MedicationRequestPembroChemoNeoadjuvantMamma"
      },
      "note" : [{
        "text" : "Zyklus 2 von 4 (Pembro/Carbo q3w); begleitend wöchentliche Paclitaxel-Gaben, hier nicht einzeln erfasst"
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "MedicationAdministration"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/MedicationAdministration/MedicationAdministrationPembroChemoNeoadjuvantMamma3",
    "resource" : {
      "resourceType" : "MedicationAdministration",
      "id" : "MedicationAdministrationPembroChemoNeoadjuvantMamma3",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"MedicationAdministration_MedicationAdministrationPembroChemoNeoadjuvantMamma3\"> </a><p class=\"res-header-id\"><b>Generated Narrative: MedicationAdministration MedicationAdministrationPembroChemoNeoadjuvantMamma3</b></p><a name=\"MedicationAdministrationPembroChemoNeoadjuvantMamma3\"> </a><a name=\"hcMedicationAdministrationPembroChemoNeoadjuvantMamma3\"> </a><p><b>status</b>: Completed</p><p><b>medication</b>: <span title=\"Codes:\">Pembrolizumab + Carboplatin (q3w), Paclitaxel wöchentlich begleitend (KEYNOTE-522, Phase 1)</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>effective</b>: 2026-02-10</p><p><b>request</b>: <a href=\"MedicationRequest-MedicationRequestPembroChemoNeoadjuvantMamma.html\">MedicationRequest: status = completed; intent = plan; category = Tumor board Consult note; medication[x] = </a></p><p><b>note</b>: </p><blockquote><div><p>Zyklus 3 von 4 (Pembro/Carbo q3w); begleitend wöchentliche Paclitaxel-Gaben, hier nicht einzeln erfasst</p>\n</div></blockquote></div></div>"
      },
      "status" : "completed",
      "medicationCodeableConcept" : {
        "text" : "Pembrolizumab + Carboplatin (q3w), Paclitaxel wöchentlich begleitend (KEYNOTE-522, Phase 1)"
      },
      "subject" : {
        "reference" : "Patient/PatientinMamma"
      },
      "effectiveDateTime" : "2026-02-10",
      "request" : {
        "reference" : "MedicationRequest/MedicationRequestPembroChemoNeoadjuvantMamma"
      },
      "note" : [{
        "text" : "Zyklus 3 von 4 (Pembro/Carbo q3w); begleitend wöchentliche Paclitaxel-Gaben, hier nicht einzeln erfasst"
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "MedicationAdministration"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/MedicationAdministration/MedicationAdministrationPembroChemoNeoadjuvantMamma4",
    "resource" : {
      "resourceType" : "MedicationAdministration",
      "id" : "MedicationAdministrationPembroChemoNeoadjuvantMamma4",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"MedicationAdministration_MedicationAdministrationPembroChemoNeoadjuvantMamma4\"> </a><p class=\"res-header-id\"><b>Generated Narrative: MedicationAdministration MedicationAdministrationPembroChemoNeoadjuvantMamma4</b></p><a name=\"MedicationAdministrationPembroChemoNeoadjuvantMamma4\"> </a><a name=\"hcMedicationAdministrationPembroChemoNeoadjuvantMamma4\"> </a><p><b>status</b>: Completed</p><p><b>medication</b>: <span title=\"Codes:\">Pembrolizumab + Carboplatin (q3w), Paclitaxel wöchentlich begleitend (KEYNOTE-522, Phase 1)</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>effective</b>: 2026-03-15</p><p><b>request</b>: <a href=\"MedicationRequest-MedicationRequestPembroChemoNeoadjuvantMamma.html\">MedicationRequest: status = completed; intent = plan; category = Tumor board Consult note; medication[x] = </a></p><p><b>note</b>: </p><blockquote><div><p>Zyklus 4 von 4 (Pembro/Carbo q3w); begleitend wöchentliche Paclitaxel-Gaben, hier nicht einzeln erfasst</p>\n</div></blockquote></div></div>"
      },
      "status" : "completed",
      "medicationCodeableConcept" : {
        "text" : "Pembrolizumab + Carboplatin (q3w), Paclitaxel wöchentlich begleitend (KEYNOTE-522, Phase 1)"
      },
      "subject" : {
        "reference" : "Patient/PatientinMamma"
      },
      "effectiveDateTime" : "2026-03-15",
      "request" : {
        "reference" : "MedicationRequest/MedicationRequestPembroChemoNeoadjuvantMamma"
      },
      "note" : [{
        "text" : "Zyklus 4 von 4 (Pembro/Carbo q3w); begleitend wöchentliche Paclitaxel-Gaben, hier nicht einzeln erfasst"
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "MedicationAdministration"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/Procedure/ProcedureOperationMamma",
    "resource" : {
      "resourceType" : "Procedure",
      "id" : "ProcedureOperationMamma",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Procedure_ProcedureOperationMamma\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Procedure ProcedureOperationMamma</b></p><a name=\"ProcedureOperationMamma\"> </a><a name=\"hcProcedureOperationMamma\"> </a><p><b>status</b>: Completed</p><p><b>code</b>: <span title=\"Codes:{http://snomed.info/sct 392021009}\">Brusterhaltende Operation (BET) links + Sentinel-Lymphknoten-Biopsie</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>performed</b>: 2026-04-02</p></div></div>"
      },
      "status" : "completed",
      "code" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "392021009",
          "display" : "Lumpectomy of breast (procedure)"
        }],
        "text" : "Brusterhaltende Operation (BET) links + Sentinel-Lymphknoten-Biopsie"
      },
      "subject" : {
        "reference" : "Patient/PatientinMamma"
      },
      "performedDateTime" : "2026-04-02"
    },
    "request" : {
      "method" : "POST",
      "url" : "Procedure"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/Observation/ObsTNMpathologischMamma",
    "resource" : {
      "resourceType" : "Observation",
      "id" : "ObsTNMpathologischMamma",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Observation_ObsTNMpathologischMamma\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Observation ObsTNMpathologischMamma</b></p><a name=\"ObsTNMpathologischMamma\"> </a><a name=\"hcObsTNMpathologischMamma\"> </a><p><b>status</b>: Final</p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 21902-2}\">Stage group.pathology Cancer</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>effective</b>: 2026-04-07</p><p><b>value</b>: <span title=\"Codes:\">ypT0 ypN0 – pathologische Komplettremission (pCR)</span></p></div></div>"
      },
      "status" : "final",
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "21902-2",
          "display" : "Stage group.pathology Cancer"
        }]
      },
      "subject" : {
        "reference" : "Patient/PatientinMamma"
      },
      "effectiveDateTime" : "2026-04-07",
      "valueCodeableConcept" : {
        "text" : "ypT0 ypN0 – pathologische Komplettremission (pCR)"
      }
    },
    "request" : {
      "method" : "POST",
      "url" : "Observation"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/Observation/ObsDiseaseStatusMamma",
    "resource" : {
      "resourceType" : "Observation",
      "id" : "ObsDiseaseStatusMamma",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Observation_ObsDiseaseStatusMamma\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Observation ObsDiseaseStatusMamma</b></p><a name=\"ObsDiseaseStatusMamma\"> </a><a name=\"hcObsDiseaseStatusMamma\"> </a><p><b>status</b>: Final</p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 97509-4}\">Cancer disease progression</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>effective</b>: 2026-04-07</p><p><b>value</b>: <span title=\"Codes:{http://snomed.info/sct 260415000}\">Not detected</span></p><p><b>note</b>: </p><blockquote><div><p>Pathologische Komplettremission (pCR, ypT0 ypN0) nach neoadjuvanter Systemtherapie.</p>\n</div></blockquote></div></div>"
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
        "reference" : "Patient/PatientinMamma"
      },
      "effectiveDateTime" : "2026-04-07",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "260415000",
          "display" : "Not detected"
        }]
      },
      "note" : [{
        "text" : "Pathologische Komplettremission (pCR, ypT0 ypN0) nach neoadjuvanter Systemtherapie."
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "Observation"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/CarePlan/CarePlanMammaNeoadjuvant",
    "resource" : {
      "resourceType" : "CarePlan",
      "id" : "CarePlanMammaNeoadjuvant",
      "meta" : {
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-care-plan"]
      },
      "text" : {
        "status" : "extensions",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"CarePlan_CarePlanMammaNeoadjuvant\"> </a><p class=\"res-header-id\"><b>Generated Narrative: CarePlan CarePlanMammaNeoadjuvant</b></p><a name=\"CarePlanMammaNeoadjuvant\"> </a><a name=\"hcCarePlanMammaNeoadjuvant\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-onko-care-plan.html\">Onkologischer CarePlan</a></p></div><p><b>CarePlan Custodian (Extension)</b>: <a href=\"Organization-TumorzentrumMamma.html\">Organization Zertifiziertes Brustzentrum Musterklinik</a></p><p><b>status</b>: Active</p><p><b>intent</b>: Plan</p><p><b>category</b>: <span title=\"Codes:{http://snomed.info/sct 736252007}\">Cancer care plan</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>period</b>: 2025-09-22 --&gt; (ongoing)</p><p><b>author</b>: <a href=\"Practitioner-OnkologinMamma.html\">Practitioner Katrin Musterarzt </a></p><p><b>addresses</b>: <a href=\"Condition-ConditionMamma.html\">Condition Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse</a></p><p><b>goal</b>: <a href=\"Goal-TherapiezielMammaHeilung.html\">Goal: extension = ,,,; lifecycleStatus = active; achievementStatus = Achieved; category = Heilung,Funktionserhalt; priority = High Priority; description = ; start[x] = 2025-09-22</a></p><blockquote><p><b>activity</b></p><p><b>outcomeReference</b>: </p><ul><li><a href=\"MedicationAdministration-MedicationAdministrationPembroChemoNeoadjuvantMamma1.html\">MedicationAdministration: status = completed; medication[x] = ; effective[x] = 2025-10-01; note = Zyklus 1 von 4 (Pembro/Carbo q3w); begleitend wöchentliche Paclitaxel-Gaben, hier nicht einzeln erfasst</a></li><li><a href=\"MedicationAdministration-MedicationAdministrationPembroChemoNeoadjuvantMamma2.html\">MedicationAdministration: status = completed; medication[x] = ; effective[x] = 2025-11-01; note = Zyklus 2 von 4 (Pembro/Carbo q3w); begleitend wöchentliche Paclitaxel-Gaben, hier nicht einzeln erfasst</a></li><li><a href=\"MedicationAdministration-MedicationAdministrationPembroChemoNeoadjuvantMamma3.html\">MedicationAdministration: status = completed; medication[x] = ; effective[x] = 2026-02-10; note = Zyklus 3 von 4 (Pembro/Carbo q3w); begleitend wöchentliche Paclitaxel-Gaben, hier nicht einzeln erfasst</a></li><li><a href=\"MedicationAdministration-MedicationAdministrationPembroChemoNeoadjuvantMamma4.html\">MedicationAdministration: status = completed; medication[x] = ; effective[x] = 2026-03-15; note = Zyklus 4 von 4 (Pembro/Carbo q3w); begleitend wöchentliche Paclitaxel-Gaben, hier nicht einzeln erfasst</a></li></ul><p><b>reference</b>: <a href=\"MedicationRequest-MedicationRequestPembroChemoNeoadjuvantMamma.html\">MedicationRequest: status = completed; intent = plan; category = Tumor board Consult note; medication[x] = </a></p></blockquote><blockquote><p><b>activity</b></p><p><b>outcomeReference</b>: <a href=\"Procedure-ProcedureOperationMamma.html\">Procedure Lumpectomy of breast (procedure)</a></p><p><b>reference</b>: <a href=\"ServiceRequest-ServiceRequestProcedure.html\">ServiceRequest Lumpectomy of breast (procedure)</a></p></blockquote><blockquote><p><b>activity</b></p><p><b>reference</b>: <a href=\"MedicationRequest-MedicationRequestPembroAdjuvantMamma.html\">MedicationRequest: status = active; intent = plan; category = Tumor board Consult note; medication[x] = </a></p></blockquote><blockquote><p><b>activity</b></p><p><b>outcomeReference</b>: <a href=\"Observation-ObsDiseaseStatusMamma.html\">Observation Cancer disease progression</a></p></blockquote></div></div>"
      },
      "extension" : [{
        "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-careplan-custodian",
        "valueReference" : {
          "reference" : "Organization/TumorzentrumMamma"
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
        "reference" : "Patient/PatientinMamma"
      },
      "period" : {
        "start" : "2025-09-22"
      },
      "author" : {
        "reference" : "Practitioner/OnkologinMamma"
      },
      "addresses" : [{
        "reference" : "Condition/ConditionMamma"
      }],
      "goal" : [{
        "reference" : "Goal/TherapiezielMammaHeilung"
      }],
      "activity" : [{
        "outcomeReference" : [{
          "reference" : "MedicationAdministration/MedicationAdministrationPembroChemoNeoadjuvantMamma1"
        },
        {
          "reference" : "MedicationAdministration/MedicationAdministrationPembroChemoNeoadjuvantMamma2"
        },
        {
          "reference" : "MedicationAdministration/MedicationAdministrationPembroChemoNeoadjuvantMamma3"
        },
        {
          "reference" : "MedicationAdministration/MedicationAdministrationPembroChemoNeoadjuvantMamma4"
        }],
        "reference" : {
          "reference" : "MedicationRequest/MedicationRequestPembroChemoNeoadjuvantMamma"
        }
      },
      {
        "outcomeReference" : [{
          "reference" : "Procedure/ProcedureOperationMamma"
        }],
        "reference" : {
          "reference" : "ServiceRequest/ServiceRequestProcedure"
        }
      },
      {
        "reference" : {
          "reference" : "MedicationRequest/MedicationRequestPembroAdjuvantMamma"
        }
      },
      {
        "outcomeReference" : [{
          "reference" : "Observation/ObsDiseaseStatusMamma"
        }]
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "CarePlan"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/Goal/FollowUpGoal",
    "resource" : {
      "resourceType" : "Goal",
      "id" : "FollowUpGoal",
      "meta" : {
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-goal"]
      },
      "text" : {
        "status" : "extensions",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"Goal_FollowUpGoal\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Goal FollowUpGoal</b></p><a name=\"FollowUpGoal\"> </a><a name=\"hcFollowUpGoal\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-onko-therapy-goal.html\">Onkologisches Therapieziel</a></p></div><blockquote><p><b>Goal acceptance</b></p><ul><li>individual: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></li><li>status: agree</li><li>priority: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/goal-priority high-priority}\">High Priority</span></li></ul></blockquote><blockquote><p><b>Goal: Related Goal</b></p><ul><li>type: <span title=\"Codes:{http://hl7.org/fhir/goal-relationship-type predecessor}\">Predecessor</span></li><li>target: <a href=\"Goal-DiagnosticGoal.html\">Goal: extension = ; lifecycleStatus = active; achievementStatus = In Progress; category = Diagnostic intent; priority = High Priority; description = ; start[x] = 2025-09-12</a></li></ul></blockquote><blockquote><p><b>Goal: Related Goal</b></p><ul><li>type: <span title=\"Codes:{http://hl7.org/fhir/goal-relationship-type predecessor}\">Predecessor</span></li><li>target: <a href=\"Goal-TherapiezielMammaHeilung.html\">Goal: extension = ,,,; lifecycleStatus = active; achievementStatus = Achieved; category = Heilung,Funktionserhalt; priority = High Priority; description = ; start[x] = 2025-09-22</a></li></ul></blockquote><p><b>lifecycleStatus</b>: Planned</p><p><b>achievementStatus</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/goal-achievement in-progress}\">In Progress</span></p><p><b>category</b>: <span title=\"Codes:{https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-goal-type lebensqualitaet}\">Lebensqualität</span></p><p><b>priority</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/goal-priority high-priority}\">High Priority</span></p><p><b>description</b>: <span title=\"Codes:\">Monitoring der Lebensqualität und des Krankheitsstatus nach der onkologischen Erkrankung und Therapie</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>start</b>: 2026-08-15</p><blockquote><p><b>target</b></p><p><b>measure</b>: <span title=\"Codes:{http://loinc.org 21976-6}\">Cancer outcome status</span></p><p><b>detail</b>: <span title=\"Codes:\">Kein Hinweis auf Lokalrezidiv oder Fernmetastasen</span></p><p><b>due</b>: 2026-11-15</p></blockquote><blockquote><p><b>target</b></p><p><b>measure</b>: <span title=\"Codes:{http://loinc.org 24606-6}\">MG Breast Screening</span></p><p><b>detail</b>: <span title=\"Codes:\">Unauffällige Nachsorge-Mammographie (jährlich), kein Rezidivnachweis</span></p><p><b>due</b>: 2027-04-15</p></blockquote><blockquote><p><b>target</b></p><p><b>measure</b>: <span title=\"Codes:\">Arm-/Schulterfunktion und Lymphödem-Status nach axillärem Eingriff</span></p><p><b>detail</b>: <span title=\"Codes:\">Kein manifestes Lymphödem, erhaltene Schulterbeweglichkeit</span></p></blockquote><blockquote><p><b>target</b></p><p><b>measure</b>: <span title=\"Codes:\">Gesundheitsbezogene Lebensqualität (PROM, EORTC QLQ-C30 / BR23) – MII PRO-Modul</span></p><p><b>detail</b>: <span title=\"Codes:\">Stabile bis verbesserte Lebensqualität im Verlauf</span></p></blockquote><p><b>expressedBy</b>: <a href=\"Practitioner-OnkologinMamma.html\">Practitioner Katrin Musterarzt </a></p><p><b>addresses</b>: <a href=\"Condition-ConditionMamma.html\">Condition Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse</a></p><p><b>outcomeReference</b>: <a href=\"Observation-ObsDiseaseStatusMamma.html\">Observation Cancer disease progression</a></p></div></div>"
      },
      "extension" : [{
        "extension" : [{
          "url" : "individual",
          "valueReference" : {
            "reference" : "Patient/PatientinMamma"
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
              "system" : "http://hl7.org/fhir/goal-relationship-type",
              "code" : "predecessor",
              "display" : "Predecessor"
            }]
          }
        },
        {
          "url" : "target",
          "valueReference" : {
            "reference" : "Goal/DiagnosticGoal"
          }
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/goal-relationship"
      },
      {
        "extension" : [{
          "url" : "type",
          "valueCodeableConcept" : {
            "coding" : [{
              "system" : "http://hl7.org/fhir/goal-relationship-type",
              "code" : "predecessor",
              "display" : "Predecessor"
            }]
          }
        },
        {
          "url" : "target",
          "valueReference" : {
            "reference" : "Goal/TherapiezielMammaHeilung"
          }
        }],
        "url" : "http://hl7.org/fhir/StructureDefinition/goal-relationship"
      }],
      "lifecycleStatus" : "planned",
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
          "code" : "lebensqualitaet",
          "display" : "Lebensqualität"
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
        "text" : "Monitoring der Lebensqualität und des Krankheitsstatus nach der onkologischen Erkrankung und Therapie"
      },
      "subject" : {
        "reference" : "Patient/PatientinMamma"
      },
      "startDate" : "2026-08-15",
      "target" : [{
        "measure" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "21976-6",
            "display" : "Cancer outcome status"
          }]
        },
        "detailCodeableConcept" : {
          "text" : "Kein Hinweis auf Lokalrezidiv oder Fernmetastasen"
        },
        "dueDate" : "2026-11-15"
      },
      {
        "measure" : {
          "coding" : [{
            "system" : "http://loinc.org",
            "code" : "24606-6",
            "display" : "MG Breast Screening"
          }]
        },
        "detailCodeableConcept" : {
          "text" : "Unauffällige Nachsorge-Mammographie (jährlich), kein Rezidivnachweis"
        },
        "dueDate" : "2027-04-15"
      },
      {
        "measure" : {
          "text" : "Arm-/Schulterfunktion und Lymphödem-Status nach axillärem Eingriff"
        },
        "detailCodeableConcept" : {
          "text" : "Kein manifestes Lymphödem, erhaltene Schulterbeweglichkeit"
        }
      },
      {
        "measure" : {
          "text" : "Gesundheitsbezogene Lebensqualität (PROM, EORTC QLQ-C30 / BR23) – MII PRO-Modul"
        },
        "detailCodeableConcept" : {
          "text" : "Stabile bis verbesserte Lebensqualität im Verlauf"
        }
      }],
      "expressedBy" : {
        "reference" : "Practitioner/OnkologinMamma"
      },
      "addresses" : [{
        "reference" : "Condition/ConditionMamma"
      }],
      "outcomeReference" : [{
        "reference" : "Observation/ObsDiseaseStatusMamma"
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "Goal"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/ServiceRequest/ServiceRequestMammographieNachsorge",
    "resource" : {
      "resourceType" : "ServiceRequest",
      "id" : "ServiceRequestMammographieNachsorge",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"ServiceRequest_ServiceRequestMammographieNachsorge\"> </a><p class=\"res-header-id\"><b>Generated Narrative: ServiceRequest ServiceRequestMammographieNachsorge</b></p><a name=\"ServiceRequestMammographieNachsorge\"> </a><a name=\"hcServiceRequestMammographieNachsorge\"> </a><p><b>status</b>: Active</p><p><b>intent</b>: Plan</p><p><b>code</b>: <span title=\"Codes:{http://loinc.org 24606-6}\">Nachsorge-Mammographie beidseits (jährlich)</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>occurrence</b>: 2027-04-15</p><p><b>requester</b>: <a href=\"Practitioner-OnkologinMamma.html\">Practitioner Katrin Musterarzt </a></p><p><b>reasonReference</b>: <a href=\"Condition-ConditionMamma.html\">Condition Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse</a></p></div></div>"
      },
      "status" : "active",
      "intent" : "plan",
      "code" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "24606-6",
          "display" : "MG Breast Screening"
        }],
        "text" : "Nachsorge-Mammographie beidseits (jährlich)"
      },
      "subject" : {
        "reference" : "Patient/PatientinMamma"
      },
      "occurrenceDateTime" : "2027-04-15",
      "requester" : {
        "reference" : "Practitioner/OnkologinMamma"
      },
      "reasonReference" : [{
        "reference" : "Condition/ConditionMamma"
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "ServiceRequest"
    }
  },
  {
    "fullUrl" : "http://example.org/fhir/CarePlan/CarePlanMammaNachsorge",
    "resource" : {
      "resourceType" : "CarePlan",
      "id" : "CarePlanMammaNachsorge",
      "meta" : {
        "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-care-plan"]
      },
      "text" : {
        "status" : "extensions",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div xml:lang=\"de\" lang=\"de\"><hr/><p><b>German</b></p><hr/><a name=\"CarePlan_CarePlanMammaNachsorge\"> </a><p class=\"res-header-id\"><b>Generated Narrative: CarePlan CarePlanMammaNachsorge</b></p><a name=\"CarePlanMammaNachsorge\"> </a><a name=\"hcCarePlanMammaNachsorge\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-onko-care-plan.html\">Onkologischer CarePlan</a></p></div><p><b>CarePlan Custodian (Extension)</b>: <a href=\"Organization-TumorzentrumMamma.html\">Organization Zertifiziertes Brustzentrum Musterklinik</a></p><p><b>status</b>: Active</p><p><b>intent</b>: Plan</p><p><b>category</b>: <span title=\"Codes:{http://snomed.info/sct 736252007}\">Cancer care plan</span></p><p><b>subject</b>: <a href=\"Patient-PatientinMamma.html\">Sabine Baumann  Female, DoB: 1977-06-24</a></p><p><b>period</b>: 2026-08-15 --&gt; (ongoing)</p><p><b>author</b>: <a href=\"Practitioner-OnkologinMamma.html\">Practitioner Katrin Musterarzt </a></p><p><b>addresses</b>: <a href=\"Condition-ConditionMamma.html\">Condition Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse</a></p><p><b>goal</b>: <a href=\"Goal-FollowUpGoal.html\">Goal: extension = ,,; lifecycleStatus = planned; achievementStatus = In Progress; category = Lebensqualität; priority = High Priority; description = ; start[x] = 2026-08-15</a></p><h3>Activities</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Reference</b></td></tr><tr><td style=\"display: none\">*</td><td><a href=\"ServiceRequest-ServiceRequestMammographieNachsorge.html\">ServiceRequest MG Breast Screening</a></td></tr></table></div></div>"
      },
      "extension" : [{
        "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-careplan-custodian",
        "valueReference" : {
          "reference" : "Organization/TumorzentrumMamma"
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
        "reference" : "Patient/PatientinMamma"
      },
      "period" : {
        "start" : "2026-08-15"
      },
      "author" : {
        "reference" : "Practitioner/OnkologinMamma"
      },
      "addresses" : [{
        "reference" : "Condition/ConditionMamma"
      }],
      "goal" : [{
        "reference" : "Goal/FollowUpGoal"
      }],
      "activity" : [{
        "reference" : {
          "reference" : "ServiceRequest/ServiceRequestMammographieNachsorge"
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
