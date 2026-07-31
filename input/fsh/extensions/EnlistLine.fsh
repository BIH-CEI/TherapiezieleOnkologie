// =====================================================================
// EnLiST-Abbildung der Therapielinie (Saini et al., Ann Oncol 2026):
// Die Line of Therapy ist ein FACHLICHES KONTINUUM, das organisatorisch
// in mehrere Segmente zerfallen kann (EpisodeOfCare ist organisations-
// gebunden). Die X.Y-Designation existiert je Linie GENAU EINMAL — an
// der führenden Episode (main contributor) oder, im MII-only-Pfad ohne
// Episodenführung, an der systemischen Therapie-Procedure. Ausführende
// Instanzen tragen nur den Segment-Marker mit gemeinsamer lineId.
// Änderungstypen (New/Modified/Same) liegen auf der Request-Ebene.
// =====================================================================

Extension: EnlistLotExt
Id: enlist-lot
Title: "EnLiST-LoT-Designation (Extension)"
Description: """
EnLiST-Designation der systemischen Line of Therapy in **X.Y-Notation je Setting**:

- `setting` — die Zählachse: **eLoT** (early: neoadjuvant, adjuvant, perioperativ),
  **aLoT** (advanced) oder **iLoT** (investigational). Jede Achse zählt **getrennt**.
- `line` (X) — Zahl der *New LoTs* im Setting; neue Linie nur bei klinischer
  Progression (cPD) oder fehlendem adäquatem Ansprechen.
- `modification` (Y) — Zahl der *Modified LoTs* seit der letzten New LoT;
  0 = unmodifiziert, Reset bei jedem X-Inkrement.
- `notation` — optionale Gesamtdarstellung, z. B. „aLoT 2.1".
- `lineId` — Identifier der Linie (System
  `https://bih-cei.de/fhir/therapieziele-onkologie/sid/enlist-line`), verkettet
  ausführende Segmente (`enlist-line-segment`) mit der geführten Linie. Optional,
  wenn die Linie aus genau einer Episode besteht.

**Genau-einmal-Regel:** Die Designation liegt je Linie an genau einer Stelle —
an der **führenden Episode** (main contributor, `managingOrganization` = die
koordinierende Stelle) oder, wo keine Episodenführung existiert, an der
systemischen Therapie-`Procedure` (MII-Pfad). Sie wird dokumentiert erfasst,
nicht berechnet; *Same LoTs* (prospektiv geplante Änderungen inkl. Erhaltung)
verändern die Designation nicht.
"""
* insert Translation(^title, en, EnLiST LoT designation extension)
* insert Translation(^description, en, EnLiST designation of the systemic line of therapy in X.Y notation per setting axis. The line of therapy is a clinical continuum that may span multiple organisation-bound episodes; the designation exists exactly once per line — on the leading episode or\, in the MII-only path\, on the systemic therapy procedure. Executing segments link via the shared lineId. Recorded\, not computed.)
* ^context.type = #element
* ^context.expression = "EpisodeOfCare"
* ^context[+].type = #element
* ^context[=].expression = "Procedure"
* value[x] 0..0
* extension contains
    setting 1..1 MS and
    line 1..1 MS and
    modification 1..1 MS and
    notation 0..1 and
    lineId 0..1 MS
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
* extension[lineId].value[x] only Identifier
* insert Label(extension[lineId], Linien-Identifier, Gemeinsamer Identifier der Linie — verkettet ausführende Segmente mit der geführten Linie.)
* insert Translation(extension[lineId] ^short, en, Line identifier)
* insert Translation(extension[lineId] ^definition, en, Shared identifier of the line — links executing segments to the led line.)
* obeys onko-enlist-2

// Notation muss zur strukturierten Designation passen (z. B. "eLoT 1.0")
Invariant: onko-enlist-2
Description: "Die notation (falls vorhanden) muss aus setting, line und modification zusammengesetzt sein (z. B. 'eLoT 1.0')."
Severity: #warning
Expression: "extension.where(url = 'notation').exists() implies extension.where(url = 'notation').value = extension.where(url = 'setting').value.ofType(CodeableConcept).coding.first().code + ' ' + extension.where(url = 'line').value.toString() + '.' + extension.where(url = 'modification').value.toString()"

