// ─────────────────────────────────────────────────────────────────────────────
// Terminologie-Manifest
//
// Hält fest, gegen welche Fassungen der externen Codesysteme dieser Leitfaden
// gilt. Ohne diese Angabe ist nicht nachvollziehbar, auf welchem Stand die
// SNOMED-basierten ValueSets (Intention, Phase, Modalität, Kontext) beruhen —
// und Hierarchien verschieben sich zwischen SNOMED-Releases.
//
// Form nach CRMI (`crmi-manifestparameters`), wie sie das MII-Modul Onkologie
// mit `mii-param-onko-manifest` verwendet. Die Profilzuweisung erfolgt bewusst
// noch nicht: Sie setzt die CRMI-Abhängigkeit voraus und gehört in den Schritt,
// in dem die Artefakte ins MII-Modul übergehen.
//
// Gepinnt sind nur Systeme, die der Leitfaden tatsächlich verwendet.
// Alle Fassungen wurden gegen den Terminologieserver verifiziert.
//
// Ohne Translation-RuleSet: Dieses arbeitet mit Caret-Regeln, die auf Instance
// nicht anwendbar sind. Die englische Fassung entsteht über die .po-Dateien.
// ─────────────────────────────────────────────────────────────────────────────

Instance: TerminologieManifest
InstanceOf: Parameters
Usage: #definition
Title: "Terminologie-Manifest (Systemversionen)"
Description: """
Systemversionen, gegen die dieser Implementierungsleitfaden gilt.

| System | Fassung | Verwendung im Leitfaden |
|---|---|---|
| SNOMED CT International | 20260501 | Intention, Therapiephase, Behandlungsmodalität, Kontext, Zielart-ConceptMap |
| LOINC | 2.83 | Tumorboard-Kennzeichnung (85232-7) |
| ICD-10-GM | 2026 | Tumordiagnosen in den Anwendungsbeispielen |
| ISO 3166 | 20240629 | Jurisdiction des Leitfadens |

Die SNOMED-Fassung ist die kritische Angabe: Die zentralen ValueSets des
Leitfadens sind SNOMED-basiert, und die Zuordnung eines Codes zu einer
Hierarchie kann sich zwischen Releases ändern. Die Trennung von Intention und
Kontext stützt sich darauf, dass beide Achsen unter `362981000 | Qualifier value`
liegen, die Modalität dagegen unter `71388002 | Procedure` — gegen die hier
gepinnte Fassung geprüft.
"""
* parameter[+].name = "system-version"
* parameter[=].valueCanonical = "http://snomed.info/sct|http://snomed.info/sct/900000000000207008/version/20260501"

* parameter[+].name = "system-version"
* parameter[=].valueCanonical = "http://loinc.org|2.83"

* parameter[+].name = "system-version"
* parameter[=].valueCanonical = "http://fhir.de/CodeSystem/bfarm/icd-10-gm|2026"

* parameter[+].name = "system-version"
* parameter[=].valueCanonical = "urn:iso:std:iso:3166|20240629"
