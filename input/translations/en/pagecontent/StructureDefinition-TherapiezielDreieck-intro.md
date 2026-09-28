The three core concepts of this guide form a **triangle**: the **care episode**
(*who* treats, in which setting), the **therapy goal** (*what* is to be achieved)
and the **care plan** (*which measures* are planned). The plan pursues the goal
(`CarePlan.goal`) and belongs to its episode (extension `workflow-episodeOfCare`);
goal and episode are linked **only implicitly through the plan**.

{% include therapieziel-dreieck-en.svg %}

The logical model below states these concepts independently of any resource; the
mapping onto FHIR R4 and onto the profiles of this guide
([OnkoTherapyGoal](StructureDefinition-onko-therapy-goal.html),
[OnkoCarePlan](StructureDefinition-onko-care-plan.html),
[care episode](behandlungsepisode.html)) is given in the “Mappings” tab.
