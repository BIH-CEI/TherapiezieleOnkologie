Extension: OnkoTherapyIntentExt
Id: onko-therapy-intent
Title: "Onkologische Therapieintention (Extension)"
Description: """
Strukturierte Codierung der Therapieintention über zwei Achsen:

- `hauptintention` (Pflicht): die eigentliche Behandlungsintention (kurativ, palliativ,
  neoadjuvant, adjuvant, supportiv) – SNOMED `Procedure by intent`.
- `phase` (optional, wiederholbar): die sequenzielle Behandlungsphase / Unter-Intention
  (Induktionstherapie, Erhaltungstherapie) – ergänzend zur Hauptintention.

So lässt sich z. B. „kurativ + Induktionsphase" gleichzeitig ausdrücken. Verwendet in
OnkoCarePlan, OnkoTherapyGoal und OnkoTherapyLine. Konzeptionell anschlussfähig an mCODE
`procedure-intent`.
"""
* insert Translation(^title, en, Oncological therapy intent extension)
* insert Translation(^description, en, Structured coding of the therapy intent on two axes: hauptintention – the actual treatment intent such as curative\, palliative\, neoadjuvant\, adjuvant\, supportive – and phase – the sequential treatment phase such as induction or maintenance therapy. This allows expressing e.g. curative plus induction phase at the same time.)
* ^context.type = #element
* ^context.expression = "CarePlan"
* ^context[+].type = #element
* ^context[=].expression = "Goal"
* ^context[+].type = #element
* ^context[=].expression = "EpisodeOfCare"

// Komplexe Extension: keine top-level value, stattdessen Unter-Extensions
* value[x] 0..0
* extension contains
    hauptintention 1..1 MS and
    phase 0..* MS

// Hauptintention (das „Warum")
* extension[hauptintention] ^short = "Haupt-Therapieintention"
* extension[hauptintention] ^definition = "Die eigentliche Behandlungsintention (kurativ, palliativ, neoadjuvant, adjuvant, supportiv)."
* extension[hauptintention].value[x] only CodeableConcept
* extension[hauptintention].valueCodeableConcept from OnkoTherapyIntentVS (extensible)
* insert Translation(extension[hauptintention] ^short, en, Main therapy intent)
* insert Translation(extension[hauptintention] ^definition, en, The actual treatment intent – curative\, palliative\, neoadjuvant\, adjuvant\, supportive.)

// Phase / Unter-Intention (die Sequenz)
* extension[phase] ^short = "Therapiephase / Unter-Intention"
* extension[phase] ^definition = "Sequenzielle Behandlungsphase innerhalb des Konzepts (z. B. Induktions-, Erhaltungstherapie)."
* extension[phase].value[x] only CodeableConcept
* extension[phase].valueCodeableConcept from OnkoTherapyPhaseVS (extensible)
* insert Translation(extension[phase] ^short, en, Therapy phase / sub-intent)
* insert Translation(extension[phase] ^definition, en, Sequential treatment phase within the concept – e.g. induction or maintenance therapy.)
