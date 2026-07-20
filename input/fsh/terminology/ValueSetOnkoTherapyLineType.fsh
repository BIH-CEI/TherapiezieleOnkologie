ValueSet: OnkoTherapyLineTypeVS
Id: onko-therapy-line-type
Title: "Onkologische Therapielinie – Art (VS)"
Description: """
Art einer onkologischen Therapielinie (Behandlungsmodalität) für `EpisodeOfCare.type`.

Die Codes wurden gegen SNOMED CT (internationale Edition) recherchiert und stellen ein
Beispiel-Set gängiger onkologischer Behandlungsmodalitäten dar. Für Bestrahlung existiert
`Radiation therapy care` (385798007), für die ambulante Chemotherapie der spezifische Code
`Ambulatory chemotherapy` (315601005).
"""
* ^status = #draft
* ^experimental = true
* http://snomed.info/sct#385786002 "Chemotherapy care"
* http://snomed.info/sct#315601005 "Ambulatory chemotherapy"
* http://snomed.info/sct#385798007 "Radiation therapy care"
* http://snomed.info/sct#76334006 "Immunological therapy"
* http://snomed.info/sct#169413002 "Hormone therapy"
