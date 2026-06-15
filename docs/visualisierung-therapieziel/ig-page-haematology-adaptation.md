# IG-Seitenentwurf: Adaption für hämatologische Neoplasien

> **Status:** Vorbereitendes Konzeptpapier für die spätere Übernahme in das IG-Repository (das IG selbst wird nicht hier entwickelt).
>
> **Normativer Status:** **Informativ.** Diese Seite definiert keine neuen Profile oder Pflichtfelder; sie beschreibt die Adaptationspfade, an denen sich künftige hämatologische Profile ausrichten sollen.

## 1. Scope

Das Kern-Datenmodell dieses IG orientiert sich am **ESMO EnLiST Framework (Saini et al., Ann Oncol 2026;37:608–623)** und ist primär für **solide Tumoren** ausgelegt. Die strukturierenden Achsen sind:

- **Clinical Setting** (early-stage / advanced-stage)
- **Treatment Intent** (curative / non-curative)
- **Line of Therapy** als `[eLoT + aLoT] + iLoT` im X.Y-Format
- **Mindestdatensatz** mit 10 Items (siehe Profil `TherapyLineEnLiST`)

Diese Seite beschreibt, **wie hämatologische Neoplasien an dasselbe Datenmodell angedockt werden können**, ohne dessen Kernstruktur zu verlassen.

## 2. Hintergrund: Warum eine eigene Seite

EnLiST adressiert in seinem Geltungsbereich explizit nur solide Tumoren. In der Hämatologie existieren krankheitsspezifische Response- und Risikokriterien (IMWG, ELN, iwCLL, Lugano, IWG-MDS, IWG-MRT), aber **kein** konsolidiertes LoT-Counting-Framework. Die einzige formale LoT-Konvention ist Rajkumar SV, Richardson PG, San Miguel JF — *Guidelines for determination of the number of prior lines of therapy in multiple myeloma* (Blood 2015;126(7):921-922), 11 Jahre alt und seither nicht aktualisiert.

Für RWD-, Studien- und Visualisierungszwecke ist es trotzdem nötig, hämatologische Verläufe in einer **strukturell vergleichbaren** Notation darzustellen. Diese Seite skizziert, wie das ohne neues Framework und mit minimaler Erweiterung des EnLiST-Modells gelingt.

Hintergrundübersicht der hämatologischen Ressourcen: siehe `liquid-cancer-lot-ressourcen.md`.

## 3. Adaptationsmuster

Drei kontrollierte Erweiterungen des EnLiST-Modells decken den hämatologischen Bedarf:

### 3.1 Phasen-Achse statt Setting-Achse

Die EnLiST-Achse `eLoT / aLoT` wird durch eine **entitätsspezifische Phasen-Achse** ersetzt. Empfohlene Ausprägungen (nicht-normativ, anschlussfähig an die jeweiligen Konsensdokumente):

| Entität | Phasen | Quelle |
|---|---|---|
| Multiples Myelom | `ndmm` / `rrmm` | Rajkumar 2015, IMWG 2016 |
| AML | `front-line` / `r/r` | ELN 2022 + 2024 |
| ALL | `front-line` / `r/r` | NCCN/ESMO |
| CML | `chronic-phase` / `accelerated` / `blast-phase` | ELN 2020 |
| CLL | `front-line` / `r/r` | iwCLL 2018 |
| Indolentes NHL | `watch-and-wait` / `front-line` / `r/r` / `transformed` | Lugano 2014/2016 |
| Aggressives NHL | `front-line` / `r/r` | Lugano 2014/2016 |
| Hodgkin-Lymphom | `front-line` / `r/r` | Lugano 2014/2016 |
| MDS | `lower-risk` / `higher-risk` | IWG-2023, IWG-2018 |
| MPN/MF | `chronic` / `high-risk` / `transformed` | IWG-MRT |

**Technisch:** Datenelement `lot_axis_type` mit Werten `solid-setting` (EnLiST) und `haem-phase` (Adaption). Bei `haem-phase` referenziert ein zusätzliches Datenelement `disease_phase` ein entitätsspezifisches CodeSystem.

### 3.2 Transformationsereignis

Phasenübergänge in der Hämatologie (Richter-Transformation, Blastenkrise, MDS→AML, indolentes NHL → aggressives NHL) sind klinisch und biologisch ein Bruch. Sie werden als **eigenes Ereignis** neben `cPD` modelliert:

- **Datenelement:** `transformation_event` (Datum, neue Entität/Phase, optional kommentar).
- **Verhalten:** Im neuen Phasenbereich startet die Zählung bei `1.0`. Die Verläufe der Vorphase bleiben in der Visualisierung als separate Spur sichtbar.
- **EnLiST-Analogon:** Funktional ähnlich dem Wechsel `early → advanced`, der die zweite Zählung beginnen lässt — nur entitätsspezifisch und nicht setting-basiert.

### 3.3 Cellular-Therapy-Sonderregeln

Hämatologische Verläufe enthalten regelmäßig zelluläre Therapien, deren LoT-Status uneinheitlich gehandhabt wird. Empfehlung für die Modellierung (nicht-normativ):

