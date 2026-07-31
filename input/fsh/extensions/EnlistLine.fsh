// =====================================================================
// EnLiST-Abbildung der Therapielinie (Saini et al., Ann Oncol 2026):
// X.Y-Notation je Setting-Achse (eLoT / aLoT / iLoT) als komplexe
// Extension an der Behandlungsepisode, plus Zählstatus-Marker für
// Linien außerhalb jeder LoT-Achse (lokoregional, Management).
// Die Zählregeln (New / Modified / Same) sind dokumentierte Konvention
// des Leitfadens — die Designation wird erfasst, nicht berechnet.
// =====================================================================

Extension: EnlistLotExt
Id: enlist-lot
Title: "EnLiST-LoT-Designation (Extension)"
Description: """
EnLiST-Designation der systemischen Therapielinie in **X.Y-Notation je Setting**:

- `setting` — die Zählachse: **eLoT** (early: neoadjuvant, adjuvant, perioperativ),
  **aLoT** (advanced: lokal fortgeschritten oder metastasiert) oder **iLoT**
  (investigational: ausschließlich nicht zugelassene Komponenten). Jede Achse
  zählt **getrennt**.
- `line` (X) — Zahl der *New LoTs* in diesem Setting; eine neue Linie entsteht
  nur bei klinischer Progression (cPD) oder fehlendem adäquatem Ansprechen.
- `modification` (Y) — Zahl der *Modified LoTs* seit der letzten New LoT
  (nicht-progressionsbedingte Änderungen); 0 = unmodifiziert, Reset bei jedem
  X-Inkrement.
- `notation` — optionale Gesamtdarstellung, z. B. „aLoT 2.1".

Die Designation wird **dokumentiert erfasst, nicht berechnet**. *Same LoTs*
(prospektiv geplante Änderungen inkl. Erhaltungstherapie) verändern die
Designation nicht.
"""
* insert Translation(^title, en, EnLiST LoT designation extension)
* insert Translation(^description, en, EnLiST designation of the systemic line of therapy in X.Y notation per setting axis: setting — eLoT early\, aLoT advanced or iLoT investigational\, each counted separately; line X — number of new LoTs\, incremented only on clinical progression or lack of adequate response; modification Y — number of modified LoTs since the last new LoT\, 0 when unmodified; notation — optional display such as aLoT 2.1. The designation is recorded\, not computed.)
* ^context.type = #element
* ^context.expression = "EpisodeOfCare"
* value[x] 0..0
* extension contains
    setting 1..1 MS and
    line 1..1 MS and
    modification 1..1 MS and
    notation 0..1
* extension[setting].value[x] only CodeableConcept
* extension[setting].valueCodeableConcept from EnlistLotSettingVS (required)
* insert Label(extension[setting], Setting-Achse, Zählachse nach EnLiST — eLoT\, aLoT oder iLoT; jede Achse zählt getrennt.)
* insert Translation(extension[setting] ^short, en, Setting axis)
* insert Translation(extension[setting] ^definition, en, EnLiST counting axis — eLoT\, aLoT or iLoT; each axis is counted separately.)
* extension[line].value[x] only positiveInt
* insert Label(extension[line], Liniennummer X, Zahl der New LoTs im Setting — neue Linie nur bei Progression oder fehlendem Ansprechen.)
* insert Translation(extension[line] ^short, en, Line number X)
* insert Translation(extension[line] ^definition, en, Number of new LoTs within the setting — a new line only on progression or lack of adequate response.)
* extension[modification].value[x] only unsignedInt
* insert Label(extension[modification], Modifikationszähler Y, Zahl der Modified LoTs seit der letzten New LoT — 0 = unmodifiziert\, Reset bei jedem X-Inkrement.)
* insert Translation(extension[modification] ^short, en, Modification counter Y)
* insert Translation(extension[modification] ^definition, en, Number of modified LoTs since the last new LoT — 0 when unmodified\, reset on each X increment.)
* extension[notation].value[x] only string
* insert Label(extension[notation], Notation, Gesamtdarstellung der Designation\, z. B. aLoT 2.1)
* insert Translation(extension[notation] ^short, en, Notation)
* insert Translation(extension[notation] ^definition, en, Display form of the designation\, e.g. aLoT 2.1)

Extension: EnlistCountableExt
Id: enlist-countable
Title: "EnLiST-Zählstatus (Extension)"
Description: """
Zählstatus der Behandlungslinie nach EnLiST: `counted` — die Linie liegt auf
einer EnLiST-Zählachse (eLoT/aLoT/iLoT; Details in der Extension `enlist-lot`);
`not-counted` — außerhalb jeder LoT-Zählung, z. B. lokoregionale
Behandlungslinie (Chirurgie, Strahlentherapie, Ablation) oder
Management-Abschnitt.
"""
* insert Translation(^title, en, EnLiST countability extension)
* insert Translation(^description, en, EnLiST countability of the treatment line: counted — the line lies on an EnLiST counting axis\, detailed in the enlist-lot extension; not-counted — outside any LoT count\, e.g. a locoregional treatment line or a management segment.)
* ^context.type = #element
* ^context.expression = "EpisodeOfCare"
* value[x] only CodeableConcept
* value[x] 1..1
* valueCodeableConcept from EnlistCountableVS (required)
* insert Label(value[x], Zählstatus, Zählstatus nach EnLiST — counted oder not-counted.)
* insert Translation(value[x] ^short, en, Countability)
* insert Translation(value[x] ^definition, en, EnLiST countability — counted or not-counted.)
