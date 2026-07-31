// EnLiST-Terminologien (Saini et al., Ann Oncol 2026): Zählstatus,
// Setting-Achsen und Änderungstypen der Linien-Zählung.

CodeSystem: EnlistCountable
Id: enlist-countable
Title: "EnLiST-Zählstatus"
Description: "Zählstatus einer Behandlungslinie nach EnLiST: auf einer LoT-Zählachse (counted) oder außerhalb jeder Zählung (not-counted, z. B. lokoregionale Behandlungslinie)."
* insert Translation(^title, en, EnLiST countability)
* insert Translation(^description, en, Countability of a treatment line per EnLiST: on a LoT counting axis — counted — or outside any count — not-counted\, e.g. a locoregional treatment line.)
* ^caseSensitive = true
* ^content = #complete
* #counted "Zählt in der LoT-Zählung" "Systemische Therapielinie auf einer EnLiST-Zählachse (eLoT, aLoT oder iLoT); die Designation steht in der Extension enlist-lot."
* #not-counted "Zählt nicht" "Behandlungslinie außerhalb jeder EnLiST-Zählachse — z. B. lokoregionale Behandlungslinie (Chirurgie, Strahlentherapie, Ablation) oder Management-Abschnitt."

ValueSet: EnlistCountableVS
Id: enlist-countable
Title: "EnLiST-Zählstatus (ValueSet)"
Description: "Alle Zählstatus-Werte nach EnLiST."
* insert Translation(^title, en, EnLiST countability value set)
* insert Translation(^description, en, All EnLiST countability values.)
* include codes from system EnlistCountable

CodeSystem: EnlistLotSetting
Id: enlist-lot-setting
Title: "EnLiST-Setting-Achsen"
Description: "Die drei getrennt gezählten Setting-Achsen der EnLiST-Notation: eLoT (early), aLoT (advanced), iLoT (investigational)."
* insert Translation(^title, en, EnLiST setting axes)
* insert Translation(^description, en, The three separately counted setting axes of the EnLiST notation: eLoT early\, aLoT advanced\, iLoT investigational.)
* ^caseSensitive = true
* ^content = #complete
* #eLoT "eLoT — frühes Setting" "Early-stage Line of Therapy: resektable Situation — neoadjuvante, adjuvante und perioperative Systemtherapie."
* #aLoT "aLoT — fortgeschrittenes Setting" "Advanced-stage Line of Therapy: lokal fortgeschrittene oder metastasierte Situation."
* #iLoT "iLoT — investigational" "Investigational Line of Therapy: Systemtherapie mit ausschließlich nicht EMA/FDA-zugelassenen Komponenten, unabhängig vom Setting; eigene Zählachse."

ValueSet: EnlistLotSettingVS
Id: enlist-lot-setting
Title: "EnLiST-Setting-Achsen (ValueSet)"
Description: "Alle EnLiST-Setting-Achsen."
* insert Translation(^title, en, EnLiST setting axes value set)
* insert Translation(^description, en, All EnLiST setting axes.)
* include codes from system EnlistLotSetting

CodeSystem: EnlistChangeType
Id: enlist-change-type
Title: "EnLiST-Änderungstypen"
Description: "Die drei Änderungstypen der EnLiST-Zähllogik: New LoT (X+1, nur bei Progression oder fehlendem Ansprechen), Modified LoT (Y+1, nicht-progressionsbedingte Änderung) und Same LoT (prospektiv geplante Änderung, Designation unverändert). Vorgesehen für die Kennzeichnung von Therapieänderungen auf Request-Ebene."
* insert Translation(^title, en, EnLiST change types)
* insert Translation(^description, en, The three change types of the EnLiST counting logic: new LoT — X plus one\, only on progression or lack of adequate response; modified LoT — Y plus one\, non-progression-related change; same LoT — prospectively planned change\, designation unchanged. Intended for flagging treatment changes at request level.)
* ^caseSensitive = true
* ^content = #complete
* #new "New LoT" "Neue Linie (X+1): klinische Progression (cPD) oder fehlendes adäquates Ansprechen."
* #modified "Modified LoT" "Modifizierte Linie (Y+1): nicht-progressionsbedingte Änderung — Intoleranz, Hinzunahme/Wechsel eines Wirkstoffs, finanzielle oder logistische Gründe."
* #same "Same LoT" "Unveränderte Designation: prospektiv geplante Änderungen — Dosis, Zeitplan, Applikationsweg, Erhaltungstherapie, Therapiepause mit unveränderter Reintroduktion."

ValueSet: EnlistChangeTypeVS
Id: enlist-change-type
Title: "EnLiST-Änderungstypen (ValueSet)"
Description: "Alle EnLiST-Änderungstypen."
* insert Translation(^title, en, EnLiST change types value set)
* insert Translation(^description, en, All EnLiST change types.)
* include codes from system EnlistChangeType
