// =====================================================================
// ConceptMap: Semantische Annotation der Zielarten (OnkoTherapyGoalType)
// mit SNOMED-CT-Zielzustands-Konzepten.
//
// WICHTIG — Achsentrennung: Die Zielart (Goal.category) beschreibt den
// angestrebten ZIELZUSTAND aus Patientensicht; die Therapieintention
// (OnkoTherapyIntentVS, SNOMED 362961001 |Procedure by intent|)
// beschreibt den MODUS des Behandelns. Deshalb zeigt dieses Mapping
// bewusst NICHT auf die Intent-Qualifier, sondern auf Zustands-/
// Finding-Konzepte — sonst kollabieren die beiden Achsen.
//
// Codes recherchiert und validiert gegen Snowstorm (SNOMED CT
// International, lokale Instanz) am 2026-07-31.
// MapQual: Einzelvalidierung (D12 = 2, AI-recherchiert, fachliche
// Review ausstehend); Ø-Äquivalenz siehe Kommentare je Konzept.
// =====================================================================

Instance: ConceptMapOnkoTherapyGoalTypeSct
InstanceOf: ConceptMap
Title: "Zielarten → SNOMED CT (Zielzustände)"
Description: "Semantische Annotation der onkologischen Zielarten (`OnkoTherapyGoalType`) mit SNOMED-CT-Konzepten des jeweils angestrebten Zielzustands. Die Beziehungsqualität (`equivalence`) dokumentiert ehrlich, wo SNOMED nur verwandte Konzepte (Messgröße, Regime) oder gar kein Konzept anbietet."
Usage: #definition

* status = #draft
* experimental = true
* sourceCanonical = "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-therapy-goal-type"
* targetCanonical = "http://snomed.info/sct?fhir_vs"

* group[+]
  * source = "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-goal-type"
  * target = "http://snomed.info/sct"

  * element[+]
    * code = #heilung
    * display = "Heilung"
    * target[+]
      * code = #371001000
      * display = "Patient cured"
      * equivalence = #equivalent
      * comment = "Zielzustand exakt abgebildet (Finding). Alternative Zustandscodes für Zwischenziele: 103338009 |In full remission|, 103337004 |In partial remission|."

  * element[+]
    * code = #lebensverlaengerung
    * display = "Lebensverlängerung"
    * target[+]
      * code = #445320007
      * display = "Survival time"
      * equivalence = #relatedto
      * comment = "SNOMED kennt keinen Zielzustand 'verlängertes Leben'; annotiert ist die Messgröße (Observable). Verwandt: 445397003 |Duration of recurrence-free survival|."

  * element[+]
    * code = #symptomkontrolle
    * display = "Symptomkontrolle / Palliation"
    * target[+]
      * code = #1149243003
      * display = "Managing to control symptoms"
      * equivalence = #relatedto
      * comment = "Finding aus dem Selbstmanagement-Kontext; nächstliegender Zustandscode."
    * target[+]
      * code = #225353007
      * display = "Symptom control"
      * equivalence = #relatedto
      * comment = "Regime/Therapy — das Mittel, nicht der Zielzustand."

  * element[+]
    * code = #lebensqualitaet
    * display = "Lebensqualität"
    * target[+]
      * code = #1156447008
      * display = "Good quality of life"
      * equivalence = #equivalent
      * comment = "Zielzustand als Finding. Messgröße dazu: 405152002 |Quality of life satisfaction (observable entity)| — Erfassung per PROM oder Interview, siehe Zielwerte-Seite."

  * element[+]
    * code = #funktionserhalt
    * display = "Funktionserhalt"
    * target[+]
      * equivalence = #unmatched
      * comment = "Kein generisches SNOMED-Konzept 'Funktionserhalt als Zielzustand'. Die konkrete Funktion wird je Ziel über target.measure benannt (z. B. 284773001 |Ability to perform personal care activity|, Fertilität via 389093003 |Fertility care|); ein Sammel-Mapping wäre irreführend."
