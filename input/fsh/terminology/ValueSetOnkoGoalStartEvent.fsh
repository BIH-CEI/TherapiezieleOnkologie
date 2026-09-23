ValueSet: OnkoGoalStartEventVS
Id: onko-goal-start-event
Title: "Onkologisches Zielbeginn-Ereignis (VS)"
Description: """
Codierte Ereignisse für den Beginn eines onkologischen Therapieziels (`Goal.startCodeableConcept`).
Übernimmt das HL7-Basis-ValueSet [GoalStartEvent](http://hl7.org/fhir/ValueSet/goal-start-event) und
ergänzt onkologisch relevante SNOMED-CT-Qualifier für den Zielbeginn nach Bestrahlung, Chemotherapie
oder Operation. Example-Bindung – die Codes dienen als Anregung, sind aber nicht verpflichtend.
"""
* ^url = "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-goal-start-event"
* ^status = #draft
* ^experimental = true
* include codes from valueset http://hl7.org/fhir/ValueSet/goal-start-event
* http://snomed.info/sct#264908009 "Post-radiation (qualifier value)"
* http://snomed.info/sct#262502001 "Post-chemotherapy (qualifier value)"
* http://snomed.info/sct#262061000 "Postoperative period (qualifier value)"
