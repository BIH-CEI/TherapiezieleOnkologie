# Onkologische Therapieintention (Extension) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Extension: Onkologische Therapieintention (Extension) 

Strukturierte Codierung der Therapieintention über zwei Achsen:

* `hauptintention` (Pflicht): die eigentliche Behandlungsintention (kurativ, palliativ, neoadjuvant, adjuvant, supportiv) – SNOMED `Procedure by intent`.
* `phase` (optional, wiederholbar): die sequenzielle Behandlungsphase / Unter-Intention (Induktionstherapie, Erhaltungstherapie) – ergänzend zur Hauptintention.

So lässt sich z. B. „kurativ + Induktionsphase" gleichzeitig ausdrücken. Verwendet in OnkoCarePlan, OnkoTherapyGoal und OnkoTherapyLine. Konzeptionell anschlussfähig an mCODE `procedure-intent`.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Onkologischer CarePlan](StructureDefinition-onko-care-plan.md), [Onkologisches Therapieziel](StructureDefinition-onko-therapy-goal.md) and [Onkologische Therapielinie](StructureDefinition-onko-therapy-line.md)
* Examples for this Extension: [Bundle/BundleCRCPalliativ](Bundle-BundleCRCPalliativ.md), [Bundle/BundleMammaNeoadjuvant](Bundle-BundleMammaNeoadjuvant.md), [CarePlan/CarePlanCRCPalliativ](CarePlan-CarePlanCRCPalliativ.md), [EpisodeOfCare/TherapielinieCRCErstlinie](EpisodeOfCare-TherapielinieCRCErstlinie.md)... Show 7 more, [EpisodeOfCare/TherapielinieChemo](EpisodeOfCare-TherapielinieChemo.md), [EpisodeOfCare/TherapielinieOperation](EpisodeOfCare-TherapielinieOperation.md), [EpisodeOfCare/TherapieliniePembroAdjuvant](EpisodeOfCare-TherapieliniePembroAdjuvant.md), [Goal/TherapiezielCRCErhaltung](Goal-TherapiezielCRCErhaltung.md), [Goal/TherapiezielCRCKurativAbgelehnt](Goal-TherapiezielCRCKurativAbgelehnt.md), [Goal/TherapiezielCRCLebensverlaengerung](Goal-TherapiezielCRCLebensverlaengerung.md) and [Goal/TherapiezielMammaHeilung](Goal-TherapiezielMammaHeilung.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.bih-cei.therapieziele-onkologie|current/StructureDefinition/StructureDefinition-onko-therapy-intent.json)

