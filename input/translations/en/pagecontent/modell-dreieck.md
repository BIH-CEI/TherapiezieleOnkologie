The three core concepts of this guide form a **triangle**: the **care episode**
(*who* treats, in which setting), the **therapy goal** (*what* is to be
achieved) and the **care plan** (*which measures* are planned). The plan
**pursues** the goal (`CarePlan.goal` — pursuit, not ownership) and **belongs
to** its episode (standard extension `workflow-episodeOfCare`); goal and
episode are linked **only implicitly via the plan**. At the centre stands the
patient as the shared `subject` of all three.

{% include therapieziel-dreieck.svg %}

### Formalised as a logical model

The triangle is formalised as the resource-neutral **logical model**
[TherapiezielDreieck](StructureDefinition-TherapiezielDreieck.html) — the three
concepts as a structure tree, with the **"Mappings"** tab showing how each
element maps to FHIR R4 and the profiles of this guide.

### Deep dives per corner

- **Goal:** [Therapy goals](therapieziele.html) and
  [Targets & measures](goal-target-measure.html)
- **Plan:** [Recommendation and treatment plan](empfehlung-behandlung.html)
- **Episode:** [Care episodes](behandlungsepisode.html)
