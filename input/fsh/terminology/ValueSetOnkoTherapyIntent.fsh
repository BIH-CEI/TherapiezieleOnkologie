ValueSet: OnkoTherapyIntentVS
Id: onko-therapy-intent
Title: "Onkologische Therapieintention (VS)"
Description: """
Intention (das „Warum") einer onkologischen Therapielinie bzw. eines Behandlungsabschnitts.

Verwendet aktuelle SNOMED-CT-Codes aus der Hierarchie `362961001 | Procedure by intent`.
Die deutschen Anzeigetexte sind als Concept-Display hinterlegt (Übersetzung der englischen
SNOMED-FSN). Extensible gebunden – seltene Sonderintentionen dürfen ergänzt werden.
"""
* ^url = "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-therapy-intent"
* ^status = #draft
* ^experimental = true
* http://snomed.info/sct#373808002 "Kurativ"
* http://snomed.info/sct#363676003 "Palliativ"
* http://snomed.info/sct#373847000 "Neoadjuvant"
* http://snomed.info/sct#373846009 "Adjuvant"
* http://snomed.info/sct#399707004 "Supportiv"
