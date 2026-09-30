# Das Therapieziel-Dreieck - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Das Therapieziel-Dreieck

 
This page includes translations from the original source language in which the guide was authored. Information on these translations and instructions on how to provide feedback on the translations can be found [here](translationinfo.md). 

The three core concepts of this guide form a **triangle**: the **care episode** (**who** treats, in which setting), the **therapy goal** (**what** is to be achieved) and the **care plan** (**which measures** are planned). The plan **pursues** the goal (`CarePlan.goal` — pursuit, not ownership) and **belongs to** its episode (standard extension `workflow-episodeOfCare`); goal and episode are linked **only implicitly via the plan**. At the centre stands the patient as the shared `subject` of all three.

### Formalised as a logical model

The triangle is formalised as the resource-neutral **logical model** [TherapiezielDreieck](StructureDefinition-TherapiezielDreieck.md) — the three concepts as a structure tree, with the **"Mappings"** tab showing how each element maps to FHIR R4 and the profiles of this guide.

### Deep dives per corner

* **Goal:** [Therapy goals](therapieziele.md) and [Targets & measures](goal-target-measure.md)
* **Plan:** [Recommendation and treatment plan](empfehlung-behandlung.md)
* **Episode:** [Care episodes](behandlungsepisode.md)

