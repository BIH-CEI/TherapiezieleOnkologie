Profile: OnkoCondition
Parent: https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-diagnose-primaertumor
Id: onko-condition
Title: "Onkologische Diagnose (Condition)"
Description: """
Onkologische Tumorerkrankung auf Basis des **MII Kerndatensatz-Moduls Onkologie**
([MII PR Onkologie Diagnose Primärtumor](https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-diagnose-primaertumor),
Version 2026.0.3).

Dieses Profil erbt das vollständige onkologische Diagnosemodell des MII KDS (ICD-10-GM,
ICD-O-3 Topographie/Morphologie, Diagnosesicherung gemäß oBDS, Seitenlokalisation,
Feststellungsdatum) und dient als adressierte Erkrankung (`addresses`) für `OnkoCarePlan`
und `OnkoTherapyGoal`. Damit wird die Therapieziel-Spezifikation an den nationalen
Onkologie-Kerndatensatz angeschlossen, statt ein eigenes Condition-Modell zu definieren.

Für die Therapieziel-Domäne werden keine zusätzlichen Einschränkungen vorgenommen; das
Profil dokumentiert lediglich die explizite Wiederverwendung und stellt einen stabilen
lokalen Canonical bereit, auf den die übrigen Profile referenzieren.
"""
* insert Translation(^title, en, Oncological diagnosis condition)
* insert Translation(^description, en, Oncological tumor condition based on the MII core data set module Oncology – MII PR Onkologie Diagnose Primärtumor\, version 2026.0.3. The profile inherits the full oncological diagnosis model – ICD-10-GM\, ICD-O-3 topography and morphology\, diagnostic certainty per oBDS\, laterality\, date of diagnosis – and serves as the addressed condition for OnkoCarePlan and OnkoTherapyGoal. No additional constraints are added for the therapy-goal domain.)
* ^status = #draft
