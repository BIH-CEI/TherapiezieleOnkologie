Die drei Kernkonzepte des Leitfadens bilden ein **Dreieck**: die
**Behandlungsepisode** (*wer* behandelt, in welchem Rahmen), das **Therapieziel**
(*was* erreicht werden soll) und der **Versorgungsplan** (*welche Maßnahmen*
geplant sind). Der Plan verfolgt das Ziel (`CarePlan.goal`) und gehört zu seiner
Episode (Extension `workflow-episodeOfCare`); Ziel und Episode sind **nur
implizit über den Plan** verknüpft.

{% include therapieziel-dreieck.svg %}

Das folgende logische Modell formuliert diese Konzepte ressourcenneutral; die
Abbildung auf FHIR R4 bzw. die Profile dieses Leitfadens
([OnkoTherapyGoal](StructureDefinition-onko-therapy-goal.html),
[OnkoCarePlan](StructureDefinition-onko-care-plan.html),
[Behandlungsepisode](behandlungsepisode.html)) steht im Reiter „Mappings“.
