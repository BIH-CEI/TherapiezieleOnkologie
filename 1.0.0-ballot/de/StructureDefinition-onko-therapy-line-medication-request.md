# Therapielinie – Medikationsverordnung (Extension) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Extension: Therapielinie – Medikationsverordnung (Extension) 

Referenz auf die `MedicationRequest`-Ressource(en), die den Anlass bzw. die Verordnung für diese Therapielinie bilden.

`EpisodeOfCare.referralRequest` ist im FHIR-Core auf `Reference(ServiceRequest)` beschränkt und kann in einem Profil nicht auf weitere Zieltypen erweitert werden (Profile dürfen Referenzziele nur einschränken, nicht erweitern). Für Therapielinien, deren Auslöser eine Medikationsverordnung statt eines ServiceRequest ist (z. B. eine antineoplastische Systemtherapie), wird daher diese Extension ergänzend zu `referralRequest` verwendet.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Onkologische Therapielinie](StructureDefinition-onko-therapy-line.md)
* Examples for this Extension: [Bundle/BundleMammaNeoadjuvant](Bundle-BundleMammaNeoadjuvant.md), [EpisodeOfCare/TherapielinieChemo](EpisodeOfCare-TherapielinieChemo.md) and [EpisodeOfCare/TherapieliniePembroAdjuvant](EpisodeOfCare-TherapieliniePembroAdjuvant.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.bih-cei.therapieziele-onkologie|current/StructureDefinition/StructureDefinition-onko-therapy-line-medication-request.json)

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

Simple Extension with the type Reference: Referenz auf die `MedicationRequest`-Ressource(en), die den Anlass bzw. die Verordnung für diese Therapielinie bilden.

`EpisodeOfCare.referralRequest` ist im FHIR-Core auf `Reference(ServiceRequest)` beschränkt und kann in einem Profil nicht auf weitere Zieltypen erweitert werden (Profile dürfen Referenzziele nur einschränken, nicht erweitern). Für Therapielinien, deren Auslöser eine Medikationsverordnung statt eines ServiceRequest ist (z. B. eine antineoplastische Systemtherapie), wird daher diese Extension ergänzend zu `referralRequest` verwendet.

 **Differential-AnsichtDifferential View** 

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

 **Snapshot-Ansicht** 

#### Constraints

Diese Struktur ist abgeleitet von [Extension](http://hl7.org/fhir/R4/extensibility.html#Extension) 

** Summary **

Simple Extension with the type Reference: Referenz auf die `MedicationRequest`-Ressource(en), die den Anlass bzw. die Verordnung für diese Therapielinie bilden.

`EpisodeOfCare.referralRequest` ist im FHIR-Core auf `Reference(ServiceRequest)` beschränkt und kann in einem Profil nicht auf weitere Zieltypen erweitert werden (Profile dürfen Referenzziele nur einschränken, nicht erweitern). Für Therapielinien, deren Auslöser eine Medikationsverordnung statt eines ServiceRequest ist (z. B. eine antineoplastische Systemtherapie), wird daher diese Extension ergänzend zu `referralRequest` verwendet.

 

Weitere Repräsentationen des Profils: [CSV](../StructureDefinition-onko-therapy-line-medication-request.csv), [Excel](../StructureDefinition-onko-therapy-line-medication-request.xlsx), [Schematron](../StructureDefinition-onko-therapy-line-medication-request.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "onko-therapy-line-medication-request",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-line-medication-request",
  "version" : "1.0.0-ballot",
  "name" : "OnkoTherapyLineMedicationRequestExt",
  "title" : "Therapielinie – Medikationsverordnung (Extension)",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Line of therapy – medication request extension"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "draft",
  "date" : "2026-07-31T08:51:02+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Referenz auf die `MedicationRequest`-Ressource(en), die den Anlass bzw. die Verordnung für\ndiese Therapielinie bilden.\n\n`EpisodeOfCare.referralRequest` ist im FHIR-Core auf `Reference(ServiceRequest)` beschränkt\nund kann in einem Profil nicht auf weitere Zieltypen erweitert werden (Profile dürfen\nReferenzziele nur einschränken, nicht erweitern). Für Therapielinien, deren Auslöser eine\nMedikationsverordnung statt eines ServiceRequest ist (z. B. eine antineoplastische\nSystemtherapie), wird daher diese Extension ergänzend zu `referralRequest` verwendet.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Reference to the MedicationRequest resource or resources that gave rise to or order this line of therapy. EpisodeOfCare.referralRequest is restricted to a Reference of type ServiceRequest in FHIR core and profiles cannot widen reference target types. For lines of therapy triggered by a medication order rather than a ServiceRequest, e.g. an antineoplastic systemic therapy, this extension is used alongside referralRequest."
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
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Therapielinie – Medikationsverordnung (Extension)",
      "definition" : "Referenz auf die `MedicationRequest`-Ressource(en), die den Anlass bzw. die Verordnung für\ndiese Therapielinie bilden.\n\n`EpisodeOfCare.referralRequest` ist im FHIR-Core auf `Reference(ServiceRequest)` beschränkt\nund kann in einem Profil nicht auf weitere Zieltypen erweitert werden (Profile dürfen\nReferenzziele nur einschränken, nicht erweitern). Für Therapielinien, deren Auslöser eine\nMedikationsverordnung statt eines ServiceRequest ist (z. B. eine antineoplastische\nSystemtherapie), wird daher diese Extension ergänzend zu `referralRequest` verwendet."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-line-medication-request"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "short" : "Medikationsverordnung",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Medication request"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referenz auf die der Therapielinie zugrunde liegende Medikationsverordnung.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Reference to the medication request underlying the line of therapy."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/MedicationRequest"]
      }]
    }]
  }
}

```
