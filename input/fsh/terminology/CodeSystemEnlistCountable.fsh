CodeSystem: EnlistCountable
Id: enlist-countable
Title: "EnLiST-Zählstatus"
Description: "Zählstatus einer Behandlungslinie nach EnLiST (Saini et al., Ann Oncol 2026): in der LoT-Zählung, außerhalb der Zählung oder investigationale Studientherapie (iLoT)."
* insert Translation(^title, en, EnLiST countability)
* insert Translation(^description, en, Countability of a treatment line per EnLiST: within the LoT count\, outside the count\, or investigational study therapy — iLoT.)
* ^caseSensitive = true
* ^content = #complete
* #counted "Zählt in der LoT-Zählung" "Systemische Therapielinie, die nach EnLiST in die Linien-Zählung eingeht."
* #not-counted "Zählt nicht" "Behandlungslinie außerhalb der EnLiST-Zählung — z. B. lokoregionale Behandlungslinie (Chirurgie, Strahlentherapie, Ablation)."
* #investigational "iLoT — Studientherapie" "Investigational Line of Therapy nach EnLiST: Studientherapie, separat notiert statt regulär gezählt."

ValueSet: EnlistCountableVS
Id: enlist-countable
Title: "EnLiST-Zählstatus (ValueSet)"
Description: "Alle Zählstatus-Werte nach EnLiST."
* insert Translation(^title, en, EnLiST countability value set)
* insert Translation(^description, en, All EnLiST countability values.)
* include codes from system EnlistCountable
