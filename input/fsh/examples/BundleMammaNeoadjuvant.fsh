// =====================================================================
// Transaction-Bundle für das Szenario "Mammakarzinom neoadjuvant/kurativ".
//
// Fasst alle Beispiel-Instanzen aus ScenarioMammaNeoadjuvant.fsh zu einem
// FHIR-Transaction-Bundle zusammen, das direkt an einen FHIR-Server
// (z. B. ClinFHIR, HAPI) per POST auf den Base-Endpoint gesendet werden
// kann. Jede Entry erhält eine absolute fullUrl (Base + ResourceType/id)
// sowie eine POST-Request-Anweisung; interne Referenzen (ResourceType/id)
// werden vom Server anhand Typ+Id gegen die fullUrls aufgelöst.
// =====================================================================

Instance: BundleMammaNeoadjuvant
InstanceOf: Bundle
Usage: #example
Title: "Transaction-Bundle – Mammakarzinom neoadjuvant (Beispiel)"
Description: "Postbares Transaction-Bundle mit allen Instanzen des Mamma-Szenarios (Patientin, Akteure, Diagnostik, Diagnose, Therapielinien, Therapieziele, Tumorboard-Empfehlungen, Verlauf)."
* type = #transaction

* entry[+].fullUrl = "http://example.org/fhir/Patient/PatientinMamma"
* entry[=].resource = PatientinMamma
* entry[=].request.method = #POST
* entry[=].request.url = "Patient"

* entry[+].fullUrl = "http://example.org/fhir/Practitioner/OnkologinMamma"
* entry[=].resource = OnkologinMamma
* entry[=].request.method = #POST
* entry[=].request.url = "Practitioner"

* entry[+].fullUrl = "http://example.org/fhir/Organization/TumorzentrumMamma"
* entry[=].resource = TumorzentrumMamma
* entry[=].request.method = #POST
* entry[=].request.url = "Organization"

* entry[+].fullUrl = "http://example.org/fhir/Organization/Tumorboard"
* entry[=].resource = Tumorboard
* entry[=].request.method = #POST
* entry[=].request.url = "Organization"

* entry[+].fullUrl = "http://example.org/fhir/ServiceRequest/ServiceRequestBiopsieMamma"
* entry[=].resource = ServiceRequestBiopsieMamma
* entry[=].request.method = #POST
* entry[=].request.url = "ServiceRequest"

* entry[+].fullUrl = "http://example.org/fhir/ServiceRequest/ServiceRequestPathologieMamma"
* entry[=].resource = ServiceRequestPathologieMamma
* entry[=].request.method = #POST
* entry[=].request.url = "ServiceRequest"

* entry[+].fullUrl = "http://example.org/fhir/ServiceRequest/ServiceRequestStagingMamma"
* entry[=].resource = ServiceRequestStagingMamma
* entry[=].request.method = #POST
* entry[=].request.url = "ServiceRequest"

* entry[+].fullUrl = "http://example.org/fhir/ServiceRequest/ServiceRequestGBRCAMamma"
* entry[=].resource = ServiceRequestGBRCAMamma
* entry[=].request.method = #POST
* entry[=].request.url = "ServiceRequest"

* entry[+].fullUrl = "http://example.org/fhir/CarePlan/CarePlanMammaDiagnostik"
* entry[=].resource = CarePlanMammaDiagnostik
* entry[=].request.method = #POST
* entry[=].request.url = "CarePlan"

* entry[+].fullUrl = "http://example.org/fhir/Goal/DiagnosticGoal"
* entry[=].resource = DiagnosticGoal
* entry[=].request.method = #POST
* entry[=].request.url = "Goal"

* entry[+].fullUrl = "http://example.org/fhir/Condition/ConditionMamma"
* entry[=].resource = ConditionMamma
* entry[=].request.method = #POST
* entry[=].request.url = "Condition"

* entry[+].fullUrl = "http://example.org/fhir/Procedure/ProcedureBiopsieMamma"
* entry[=].resource = ProcedureBiopsieMamma
* entry[=].request.method = #POST
* entry[=].request.url = "Procedure"

* entry[+].fullUrl = "http://example.org/fhir/Specimen/SpecimenBiopsieMamma"
* entry[=].resource = SpecimenBiopsieMamma
* entry[=].request.method = #POST
* entry[=].request.url = "Specimen"

