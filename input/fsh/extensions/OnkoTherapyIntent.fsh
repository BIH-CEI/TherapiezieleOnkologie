Extension: OnkoTherapyIntentExt
Id: onko-therapy-intent
Title: "Onkologische Therapieintention (Extension)"
Description: "Strukturierte Codierung der Therapieintention (kurativ, neoadjuvant, adjuvant, Erhaltung, palliativ, supportiv). Verwendet in OnkoCarePlan und OnkoTherapyLine. Konzeptionell anschlussfähig an mCODE `procedure-intent`."
* ^context.type = #element
* ^context.expression = "CarePlan"
* ^context[+].type = #element
* ^context[=].expression = "Goal"
* value[x] only CodeableConcept
* valueCodeableConcept from OnkoTherapyIntentVS (required)
