# ESMO EnLiST — Zusammenfassung

**Quelle:** Saini KS, Koopman M, Martins-Branco D, et al. *ESMO adaptation of Lines of Systemic Therapy (EnLiST): a consensus framework for standardising the designation of lines of therapy in solid tumours.* Annals of Oncology, Vol. 37, Issue 5 (Mai 2026), S. 608–623. DOI: [10.1016/j.annonc.2026.02.008](https://doi.org/10.1016/j.annonc.2026.02.008)

**Typ:** Special Article / Konsenspapier der ESMO Real World Data & Digital Health Task Force. 59 Autor\*innen aus 23 europäischen Zentren plus Kollaborationen aus Kanada, USA, Israel.

**Datei im Projekt:** `visualisierung-therapieziel/esmo-enlist-framework-2026.pdf`

---

## 1. Hintergrund und Motivation

Die onkologische Behandlung ist durch eine stetig wachsende Zahl an Substanzen und Modalitäten (Zytostatika, endokrine Therapie, Targeted, Immuntherapie, Zell-/Gentherapie, Radiopharmaka) deutlich komplexer geworden. Begriffe rund um "Therapielinien" werden in Literatur, Studienprotokollen, Versorgungsdaten und regulatorischen Dokumenten **inkonsistent** verwendet. Das hat konkrete Folgen:

- **Studieneligibilität** ist häufig an "≥ 2 prior LoT" o. ä. gekoppelt — ohne einheitliche Definition werden Patient\*innen falsch ein- oder ausgeschlossen.
- **HTA, Zulassung und Erstattung** sind oft linienspezifisch ("zugelassen ab 2L") — uneinheitliche Zählung verzerrt Cost-Effectiveness und behindert grenzüberschreitende Versorgung.
- **Real World Data (RWD)** aus Registern und EHR-Plattformen werden ohne gemeinsames Vokabular schwer poolbar; cancer registries (auch im Rahmen des European Health Data Space, EHDS) leiden darunter.
- **Audit, Sequenzierung von Therapien, PROs** und prognostische Auswertungen brauchen eine reproduzierbare Bezugsachse.

Frühere Vorarbeiten (NHS England, NCCN/ChemoCare, Claims-basierte Schemata wie OPTUM, Saini & Twelves 2021) lieferten Teilaspekte, aber keinen umfassenden Standard für solide Tumoren. Hämatologische Vorbilder (z. B. multiples Myelom) sind wegen unterschiedlicher Krankheits- und Settinglogik nicht übertragbar. EnLiST schließt diese Lücke.

## 2. Methodik

Fünfphasiger, von ESMO koordinierter Prozess:

1. **Phase 1 (Delphi-Runden, Definitionen):** Schlüsselbegriffe einzeln zur Abstimmung; Mindestschwelle 75 %, finale Definitionen ≥ 91,7 %.
2. **Phase 2 (Format & Mindestdaten):** Reporting-Format und 10-Item-Datensatz.
3. **Phase 3 (Vignetten):** Tumor- und settingspezifische Fallbeispiele (Mamma, GI-untere, GI-obere, Gyn, Thorax, Uro, Sarkom/AYA, HNO/ZNS, Haut, Misc, Studien & Ethik). Umfrage an 547 ESMO-Faculty- und Working-Group-Mitglieder; Rücklauf 25 % (138 Antworten).
4. **Phase 4 (Brüssel-Workshop, 21.05.2024):** Hybrid mit 26 Stakeholdern (22 vor Ort, 4 virtuell); Diskussion der Survey-Ergebnisse, Konsolidierung von zunächst 7 auf 4 finale Leitlinien — alle einstimmig (100 %).
5. **Phase 5 (Finalisierung):** Letzte Konsensabstimmung über alle Elemente, Konsens ≥ 87,5 % für jedes Element.

Stakeholdergruppen: Medizinische Onkologie, Klinische Studien, Regulatoren, Akademiker, Patientenvertretung, Pharmazeutische Industrie, Auftragsforschung (CROs), RWD/KI-Spezialisten, Förderer, Ethiker.

## 3. Das EnLiST-Framework — Vier Komponenten

### 3.1 Definitionen (Kernbegriffe)

| Begriff | Kerninhalt |
|---|---|
| **Anticancer modality** | (i) **SACT** (s. u.), (ii) Chirurgie, (iii) Strahlentherapie (externe RT, Brachytherapie, Protonen, SRS, Radiomicrosphären — **ohne** Radiopharmaka), (iv) Sonstige (HIFU, Kryo, thermische Ablation, PDT, Hyperthermie, Embolisation, lokal verabreichte SACT ohne relevante systemische Exposition). |
| **Clinical progression of disease (cPD)** | Klinisch klare Verschlechterung durch die Malignität (Symptome, Befunde, Labor, Bildgebung). Wo möglich mit objektiven Kriterien (RECIST u. a.) abgleichen. cPD impliziert i. d. R. den Wechsel auf eine andere Anticancer Modality oder Best Supportive Care. |
| **Clinical setting** | (i) **Early-stage** (z. B. resektabel, ggf. mit kurativer Intention) und (ii) **Advanced-stage** (typischerweise inoperabel lokal fortgeschritten oder distal metastasiert). |
| **Intolerability** | Erhebliche körperliche, psychosoziale oder emotionale Toxizität, die zum Absetzen einer SACT führt. |
| **SACT** (Systemic Anticancer Therapy) | (Bio-)pharmazeutisches Produkt zur systemischen Tumorbehandlung. Achtsubkategorien: zytotoxisch, endokrin, targeted, Immuntherapie, Zell-/Gentherapie, Krebsvakzine, Radiopharmaka (auch I-131, Lu-177-Dotatat), Sonstige. **Pre-spezifiziert:** geplante Komponentenwechsel (Erhaltung A→A nach A+B) bleiben Teil desselben Regimes; Änderungen *aufgrund unzureichender Wirkung* gehören nicht zum geplanten Regime. SACT-Status hängt am EMA/FDA-Zulassungsstatus zum Startdatum: **approved** vs. **investigational**. |
| **LoT** (Line of Therapy) | Fortlaufende chronologische Nummer pro SACT-Regime — ein eigenständiger therapeutischer Versuch. Drei Settings (eLoT/aLoT/iLoT) werden separat gezählt. |
| **Treatment intent** | Kurativ (Eliminierung und Rezidivverhütung) vs. nicht-kurativ (lebensverlängernd oder palliativ). |

Wichtig: EnLiST nutzt **nicht** kurativ/palliativ als primäre Achse, sondern **eLoT/aLoT** — das Setting ist beobachtbarer und weniger missverständlich für Patient\*innen und Familien.

### 3.2 Reporting-Format

Drei Settings werden **separat** gezählt:

- **eLoT** — Early-stage (neoadjuvant, adjuvant, perioperativ in resektabler Situation)
- **aLoT** — Advanced-stage (lokal fortgeschritten oder metastasiert)
- **iLoT** — *Investigational*: SACT, deren Komponenten **ausschließlich** ohne EMA/FDA-Zulassung sind (unabhängig vom Setting). Ein einziges zugelassenes Agens reicht, dass das Regime als eLoT/aLoT zählt — auch wenn weitere experimentelle Agenzien dazukommen.

Notation pro Setting als **X.Y**:

- **X** = Gesamtzahl der *New LoTs* (links vom Punkt)
- **Y** = Gesamtzahl der *Modified LoTs* seit der letzten New LoT (rechts vom Punkt) — wird mit jeder neuen X auf 0 zurückgesetzt

**Gesamtdarstellung:** `[eLoT + aLoT] + iLoT`, z. B. `[eLoT 2.0 + aLoT 2.1] + iLoT 1.0`. Bei nicht stattgefundenen Linien steht `0`.

### 3.3 Mindestdatensatz (10 Items, 100 % Konsens)

1. **Clinical setting** (early / advanced locally / advanced metastatic)
2. **Treatment intent** (curative / non-curative)
3. **Datum der letzten cPD** (YYYY-MM-DD; bei Erstdiagnose ohne cPD: Diagnosedatum)
4. **Anticancer modality** (SACT, investigational SACT, Surgery, Radiotherapy, Other) — Subkategorien für SACT 4ai-viii s. o.
5. **SACT-Agent(en)**
6. **Startdatum** (YYYY-MM-DD)
7. **Stoppdatum** (YYYY-MM-DD)
8. **Grund des Absetzens** (cPD / geplantes Ende / Intoleranz / Patient- oder Arztwahl / Tod / Sonstiges)
9. **Kommentare**
10. **Lines of therapy** (`[eLoT + aLoT] + iLoT`)

### 3.4 Vier Leitlinien zur LoT-Zuweisung

1. **Neue SACT wegen cPD ODER fehlendem adäquaten Ansprechen → New LoT** (X+1).0 — gilt für die häufigsten Wechsel.
2. **Gleiche SACT fortgesetzt oder nach Treatment Holiday reintroduziert (ohne dazwischenliegende andere SACT) → Same LoT**; bei Setting-Wechsel early → advanced wird sie zusätzlich als **aLoT 1.0** geführt (eine SACT kann also gleichzeitig eLoT 1.0 und aLoT 1.0 sein).
3. **Ohne cPD ein Agens abgesetzt und durch anderes ersetzt** (z. B. Intoleranz, fehlende Verfügbarkeit, finanzielle Gründe) → **Modified LoT** X.(Y+1). Wichtig, damit die Exposition gegenüber dem alternativen Agens dokumentiert bleibt.
4. **Ohne cPD ein Agens abgesetzt** oder gleiche SACT nach Holiday reintroduziert → **Same LoT**; **Agens hinzugefügt** (nicht prospektiv geplant) → **Modified LoT**.

Prospektiv geplante Änderungen (Dosis, Schedule, Route, geplantes Absetzen von Komponenten, Erhaltung) bleiben **Same LoT**.

## 4. Beispiele aus dem Paper

- **Mammakarzinom Stage III:** FEC × 6 → BCS → EBRT → Tamoxifen × 2 J → Letrozol × 3 J geplant; Intoleranz bricht Letrozol ab → Wechsel auf Anastrozol = `eLoT 1.1` (Modified). Späteres isoliertes Lokalrezidiv → OP + Exemestan = `eLoT 2.0`. Spätere nicht-resektable Manifestation → Ribociclib + Fulvestrant = `aLoT 1.0`. Phase-I LAG3-Antikörper nach cPD = `iLoT 1.0`.
- **Chemoimmunotherapie 4 Zyklen, dann aus finanziellen Gründen Wechsel auf günstigeres Zytostatikum** ohne cPD → `aLoT 2.1` (Modified).
- **Mehrere AYA-/GI-/Gyn-/Thorax-Vignetten** in Supplementary Table S2 illustrieren Re-Challenge-, Maintenance- und Strahlentherapie-Kontexte.

## 5. Diskussion, Grenzen, Kontroversen

- **Lokoregionale Therapien (Chirurgie, RT, Ablation, Embolisation) bekommen keine LoT.** Abscopal-Effekte sind anerkannt, aber mechanistisch und klinisch unzureichend definiert. Eine spätere Version könnte das ändern, insbesondere bei Oligoprogression.
- **Chemoradiotherapie (CRT):** Je nach SACT-Dosis und klinischem Urteil LoT oder nicht. Beispiel: FOLFIRINOX im total-neoadjuvanten Rektumkarzinom = LoT.
- **Anwendung nur bei invasiven Tumoren.** Chemoprävention (z. B. endokrine Prävention bei Hochrisiko-Brustkrebs) und DCIS sind ausgeschlossen.
- **Re-Challenge nach Treatment Holiday:** Gynäkologische Onkolog\*innen zählen Platin-Re-Challenge oft als New LoT, GI-Onkolog\*innen Oxaliplatin-Re-Challenge oft als Same LoT. EnLiST entscheidet sich für die zweite Variante (Guideline 2) — sofern keine andere SACT dazwischen lag.
- **"Ähnlicher" Agentenwechsel:** Wenn ein Wirkstoff aus anderem Grund als cPD durch einen *strukturell und mechanistisch ähnlichen* ersetzt wird, wird das **immer** als Modified LoT gezählt. Eine harte Definition von "Ähnlichkeit" bleibt offen; eine detaillierte Dokumentation der Agenzien im Mindestdatensatz fängt das auf.
- **Keine Cut-off-Dauer für Treatment Holidays:** Bewusst keine "X Monate ohne Therapie = New LoT"-Regel — keine universell verteidigbare Schwelle.
- **iLoT ist regulatorisch wichtig:** Würde Investigational-SACT als eLoT/aLoT gezählt, wäre der Zugang zu späteren zugelassenen Therapien u. U. eingeschränkt (Erstattung an LoT gekoppelt). iLoT separiert klar.

## 6. Implementierung und Ausblick

- Aufruf an Studienprotokoll-Autor\*innen, Pharma, CROs, Patientenvertretung, Fachgesellschaften und Zahler, EnLiST in Studienprotokolle, regulatorische und Erstattungs-Workflows zu übernehmen.
- Standardisierung der Mindestdaten passt zum **European Health Data Space (EHDS)** und unterstützt nationale Krebsregister.
- Geplant: Praxisvalidierung ("road test") über mehrere Settings hinweg; **elektronische Versionen** der EnLiST-Dokumentation für EHR-/Prescribing-Plattformen.

## 7. Relevanz für das KIG-Onko-Projekt (Therapieziel-Visualisierung)

- **Direkter inhaltlicher Anschluss:** EnLiST liefert das international anschlussfähige strukturelle Modell, an dem sich jede Therapielinien- und Therapieziel-Visualisierung orientieren kann. Die Figure 1 des Papers ist faktisch schon ein erster Visualisierungs-Layout-Vorschlag (Swimlanes nach Setting × Zeit, Marker für cPD).
- **Trennung von Therapieziel und LoT-Zählung:** EnLiST trennt explizit *Treatment Intent* (kurativ/nicht-kurativ) vom *Clinical Setting* und davon wiederum der *LoT-Zählung*. Genau diese Trennung ist für unsere Visualisierung des Therapieziels essenziell — Patient\*innen, Kliniker\*innen und Datenmodelle interpretieren "kurativ" / "Linie 2" / "advanced" jeweils anders, EnLiST entkoppelt sie sauber.
- **Mapping auf MII-KDS / oBDS / FHIR:** Die 10 Mindestdaten-Items lassen sich nahezu 1:1 auf bestehende Datenelemente abbilden — Setting, Intent, cPD-Datum, Modalität, Agenzien, Start/Stop, Stop-Reason. Das senkt den Implementierungsaufwand und die Argumentationslast gegenüber Stakeholdern erheblich.
- **iLoT als Differenzierungsachse:** Für Patient\*innen in Studien ist die saubere Trennung in iLoT vor allem für Sequenz-Visualisierungen wertvoll (Studieneinschlüsse als eigene Spur statt Vermischung mit Regelversorgung).
- **Validierungspartnerschaft:** ESMO ruft explizit zu "road testing" mit Stakeholdern auf — eine konkrete Andockmöglichkeit, wenn das Projekt Demonstratoren für RWD-/Visualisierungsworkflows zeigt.
- **Kommunikationsnutzen:** EnLiST liefert auch Sprachregelungen (z. B. "eLoT/aLoT" statt "kurativ/palliativ"), die in Patient\*innen-Materialien und in der UI weniger angstbesetzt sind als die klassischen Termini.

## 8. Limitationen / offene Punkte

- "Locally advanced" wird unter aLoT geführt — pragmatisch, aber tumorspezifisch diskutabel (z. B. Hoden vs. Pankreas) und im Paper als zukünftiger Revisionsbereich markiert.
- Survey-Rücklauf in Phase 3 lag bei 25 % (138/547 ESMO-Mitglieder) — breite Versorgungsakzeptanz folgt erst im road testing.
- Lokoregionale Modalitäten (Chirurgie, RT) sind aktuell nicht LoT-zählend; für Visualisierungen müssen sie trotzdem dargestellt werden (Modalitäten-Spur), nur eben nicht als Linie nummeriert.
- Keine harte "Treatment-Holiday-Dauer" — für RWD-Algorithmen heißt das, Heuristiken bleiben tumorspezifisch.
- 100 % der genannten Erst-/Letztautoren und ein großer Teil der Koautor\*innen haben Industriebezüge (Disclosures explizit aufgelistet) — Finanzierung des Projekts erfolgte aber zentral aus ESMO-Mitteln, ohne externe Sponsoring.
