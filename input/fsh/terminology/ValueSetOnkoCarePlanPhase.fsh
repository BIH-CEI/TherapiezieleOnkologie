ValueSet: OnkoCarePlanPhaseVS
Id: onko-care-plan-phase
Title: "Onkologischer CarePlan – Therapieabschnitt (VS)"
Description: """
Kennzeichnet, ob ein `OnkoCarePlan` den diagnostischen oder den therapeutischen Abschnitt der
onkologischen Versorgung abbildet. Gebunden an `category` (Slice `therapieabschnitt`); ersetzt
die vormalige Unterscheidung über zwei separate Profile (`OnkoCarePlan` / `DiagnosticCarePlan`).
"""
* ^url = "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-care-plan-phase"
* ^status = #draft
* ^experimental = true
* http://snomed.info/sct#261004008 "Diagnostic intent (qualifier value)"
* http://snomed.info/sct#262202000 "Therapeutic intent (qualifier value)"
