ValueSet: OnkoTherapyIntentVS
Id: onko-therapy-intent
Title: "Onkologische Therapieintention (VS)"
Description: """
Intention (das „Warum") einer onkologischen Behandlungsepisode bzw. eines Behandlungsabschnitts:
**wozu** behandelt wird.

Verwendet aktuelle SNOMED-CT-Codes aus der Hierarchie `362981000 | Qualifier value`.

Nicht hier abgebildet sind **neoadjuvant** und **adjuvant**: Sie beantworten nicht das „Wozu",
sondern beschreiben die Stellung einer Maßnahme zur Operation — eine neoadjuvante Therapie ist
in aller Regel kurativ intendiert. Sie sind daher mit der Intention kombinierbar statt zu ihr
alternativ und stehen in der Kontext-Achse (`onko-service-request-kontext`).
Als Concept-Display dient der englische SNOMED-Anzeigetext des aktuellen Release (validierbar
gegen tx.fhir.org); die deutschen Begriffe stehen in den Label-Texten
des Leitfadens. Extensible gebunden – seltene Sonderintentionen dürfen ergänzt werden.
"""
* ^url = "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-therapy-intent"
* ^status = #active
* ^experimental = true
* http://snomed.info/sct#373808002 "Curative - procedure intent"
* http://snomed.info/sct#363676003 "Palliative intent"
* http://snomed.info/sct#399707004 "Supportive - procedure intent"