Extension: EnlistLineSegmentExt
Id: enlist-line-segment
Title: "EnLiST-Linien-Segment (Extension)"
Description: """
Markiert einen **ausführenden Behandlungsabschnitt** (Episode einer ausführenden
Einrichtung bzw. eine Therapie-`Procedure`) als Segment einer geführten Line of
Therapy. Trägt **keine eigene Designation**, sondern nur die gemeinsame
`lineId` der Linie (siehe `enlist-lot.lineId` an der führenden Episode).
So bleibt jede ausführende Instanz autonom dokumentationsfähig, ohne die
LoT-Zählung zu duplizieren — Auswerter zählen ausschließlich Träger von
`enlist-lot`.
"""
* insert Translation(^title, en, EnLiST line segment extension)
* insert Translation(^description, en, Marks an executing treatment segment — an episode of an executing organisation or a therapy procedure — as part of a led line of therapy. Carries no designation of its own\, only the shared lineId; evaluators count enlist-lot carriers only.)
* ^context.type = #element
* ^context.expression = "EpisodeOfCare"
* ^context[+].type = #element
* ^context[=].expression = "Procedure"
* value[x] only Identifier
* value[x] 1..1
* insert Label(value[x], Linien-Identifier, Identifier der Linie\, zu der dieses Segment gehört.)
* insert Translation(value[x] ^short, en, Line identifier)
* insert Translation(value[x] ^definition, en, Identifier of the line this segment belongs to.)

Extension: EnlistChangeTypeExt
Id: enlist-change
Title: "EnLiST-Änderungstyp (Extension)"
Description: """
EnLiST-Änderungstyp einer Therapieänderung auf Request-Ebene: **new** (eröffnet
eine neue Linie, X+1 — nur bei Progression/fehlendem Ansprechen), **modified**
(Y+1 — nicht-progressionsbedingte Änderung; bei Ersetzung eines Vorgängers
zusätzlich `priorPrescription`) oder **same** (prospektiv geplante Änderung
inkl. Erhaltungstherapie — Designation unverändert). Die Sequenz geplanter
Blöcke liegt in der RequestGroup, nicht in `priorPrescription`.
"""
* insert Translation(^title, en, EnLiST change type extension)
* insert Translation(^description, en, EnLiST change type of a treatment change at request level: new — opens a new line\, X plus one; modified — Y plus one\, non-progression-related\, with priorPrescription when replacing a predecessor; same — prospectively planned change including maintenance\, designation unchanged.)
* ^context.type = #element
* ^context.expression = "MedicationRequest"
* value[x] only CodeableConcept
* value[x] 1..1
* valueCodeableConcept from EnlistChangeTypeVS (required)
* insert Label(value[x], Änderungstyp, EnLiST-Änderungstyp — new\, modified oder same.)
* insert Translation(value[x] ^short, en, Change type)
* insert Translation(value[x] ^definition, en, EnLiST change type — new\, modified or same.)

Extension: EnlistCountableExt
Id: enlist-countable
Title: "EnLiST-Zählstatus (Extension)"
Description: """
Zählstatus der Behandlungslinie nach EnLiST: `counted` — die Linie liegt auf
einer EnLiST-Zählachse (Designation in `enlist-lot` an der führenden Episode
bzw. Segment-Marker `enlist-line-segment`); `not-counted` — außerhalb jeder
LoT-Zählung, z. B. lokoregionale Behandlungslinie (Chirurgie, Strahlentherapie,
Ablation) oder Management-Abschnitt.
"""
* insert Translation(^title, en, EnLiST countability extension)
* insert Translation(^description, en, EnLiST countability of the treatment line: counted — the line lies on an EnLiST counting axis\, with the designation in enlist-lot on the leading episode or the segment marker; not-counted — outside any LoT count\, e.g. a locoregional treatment line or a management segment.)
* ^context.type = #element
* ^context.expression = "EpisodeOfCare"
* value[x] only CodeableConcept
* value[x] 1..1
* valueCodeableConcept from EnlistCountableVS (required)
* insert Label(value[x], Zählstatus, Zählstatus nach EnLiST — counted oder not-counted.)
* insert Translation(value[x] ^short, en, Countability)
* insert Translation(value[x] ^definition, en, EnLiST countability — counted or not-counted.)
