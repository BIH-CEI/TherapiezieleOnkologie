# Therapieziel-Dreieck (logisches Modell) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Logisches Modell: Therapieziel-Dreieck (logisches Modell) 

 
Logisches Modell der drei Kernkonzepte des Leitfadens und ihrer Beziehungen: 
* **Behandlungsepisode** — **wer** behandelt, in welchem Rahmen (Art, Intention, Zeitraum, verantwortliche Organisation),
* **Therapieziel** — **was** erreicht werden soll (Zielart, messbarer Zielwert, Erreichungsgrad),
* **Versorgungsplan** — **welche Maßnahmen** geplant sind (Tumorboard-Empfehlung bzw. Behandlungsplan mit den geplanten Anforderungen).
 
Das Ziel geht dem Plan voraus; der Plan **verfolgt** das Ziel (`verfolgtesZiel`) und ist seiner **Episode zugeordnet** (`episode`). Zwischen Ziel und Episode gibt es **keine direkte Referenz** — die Zuordnung ergibt sich implizit über den Plan (siehe schematische Darstellung). 

Die drei Kernkonzepte des Leitfadens bilden ein **Dreieck**: die **Behandlungsepisode** (**wer** behandelt, in welchem Rahmen), das **Therapieziel** (**was** erreicht werden soll) und der **Versorgungsplan** (**welche Maßnahmen** geplant sind). Der Plan verfolgt das Ziel (`CarePlan.goal`) und gehört zu seiner Episode (Extension `workflow-episodeOfCare`); Ziel und Episode sind **nur implizit über den Plan** verknüpft.

Das folgende logische Modell formuliert diese Konzepte ressourcenneutral; die Abbildung auf FHIR R4 bzw. die Profile dieses Leitfadens ([OnkoTherapyGoal](StructureDefinition-onko-therapy-goal.md), [OnkoCarePlan](StructureDefinition-onko-care-plan.md), [Behandlungsepisode](behandlungsepisode.md)) steht im Reiter „Mappings“.

**Usages:**

* This Logical Model is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.bih-cei.therapieziele-onkologie|current/StructureDefinition/StructureDefinition-TherapiezielDreieck.json)