| Modalität | Regel | Vorbild |
|---|---|---|
| Autologe SZT | **Teil der vorhergehenden Linie** (nicht eigene LoT). | Rajkumar 2015 für MM, universalisiert. |
| Allogene SZT | **Teil der vorhergehenden Linie** als Konsolidierung. Optional Flag `consolidation_with_allo_hsct`. | ELN-Praxis. |
| CAR-T | **Eigene Linie**, da unabhängige Wirksubstanz mit eigenem Risikoprofil. | Studien- und Zulassungspraxis (Tisa-cel, Axi-cel, Ide-cel, Cilta-cel). |
| Bispecifics | **Eigene Linie** (analog konventioneller Antikörper). | EnLiST-konform. |
| Induktion → Konsolidierung → Maintenance | **Eine Linie**, sofern prospektiv geplant und vor Progression. | Rajkumar 2015. |

Diese Regeln sind im Profil als invariants/conditional rules abbildbar; die zelluläre Modalität wird im bestehenden SACT-`anticancer_modality`-Subkategoriesystem ergänzt (z. B. Code `4a-v` Cell and gene therapy ist EnLiST-konform).

### 3.4 MRD-Klausel

Prospektiv geplante MRD-getriebene Therapieanpassungen (Eskalation oder De-Eskalation entlang protokollierter MRD-Marker) zählen als **Same LoT** — analog zur EnLiST-Regel "prospectively planned changes". Damit werden MRD-adaptive Protokolle (häufig in ALL, AML, CML, MM) abgebildet, ohne die LoT-Zählung künstlich aufzublähen.

## 4. Was bleibt unverändert aus EnLiST

- **SACT-Definition** und ihre acht Subkategorien (zytotoxisch, endokrin, targeted, Immuntherapie, Zell-/Gentherapie, Vakzine, Radiopharmaka, Sonstige) sind direkt anwendbar.
- **iLoT** (Investigational LoT) wird unverändert übernommen — bei hämatologischen Patient\*innen in R/R-Linien sogar besonders häufig relevant.
- **X.Y-Notation** (New / Modified / Same LoT) bleibt erhalten.
- **Mindestdatensatz** (10 Items) bleibt erhalten; lediglich `clinical_setting` wird durch `disease_phase` ersetzt, wenn `lot_axis_type = haem-phase`.
- **Treatment Intent** (curative / non-curative) bleibt erhalten und ist in der Hämatologie besonders aussagekräftig (allo-SZT mit kurativer Intention).

## 5. Erweiterungspunkte im Datenmodell

| EnLiST-Element | Adaption für Hämatologie |
|---|---|
| `clinical_setting` (early / advanced) | Wird durch `disease_phase` ersetzt (entitätsspezifisches CodeSystem). |
| Implizit "Wechsel early→advanced" | Wird zu `transformation_event` mit eigenem Datentyp. |
| `anticancer_modality` 4a-v "Cell and gene therapy" | Subkategorien-Codes für auto-SZT, allo-SZT, CAR-T, Bispecifics erweitern. |
| Reporting-Format `[eLoT + aLoT] + iLoT` | Generalisiertes Format `[phase_a-LoT + phase_b-LoT + …] + iLoT`, entitätsspezifische Reihenfolge per CodeSystem. |
| Stop-Reason | Optional um MRD-getriebene Anpassung erweitern. |

## 6. Governance-Ausblick

Ein paneuropäisches Konsensframework analog zu EnLiST für hämatologische Neoplasien wäre die langfristig saubere Lösung. Realistische Konstellation:

- **Federführung:** EHA + HARMONY Alliance
- **Krankheitspartner:** IMWG, ELN, iwCLL, Lugano Steering / RECIL, IWG-MDS, IWG-MRT
- **Stakeholder:** Klinik, Studien, EMA/FDA, Patientenvertretung, Pharma, CROs, RWD/KI, Ethik
- **Realistisches Zeitfenster:** 2027–2028

Das Projekt kann als **Demonstrator** für ein solches Folgevorhaben dienen, indem die hier skizzierte Adaption frühzeitig in einer realen Datenstruktur und einer Visualisierung läuft.

## 7. Referenzen

- Saini KS et al. *EnLiST.* Ann Oncol 2026;37:608–623. DOI: [10.1016/j.annonc.2026.02.008](https://doi.org/10.1016/j.annonc.2026.02.008)
- Rajkumar SV et al. *Prior lines of therapy in MM.* Blood 2015;126(7):921-922.
- Döhner H et al. *AML 2022 ELN.* Blood 2022;140(12):1345-1377.
- Döhner H et al. *AML less-intensive 2024 ELN.* Blood 2024;144(21):2169-2179.
- ELN-DAVID MRD Working Party. *AML MRD 2025.* Blood 2025;147(11):1147.
- Hochhaus A et al. *CML ELN 2020.* Leukemia 2020;34(4):966-984.
- Hallek M et al. *iwCLL 2018.* Blood 2018;131(25):2745-2760.
- Cheson BD et al. *Lugano Classification.* J Clin Oncol 2014;32(27):3059-3068.
- Platzbecker U et al. *IWG-MDS 2023.* Blood 2023;141(17):2047-2061.
- HARMONY Alliance: [harmony-alliance.eu](https://www.harmony-alliance.eu/)
- Ressourcenübersicht im Projekt: `liquid-cancer-lot-ressourcen.md`
