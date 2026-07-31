Profile: OnkoTherapyGoal
Parent: Goal
Id: onko-therapy-goal
Title: "Onkologisches Therapieziel"
Description: """
Strukturiertes onkologisches Therapieziel auf Basis von `Goal`.

Das Profil ist an den **HL7 FHIR US Multiple Chronic Conditions (MCC) eCare Plan**
([MCCGoal](https://build.fhir.org/ig/HL7/fhir-us-mcc/StructureDefinition-MCCGoal.html))
angelehnt: Das Therapieziel ist eine eigenständige, referenzbasierte Ressource, die über
`addresses` mit den adressierten Erkrankungen und über `outcomeReference` mit beobachteten
Ergebnissen (Verlaufs-Observations) verknüpft wird.

Onkologiespezifische Ergänzungen gegenüber MCC:
- Die Zielart wird über `category` aus `OnkoTherapyGoalTypeVS` codiert (Heilung,
  Lebensverlängerung, Symptomkontrolle, Lebensqualität, Funktionserhalt).
- Über die Extension `onko-therapy-intent` kann zusätzlich die Therapieintention der
  zugehörigen Behandlungslinie hinterlegt werden.
- `outcomeReference` bindet das Ziel an Verlaufs-Observations (z. B. mCODE
  CancerDiseaseStatus / Response Assessment), wodurch das Tumoransprechen auf das Ziel
  bezogen ausgewertet werden kann.

`achievementStatus` bildet — analog MCC — den Erreichungsgrad bzw. die Zielakzeptanz ab
(z. B. erreicht, in Bearbeitung, nicht erreicht).
"""
* insert Translation(^title, en, Oncological therapy goal)
* insert Translation(^description, en, Structured oncological therapy goal based on Goal\, aligned with the HL7 FHIR US MCC eCare Plan MCCGoal. The goal is a standalone reference-based resource linked to the addressed condition via addresses and to progress observations via outcomeReference.)

// Therapieintention (onkologiespezifisch) sowie die von MCCGoal als Must-Support
// gesetzten Standard-FHIR-Extensions (goal-acceptance, goal-reasonRejected, goal-relationship)
* extension contains
    OnkoTherapyIntentExt named therapyIntent 0..1 and
    http://hl7.org/fhir/StructureDefinition/goal-acceptance named acceptance 0..* MS and
    http://hl7.org/fhir/StructureDefinition/goal-reasonRejected named reasonRejected 0..1 MS and
    http://hl7.org/fhir/StructureDefinition/goal-relationship named relatedGoal 0..* MS
* insert Label(extension[therapyIntent], Therapieintention, Strukturierte Therapieintention – Hauptintention und optionale Behandlungsphase.)
* insert Translation(extension[therapyIntent] ^short, en, Therapy intent)
* insert Translation(extension[therapyIntent] ^definition, en, Structured therapy intent – main intent and optional treatment phase.)
* insert Label(extension[acceptance], Zielakzeptanz, Akzeptanz und relative Priorität des Ziels durch Patient und Behandler – MCC goal-acceptance.)
* insert Translation(extension[acceptance] ^short, en, Goal acceptance)
* insert Translation(extension[acceptance] ^definition, en, Acceptance and relative priority of the goal by patient and practitioners – MCC goal-acceptance.)
* insert Label(extension[reasonRejected], Ablehnungsgrund, Begründung\, warum das Ziel nicht akzeptiert bzw. abgelehnt wurde.)
* insert Translation(extension[reasonRejected] ^short, en, Reason rejected)
* insert Translation(extension[reasonRejected] ^definition, en, Reason why the goal was not accepted or was rejected.)
* insert Label(extension[relatedGoal], Zielbeziehung, Beziehung zu anderen Zielen – predecessor\, successor\, replacement\, milestone.)
* insert Translation(extension[relatedGoal] ^short, en, Goal relationship)
* insert Translation(extension[relatedGoal] ^definition, en, Relationship to other goals – predecessor\, successor\, replacement\, milestone.)

// Lebenszyklus und Erreichungsgrad
* lifecycleStatus 1..1 MS
* insert Label(lifecycleStatus, Lebenszyklus-Status, Status des Ziels im Lebenszyklus\, z. B. proposed\, active\, completed\, rejected.)
* insert Translation(lifecycleStatus ^short, en, Lifecycle status)
* insert Translation(lifecycleStatus ^definition, en, State of the goal within its lifecycle\, e.g. proposed\, active\, completed\, rejected.)
* achievementStatus MS
* insert Label(achievementStatus, Erreichungsgrad, Grad der Zielerreichung\, z. B. erreicht\, in Bearbeitung\, nicht erreicht.)
* insert Translation(achievementStatus ^short, en, Achievement status)
* insert Translation(achievementStatus ^definition, en, Degree of goal achievement\, e.g. achieved\, in progress\, not achieved.)

// Zielart (onkologiespezifische ValueSet-Bindung)
* category 1..*
* category from OnkoTherapyGoalTypeVS (extensible)
* insert Label(category, Zielart, Art des onkologischen Therapieziels – Heilung\, Lebensverlängerung\, Symptomkontrolle\, Lebensqualität\, Funktionserhalt.)
* insert Translation(category ^short, en, Goal category)
* insert Translation(category ^definition, en, Type of oncological therapy goal – cure\, life prolongation\, symptom control\, quality of life\, preservation of function.)

