# EnLiST-LoT-Designation (Extension) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Extension: EnLiST-LoT-Designation (Extension) 

EnLiST-Designation der systemischen Line of Therapy in **X.Y-Notation je Setting**:

* `setting` — die Zählachse: **eLoT** (early: neoadjuvant, adjuvant, perioperativ), **aLoT** (advanced) oder **iLoT** (investigational). Jede Achse zählt **getrennt**.
* `line` (X) — Zahl der **New LoTs** im Setting; neue Linie nur bei klinischer Progression (cPD) oder fehlendem adäquatem Ansprechen.
* `modification` (Y) — Zahl der **Modified LoTs** seit der letzten New LoT; 0 = unmodifiziert, Reset bei jedem X-Inkrement.
* `notation` — optionale Gesamtdarstellung, z. B. „aLoT 2.1".
* `lineId` — Identifier der Linie (System `https://bih-cei.de/fhir/therapieziele-onkologie/sid/enlist-line`), verkettet ausführende Segmente (`enlist-line-segment`) mit der geführten Linie. Optional, wenn die Linie aus genau einer Episode besteht.

**Genau-einmal-Regel:** Die Designation liegt je Linie an genau einer Stelle — an der **führenden Episode** (main contributor, `managingOrganization` = die koordinierende Stelle) oder, wo keine Episodenführung existiert, an der systemischen Therapie-`Procedure` (MII-Pfad). Sie wird dokumentiert erfasst, nicht berechnet; **Same LoTs** (prospektiv geplante Änderungen inkl. Erhaltung) verändern die Designation nicht.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Onkologische Therapielinie](StructureDefinition-onko-therapy-line.md)
* Examples for this Extension: [Bundle/BundleCRCPalliativ](Bundle-BundleCRCPalliativ.md), [Bundle/BundleMammaNeoadjuvant](Bundle-BundleMammaNeoadjuvant.md), [EpisodeOfCare/TherapielinieCRCErstlinie](EpisodeOfCare-TherapielinieCRCErstlinie.md) and [EpisodeOfCare/TherapielinieChemo](EpisodeOfCare-TherapielinieChemo.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.bih-cei.therapieziele-onkologie|current/StructureDefinition/StructureDefinition-enlist-lot.json)

