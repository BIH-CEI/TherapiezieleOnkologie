# Resource Implementierungsleitfaden Therapieziele Onkologie



## Resource Content

```json
{
  "resourceType" : "ImplementationGuide",
  "id" : "bih-cei-therapieziele-onkologie",
  "language" : "de",
  "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/ImplementationGuide/bih-cei-therapieziele-onkologie",
  "version" : "0.1.0",
  "name" : "TherapiezieleOnkologie",
  "title" : "Implementierungsleitfaden Therapieziele Onkologie",
  "status" : "draft",
  "date" : "2026-07-20T15:05:40+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Implementierungsleitfaden zur Dokumentation onkologischer Therapieziele in FHIR",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "packageId" : "de.bih-cei.therapieziele-onkologie",
  "license" : "CC-BY-4.0",
  "fhirVersion" : ["4.0.1"],
  "dependsOn" : [{
    "id" : "hl7tx",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on HL7 Terminology"
    }],
    "uri" : "http://terminology.hl7.org/ImplementationGuide/hl7.terminology",
    "packageId" : "hl7.terminology.r4",
    "version" : "7.2.0"
  },
  {
    "id" : "hl7ext",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on the HL7 Extension Pack"
    }],
    "uri" : "http://hl7.org/fhir/extensions/ImplementationGuide/hl7.fhir.uv.extensions",
    "packageId" : "hl7.fhir.uv.extensions.r4",
    "version" : "5.3.0"
  },
  {
    "id" : "de_medizininformatikinitiative_kerndatensatz_onkologie",
    "uri" : "http://fhir.org/packages/de.medizininformatikinitiative.kerndatensatz.onkologie/ImplementationGuide/de.medizininformatikinitiative.kerndatensatz.onkologie",
    "packageId" : "de.medizininformatikinitiative.kerndatensatz.onkologie",
    "version" : "2026.0.3"
  }],
  "definition" : {
    "extension" : [{
      "extension" : [{
        "url" : "code",
        "valueString" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2026+"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "ci-build"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "i18n-default-lang"
      },
      {
        "url" : "value",
        "valueString" : "de"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "i18n-lang"
      },
      {
        "url" : "value",
        "valueString" : "en"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "translation-sources"
      },
      {
        "url" : "value",
        "valueString" : "input/translations/en"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "excludettl"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "autoload-resources"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "template/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "input/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-qa"
      },
      {
        "url" : "value",
        "valueString" : "temp/qa"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-temp"
      },
      {
        "url" : "value",
        "valueString" : "temp/pages"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-output"
      },
      {
        "url" : "value",
        "valueString" : "output"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-suppressed-warnings"
      },
      {
        "url" : "value",
        "valueString" : "input/ignoreWarnings.txt"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-history"
      },
      {
        "url" : "value",
        "valueString" : "https://bih-cei.de/fhir/therapieziele-onkologie/history.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "template-html"
      },
      {
        "url" : "value",
        "valueString" : "template-page.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "template-md"
      },
      {
        "url" : "value",
        "valueString" : "template-page-md.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-contact"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-context"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-copyright"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-jurisdiction"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-license"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-publisher"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-version"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-wg"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "active-tables"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "fmm-definition"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/versions.html#maturity"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "propagate-status"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "excludelogbinaryformat"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "tabbed-snapshots"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "wantGen-ttl"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "wantGen-ttl-html"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-internal-dependency",
      "valueCode" : "hl7.fhir.uv.tools.r4#1.1.2"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2026+"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "ci-build"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "i18n-default-lang"
      },
      {
        "url" : "value",
        "valueString" : "de"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "i18n-lang"
      },
      {
        "url" : "value",
        "valueString" : "en"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "translation-sources"
      },
      {
        "url" : "value",
        "valueString" : "input/translations/en"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "excludettl"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "autoload-resources"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "template/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "input/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-qa"
      },
      {
        "url" : "value",
        "valueString" : "temp/qa"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-temp"
      },
      {
        "url" : "value",
        "valueString" : "temp/pages"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-output"
      },
      {
        "url" : "value",
        "valueString" : "output"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-suppressed-warnings"
      },
      {
        "url" : "value",
        "valueString" : "input/ignoreWarnings.txt"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-history"
      },
      {
        "url" : "value",
        "valueString" : "https://bih-cei.de/fhir/therapieziele-onkologie/history.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-html"
      },
      {
        "url" : "value",
        "valueString" : "template-page.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-md"
      },
      {
        "url" : "value",
        "valueString" : "template-page-md.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-contact"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-context"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-copyright"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-jurisdiction"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-license"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-publisher"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-version"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-wg"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "active-tables"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "fmm-definition"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/versions.html#maturity"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "propagate-status"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "excludelogbinaryformat"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "tabbed-snapshots"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "wantGen-ttl"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "wantGen-ttl-html"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    }],
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ServiceRequest"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ServiceRequest-ServiceRequestPathologieMamma.html"
      }],
      "reference" : {
        "reference" : "ServiceRequest/ServiceRequestPathologieMamma"
      },
      "name" : "Anforderung histopathologische Untersuchung (Beispiel)",
      "description" : "Pathologieauftrag zum Stanzbiopsat: Histologie, Grading, Hormonrezeptor- und HER2-Status sowie Ki-67.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ServiceRequest"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ServiceRequest-ServiceRequestGBRCAMamma.html"
      }],
      "reference" : {
        "reference" : "ServiceRequest/ServiceRequestGBRCAMamma"
      },
      "name" : "Anforderung Keimbahn-Testung gBRCA1 (Beispiel)",
      "description" : "Leitlinienindizierte Keimbahn-Panel-Diagnostik (BRCA1/BRCA2) beim triple-negativen Mammakarzinom.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ServiceRequest"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ServiceRequest-ServiceRequestStagingMamma.html"
      }],
      "reference" : {
        "reference" : "ServiceRequest/ServiceRequestStagingMamma"
      },
      "name" : "Anforderung klinisches Staging (Beispiel)",
      "description" : "Anforderung der klinischen Ausbreitungsdiagnostik (TNM-Klassifikation) vor Therapiebeginn.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ServiceRequest"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ServiceRequest-ServiceRequestKoloskopieCRC.html"
      }],
      "reference" : {
        "reference" : "ServiceRequest/ServiceRequestKoloskopieCRC"
      },
      "name" : "Anforderung Koloskopie mit Biopsie (Beispiel)",
      "description" : "Diagnostische Maßnahme des DiagnosticCarePlan.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ServiceRequest"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ServiceRequest-ServiceRequestBiopsieMamma.html"
      }],
      "reference" : {
        "reference" : "ServiceRequest/ServiceRequestBiopsieMamma"
      },
      "name" : "Anforderung Stanzbiopsie Mamma (Beispiel)",
      "description" : "Anforderung einer sonografisch gesteuerten Stanzbiopsie der Mamma links zur histologischen Sicherung des Tumorverdachts.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Practitioner"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Practitioner-OnkologinCRC.html"
      }],
      "reference" : {
        "reference" : "Practitioner/OnkologinCRC"
      },
      "name" : "Behandelnde Onkologin (Beispiel)",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Practitioner"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Practitioner-OnkologinMamma.html"
      }],
      "reference" : {
        "reference" : "Practitioner/OnkologinMamma"
      },
      "name" : "Behandelnde Onkologin (Mamma, Beispiel)",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Procedure"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Procedure-ProcedureOperationMamma.html"
      }],
      "reference" : {
        "reference" : "Procedure/ProcedureOperationMamma"
      },
      "name" : "Brusterhaltende Operation + Sentinel-Lymphknoten-Biopsie (Beispiel)",
      "description" : "Durchgeführte lokale Therapie nach Abschluss der neoadjuvanten Systemtherapie: brusterhaltende Operation (BET) links mit Sentinel-Lymphknoten-Biopsie.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Organization"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Organization-TumorzentrumMamma.html"
      }],
      "reference" : {
        "reference" : "Organization/TumorzentrumMamma"
      },
      "name" : "Brustzentrum (Custodian, Beispiel)",
      "description" : "Verantwortliche Stelle für Pflege und Aktualisierung des Versorgungsplans.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-onko-careplan-custodian.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/onko-careplan-custodian"
      },
      "name" : "CarePlan Custodian (Extension)",
      "description" : "Verantwortliche Stelle für Pflege und Aktualisierung des Versorgungsplans (Custodian).\n\nÜbernahme der **MCC eCare Plan** Extension\n[custodian](https://build.fhir.org/ig/HL7/fhir-us-mcc/StructureDefinition-custodian.html)\n(`http://hl7.org/fhir/us/mcc/StructureDefinition/custodian`). Es handelt sich um einen\nR5-Backport: In FHIR R5 wurde `CarePlan.author` entfernt; `CarePlan.custodian` benennt die\nfür Pflege und Wartung des Plans verantwortliche Partei. Der Custodian kann, muss aber kein\nContributor sein.\n\nHier als lokale Extension nachgebildet, um die US-Realm-Abhängigkeit (US MCC / US Core) zu\nvermeiden; Wertebereich an die Referenztypen der MCC-Extension angelehnt.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-onko-diagnostic-care-plan.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/onko-diagnostic-care-plan"
      },
      "name" : "Diagnostischer CarePlan",
      "description" : "CarePlan für die Tumordiagnostik auf Basis von `CarePlan`.\n\nErgänzend zum onkologischen Therapie-CarePlan (`OnkoCarePlan`) bildet dieses Profil den Weg\nzur Diagnosestellung als strukturierten Prozess ab. Die Schritte des Diagnosepfads werden als\nAktivitäten abgebildet, deren Ergebnisse können\nüber `activity.outcomeReference` angebunden werden.\n\nDer diagnostische CarePlan verweist über `addresses` auf die Tumordiagnose (`OnkoCondition`)\nund ist darüber mit dem Therapie-CarePlan verknüpft, der dieselbe Diagnose adressiert.\n\nDiagnostikspezifische Ergänzungen:\n- Der Plan-Typ ist über `category` verpflichtend gekennzeichnet: `category.text`\n  muss den Wert \"Tumordiagnostik\" tragen. Weitere Categories können ergänzt\n  werden. Damit sind diagnostischer und Therapie-CarePlan unterscheidbar.\n\n**Abgrenzung:** Dieses Profil beschreibt den *Prozess* der Diagnosefindung.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CarePlan"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CarePlan-CarePlanMammaDiagnostik.html"
      }],
      "reference" : {
        "reference" : "CarePlan/CarePlanMammaDiagnostik"
      },
      "name" : "Diagnostischer CarePlan ",
      "description" : "Diagnostikplan zur Tumordiagnose: bildet den Weg zur Diagnosesicherung ab (Stanzbiopsie, Histologie, Grading, klinisches TNM, Rezeptor-/HER2-Status, Ki-67, Keimbahn-Testung) und verweist auf die daraus hervorgegangene Tumordiagnose.",
      "exampleCanonical" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-diagnostic-care-plan"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CarePlan"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CarePlan-DiagnostikCarePlanCRC.html"
      }],
      "reference" : {
        "reference" : "CarePlan/DiagnostikCarePlanCRC"
      },
      "name" : "Diagnostischer CarePlan – Tumordiagnostik (Beispiel)",
      "description" : "Bildet den Weg zur Diagnosestellung ab: Koloskopie mit Biopsie und histopathologische Sicherung. Adressiert dieselbe Diagnose wie der Therapie-CarePlan.",
      "exampleCanonical" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-diagnostic-care-plan"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ServiceRequest"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ServiceRequest-ServiceRequestProcedure.html"
      }],
      "reference" : {
        "reference" : "ServiceRequest/ServiceRequestProcedure"
      },
      "name" : "Geplante Operation vom Tumorboard um den Tumor operativ zu entfernen",
      "description" : "Empfehlung des Tumorboards: operative Entfernung des Tumors (Lumpektomie) bei Mammakarzinom.",
      "exampleCanonical" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-tumorboard-service-request"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationRequest"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "MedicationRequest-MedicationRequestKEYNOTE522.html"
      }],
      "reference" : {
        "reference" : "MedicationRequest/MedicationRequestKEYNOTE522"
      },
      "name" : "Geplante Systemtherapie – Pembrolizumab + Chemotherapie (KEYNOTE-522, Beispiel)",
      "description" : "Geplante Aktivität des CarePlan: neoadjuvante Chemo-/Immuntherapie nach KEYNOTE-522 (Pembrolizumab + Carboplatin/Paclitaxel → Pembrolizumab + EC).",
      "exampleCanonical" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-tumorboard-medication-request"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-ObsGradingMamma.html"
      }],
      "reference" : {
        "reference" : "Observation/ObsGradingMamma"
      },
      "name" : "Grading G3 (Beispiel)",
      "description" : "Histopathologisches Grading nach Elston-Ellis: G3 (schlecht differenziert).",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-ObsHER2Mamma.html"
      }],
      "reference" : {
        "reference" : "Observation/ObsHER2Mamma"
      },
      "name" : "HER2/neu-Status – negativ (Beispiel)",
      "description" : "HER2/neu-Status: negativ (IHC 1+). Kodierung nach MII Mamma-Zusatzmodul (oBDS + Leitlinie).",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-ObsHistologieMamma.html"
      }],
      "reference" : {
        "reference" : "Observation/ObsHistologieMamma"
      },
      "name" : "Histologie / Morphologie (ICD-O-3, Beispiel)",
      "description" : "Histologischer Befund der Stanzbiopsie: invasives Karzinom ohne speziellen Typ (NST).",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "DiagnosticReport"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "DiagnosticReport-DiagnosticReportHistologieCRC.html"
      }],
      "reference" : {
        "reference" : "DiagnosticReport/DiagnosticReportHistologieCRC"
      },
      "name" : "Histopathologischer Befund (Beispiel)",
      "description" : "Ergebnis der Diagnostik: histologische Sicherung eines Adenokarzinoms des Kolons.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CareTeam"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CareTeam-TumorboardCRC.html"
      }],
      "reference" : {
        "reference" : "CareTeam/TumorboardCRC"
      },
      "name" : "Interdisziplinäres Tumorboard (Beispiel)",
      "description" : "Tumorkonferenz, die die Therapieempfehlungen ausspricht (Requester der Tumorboard-Requests).",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-ObsGBRCAMamma.html"
      }],
      "reference" : {
        "reference" : "Observation/ObsGBRCAMamma"
      },
      "name" : "Keimbahn-Testung gBRCA1 – unauffällig (Beispiel)",
      "description" : "Leitlinienindizierte Keimbahn-Panel-Diagnostik (BRCA1/BRCA2) beim TNBC: keine (wahrscheinlich) pathogene Variante nachgewiesen.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-ObsKi67Mamma.html"
      }],
      "reference" : {
        "reference" : "Observation/ObsKi67Mamma"
      },
      "name" : "Ki-67 Proliferationsindex (Beispiel)",
      "description" : "Proliferationsmarker Ki-67: 70 % – hohe Proliferationsaktivität.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-ObsTNMklinischMamma.html"
      }],
      "reference" : {
        "reference" : "Observation/ObsTNMklinischMamma"
      },
      "name" : "Klinisches TNM / UICC-Stadium (Beispiel)",
      "description" : "Klinische Ausbreitungsdiagnostik vor Therapiebeginn: cT2 cN1 cM0, UICC-Stadium IIB.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Condition"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Condition-ConditionCRC.html"
      }],
      "reference" : {
        "reference" : "Condition/ConditionCRC"
      },
      "name" : "Kolorektales Karzinom, metastasiert (Beispiel)",
      "description" : "Adressierte Tumorerkrankung: metastasiertes Kolonkarzinom (ICD-10-GM C18.9). Konform zum MII-Onkologie-Diagnoseprofil (Primärtumor).",
      "exampleCanonical" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-condition"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Condition"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Condition-ConditionMamma.html"
      }],
      "reference" : {
        "reference" : "Condition/ConditionMamma"
      },
      "name" : "Mammakarzinom links, triple-negativ (Beispiel)",
      "description" : "Adressierte Tumorerkrankung: invasives Mammakarzinom links (NST), ICD-10-GM C50.4. Konform zum MII-Onkologie-Diagnoseprofil (Primärtumor).",
      "exampleCanonical" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-condition"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-onko-condition.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/onko-condition"
      },
      "name" : "Onkologische Diagnose (Condition)",
      "description" : "Onkologische Tumorerkrankung auf Basis des **MII Kerndatensatz-Moduls Onkologie**\n([MII PR Onkologie Diagnose Primärtumor](https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-diagnose-primaertumor),\nVersion 2026.0.3).\n\nDieses Profil erbt das vollständige onkologische Diagnosemodell des MII KDS (ICD-10-GM,\nICD-O-3 Topographie/Morphologie, Diagnosesicherung gemäß oBDS, Seitenlokalisation,\nFeststellungsdatum) und dient als adressierte Erkrankung (`addresses`) für `OnkoCarePlan`\nund `OnkoTherapyGoal`. Damit wird die Therapieziel-Spezifikation an den nationalen\nOnkologie-Kerndatensatz angeschlossen, statt ein eigenes Condition-Modell zu definieren.\n\nFür die Therapieziel-Domäne werden keine zusätzlichen Einschränkungen vorgenommen; das\nProfil dokumentiert lediglich die explizite Wiederverwendung und stellt einen stabilen\nlokalen Canonical bereit, auf den die übrigen Profile referenzieren.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-onko-therapy-intent.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/onko-therapy-intent"
      },
      "name" : "Onkologische Therapieintention (Extension)",
      "description" : "Strukturierte Codierung der Therapieintention über zwei Achsen:\n\n- `hauptintention` (Pflicht): die eigentliche Behandlungsintention (kurativ, palliativ,\n  neoadjuvant, adjuvant, supportiv) – SNOMED `Procedure by intent`.\n- `phase` (optional, wiederholbar): die sequenzielle Behandlungsphase / Unter-Intention\n  (Induktionstherapie, Erhaltungstherapie) – ergänzend zur Hauptintention.\n\nSo lässt sich z. B. „kurativ + Induktionsphase\" gleichzeitig ausdrücken. Verwendet in\nOnkoCarePlan, OnkoTherapyGoal und OnkoTherapyLine. Konzeptionell anschlussfähig an mCODE\n`procedure-intent`.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ValueSet-onko-therapy-intent.html"
      }],
      "reference" : {
        "reference" : "ValueSet/onko-therapy-intent"
      },
      "name" : "Onkologische Therapieintention (VS)",
      "description" : "Intention (das „Warum\") einer onkologischen Therapielinie bzw. eines Behandlungsabschnitts.\n\nVerwendet aktuelle SNOMED-CT-Codes aus der Hierarchie `362961001 | Procedure by intent`.\nDie deutschen Anzeigetexte sind als Concept-Display hinterlegt (Übersetzung der englischen\nSNOMED-FSN). Extensible gebunden – seltene Sonderintentionen dürfen ergänzt werden.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-onko-therapy-line.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/onko-therapy-line"
      },
      "name" : "Onkologische Therapielinie",
      "description" : "Eine onkologische Therapielinie (Line of Therapy, LoT) auf Basis von `EpisodeOfCare`, EnLiST-konform. Eine Therapielinie ist ein Behandlungsabschnitt mit einer bestimmten Intention und einer definierten Tumorerkrankung, der durch ein klinisches Ereignis (Progress, Toxizität, Patientenwunsch, Studienende, geplanter Wechsel) beendet wird. Die Verbindung zu einem `OnkoCarePlan` erfolgt über `CarePlan.encounter` → `Encounter.episodeOfCare` oder die Standard-Extension `workflow-episodeOfCare`.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ValueSet-onko-therapy-line-type.html"
      }],
      "reference" : {
        "reference" : "ValueSet/onko-therapy-line-type"
      },
      "name" : "Onkologische Therapielinie – Art (VS)",
      "description" : "Art einer onkologischen Therapielinie (Behandlungsmodalität) für `EpisodeOfCare.type`.\n\nDie Codes wurden gegen SNOMED CT (internationale Edition) recherchiert und stellen ein\nBeispiel-Set gängiger onkologischer Behandlungsmodalitäten dar. Für Bestrahlung existiert\n`Radiation therapy care` (385798007), für die ambulante Chemotherapie der spezifische Code\n`Ambulatory chemotherapy` (315601005).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ValueSet-onko-therapy-phase.html"
      }],
      "reference" : {
        "reference" : "ValueSet/onko-therapy-phase"
      },
      "name" : "Onkologische Therapiephase / Unter-Intention (VS)",
      "description" : "Sequenzielle Phase (Unter-Intention) innerhalb eines Behandlungskonzepts – ergänzend zur\nHaupt-Therapieintention. In SNOMED CT liegen diese Konzepte nicht in der Intent-Hierarchie,\nsondern als Behandlungsformen unter `716872004 | Antineoplastic chemotherapy regimen`.\nDeutsche Anzeigetexte als Concept-Display. Extensible gebunden (z. B. Konsolidierung\nergänzbar).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CodeSystem-onko-therapy-goal-type.html"
      }],
      "reference" : {
        "reference" : "CodeSystem/onko-therapy-goal-type"
      },
      "name" : "Onkologische Therapieziel-Art",
      "description" : "Codiert die Art eines onkologischen Therapieziels (Heilung, Lebensverlängerung, Symptomkontrolle, Lebensqualität, gemeinsame Entscheidung).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ValueSet-onko-therapy-goal-type.html"
      }],
      "reference" : {
        "reference" : "ValueSet/onko-therapy-goal-type"
      },
      "name" : "Onkologische Therapieziel-Art (VS)",
      "description" : "ValueSet der zugelassenen Codes für die Zielart eines onkologischen Therapieziels.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-onko-care-plan.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/onko-care-plan"
      },
      "name" : "Onkologischer CarePlan",
      "description" : "Onkologischer Versorgungsplan auf Basis von `CarePlan`.\n\nDas Profil ist architektonisch an den **HL7 FHIR US Multiple Chronic Conditions (MCC) eCare Plan**\n([MCCCarePlan](https://build.fhir.org/ig/HL7/fhir-us-mcc/StructureDefinition-mccCarePlan.html))\nangelehnt: Der CarePlan ist das zentrale, konsensbasierte Steuerobjekt, das adressierte\nErkrankungen (`addresses`), übergeordnete Ziele (`goal`) sowie geplante und durchgeführte\nMaßnahmen (`activity`) verschiedener Versorgungsteams zusammenführt.\n\nOnkologiespezifische Ergänzungen gegenüber MCC:\n- Therapieintention über die Extension `onko-therapy-intent` (kurativ, neoadjuvant, adjuvant,\n  Erhaltung, palliativ, supportiv).\n- `goal` referenziert das Profil `OnkoTherapyGoal`.\n- Therapielinien (`OnkoTherapyLine`, Basis `EpisodeOfCare`) werden über `CarePlan.encounter`\n  bzw. die Standard-Extension `workflow-episodeOfCare` verknüpft.\n\nIm Fallback-Pfad (keine computable Leitlinie) ist der CarePlan die führende Repräsentation des\nrealen Versorgungsverlaufs; im Primärpfad referenziert er via `instantiatesCanonical` eine\n`PlanDefinition` aus dem CPG-on-FHIR-Stack.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CarePlan"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CarePlan-CarePlanMammaNeoadjuvant.html"
      }],
      "reference" : {
        "reference" : "CarePlan/CarePlanMammaNeoadjuvant"
      },
      "name" : "Onkologischer CarePlan – Mamma neoadjuvant/kurativ (Beispiel)",
      "description" : "Zentraler Versorgungsplan, der adressierte Erkrankung, kuratives Therapieziel sowie geplante (neoadjuvante Systemtherapie) und durchgeführte Maßnahmen (Operation, Ansprechbeurteilung) zusammenführt.",
      "exampleCanonical" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-care-plan"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CarePlan"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CarePlan-CarePlanCRCPalliativ.html"
      }],
      "reference" : {
        "reference" : "CarePlan/CarePlanCRCPalliativ"
      },
      "name" : "Onkologischer CarePlan – mCRC palliativ (Beispiel)",
      "description" : "Zentraler Versorgungsplan, der adressierte Erkrankung, palliatives Therapieziel sowie geplante und durchgeführte Maßnahmen zusammenführt.",
      "exampleCanonical" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-care-plan"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-onko-therapy-goal.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/onko-therapy-goal"
      },
      "name" : "Onkologisches Therapieziel",
      "description" : "Strukturiertes onkologisches Therapieziel auf Basis von `Goal`.\n\nDas Profil ist an den **HL7 FHIR US Multiple Chronic Conditions (MCC) eCare Plan**\n([MCCGoal](https://build.fhir.org/ig/HL7/fhir-us-mcc/StructureDefinition-MCCGoal.html))\nangelehnt: Das Therapieziel ist eine eigenständige, referenzbasierte Ressource, die über\n`addresses` mit den adressierten Erkrankungen und über `outcomeReference` mit beobachteten\nErgebnissen (Verlaufs-Observations) verknüpft wird.\n\nOnkologiespezifische Ergänzungen gegenüber MCC:\n- Die Zielart wird über `category` aus `OnkoTherapyGoalTypeVS` codiert (Heilung,\n  Lebensverlängerung, Symptomkontrolle, Lebensqualität, Funktionserhalt, Studienteilnahme).\n- Über die Extension `onko-therapy-intent` kann zusätzlich die Therapieintention der\n  zugehörigen Behandlungslinie hinterlegt werden.\n- `outcomeReference` bindet das Ziel an Verlaufs-Observations (z. B. mCODE\n  CancerDiseaseStatus / Response Assessment), wodurch das Tumoransprechen auf das Ziel\n  bezogen ausgewertet werden kann.\n\n`achievementStatus` bildet — analog MCC — den Erreichungsgrad bzw. die Zielakzeptanz ab\n(z. B. erreicht, in Bearbeitung, nicht erreicht).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Patient"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Patient-PatientinMamma.html"
      }],
      "reference" : {
        "reference" : "Patient/PatientinMamma"
      },
      "name" : "Patientin – Mammakarzinom (Beispiel)",
      "description" : "Beispielpatientin mit primärem, triple-negativem Mammakarzinom (frühes Stadium).",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Patient"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Patient-PatientinCRC.html"
      }],
      "reference" : {
        "reference" : "Patient/PatientinCRC"
      },
      "name" : "Patientin – mCRC (Beispiel)",
      "description" : "Beispielpatientin mit metastasiertem kolorektalem Karzinom.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-ObsTNMpathologischMamma.html"
      }],
      "reference" : {
        "reference" : "Observation/ObsTNMpathologischMamma"
      },
      "name" : "Postneoadjuvantes TNM / pCR (Beispiel)",
      "description" : "Pathologische Aufarbeitung des OP-Präparats nach neoadjuvanter Therapie: ypT0 ypN0 – pathologische Komplettremission (pCR).",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-ObsProgesteronrezeptorMamma.html"
      }],
      "reference" : {
        "reference" : "Observation/ObsProgesteronrezeptorMamma"
      },
      "name" : "Progesteronrezeptor-Status – negativ (Beispiel)",
      "description" : "Immunhistochemischer Progesteronrezeptor-Status: negativ (<1 % positive Tumorzellkerne).",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Procedure"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Procedure-ProcedureBiopsieMamma.html"
      }],
      "reference" : {
        "reference" : "Procedure/ProcedureBiopsieMamma"
      },
      "name" : "Sonografisch gesteuerte Stanzbiopsie der Mamma (Beispiel)",
      "description" : "Diagnostische Prozedur zur Sicherung der Tumordiagnose: sonografisch gesteuerte Stanzbiopsie der Mamma links. Liefert das Material für Histologie, Grading und Rezeptor-/HER2-Bestimmung.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Specimen"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Specimen-SpecimenBiopsieMamma.html"
      }],
      "reference" : {
        "reference" : "Specimen/SpecimenBiopsieMamma"
      },
      "name" : "Stanzbiopsat Mamma links (Beispiel)",
      "description" : "Gewebeprobe aus der Stanzbiopsie, an der die histopathologische und molekulare Diagnostik durchgeführt wurde.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "EpisodeOfCare"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "EpisodeOfCare-TherapielinieCRCErstlinie.html"
      }],
      "reference" : {
        "reference" : "EpisodeOfCare/TherapielinieCRCErstlinie"
      },
      "name" : "Therapielinie 1 – FOLFOX + Bevacizumab (Beispiel)",
      "description" : "Erstlinien-Behandlungsabschnitt mit palliativer Intention, Induktionsphase (FOLFOX + Bevacizumab).",
      "exampleCanonical" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-line"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "EpisodeOfCare"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "EpisodeOfCare-TherapielinieMammaNeoadjuvant.html"
      }],
      "reference" : {
        "reference" : "EpisodeOfCare/TherapielinieMammaNeoadjuvant"
      },
      "name" : "Therapielinie 1 – neoadjuvante Chemo-/Immuntherapie (Beispiel)",
      "description" : "Erstlinien-Behandlungsabschnitt mit neoadjuvanter Intention (KEYNOTE-522-Schema) im Rahmen eines kurativen Gesamtkonzepts.",
      "exampleCanonical" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-line"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Goal"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Goal-TherapiezielCRCErhaltung.html"
      }],
      "reference" : {
        "reference" : "Goal/TherapiezielCRCErhaltung"
      },
      "name" : "Therapieziel – Erhaltungstherapie / Stabilisierung (Beispiel)",
      "description" : "Nachgelagertes Ziel der Erhaltungsphase (Deeskalation auf 5-FU/Bevacizumab nach Ansprechen). Demonstriert die predecessor-Beziehung als Gegenrichtung zum successor des Induktionsziels.",
      "exampleCanonical" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-goal"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Goal"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Goal-TherapiezielMammaHeilung.html"
      }],
      "reference" : {
        "reference" : "Goal/TherapiezielMammaHeilung"
      },
      "name" : "Therapieziel – Heilung & Brusterhalt (Beispiel)",
      "description" : "Übergeordnetes kuratives Therapieziel: Heilung des frühen TNBC durch neoadjuvante Systemtherapie und anschließende Operation, bei gleichzeitigem Ziel des Brusterhalts (Funktionserhalt).",
      "exampleCanonical" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-goal"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Goal"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Goal-TherapiezielCRCKurativAbgelehnt.html"
      }],
      "reference" : {
        "reference" : "Goal/TherapiezielCRCKurativAbgelehnt"
      },
      "name" : "Therapieziel – kurative Resektion (abgelehnt, Beispiel)",
      "description" : "In der Tumorkonferenz erwogenes kuratives Ziel, das aufgrund der Metastasierung verworfen wurde. Demonstriert die Extension goal-reasonRejected.",
      "exampleCanonical" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-goal"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Goal"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Goal-TherapiezielCRCLebensverlaengerung.html"
      }],
      "reference" : {
        "reference" : "Goal/TherapiezielCRCLebensverlaengerung"
      },
      "name" : "Therapieziel – Lebensverlängerung & Symptomkontrolle (Beispiel)",
      "description" : "Übergeordnetes palliatives Therapieziel: Lebensverlängerung bei gleichzeitiger Symptomkontrolle.",
      "exampleCanonical" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-goal"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-ObservationDiseaseStatusCRC.html"
      }],
      "reference" : {
        "reference" : "Observation/ObservationDiseaseStatusCRC"
      },
      "name" : "Tumoransprechen / Disease Status (Beispiel)",
      "description" : "Verlaufs-Observation zum Krankheitsstatus, die das Tumoransprechen auf das Therapieziel bezieht (vgl. mCODE Cancer Disease Status).",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-ObsDiseaseStatusMamma.html"
      }],
      "reference" : {
        "reference" : "Observation/ObsDiseaseStatusMamma"
      },
      "name" : "Tumoransprechen / Disease Status – Komplettremission (Beispiel)",
      "description" : "Verlaufs-Observation zum Krankheitsstatus nach neoadjuvanter Therapie und Operation: pathologische Komplettremission (vgl. mCODE Cancer Disease Status).",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-onko-tumorboard-medication-request.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/onko-tumorboard-medication-request"
      },
      "name" : "Tumorboard MedicationRequest",
      "description" : "Strukturierte Empfehlung des Tumorboards auf Basis von `MedicationRequest`.\n\nTumorboardspezifische Ergänzung:\n- Im Element `category` muss der LOINC-Code `Tumor board Consult note` (85232-7) enthalten sein, um zu kennzeichnen, dass es sich um eine Empfehlung des Tumorboards handelt. Weitere Categories können zusätzlich angegeben werden.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-onko-tumorboard-service-request.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/onko-tumorboard-service-request"
      },
      "name" : "Tumorboard ServiceRequest",
      "description" : "Strukturierte Empfehlung des Tumorboards auf Basis von `ServiceRequest`.\n\nTumorboardspezifische Ergänzung:\n- Im Element `category` muss der LOINC-Code `Tumor board Consult note` (85232-7) enthalten sein, um zu kennzeichnen, dass es sich um eine Empfehlung des Tumorboards handelt. Weitere Categories können zusätzlich angegeben werden.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationRequest"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "MedicationRequest-MedicationRequestFOLFOX.html"
      }],
      "reference" : {
        "reference" : "MedicationRequest/MedicationRequestFOLFOX"
      },
      "name" : "Tumorboard-Empfehlung – FOLFOX + Bevacizumab (Beispiel)",
      "description" : "Vom Tumorboard empfohlene palliative Erstlinien-Systemtherapie (geplante Aktivität des Therapie-CarePlan).",
      "exampleCanonical" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-tumorboard-medication-request"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ServiceRequest"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ServiceRequest-ServiceRequestPortCRC.html"
      }],
      "reference" : {
        "reference" : "ServiceRequest/ServiceRequestPortCRC"
      },
      "name" : "Tumorboard-Empfehlung – Portimplantation (Beispiel)",
      "description" : "Vom Tumorboard empfohlene Anlage eines Portkatheters für die systemische Therapie.",
      "exampleCanonical" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-tumorboard-service-request"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Organization"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Organization-TumorzentrumCRC.html"
      }],
      "reference" : {
        "reference" : "Organization/TumorzentrumCRC"
      },
      "name" : "Tumorzentrum (Custodian, Beispiel)",
      "description" : "Verantwortliche Stelle für Pflege und Aktualisierung der Versorgungspläne.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-ObsEstrogenrezeptorMamma.html"
      }],
      "reference" : {
        "reference" : "Observation/ObsEstrogenrezeptorMamma"
      },
      "name" : "Östrogenrezeptor-Status – negativ (Beispiel)",
      "description" : "Immunhistochemischer Östrogenrezeptor-Status: negativ (<1 % positive Tumorzellkerne).",
      "exampleBoolean" : true
    }],
    "page" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
        "valueUrl" : "toc.html"
      }],
      "nameUrl" : "toc.html",
      "title" : "Table of Contents",
      "generation" : "html",
      "page" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "index.html"
        }],
        "nameUrl" : "index.html",
        "title" : "Startseite",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "szenario-crc.html"
        }],
        "nameUrl" : "szenario-crc.html",
        "title" : "Anwendungsbeispiel (mCRC palliativ)",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "szenario-mamma.html"
        }],
        "nameUrl" : "szenario-mamma.html",
        "title" : "Anwendungsbeispiel (Mammakarzinom neoadjuvant)",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "analysebericht.html"
        }],
        "nameUrl" : "analysebericht.html",
        "title" : "Analysebericht (LG-01)",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "translationinfo.html"
        }],
        "nameUrl" : "translationinfo.html",
        "title" : "Hinweise zur Übersetzung",
        "generation" : "markdown"
      }]
    },
    "parameter" : [{
      "code" : "path-resource",
      "value" : "input/capabilities"
    },
    {
      "code" : "path-resource",
      "value" : "input/examples"
    },
    {
      "code" : "path-resource",
      "value" : "input/extensions"
    },
    {
      "code" : "path-resource",
      "value" : "input/models"
    },
    {
      "code" : "path-resource",
      "value" : "input/operations"
    },
    {
      "code" : "path-resource",
      "value" : "input/profiles"
    },
    {
      "code" : "path-resource",
      "value" : "input/resources"
    },
    {
      "code" : "path-resource",
      "value" : "input/vocabulary"
    },
    {
      "code" : "path-resource",
      "value" : "input/maps"
    },
    {
      "code" : "path-resource",
      "value" : "input/testing"
    },
    {
      "code" : "path-resource",
      "value" : "input/history"
    },
    {
      "code" : "path-resource",
      "value" : "fsh-generated/resources"
    },
    {
      "code" : "path-pages",
      "value" : "template/config"
    },
    {
      "code" : "path-pages",
      "value" : "input/assets"
    },
    {
      "code" : "path-pages",
      "value" : "input/images"
    },
    {
      "code" : "path-tx-cache",
      "value" : "input-cache/txcache"
    }]
  }
}

```