* entry[+].fullUrl = "http://example.org/fhir/Observation/ObsHistologieMamma"
* entry[=].resource = ObsHistologieMamma
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"

* entry[+].fullUrl = "http://example.org/fhir/Observation/ObsGradingMamma"
* entry[=].resource = ObsGradingMamma
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"

* entry[+].fullUrl = "http://example.org/fhir/Observation/ObsTNMklinischMamma"
* entry[=].resource = ObsTNMklinischMamma
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"

* entry[+].fullUrl = "http://example.org/fhir/Observation/ObsEstrogenrezeptorMamma"
* entry[=].resource = ObsEstrogenrezeptorMamma
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"

* entry[+].fullUrl = "http://example.org/fhir/Observation/ObsProgesteronrezeptorMamma"
* entry[=].resource = ObsProgesteronrezeptorMamma
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"

* entry[+].fullUrl = "http://example.org/fhir/Observation/ObsHER2Mamma"
* entry[=].resource = ObsHER2Mamma
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"

* entry[+].fullUrl = "http://example.org/fhir/Observation/ObsKi67Mamma"
* entry[=].resource = ObsKi67Mamma
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"

* entry[+].fullUrl = "http://example.org/fhir/Observation/ObsGBRCAMamma"
* entry[=].resource = ObsGBRCAMamma
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"

* entry[+].fullUrl = "http://example.org/fhir/EpisodeOfCare/TherapielinieChemo"
* entry[=].resource = TherapielinieChemo
* entry[=].request.method = #POST
* entry[=].request.url = "EpisodeOfCare"

* entry[+].fullUrl = "http://example.org/fhir/EpisodeOfCare/TherapielinieOperation"
* entry[=].resource = TherapielinieOperation
* entry[=].request.method = #POST
* entry[=].request.url = "EpisodeOfCare"

* entry[+].fullUrl = "http://example.org/fhir/Goal/TherapiezielMammaHeilung"
* entry[=].resource = TherapiezielMammaHeilung
* entry[=].request.method = #POST
* entry[=].request.url = "Goal"

* entry[+].fullUrl = "http://example.org/fhir/ServiceRequest/ServiceRequestProcedure"
* entry[=].resource = ServiceRequestProcedure
* entry[=].request.method = #POST
* entry[=].request.url = "ServiceRequest"

* entry[+].fullUrl = "http://example.org/fhir/MedicationRequest/MedicationRequestPembroChemoNeoadjuvantMamma"
* entry[=].resource = MedicationRequestPembroChemoNeoadjuvantMamma
* entry[=].request.method = #POST
* entry[=].request.url = "MedicationRequest"

* entry[+].fullUrl = "http://example.org/fhir/Procedure/ProcedureOperationMamma"
* entry[=].resource = ProcedureOperationMamma
* entry[=].request.method = #POST
* entry[=].request.url = "Procedure"

* entry[+].fullUrl = "http://example.org/fhir/Observation/ObsTNMpathologischMamma"
* entry[=].resource = ObsTNMpathologischMamma
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"

* entry[+].fullUrl = "http://example.org/fhir/Observation/ObsDiseaseStatusMamma"
* entry[=].resource = ObsDiseaseStatusMamma
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"

* entry[+].fullUrl = "http://example.org/fhir/CarePlan/CarePlanMammaNeoadjuvant"
* entry[=].resource = CarePlanMammaNeoadjuvant
* entry[=].request.method = #POST
* entry[=].request.url = "CarePlan"

* entry[+].fullUrl = "http://example.org/fhir/Goal/FollowUpGoal"
* entry[=].resource = FollowUpGoal
* entry[=].request.method = #POST
* entry[=].request.url = "Goal"

* entry[+].fullUrl = "http://example.org/fhir/ServiceRequest/ServiceRequestMammographieNachsorge"
* entry[=].resource = ServiceRequestMammographieNachsorge
* entry[=].request.method = #POST
* entry[=].request.url = "ServiceRequest"

* entry[+].fullUrl = "http://example.org/fhir/CarePlan/CarePlanMammaNachsorge"
* entry[=].resource = CarePlanMammaNachsorge
* entry[=].request.method = #POST
* entry[=].request.url = "CarePlan"