### Formale Ansichten des Extension-Inhalts

 [Beschreibung von Profilen, Differentials, Snapshots und deren Repräsentationen](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Differential-Tabelle](#tabs-diff) 
*  [Snapshot-Tabelle](#tabs-snap) 
*  [Statistiken/Referenzen](#tabs-summ) 
*  [Alle](#tabs-all) 

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

#### Terminology Bindings (Differential)

#### Constraints

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

** Summary **

Complex Extension: EnLiST-Designation der systemischen Line of Therapy in **X.Y-Notation je Setting**: 
* `setting` — die Zählachse: **eLoT** (early: neoadjuvant, adjuvant, perioperativ), **aLoT** (advanced) oder **iLoT** (investigational). Jede Achse zählt **getrennt**.
* `line` (X) — Zahl der **New LoTs** im Setting; neue Linie nur bei klinischer Progression (cPD) oder fehlendem adäquatem Ansprechen.
* `modification` (Y) — Zahl der **Modified LoTs** seit der letzten New LoT; 0 = unmodifiziert, Reset bei jedem X-Inkrement.
* `notation` — optionale Gesamtdarstellung, z. B. „aLoT 2.1".
* `lineId` — Identifier der Linie (System `https://bih-cei.de/fhir/therapieziele-onkologie/sid/enlist-line`), verkettet ausführende Segmente (`enlist-line-segment`) mit der geführten Linie. Optional, wenn die Linie aus genau einer Episode besteht.
 **Genau-einmal-Regel:** Die Designation liegt je Linie an genau einer Stelle — an der **führenden Episode** (main contributor, `managingOrganization` = die koordinierende Stelle) oder, wo keine Episodenführung existiert, an der systemischen Therapie-`Procedure` (MII-Pfad). Sie wird dokumentiert erfasst, nicht berechnet; **Same LoTs** (prospektiv geplante Änderungen inkl. Erhaltung) verändern die Designation nicht.

 **Differential-AnsichtDifferential View** 

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

#### Terminology Bindings (Differential)

#### Constraints

 **Snapshot-Ansicht** 

#### Terminology Bindings

#### Constraints

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

** Summary **

Complex Extension: EnLiST-Designation der systemischen Line of Therapy in **X.Y-Notation je Setting**: 
* `setting` — die Zählachse: **eLoT** (early: neoadjuvant, adjuvant, perioperativ), **aLoT** (advanced) oder **iLoT** (investigational). Jede Achse zählt **getrennt**.
* `line` (X) — Zahl der **New LoTs** im Setting; neue Linie nur bei klinischer Progression (cPD) oder fehlendem adäquatem Ansprechen.
* `modification` (Y) — Zahl der **Modified LoTs** seit der letzten New LoT; 0 = unmodifiziert, Reset bei jedem X-Inkrement.
* `notation` — optionale Gesamtdarstellung, z. B. „aLoT 2.1".
* `lineId` — Identifier der Linie (System `https://bih-cei.de/fhir/therapieziele-onkologie/sid/enlist-line`), verkettet ausführende Segmente (`enlist-line-segment`) mit der geführten Linie. Optional, wenn die Linie aus genau einer Episode besteht.
 **Genau-einmal-Regel:** Die Designation liegt je Linie an genau einer Stelle — an der **führenden Episode** (main contributor, `managingOrganization` = die koordinierende Stelle) oder, wo keine Episodenführung existiert, an der systemischen Therapie-`Procedure` (MII-Pfad). Sie wird dokumentiert erfasst, nicht berechnet; **Same LoTs** (prospektiv geplante Änderungen inkl. Erhaltung) verändern die Designation nicht.

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-enlist-lot.csv), [Excel](../StructureDefinition-enlist-lot.xlsx), [Schematron](../StructureDefinition-enlist-lot.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "enlist-lot",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-lot",
  "version" : "1.0.0-ballot",
  "name" : "EnlistLotExt",
  "title" : "EnLiST-LoT-Designation (Extension)",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "EnLiST LoT designation extension"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "draft",
  "date" : "2026-07-31T14:25:45+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "EnLiST-Designation der systemischen Line of Therapy in **X.Y-Notation je Setting**:\n\n- `setting` — die Zählachse: **eLoT** (early: neoadjuvant, adjuvant, perioperativ),\n  **aLoT** (advanced) oder **iLoT** (investigational). Jede Achse zählt **getrennt**.\n- `line` (X) — Zahl der *New LoTs* im Setting; neue Linie nur bei klinischer\n  Progression (cPD) oder fehlendem adäquatem Ansprechen.\n- `modification` (Y) — Zahl der *Modified LoTs* seit der letzten New LoT;\n  0 = unmodifiziert, Reset bei jedem X-Inkrement.\n- `notation` — optionale Gesamtdarstellung, z. B. „aLoT 2.1\".\n- `lineId` — Identifier der Linie (System\n  `https://bih-cei.de/fhir/therapieziele-onkologie/sid/enlist-line`), verkettet\n  ausführende Segmente (`enlist-line-segment`) mit der geführten Linie. Optional,\n  wenn die Linie aus genau einer Episode besteht.\n\n**Genau-einmal-Regel:** Die Designation liegt je Linie an genau einer Stelle —\nan der **führenden Episode** (main contributor, `managingOrganization` = die\nkoordinierende Stelle) oder, wo keine Episodenführung existiert, an der\nsystemischen Therapie-`Procedure` (MII-Pfad). Sie wird dokumentiert erfasst,\nnicht berechnet; *Same LoTs* (prospektiv geplante Änderungen inkl. Erhaltung)\nverändern die Designation nicht.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "EnLiST designation of the systemic line of therapy in X.Y notation per setting axis. The line of therapy is a clinical continuum that may span multiple organisation-bound episodes; the designation exists exactly once per line — on the leading episode or, in the MII-only path, on the systemic therapy procedure. Executing segments link via the shared lineId. Recorded, not computed."
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
      "short" : "EnLiST-LoT-Designation (Extension)",
      "definition" : "EnLiST-Designation der systemischen Line of Therapy in **X.Y-Notation je Setting**:\n\n- `setting` — die Zählachse: **eLoT** (early: neoadjuvant, adjuvant, perioperativ),\n  **aLoT** (advanced) oder **iLoT** (investigational). Jede Achse zählt **getrennt**.\n- `line` (X) — Zahl der *New LoTs* im Setting; neue Linie nur bei klinischer\n  Progression (cPD) oder fehlendem adäquatem Ansprechen.\n- `modification` (Y) — Zahl der *Modified LoTs* seit der letzten New LoT;\n  0 = unmodifiziert, Reset bei jedem X-Inkrement.\n- `notation` — optionale Gesamtdarstellung, z. B. „aLoT 2.1\".\n- `lineId` — Identifier der Linie (System\n  `https://bih-cei.de/fhir/therapieziele-onkologie/sid/enlist-line`), verkettet\n  ausführende Segmente (`enlist-line-segment`) mit der geführten Linie. Optional,\n  wenn die Linie aus genau einer Episode besteht.\n\n**Genau-einmal-Regel:** Die Designation liegt je Linie an genau einer Stelle —\nan der **führenden Episode** (main contributor, `managingOrganization` = die\nkoordinierende Stelle) oder, wo keine Episodenführung existiert, an der\nsystemischen Therapie-`Procedure` (MII-Pfad). Sie wird dokumentiert erfasst,\nnicht berechnet; *Same LoTs* (prospektiv geplante Änderungen inkl. Erhaltung)\nverändern die Designation nicht.",
      "constraint" : [{
        "key" : "onko-enlist-2",
        "severity" : "warning",
        "human" : "Die notation (falls vorhanden) muss aus setting, line und modification zusammengesetzt sein (z. B. 'eLoT 1.0').",
        "expression" : "extension.where(url = 'notation').exists() implies extension.where(url = 'notation').value = extension.where(url = 'setting').value.ofType(CodeableConcept).coding.first().code + ' ' + extension.where(url = 'line').value.toString() + '.' + extension.where(url = 'modification').value.toString()",
        "source" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-lot"
      }]
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "min" : 3
    },
    {
      "id" : "Extension.extension:setting",
      "path" : "Extension.extension",
      "sliceName" : "setting",
      "short" : "Setting-Achse",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Setting axis"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Zählachse nach EnLiST — eLoT, aLoT oder iLoT; jede Achse zählt getrennt.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "EnLiST counting axis — eLoT, aLoT or iLoT; each axis is counted separately."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Extension.extension:setting.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:setting.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "setting"
    },
    {
      "id" : "Extension.extension:setting.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/enlist-lot-setting"
      }
    },
    {
      "id" : "Extension.extension:line",
      "path" : "Extension.extension",
      "sliceName" : "line",
      "short" : "Liniennummer X",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Line number X"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Zahl der New LoTs im Setting — neue Linie nur bei Progression oder fehlendem Ansprechen.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Number of new LoTs within the setting — a new line only on progression or lack of adequate response."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Extension.extension:line.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:line.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "line"
    },
    {
      "id" : "Extension.extension:line.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "positiveInt"
      }]
    },
    {
      "id" : "Extension.extension:modification",
      "path" : "Extension.extension",
      "sliceName" : "modification",
      "short" : "Modifikationszähler Y",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Modification counter Y"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Zahl der Modified LoTs seit der letzten New LoT — 0 = unmodifiziert, Reset bei jedem X-Inkrement.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Number of modified LoTs since the last new LoT — 0 when unmodified, reset on each X increment."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Extension.extension:modification.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:modification.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "modification"
    },
    {
      "id" : "Extension.extension:modification.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "unsignedInt"
      }]
    },
    {
      "id" : "Extension.extension:notation",
      "path" : "Extension.extension",
      "sliceName" : "notation",
      "short" : "Notation",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Notation"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Gesamtdarstellung der Designation, z. B. aLoT 2.1",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Display form of the designation, e.g. aLoT 2.1"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:notation.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:notation.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "notation"
    },
    {
      "id" : "Extension.extension:notation.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "Extension.extension:lineId",
      "path" : "Extension.extension",
      "sliceName" : "lineId",
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
      "definition" : "Gemeinsamer Identifier der Linie — verkettet ausführende Segmente mit der geführten Linie.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Shared identifier of the line — links executing segments to the led line."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Extension.extension:lineId.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:lineId.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "lineId"
    },
    {
      "id" : "Extension.extension:lineId.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-lot"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "max" : "0"
    }]
  }
}

```
