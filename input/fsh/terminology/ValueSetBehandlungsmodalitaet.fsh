// Behandlungsmodalität — EIGENES Merkmal einer Behandlungsepisode
// (Extension onko-modalitaet), bewusst getrennt von der Episodenart:
// vormals als "Art der Therapielinie" in EpisodeOfCare.type geführt, was
// systemische und lokoregionale Modalitäten vermischte.

ValueSet: BehandlungsmodalitaetVS
Id: onko-behandlungsmodalitaet
Title: "Behandlungsmodalität (VS)"
Description: """
Behandlungsmodalität einer onkologischen Behandlungsepisode — Beispiel-Set
gängiger Modalitäten, systemisch (Chemo-, Immun-, Hormontherapie) wie
lokoregional (Bestrahlung, Operation).

Die Codes wurden gegen SNOMED CT (internationale Edition) recherchiert. Für
Bestrahlung existiert `Radiation therapy care` (385798007), für die ambulante
Chemotherapie der spezifische Code `Ambulatory chemotherapy` (315601005).
"""
* insert Translation(^title, en, Treatment modality value set)
* insert Translation(^description, en, Treatment modality of an oncological care episode — an example set of common systemic and locoregional modalities\, researched against SNOMED CT international edition.)
* ^status = #active
* ^experimental = true
* http://snomed.info/sct#385786002 "Chemotherapy care"
* http://snomed.info/sct#315601005 "Ambulatory chemotherapy"
* http://snomed.info/sct#385798007 "Radiation therapy care"
* http://snomed.info/sct#76334006 "Immunological therapy"
* http://snomed.info/sct#169413002 "Hormone therapy"
* http://snomed.info/sct#387713003 "Surgical procedure"
