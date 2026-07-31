ValueSet: OnkoTherapyIntentVS
Id: onko-therapy-intent
Title: "Onkologische Therapieintention (VS)"
Description: """
Intention (das „Warum") einer onkologischen Therapielinie bzw. eines Behandlungsabschnitts.

Verwendet aktuelle SNOMED-CT-Codes aus der Hierarchie `362961001 | Procedure by intent`.
Als Concept-Display dient der englische SNOMED-Anzeigetext des aktuellen Release (validierbar
gegen tx.fhir.org); die deutschen Begriffe stehen in den Label-Texten
des Leitfadens. Extensible gebunden – seltene Sonderintentionen dürfen ergänzt werden.
"""
* ^url = "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-therapy-intent"
* ^status = #draft
* ^experimental = true
* http://snomed.info/sct#373808002 "Curative - procedure intent"
* http://snomed.info/sct#363676003 "Palliative intent"
* http://snomed.info/sct#373847000 "Neoadjuvant intent"
* http://snomed.info/sct#373846009 "Adjuvant - intent"
* http://snomed.info/sct#399707004 "Supportive - procedure intent"
