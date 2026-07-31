// =====================================================================
// EnLiST-Abbildung der Therapielinie (Saini et al., Ann Oncol 2026):
// Liniennummer und Zählstatus als Extensions an der Behandlungsepisode.
// Die Zählregeln selbst (was eine neue Linie auslöst) sind dokumentierte
// Konvention des Leitfadens — die Nummer wird erfasst, nicht berechnet.
// =====================================================================

Extension: EnlistLineNumberExt
Id: enlist-linenumber
Title: "EnLiST-Liniennummer (Extension)"
Description: """
Nummer der systemischen Therapielinie (Line of Therapy, LoT) nach EnLiST-Notation
(1 = Erstlinie, 2 = Zweitlinie, …). Nur für Linien, die in die Zählung eingehen
(`enlist-countable = counted`); die Nummer wird dokumentiert erfasst, nicht aus den
Daten berechnet — die EnLiST-Zählregeln sind Konvention des Leitfadens.
"""
* insert Translation(^title, en, EnLiST line number extension)
* insert Translation(^description, en, Number of the systemic line of therapy per EnLiST notation — 1 first line\, 2 second line and so on. Only for lines that enter the LoT count; the number is recorded\, not computed.)
* ^context.type = #element
* ^context.expression = "EpisodeOfCare"
* value[x] only positiveInt
* value[x] 1..1
* insert Label(value[x], Liniennummer, Nummer der Therapielinie nach EnLiST — 1 = Erstlinie\, 2 = Zweitlinie\, …)
* insert Translation(value[x] ^short, en, Line number)
* insert Translation(value[x] ^definition, en, Number of the line of therapy per EnLiST — 1 first line\, 2 second line\, and so on.)

Extension: EnlistCountableExt
Id: enlist-countable
Title: "EnLiST-Zählstatus (Extension)"
Description: """
Zählstatus der Behandlungslinie nach EnLiST: geht die Linie in die LoT-Zählung ein
(`counted`), ist sie außerhalb der Zählung (`not-counted`, z. B. lokoregionale
Behandlungslinie) oder eine investigationale Studientherapie (`investigational`,
EnLiST-Notation „iLoT“ — separat notiert statt regulär gezählt).
"""
* insert Translation(^title, en, EnLiST countability extension)
* insert Translation(^description, en, EnLiST countability of the treatment line: counted in the LoT count\, not counted — e.g. locoregional treatment line — or investigational study therapy per EnLiST iLoT notation\, recorded separately instead of counted.)
* ^context.type = #element
* ^context.expression = "EpisodeOfCare"
* value[x] only CodeableConcept
* value[x] 1..1
* valueCodeableConcept from EnlistCountableVS (required)
* insert Label(value[x], Zählstatus, Zählstatus nach EnLiST — counted\, not-counted oder investigational / iLoT.)
* insert Translation(value[x] ^short, en, Countability)
* insert Translation(value[x] ^definition, en, EnLiST countability — counted\, not-counted or investigational iLoT.)
