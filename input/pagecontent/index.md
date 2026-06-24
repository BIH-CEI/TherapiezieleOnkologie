### Therapieziele Onkologie

Dieser Implementierungsleitfaden definiert FHIR-Profile zur Dokumentation **onkologischer Therapieziele** — also der Ziele, die Patient:innen und behandelndes Team gemeinsam festlegen, wenn ein Tumortherapieplan aufgestellt wird (z. B. kurative Intention, Lebensverlängerung, Symptomkontrolle, Lebensqualität).

Er entsteht im Rahmen der BIH-CEI / Gematik-Onkologie-Kooperation und wird auf Deutsch mit englischer Übersetzung veröffentlicht.

#### Erste Profile

<img src="profile-overview.png" alt="Profil-Übersicht" style="display:block; width:100%; max-width:820px; height:auto; margin:1em auto;"/>

Der initiale Profilsatz folgt der im [Analysebericht](analysebericht.html) festgelegten Vier-Schichten-Architektur und bildet den **CarePlan-/Goal-Fallback-Pfad** ab:

- **[OnkoCarePlan](StructureDefinition-onko-care-plan.html)** — onkologischer Versorgungsplan mit Therapieintention, adressierter Tumorerkrankung und Bezug zu Therapielinien.
- **[OnkoTherapyLine](StructureDefinition-onko-therapy-line.html)** — Therapielinie (EnLiST-konform) als Behandlungsabschnitt mit eigener Intention.
- **[OnkoTherapyGoal](StructureDefinition-onko-therapy-goal.html)** — strukturiertes Therapieziel mit codierter Zielart (Heilung, Lebensverlängerung, Symptomkontrolle, Lebensqualität).
- **[OnkoTherapyIntent](StructureDefinition-onko-therapy-intent.html)** — Extension für die Therapieintention (kurativ, neoadjuvant, adjuvant, Erhaltung, palliativ, supportiv).

Begleitende Terminologien: [OnkoTherapyGoalType](CodeSystem-onko-therapy-goal-type.html) und [OnkoTherapyIntent](CodeSystem-onko-therapy-intent.html).

Der CPG-on-FHIR-Primärpfad (`PlanDefinition`, `ActivityDefinition`, `Library`) und die MII-KDS-Anbindung folgen in späteren Iterationen.
