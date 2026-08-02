# CarePlan Custodian (Extension) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Extension: CarePlan Custodian (Extension) 

Verantwortliche Stelle für Pflege und Aktualisierung des Versorgungsplans (Custodian).

Übernahme der **MCC eCare Plan** Extension [custodian](https://build.fhir.org/ig/HL7/fhir-us-mcc/StructureDefinition-custodian.html) (`http://hl7.org/fhir/us/mcc/StructureDefinition/custodian`). Es handelt sich um einen R5-Backport: In FHIR R5 wurde `CarePlan.author` entfernt; `CarePlan.custodian` benennt die für Pflege und Wartung des Plans verantwortliche Partei. Der Custodian kann, muss aber kein Contributor sein.

Hier als lokale Extension nachgebildet, um die US-Realm-Abhängigkeit (US MCC / US Core) zu vermeiden; Wertebereich an die Referenztypen der MCC-Extension angelehnt.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Onkologischer CarePlan](StructureDefinition-onko-care-plan.md) and [Diagnostischer CarePlan](StructureDefinition-onko-diagnostic-care-plan.md)
* Examples for this Extension: [Bundle/BundleCRCPalliativ](Bundle-BundleCRCPalliativ.md), [Bundle/BundleMammaNeoadjuvant](Bundle-BundleMammaNeoadjuvant.md), [CarePlan/CarePlanCRCPalliativ](CarePlan-CarePlanCRCPalliativ.md), [CarePlan/CarePlanMammaNachsorge](CarePlan-CarePlanMammaNachsorge.md)... Show 2 more, [CarePlan/CarePlanMammaNeoadjuvant](CarePlan-CarePlanMammaNeoadjuvant.md) and [CarePlan/DiagnostikCarePlanCRC](CarePlan-DiagnostikCarePlanCRC.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.bih-cei.therapieziele-onkologie|current/StructureDefinition/StructureDefinition-onko-careplan-custodian.json)

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

Simple Extension with the type Reference: Verantwortliche Stelle für Pflege und Aktualisierung des Versorgungsplans (Custodian).

Übernahme der **MCC eCare Plan** Extension [custodian](https://build.fhir.org/ig/HL7/fhir-us-mcc/StructureDefinition-custodian.html) (`http://hl7.org/fhir/us/mcc/StructureDefinition/custodian`). Es handelt sich um einen R5-Backport: In FHIR R5 wurde `CarePlan.author` entfernt; `CarePlan.custodian` benennt die für Pflege und Wartung des Plans verantwortliche Partei. Der Custodian kann, muss aber kein Contributor sein.

Hier als lokale Extension nachgebildet, um die US-Realm-Abhängigkeit (US MCC / US Core) zu vermeiden; Wertebereich an die Referenztypen der MCC-Extension angelehnt.

 **Differential-AnsichtDifferential View** 

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

 **Snapshot-Ansicht** 

#### Constraints

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

** Summary **

Simple Extension with the type Reference: Verantwortliche Stelle für Pflege und Aktualisierung des Versorgungsplans (Custodian).

Übernahme der **MCC eCare Plan** Extension [custodian](https://build.fhir.org/ig/HL7/fhir-us-mcc/StructureDefinition-custodian.html) (`http://hl7.org/fhir/us/mcc/StructureDefinition/custodian`). Es handelt sich um einen R5-Backport: In FHIR R5 wurde `CarePlan.author` entfernt; `CarePlan.custodian` benennt die für Pflege und Wartung des Plans verantwortliche Partei. Der Custodian kann, muss aber kein Contributor sein.

Hier als lokale Extension nachgebildet, um die US-Realm-Abhängigkeit (US MCC / US Core) zu vermeiden; Wertebereich an die Referenztypen der MCC-Extension angelehnt.

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-onko-careplan-custodian.csv), [Excel](../StructureDefinition-onko-careplan-custodian.xlsx), [Schematron](../StructureDefinition-onko-careplan-custodian.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "onko-careplan-custodian",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-careplan-custodian",
  "version" : "1.0.0-ballot",
  "name" : "OnkoCarePlanCustodianExt",
  "title" : "CarePlan Custodian (Extension)",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "CarePlan custodian extension"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "draft",
  "date" : "2026-08-02T18:42:01+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Verantwortliche Stelle für Pflege und Aktualisierung des Versorgungsplans (Custodian).\n\nÜbernahme der **MCC eCare Plan** Extension\n[custodian](https://build.fhir.org/ig/HL7/fhir-us-mcc/StructureDefinition-custodian.html)\n(`http://hl7.org/fhir/us/mcc/StructureDefinition/custodian`). Es handelt sich um einen\nR5-Backport: In FHIR R5 wurde `CarePlan.author` entfernt; `CarePlan.custodian` benennt die\nfür Pflege und Wartung des Plans verantwortliche Partei. Der Custodian kann, muss aber kein\nContributor sein.\n\nHier als lokale Extension nachgebildet, um die US-Realm-Abhängigkeit (US MCC / US Core) zu\nvermeiden; Wertebereich an die Referenztypen der MCC-Extension angelehnt.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Party responsible for maintaining the care plan – custodian. Adopted from the MCC eCare Plan custodian extension as an R5 backport: in FHIR R5 CarePlan.author was removed and CarePlan.custodian names the party responsible for maintenance. Modelled here as a local extension to avoid the US-realm dependency."
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
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "CarePlan Custodian (Extension)",
      "definition" : "Verantwortliche Stelle für Pflege und Aktualisierung des Versorgungsplans (Custodian).\n\nÜbernahme der **MCC eCare Plan** Extension\n[custodian](https://build.fhir.org/ig/HL7/fhir-us-mcc/StructureDefinition-custodian.html)\n(`http://hl7.org/fhir/us/mcc/StructureDefinition/custodian`). Es handelt sich um einen\nR5-Backport: In FHIR R5 wurde `CarePlan.author` entfernt; `CarePlan.custodian` benennt die\nfür Pflege und Wartung des Plans verantwortliche Partei. Der Custodian kann, muss aber kein\nContributor sein.\n\nHier als lokale Extension nachgebildet, um die US-Realm-Abhängigkeit (US MCC / US Core) zu\nvermeiden; Wertebereich an die Referenztypen der MCC-Extension angelehnt."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-careplan-custodian"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "short" : "Custodian",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Custodian"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Für Pflege und Aktualisierung des Versorgungsplans verantwortliche Stelle.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Party responsible for maintaining the care plan."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Practitioner",
        "http://hl7.org/fhir/StructureDefinition/PractitionerRole",
        "http://hl7.org/fhir/StructureDefinition/Organization",
        "http://hl7.org/fhir/StructureDefinition/CareTeam",
        "http://hl7.org/fhir/StructureDefinition/Patient",
        "http://hl7.org/fhir/StructureDefinition/RelatedPerson",
        "http://hl7.org/fhir/StructureDefinition/Device"]
      }]
    }]
  }
}

```
