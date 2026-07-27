// =====================================================================
// Transaction-Bundle für das Szenario "Metastasiertes kolorektales
// Karzinom (mCRC), palliativ".
//
// Fasst alle Beispiel-Instanzen aus ScenarioCRCPalliativ.fsh zu einem
// FHIR-Transaction-Bundle zusammen, das direkt an einen FHIR-Server
// (z. B. ClinFHIR, HAPI) per POST auf den Base-Endpoint gesendet werden
// kann. Jede Entry erhält eine absolute fullUrl (Base + ResourceType/id)
// sowie eine POST-Request-Anweisung; interne Referenzen (ResourceType/id)
// werden vom Server anhand Typ+Id gegen die fullUrls aufgelöst.
// =====================================================================

Instance: BundleCRCPalliativ
InstanceOf: Bundle
Usage: #example
Title: "Transaction-Bundle – mCRC palliativ (Beispiel)"
Description: "Postbares Transaction-Bundle mit allen Instanzen des mCRC-Szenarios (Patientin, Akteure, Diagnostik, Diagnose, Therapielinie, Therapieziele, Tumorboard-Empfehlungen, Verlauf)."
* type = #transaction

* entry[+].fullUrl = "http://example.org/fhir/Patient/PatientinCRC"
* entry[=].resource = PatientinCRC
* entry[=].request.method = #POST
* entry[=].request.url = "Patient"

* entry[+].fullUrl = "http://example.org/fhir/Practitioner/OnkologinCRC"
* entry[=].resource = OnkologinCRC
* entry[=].request.method = #POST
* entry[=].request.url = "Practitioner"

* entry[+].fullUrl = "http://example.org/fhir/Organization/TumorzentrumCRC"
* entry[=].resource = TumorzentrumCRC
* entry[=].request.method = #POST
* entry[=].request.url = "Organization"

* entry[+].fullUrl = "http://example.org/fhir/CareTeam/TumorboardCRC"
* entry[=].resource = TumorboardCRC
* entry[=].request.method = #POST
* entry[=].request.url = "CareTeam"

* entry[+].fullUrl = "http://example.org/fhir/Condition/ConditionCRC"
* entry[=].resource = ConditionCRC
* entry[=].request.method = #POST
* entry[=].request.url = "Condition"

* entry[+].fullUrl = "http://example.org/fhir/CarePlan/DiagnostikCarePlanCRC"
* entry[=].resource = DiagnostikCarePlanCRC
* entry[=].request.method = #POST
* entry[=].request.url = "CarePlan"

* entry[+].fullUrl = "http://example.org/fhir/ServiceRequest/ServiceRequestKoloskopieCRC"
* entry[=].resource = ServiceRequestKoloskopieCRC
* entry[=].request.method = #POST
* entry[=].request.url = "ServiceRequest"

* entry[+].fullUrl = "http://example.org/fhir/DiagnosticReport/DiagnosticReportHistologieCRC"
* entry[=].resource = DiagnosticReportHistologieCRC
* entry[=].request.method = #POST
* entry[=].request.url = "DiagnosticReport"

* entry[+].fullUrl = "http://example.org/fhir/EpisodeOfCare/TherapielinieCRCErstlinie"
* entry[=].resource = TherapielinieCRCErstlinie
* entry[=].request.method = #POST
* entry[=].request.url = "EpisodeOfCare"

* entry[+].fullUrl = "http://example.org/fhir/Goal/TherapiezielCRCLebensverlaengerung"
* entry[=].resource = TherapiezielCRCLebensverlaengerung
* entry[=].request.method = #POST
* entry[=].request.url = "Goal"

* entry[+].fullUrl = "http://example.org/fhir/Goal/TherapiezielCRCKurativAbgelehnt"
* entry[=].resource = TherapiezielCRCKurativAbgelehnt
* entry[=].request.method = #POST
* entry[=].request.url = "Goal"

* entry[+].fullUrl = "http://example.org/fhir/Goal/TherapiezielCRCErhaltung"
* entry[=].resource = TherapiezielCRCErhaltung
* entry[=].request.method = #POST
* entry[=].request.url = "Goal"

* entry[+].fullUrl = "http://example.org/fhir/MedicationRequest/MedicationRequestFOLFOX"
* entry[=].resource = MedicationRequestFOLFOX
* entry[=].request.method = #POST
* entry[=].request.url = "MedicationRequest"

* entry[+].fullUrl = "http://example.org/fhir/ServiceRequest/ServiceRequestPortCRC"
* entry[=].resource = ServiceRequestPortCRC
* entry[=].request.method = #POST
* entry[=].request.url = "ServiceRequest"

* entry[+].fullUrl = "http://example.org/fhir/Observation/ObservationDiseaseStatusCRC"
* entry[=].resource = ObservationDiseaseStatusCRC
* entry[=].request.method = #POST
* entry[=].request.url = "Observation"

* entry[+].fullUrl = "http://example.org/fhir/CarePlan/CarePlanCRCPalliativ"
* entry[=].resource = CarePlanCRCPalliativ
* entry[=].request.method = #POST
* entry[=].request.url = "CarePlan"