// Priorisierung konkurrierender Ziele
* priority MS
* insert Label(priority, Priorität, Relative Priorität des Ziels bei mehreren konkurrierenden Zielen.)
* insert Translation(priority ^short, en, Priority)
* insert Translation(priority ^definition, en, Relative priority of the goal among several competing goals.)

// Klartext-Beschreibung des Ziels
* description 1..1 MS
* insert Label(description, Zielbeschreibung, Klartext-Beschreibung des angestrebten Ziels.)
* insert Translation(description ^short, en, Goal description)
* insert Translation(description ^definition, en, Human-readable description of the intended goal.)

// Patientenbezug
* subject 1..1 MS
* subject only Reference(Patient)
* insert Label(subject, Patientin/Patient, Person\, für die das Therapieziel gilt.)
* insert Translation(subject ^short, en, Patient)
* insert Translation(subject ^definition, en, The person the therapy goal applies to.)

// Zeitbezug: Beginn (beide Typen Must-Support) und messbare Zielwerte
* start[x] MS
* startDate MS
* startCodeableConcept MS
* insert Label(start[x], Zielbeginn, Beginn des angestrebten Ziels als Datum oder codiertes Ereignis.)
* insert Translation(start[x] ^short, en, Goal start)
* insert Translation(start[x] ^definition, en, Start of the goal as a date or a coded event.)
* insert Label(startDate, Zielbeginn als Datum, Beginn des Ziels als Datum.)
* insert Translation(startDate ^short, en, Goal start as date)
* insert Translation(startDate ^definition, en, Start of the goal expressed as a date.)
* insert Label(startCodeableConcept, Zielbeginn als Code, Beginn des Ziels als codiertes Ereignis.)
* insert Translation(startCodeableConcept ^short, en, Goal start as code)
* insert Translation(startCodeableConcept ^definition, en, Start of the goal expressed as a coded event.)
* target MS
* insert Label(target, Zielwert, Angestrebter messbarer Zielzustand.)
* insert Translation(target ^short, en, Target)
* insert Translation(target ^definition, en, Intended measurable target state.)
* target.measure MS
* insert Label(target.measure, Zielparameter, Parameter bzw. Messgröße\, an der die Zielerreichung gemessen wird.)
* insert Translation(target.measure ^short, en, Target measure)
* insert Translation(target.measure ^definition, en, Parameter or measure used to assess goal attainment.)
* target.detail[x] MS
* insert Label(target.detail[x], Zielwert-Ausprägung, Angestrebter Wert bzw. Wertebereich des Zielparameters.)
* insert Translation(target.detail[x] ^short, en, Target detail)
* insert Translation(target.detail[x] ^definition, en, Intended value or range of the target measure.)
* target.due[x] MS
* insert Label(target.due[x], Zieltermin, Zeitpunkt bzw. Frist\, bis zu der das Ziel erreicht werden soll.)
* insert Translation(target.due[x] ^short, en, Target due)
* insert Translation(target.due[x] ^definition, en, Point in time or deadline by which the goal should be met.)

// Adressierte Tumorerkrankung
* addresses MS
* addresses only Reference(Condition)
// Bindung an OnkoCondition via targetProfile (s. Hinweis in OnkoCarePlan)
* addresses ^type.targetProfile = Canonical(OnkoCondition)
* insert Label(addresses, Adressierte Erkrankung, Referenz auf die adressierte Tumorerkrankung OnkoCondition.)
* insert Translation(addresses ^short, en, Addressed condition)
* insert Translation(addresses ^definition, en, Reference to the addressed tumor condition OnkoCondition.)

// Verfasser des Ziels (Behandler bzw. Patient)
* expressedBy MS
* insert Label(expressedBy, Verfasser, Person\, die das Ziel formuliert hat – Behandler oder Patient.)
* insert Translation(expressedBy ^short, en, Expressed by)
* insert Translation(expressedBy ^definition, en, Person who expressed the goal – practitioner or patient.)

// Ergebnisse / Tumoransprechen
* outcomeCode
* insert Label(outcomeCode, Ergebnis-Code, Codiertes Ergebnis der Zielverfolgung.)
* insert Translation(outcomeCode ^short, en, Outcome code)
* insert Translation(outcomeCode ^definition, en, Coded outcome of pursuing the goal.)
* outcomeReference MS
* outcomeReference only Reference(Observation)
* insert Label(outcomeReference, Ergebnis-Referenz, Referenz auf Verlaufs-Observations\, die das Tumoransprechen dokumentieren.)
* insert Translation(outcomeReference ^short, en, Outcome reference)
* insert Translation(outcomeReference ^definition, en, Reference to progress observations documenting tumor response.)

// Begleitende Hinweise
* note
* insert Label(note, Hinweis, Ergänzende Anmerkungen zum Ziel.)
* insert Translation(note ^short, en, Note)
* insert Translation(note ^definition, en, Additional comments on the goal.)
