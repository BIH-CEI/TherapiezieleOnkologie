ValueSet: OnkoTherapyPhaseVS
Id: onko-therapy-phase
Title: "Onkologische Therapiephase / Unter-Intention (VS)"
Description: """
Sequenzielle Phase (Unter-Intention) innerhalb eines Behandlungskonzepts – ergänzend zur
Haupt-Therapieintention. In SNOMED CT liegen diese Konzepte nicht in der Intent-Hierarchie,
sondern als Behandlungsformen unter `716872004 | Antineoplastic chemotherapy regimen`.
Deutsche Anzeigetexte als Concept-Display. Extensible gebunden (z. B. Konsolidierung
ergänzbar).
"""
* ^url = "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-therapy-phase"
* ^status = #draft
* ^experimental = true
// Reihenfolge entspricht der typischen Behandlungssequenz
* http://snomed.info/sct#450827009 "Induktionstherapie"
* http://snomed.info/sct#816151001 "Konsolidierungstherapie"
* http://snomed.info/sct#1254741007 "Intensivierungstherapie"
* http://snomed.info/sct#1345242003 "Erhaltungstherapie"