### Formale Ansichten des Profilinhalts

 [Beschreibung von Profilen, Differentials, Snapshots und deren Repräsentationen](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Differential-Tabelle](#tabs-diff) 
*  [Snapshot-Tabelle](#tabs-snap) 
*  [Statistiken/Referenzen](#tabs-summ) 
*  [Alle](#tabs-all) 

Diese Struktur ist abgeleitet von [Base](http://build.fhir.org/types.html#Base) 

#### Constraints

Diese Struktur ist abgeleitet von [Base](http://build.fhir.org/types.html#Base) 

** Summary **

Mandatory: 0 element(15 nested mandatory elements)

 **Differential-Ansicht** 

Diese Struktur ist abgeleitet von [Base](http://build.fhir.org/types.html#Base) 

 **Snapshot-AnsichtView** 

#### Constraints

Diese Struktur ist abgeleitet von [Base](http://build.fhir.org/types.html#Base) 

** Summary **

Mandatory: 0 element(15 nested mandatory elements)

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-TherapiezielDreieck.csv), [Excel](../StructureDefinition-TherapiezielDreieck.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "TherapiezielDreieck",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/TherapiezielDreieck",
  "version" : "1.0.0-ballot",
  "name" : "TherapiezielDreieck",
  "title" : "Therapieziel-Dreieck (logisches Modell)",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Therapy-goal triangle – logical model"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "draft",
  "date" : "2026-08-03T05:20:25+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Logisches Modell der drei Kernkonzepte des Leitfadens und ihrer Beziehungen:\n\n- **Behandlungsepisode** — *wer* behandelt, in welchem Rahmen (Art, Intention,\n  Zeitraum, verantwortliche Organisation),\n- **Therapieziel** — *was* erreicht werden soll (Zielart, messbarer Zielwert,\n  Erreichungsgrad),\n- **Versorgungsplan** — *welche Maßnahmen* geplant sind (Tumorboard-Empfehlung\n  bzw. Behandlungsplan mit den geplanten Anforderungen).\n\nDas Ziel geht dem Plan voraus; der Plan **verfolgt** das Ziel (`verfolgtesZiel`)\nund ist seiner **Episode zugeordnet** (`episode`). Zwischen Ziel und Episode gibt\nes **keine direkte Referenz** — die Zuordnung ergibt sich implizit über den Plan\n(siehe schematische Darstellung).",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Logical model of the three core concepts and their relations: care episode – who treats; therapy goal – what is to be achieved; care plan – which measures are planned. The goal precedes the plan; the plan tracks the goal and is assigned to its episode. Goal and episode are linked only implicitly via the plan."
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "fhir-r4",
    "uri" : "http://hl7.org/fhir",
    "name" : "FHIR R4 / Profile dieses Leitfadens"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/TherapiezielDreieck",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "TherapiezielDreieck",
      "path" : "TherapiezielDreieck",
      "short" : "Therapieziel-Dreieck (logisches Modell)",
      "definition" : "Logisches Modell der drei Kernkonzepte des Leitfadens und ihrer Beziehungen:\n\n- **Behandlungsepisode** — *wer* behandelt, in welchem Rahmen (Art, Intention,\n  Zeitraum, verantwortliche Organisation),\n- **Therapieziel** — *was* erreicht werden soll (Zielart, messbarer Zielwert,\n  Erreichungsgrad),\n- **Versorgungsplan** — *welche Maßnahmen* geplant sind (Tumorboard-Empfehlung\n  bzw. Behandlungsplan mit den geplanten Anforderungen).\n\nDas Ziel geht dem Plan voraus; der Plan **verfolgt** das Ziel (`verfolgtesZiel`)\nund ist seiner **Episode zugeordnet** (`episode`). Zwischen Ziel und Episode gibt\nes **keine direkte Referenz** — die Zuordnung ergibt sich implizit über den Plan\n(siehe schematische Darstellung)."
    },
    {
      "id" : "TherapiezielDreieck.patient",
      "path" : "TherapiezielDreieck.patient",
      "short" : "Patientin/Patient",
      "definition" : "Person, auf die sich Episoden, Ziele und Pläne beziehen (subject aller Ressourcen).",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Reference"
      }],
      "mapping" : [{
        "identity" : "fhir-r4",
        "map" : "Patient (subject der jeweiligen Ressourcen)"
      }]
    },
    {
      "id" : "TherapiezielDreieck.behandlungsepisode",
      "path" : "TherapiezielDreieck.behandlungsepisode",
      "short" : "Behandlungsepisode — wer behandelt",
      "definition" : "Abgegrenzter Versorgungsabschnitt mit eigener Intention: Therapielinie, Diagnostiklinie, Active Surveillance, Watchful Waiting u. a.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "fhir-r4",
        "map" : "EpisodeOfCare"
      }]
    },
    {
      "id" : "TherapiezielDreieck.behandlungsepisode.art",
      "path" : "TherapiezielDreieck.behandlungsepisode.art",
      "short" : "Art der Episode",
      "definition" : "Therapielinie (systemisch), lokoregionale Behandlungslinie, Diagnostiklinie, Active Surveillance, Watchful Waiting … (offen/extensible).",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mapping" : [{
        "identity" : "fhir-r4",
        "map" : "EpisodeOfCare.type"
      }]
    },
    {
      "id" : "TherapiezielDreieck.behandlungsepisode.intention",
      "path" : "TherapiezielDreieck.behandlungsepisode.intention",
      "short" : "Intention",
      "definition" : "Zweck der Episode: kurativ, neoadjuvant, adjuvant, palliativ, supportiv; bei Diagnostik der Informationsgewinn.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mapping" : [{
        "identity" : "fhir-r4",
        "map" : "EpisodeOfCare.extension[OnkoTherapyIntentExt]"
      }]
    },
    {
      "id" : "TherapiezielDreieck.behandlungsepisode.zeitraum",
      "path" : "TherapiezielDreieck.behandlungsepisode.zeitraum",
      "short" : "Zeitraum",
      "definition" : "Beginn und Ende des Versorgungsabschnitts.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Period"
      }],
      "mapping" : [{
        "identity" : "fhir-r4",
        "map" : "EpisodeOfCare.period"
      }]
    },
    {
      "id" : "TherapiezielDreieck.behandlungsepisode.verantwortlich",
      "path" : "TherapiezielDreieck.behandlungsepisode.verantwortlich",
      "short" : "Verantwortliche Organisation",
      "definition" : "Organisation bzw. Team, das die Episode führt (z. B. Tumorzentrum, betreuende Praxis).",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Reference"
      }],
      "mapping" : [{
        "identity" : "fhir-r4",
        "map" : "EpisodeOfCare.managingOrganization, EpisodeOfCare.team"
      }]
    },
    {
      "id" : "TherapiezielDreieck.behandlungsepisode.status",
      "path" : "TherapiezielDreieck.behandlungsepisode.status",
      "short" : "Status",
      "definition" : "Lebenszyklus der Episode: geplant, aktiv, beendet.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "mapping" : [{
        "identity" : "fhir-r4",
        "map" : "EpisodeOfCare.status"
      }]
    },
    {
      "id" : "TherapiezielDreieck.therapieziel",
      "path" : "TherapiezielDreieck.therapieziel",
      "short" : "Therapieziel — was soll erreicht werden",
      "definition" : "Eigenständiges, dem Plan vorausgehendes Behandlungsziel; übergeordnet (strategische Intention) oder als Episodenziel.",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "fhir-r4",
        "map" : "Goal (OnkoTherapyGoal)"
      }]
    },
    {
      "id" : "TherapiezielDreieck.therapieziel.ebene",
      "path" : "TherapiezielDreieck.therapieziel.ebene",
      "short" : "Zielebene",
      "definition" : "uebergeordnet (genau ein aktives Ziel der Intentions-Ära) oder episodenziel (optional, einem Behandlungsabschnitt zugeordnet).",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "mapping" : [{
        "identity" : "fhir-r4",
        "map" : "implizit über den Plan-Graphen (welcher Plan das Ziel verfolgt)"
      }]
    },
    {
      "id" : "TherapiezielDreieck.therapieziel.zielart",
      "path" : "TherapiezielDreieck.therapieziel.zielart",
      "short" : "Zielart",
      "definition" : "Heilung, Lebensverlängerung, Symptomkontrolle, Lebensqualität, Funktionserhalt.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mapping" : [{
        "identity" : "fhir-r4",
        "map" : "Goal.category (OnkoTherapyGoalTypeVS)"
      }]
    },
    {
      "id" : "TherapiezielDreieck.therapieziel.beschreibung",
      "path" : "TherapiezielDreieck.therapieziel.beschreibung",
      "short" : "Zielbeschreibung",
      "definition" : "Klartext-Beschreibung des angestrebten Ziels.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "fhir-r4",
        "map" : "Goal.description"
      }]
    },
    {
      "id" : "TherapiezielDreieck.therapieziel.adressierteErkrankung",
      "path" : "TherapiezielDreieck.therapieziel.adressierteErkrankung",
      "short" : "Adressierte Erkrankung",
      "definition" : "Erkrankung, auf die sich das Ziel bezieht (Tumorerkrankung bzw. chronische Grunderkrankung).",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Reference"
      }],
      "mapping" : [{
        "identity" : "fhir-r4",
        "map" : "Goal.addresses (OnkoCondition)"
      }]
    },
    {
      "id" : "TherapiezielDreieck.therapieziel.zielwert",
      "path" : "TherapiezielDreieck.therapieziel.zielwert",
      "short" : "Zielwert",
      "definition" : "Messbarer angestrebter Zielzustand: woran gemessen wird, welcher Wert als erreicht gilt, bis wann.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "fhir-r4",
        "map" : "Goal.target"
      }]
    },
    {
      "id" : "TherapiezielDreieck.therapieziel.zielwert.zielgroesse",
      "path" : "TherapiezielDreieck.therapieziel.zielwert.zielgroesse",
      "short" : "Zielgröße",
      "definition" : "Woran die Zielerreichung gemessen wird — codiert (z. B. LOINC) oder als Text (Scores, PROMs).",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mapping" : [{
        "identity" : "fhir-r4",
        "map" : "Goal.target.measure"
      }]
    },
    {
      "id" : "TherapiezielDreieck.therapieziel.zielwert.wert[x]",
      "path" : "TherapiezielDreieck.therapieziel.zielwert.wert[x]",
      "short" : "Zielwert-Ausprägung",
      "definition" : "Welcher Wert bzw. Wertebereich als erreicht gilt.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      },
      {
        "code" : "Range"
      },
      {
        "code" : "CodeableConcept"
      },
      {
        "code" : "string"
      }],
      "mapping" : [{
        "identity" : "fhir-r4",
        "map" : "Goal.target.detail[x]"
      }]
    },
    {
      "id" : "TherapiezielDreieck.therapieziel.zielwert.frist[x]",
      "path" : "TherapiezielDreieck.therapieziel.zielwert.frist[x]",
      "short" : "Frist",
      "definition" : "Zeitpunkt bzw. Frist, bis zu der das Ziel erreicht sein soll.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      },
      {
        "code" : "Duration"
      }],
      "mapping" : [{
        "identity" : "fhir-r4",
        "map" : "Goal.target.due[x]"
      }]
    },
    {
      "id" : "TherapiezielDreieck.therapieziel.ergebnis",
      "path" : "TherapiezielDreieck.therapieziel.ergebnis",
      "short" : "Ergebnis",
      "definition" : "Verlaufs-Beobachtungen, die die Zielerreichung evidenzieren; pro Ziel eigen, leer bis zur ersten Beobachtung.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Reference"
      }],
      "mapping" : [{
        "identity" : "fhir-r4",
        "map" : "Goal.outcomeReference (Observation)"
      }]
    },
    {
      "id" : "TherapiezielDreieck.therapieziel.lebenszyklusStatus",
      "path" : "TherapiezielDreieck.therapieziel.lebenszyklusStatus",
      "short" : "Lebenszyklus-Status",
      "definition" : "Warum bzw. ob die Zielverfolgung läuft oder endet: proposed, active, completed (nur bei Erfolg), cancelled …",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "mapping" : [{
        "identity" : "fhir-r4",
        "map" : "Goal.lifecycleStatus"
      }]
    },
    {
      "id" : "TherapiezielDreieck.therapieziel.erreichungsgrad",
      "path" : "TherapiezielDreieck.therapieziel.erreichungsgrad",
      "short" : "Erreichungsgrad",
      "definition" : "in-progress, achieved, not-achieved, not-attainable (keine Trajektorie-Codes).",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mapping" : [{
        "identity" : "fhir-r4",
        "map" : "Goal.achievementStatus"
      }]
    },
    {
      "id" : "TherapiezielDreieck.therapieziel.beziehung",
      "path" : "TherapiezielDreieck.therapieziel.beziehung",
      "short" : "Zielbeziehung",
      "definition" : "Beziehung zu anderen Zielen der Behandlungs-Journey.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "fhir-r4",
        "map" : "Goal.extension[goal-relationship]"
      }]
    },
    {
      "id" : "TherapiezielDreieck.therapieziel.beziehung.art",
      "path" : "TherapiezielDreieck.therapieziel.beziehung.art",
      "short" : "Beziehungsart",
      "definition" : "predecessor/successor (zeitliche Journey nach erfolgreichem Abschluss) oder replacement (Intentions-Pivot).",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "TherapiezielDreieck.therapieziel.beziehung.ziel",
      "path" : "TherapiezielDreieck.therapieziel.beziehung.ziel",
      "short" : "Bezogenes Ziel",
      "definition" : "Das in Beziehung stehende Therapieziel.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Reference"
      }]
    },
    {
      "id" : "TherapiezielDreieck.versorgungsplan",
      "path" : "TherapiezielDreieck.versorgungsplan",
      "short" : "Versorgungsplan — was ist geplant",
      "definition" : "Empfehlungsliste des Tumorboards oder episodenspezifischer Plan tatsächlich erbrachter Versorgung.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "fhir-r4",
        "map" : "CarePlan (OnkoCarePlan)"
      }]
    },
    {
      "id" : "TherapiezielDreieck.versorgungsplan.planart",
      "path" : "TherapiezielDreieck.versorgungsplan.planart",
      "short" : "Planart",
      "definition" : "empfehlung (Tumorboard-Empfehlungsliste) oder behandlung (episodenspezifischer Behandlungsplan).",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "mapping" : [{
        "identity" : "fhir-r4",
        "map" : "CarePlan.intent (proposal/plan = Empfehlung, plan/order = Behandlung)"
      }]
    },
    {
      "id" : "TherapiezielDreieck.versorgungsplan.verfolgtesZiel",
      "path" : "TherapiezielDreieck.versorgungsplan.verfolgtesZiel",
      "short" : "Verfolgtes Ziel",
      "definition" : "Therapieziel(e), die der Plan verfolgt — Verfolgungs-Referenz, kein Besitz; dasselbe Ziel kann von mehreren Plänen verfolgt werden.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Reference"
      }],
      "mapping" : [{
        "identity" : "fhir-r4",
        "map" : "CarePlan.goal"
      }]
    },
    {
      "id" : "TherapiezielDreieck.versorgungsplan.episode",
      "path" : "TherapiezielDreieck.versorgungsplan.episode",
      "short" : "Behandlungsepisode",
      "definition" : "Episode, in deren Rahmen der Plan umgesetzt wird.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Reference"
      }],
      "mapping" : [{
        "identity" : "fhir-r4",
        "map" : "CarePlan.extension[workflow-episodeOfCare]"
      }]
    },
    {
      "id" : "TherapiezielDreieck.versorgungsplan.basiertAuf",
      "path" : "TherapiezielDreieck.versorgungsplan.basiertAuf",
      "short" : "Basiert auf",
      "definition" : "Ein Behandlungsplan erfüllt eine Empfehlung (Referenz auf den Empfehlungsplan).",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Reference"
      }],
      "mapping" : [{
        "identity" : "fhir-r4",
        "map" : "CarePlan.basedOn"
      }]
    },
    {
      "id" : "TherapiezielDreieck.versorgungsplan.massnahme",
      "path" : "TherapiezielDreieck.versorgungsplan.massnahme",
      "short" : "Geplante Maßnahme",
      "definition" : "Einzelne geplante bzw. empfohlene Maßnahme des Plans.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mapping" : [{
        "identity" : "fhir-r4",
        "map" : "CarePlan.activity.reference"
      }]
    },
    {
      "id" : "TherapiezielDreieck.versorgungsplan.massnahme.typ",
      "path" : "TherapiezielDreieck.versorgungsplan.massnahme.typ",
      "short" : "Maßnahmentyp",
      "definition" : "prozedur (Operation, Bestrahlung, Diagnostik) oder medikation (Systemtherapie).",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "TherapiezielDreieck.versorgungsplan.massnahme.anforderung",
      "path" : "TherapiezielDreieck.versorgungsplan.massnahme.anforderung",
      "short" : "Anforderung",
      "definition" : "Die zugehörige Anforderung (Prozedur- bzw. Medikations-Request).",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Reference"
      }],
      "mapping" : [{
        "identity" : "fhir-r4",
        "map" : "ServiceRequest (TumorboardServiceRequest), MedicationRequest (TumorboardMedicationRequest)"
      }]
    }]
  }
}

```