### Formale Ansichten des Extension-Inhalts

 [Beschreibung von Profilen, Differentials, Snapshots und deren Repräsentationen](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Differential-Tabelle](#tabs-diff) 
*  [Snapshot-Tabelle](#tabs-snap) 
*  [Statistiken/Referenzen](#tabs-summ) 
*  [Alle](#tabs-all) 

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

#### Terminology Bindings (Differential)

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

** Summary **

Complex Extension: Strukturierte Codierung der Therapieintention über zwei Achsen: 
* `hauptintention` (Pflicht): die eigentliche Behandlungsintention (kurativ, palliativ, neoadjuvant, adjuvant, supportiv) – SNOMED `Procedure by intent`.
* `phase` (optional, wiederholbar): die sequenzielle Behandlungsphase / Unter-Intention (Induktionstherapie, Erhaltungstherapie) – ergänzend zur Hauptintention.
 So lässt sich z. B. „kurativ + Induktionsphase" gleichzeitig ausdrücken. Verwendet in OnkoCarePlan, OnkoTherapyGoal und OnkoTherapyLine. Konzeptionell anschlussfähig an mCODE `procedure-intent`.

 **Differential-AnsichtDifferential View** 

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

#### Terminology Bindings (Differential)

 **Snapshot-Ansicht** 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

** Summary **

Complex Extension: Strukturierte Codierung der Therapieintention über zwei Achsen: 
* `hauptintention` (Pflicht): die eigentliche Behandlungsintention (kurativ, palliativ, neoadjuvant, adjuvant, supportiv) – SNOMED `Procedure by intent`.
* `phase` (optional, wiederholbar): die sequenzielle Behandlungsphase / Unter-Intention (Induktionstherapie, Erhaltungstherapie) – ergänzend zur Hauptintention.
 So lässt sich z. B. „kurativ + Induktionsphase" gleichzeitig ausdrücken. Verwendet in OnkoCarePlan, OnkoTherapyGoal und OnkoTherapyLine. Konzeptionell anschlussfähig an mCODE `procedure-intent`.

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-onko-therapy-intent.csv), [Excel](../StructureDefinition-onko-therapy-intent.xlsx), [Schematron](../StructureDefinition-onko-therapy-intent.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "onko-therapy-intent",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent",
  "version" : "1.0.0-ballot",
  "name" : "OnkoTherapyIntentExt",
  "title" : "Onkologische Therapieintention (Extension)",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Oncological therapy intent extension"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "draft",
  "date" : "2026-07-31T12:16:37+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Strukturierte Codierung der Therapieintention über zwei Achsen:\n\n- `hauptintention` (Pflicht): die eigentliche Behandlungsintention (kurativ, palliativ,\n  neoadjuvant, adjuvant, supportiv) – SNOMED `Procedure by intent`.\n- `phase` (optional, wiederholbar): die sequenzielle Behandlungsphase / Unter-Intention\n  (Induktionstherapie, Erhaltungstherapie) – ergänzend zur Hauptintention.\n\nSo lässt sich z. B. „kurativ + Induktionsphase\" gleichzeitig ausdrücken. Verwendet in\nOnkoCarePlan, OnkoTherapyGoal und OnkoTherapyLine. Konzeptionell anschlussfähig an mCODE\n`procedure-intent`.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Structured coding of the therapy intent on two axes: hauptintention – the actual treatment intent such as curative, palliative, neoadjuvant, adjuvant, supportive – and phase – the sequential treatment phase such as induction or maintenance therapy. This allows expressing e.g. curative plus induction phase at the same time."
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
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "CarePlan"
  },
  {
    "type" : "element",
    "expression" : "Goal"
  },
  {
    "type" : "element",
    "expression" : "EpisodeOfCare"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Onkologische Therapieintention (Extension)",
      "definition" : "Strukturierte Codierung der Therapieintention über zwei Achsen:\n\n- `hauptintention` (Pflicht): die eigentliche Behandlungsintention (kurativ, palliativ,\n  neoadjuvant, adjuvant, supportiv) – SNOMED `Procedure by intent`.\n- `phase` (optional, wiederholbar): die sequenzielle Behandlungsphase / Unter-Intention\n  (Induktionstherapie, Erhaltungstherapie) – ergänzend zur Hauptintention.\n\nSo lässt sich z. B. „kurativ + Induktionsphase\" gleichzeitig ausdrücken. Verwendet in\nOnkoCarePlan, OnkoTherapyGoal und OnkoTherapyLine. Konzeptionell anschlussfähig an mCODE\n`procedure-intent`."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "min" : 1
    },
    {
      "id" : "Extension.extension:hauptintention",
      "path" : "Extension.extension",
      "sliceName" : "hauptintention",
      "short" : "Haupt-Therapieintention",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Main therapy intent"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Die eigentliche Behandlungsintention (kurativ, palliativ, neoadjuvant, adjuvant, supportiv).",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "The actual treatment intent – curative, palliative, neoadjuvant, adjuvant, supportive."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Extension.extension:hauptintention.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:hauptintention.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "hauptintention"
    },
    {
      "id" : "Extension.extension:hauptintention.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-therapy-intent"
      }
    },
    {
      "id" : "Extension.extension:phase",
      "path" : "Extension.extension",
      "sliceName" : "phase",
      "short" : "Therapiephase / Unter-Intention",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Therapy phase / sub-intent"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Sequenzielle Behandlungsphase innerhalb des Konzepts (z. B. Induktions-, Erhaltungstherapie).",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Sequential treatment phase within the concept – e.g. induction or maintenance therapy."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "*",
      "mustSupport" : true
    },
    {
      "id" : "Extension.extension:phase.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:phase.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "phase"
    },
    {
      "id" : "Extension.extension:phase.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/onko-therapy-phase"
      }
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "max" : "0"
    }]
  }
}

```
