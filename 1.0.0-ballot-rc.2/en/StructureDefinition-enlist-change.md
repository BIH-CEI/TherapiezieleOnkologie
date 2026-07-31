# EnLiST-Änderungstyp (Extension) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot-rc.2

## Extension: EnLiST change type extension 

EnLiST change type of a treatment change at request level: new — opens a new line, X plus one; modified — Y plus one, non-progression-related, with priorPrescription when replacing a predecessor; same — prospectively planned change including maintenance, designation unchanged.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Tumorboard MedicationRequest](StructureDefinition-onko-tumorboard-medication-request.md)
* Examples for this Extension: [Bundle/BundleMammaNeoadjuvant](Bundle-BundleMammaNeoadjuvant.md), [MedicationRequest/MedicationRequestPembroAdjuvantMamma](MedicationRequest-MedicationRequestPembroAdjuvantMamma.md) and [MedicationRequest/MedicationRequestPembroChemoNeoadjuvantMamma](MedicationRequest-MedicationRequestPembroChemoNeoadjuvantMamma.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.bih-cei.therapieziele-onkologie|current/StructureDefinition/StructureDefinition-enlist-change.json)

### Formal Views of Extension Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-enlist-change.csv), [Excel](../StructureDefinition-enlist-change.xlsx), [Schematron](../StructureDefinition-enlist-change.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "enlist-change",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-change",
  "version" : "1.0.0-ballot-rc.2",
  "name" : "EnlistChangeTypeExt",
  "title" : "EnLiST-Änderungstyp (Extension)",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "EnLiST change type extension"
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
  "description" : "EnLiST-Änderungstyp einer Therapieänderung auf Request-Ebene: **new** (eröffnet\neine neue Linie, X+1 — nur bei Progression/fehlendem Ansprechen), **modified**\n(Y+1 — nicht-progressionsbedingte Änderung; bei Ersetzung eines Vorgängers\nzusätzlich `priorPrescription`) oder **same** (prospektiv geplante Änderung\ninkl. Erhaltungstherapie — Designation unverändert). Die Sequenz geplanter\nBlöcke liegt in der RequestGroup, nicht in `priorPrescription`.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "EnLiST change type of a treatment change at request level: new — opens a new line, X plus one; modified — Y plus one, non-progression-related, with priorPrescription when replacing a predecessor; same — prospectively planned change including maintenance, designation unchanged."
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
    "expression" : "MedicationRequest"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "EnLiST-Änderungstyp (Extension)",
      "definition" : "EnLiST-Änderungstyp einer Therapieänderung auf Request-Ebene: **new** (eröffnet\neine neue Linie, X+1 — nur bei Progression/fehlendem Ansprechen), **modified**\n(Y+1 — nicht-progressionsbedingte Änderung; bei Ersetzung eines Vorgängers\nzusätzlich `priorPrescription`) oder **same** (prospektiv geplante Änderung\ninkl. Erhaltungstherapie — Designation unverändert). Die Sequenz geplanter\nBlöcke liegt in der RequestGroup, nicht in `priorPrescription`."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/enlist-change"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "short" : "Änderungstyp",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Change type"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "EnLiST-Änderungstyp — new, modified oder same.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "EnLiST change type — new, modified or same."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://bih-cei.de/fhir/therapieziele-onkologie/ValueSet/enlist-change-type"
      }
    }]
  }
}

```
