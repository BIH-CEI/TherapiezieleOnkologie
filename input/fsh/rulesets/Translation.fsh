// =====================================================================
// Übersetzungs-RuleSets (Muster übernommen aus dem MII KDS-Modul Onkologie).
//
// Translation(path, language, translation)
//   Hinterlegt für einen primitiven String (z. B. ^short, ^definition,
//   ^title) eine Übersetzung via Standard-Extension
//   http://hl7.org/fhir/StructureDefinition/translation.
//   Default-Sprache des IG ist Deutsch (de); Übersetzungen werden in
//   Englisch (en) hinterlegt.
//
// Label(path, short, definition)
//   Setzt ^short und ^definition eines Elements in einem Aufruf.
// =====================================================================

RuleSet: Translation(path, language, translation)
* {path}.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* {path}.extension[=].extension[0].url = "lang"
* {path}.extension[=].extension[0].valueCode = #{language}
* {path}.extension[=].extension[1].url = "content"
* {path}.extension[=].extension[1].valueString = "{translation}"

RuleSet: Label(path, short, definition)
* {path} ^short = "{short}"
* {path} ^definition = "{definition}"
