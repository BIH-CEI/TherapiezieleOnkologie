# EnLiST-Linien-Segment (Extension) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.2

## Extension: EnLiST-Linien-Segment (Extension) 

Markiert einen **ausführenden Behandlungsabschnitt** (Episode einer ausführenden Einrichtung bzw. eine Therapie-`Procedure`) als Segment einer geführten Line of Therapy. Trägt **keine eigene Designation**, sondern nur die gemeinsame `lineId` der Linie (siehe `enlist-lot.lineId` an der führenden Episode). So bleibt jede ausführende Instanz autonom dokumentationsfähig, ohne die LoT-Zählung zu duplizieren — Auswerter zählen ausschließlich Träger von `enlist-lot`.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Onkologische Therapielinie](StructureDefinition-onko-therapy-line.md)
* Examples for this Extension: [EpisodeOfCare/TherapieliniePembroAdjuvant](EpisodeOfCare-TherapieliniePembroAdjuvant.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.bih-cei.therapieziele-onkologie|current/StructureDefinition/StructureDefinition-enlist-line-segment.json)

### Formale Ansichten des Extension-Inhalts

 [Beschreibung von Profilen, Differentials, Snapshots und deren Repräsentationen](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Differential-Tabelle](#tabs-diff) 
*  [Snapshot-Tabelle](#tabs-snap) 
*  [Statistiken/Referenzen](#tabs-summ) 
*  [Alle](#tabs-all) 

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

#### Constraints

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

** Summary **

Simple Extension with the type Identifier: Markiert einen **ausführenden Behandlungsabschnitt** (Episode einer ausführenden Einrichtung bzw. eine Therapie-`Procedure`) als Segment einer geführten Line of Therapy. Trägt **keine eigene Designation**, sondern nur die gemeinsame `lineId` der Linie (siehe `enlist-lot.lineId` an der führenden Episode). So bleibt jede ausführende Instanz autonom dokumentationsfähig, ohne die LoT-Zählung zu duplizieren — Auswerter zählen ausschließlich Träger von `enlist-lot`.

 **Differential-AnsichtDifferential View** 

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

 **Snapshot-Ansicht** 

#### Constraints

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

** Summary **

Simple Extension with the type Identifier: Markiert einen **ausführenden Behandlungsabschnitt** (Episode einer ausführenden Einrichtung bzw. eine Therapie-`Procedure`) als Segment einer geführten Line of Therapy. Trägt **keine eigene Designation**, sondern nur die gemeinsame `lineId` der Linie (siehe `enlist-lot.lineId` an der führenden Episode). So bleibt jede ausführende Instanz autonom dokumentationsfähig, ohne die LoT-Zählung zu duplizieren — Auswerter zählen ausschließlich Träger von `enlist-lot`.

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-enlist-line-segment.csv), [Excel](../StructureDefinition-enlist-line-segment.xlsx), [Schematron](../StructureDefinition-enlist-line-segment.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "enlist-line-segment",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-line-segment",
  "version" : "1.0.0-ballot-rc.2",
  "name" : "EnlistLineSegmentExt",
  "title" : "EnLiST-Linien-Segment (Extension)",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "EnLiST line segment extension"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "draft",
  "date" : "2026-07-31T14:32:24+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Markiert einen **ausführenden Behandlungsabschnitt** (Episode einer ausführenden\nEinrichtung bzw. eine Therapie-`Procedure`) als Segment einer geführten Line of\nTherapy. Trägt **keine eigene Designation**, sondern nur die gemeinsame\n`lineId` der Linie (siehe `enlist-lot.lineId` an der führenden Episode).\nSo bleibt jede ausführende Instanz autonom dokumentationsfähig, ohne die\nLoT-Zählung zu duplizieren — Auswerter zählen ausschließlich Träger von\n`enlist-lot`.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Marks an executing treatment segment — an episode of an executing organisation or a therapy procedure — as part of a led line of therapy. Carries no designation of its own, only the shared lineId; evaluators count enlist-lot carriers only."
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
    "expression" : "EpisodeOfCare"
  },
  {
    "type" : "element",
    "expression" : "Procedure"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "EnLiST-Linien-Segment (Extension)",
      "definition" : "Markiert einen **ausführenden Behandlungsabschnitt** (Episode einer ausführenden\nEinrichtung bzw. eine Therapie-`Procedure`) als Segment einer geführten Line of\nTherapy. Trägt **keine eigene Designation**, sondern nur die gemeinsame\n`lineId` der Linie (siehe `enlist-lot.lineId` an der führenden Episode).\nSo bleibt jede ausführende Instanz autonom dokumentationsfähig, ohne die\nLoT-Zählung zu duplizieren — Auswerter zählen ausschließlich Träger von\n`enlist-lot`."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-line-segment"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "short" : "Linien-Identifier",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Line identifier"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Identifier der Linie, zu der dieses Segment gehört.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Identifier of the line this segment belongs to."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "type" : [{
        "code" : "Identifier"
      }]
    }]
  }
}

```
