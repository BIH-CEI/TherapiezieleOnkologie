ValueSet: OnkoServiceRequestKontextVS
Id: onko-service-request-kontext
Title: "Kontext einer Tumorboard-Empfehlung (VS)"
Description: """
Zusätzlicher Kontext eines Behandlungsschritts – ergänzend zur Therapieintention – z. B. ob eine
Maßnahme lokal begrenzt, symptomatisch, präventiv, definitiv, additiv, intraoperativ, elektiv
oder im Notfall erfolgt. Gebunden an die Extension `onko-service-request-kontext`.
"""
* ^url = "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-service-request-kontext"
* ^status = #draft
* ^experimental = true
* http://snomed.info/sct#255470001 "Local (qualifier value)"
* http://snomed.info/sct#264931009 "Symptomatic (qualifier value)"
* http://snomed.info/sct#129428001 "Preventive - procedure intent"
* http://snomed.info/sct#261002007 "Definitive (qualifier value)"
* http://snomed.info/sct#260364009 "Additive (qualifier value)"
* http://snomed.info/sct#277671009 "Intraoperative (qualifier value)"
* http://snomed.info/sct#103390000 "Elective (qualifier value)"
* http://snomed.info/sct#25876001 "Emergency (qualifier value)"
