# EnLiST – Analysebaustein „Onkologische Therapieziele"

Baustein für Liefergegenstand LG-01 · Gematik-Auftrag · BIH-CEI

**Quelle:** Saini KS, Koopman M, Martins-Branco D et al. *ESMO adaptation of Lines of Systemic Therapy (EnLiST): a consensus framework for standardising the designation of lines of therapy in solid tumours.* Annals of Oncology 2026;37(5):608–623. DOI: [10.1016/j.annonc.2026.02.008](https://doi.org/10.1016/j.annonc.2026.02.008)

**Status:** Publiziert Februar 2026, erster paneuropäischer Delphi-Konsens (26 Stakeholder, Endkonsens ≥ 87,5 %, vier Leitlinien einstimmig). Geltungsbereich solide Tumoren; hämatologische Adaption als separates Konzept.

## 1. Problemstellung, die EnLiST adressiert

Die Zählung von Therapielinien war in der internationalen Onkologie bislang inkonsistent: Studienprotokolle, Real-World-Datenbanken, Erstattungssysteme und einzelne Tumorboards verwendeten unterschiedliche Definitionen von "1L", "2L", "Maintenance" oder "Re-Challenge". Folgen waren u. a. nicht vergleichbare Studienpopulationen, fehlende Reproduzierbarkeit von Outcome-Auswertungen und Schwierigkeiten in der korrekten Anwendung linienspezifischer Zulassungen.

EnLiST stellt erstmals ein paneuropäisches Konsensvokabular bereit, das **was als Linie zählt**, **wie Modifikationen abgegrenzt werden** (New / Modified / Same) und **welche Setting-Stufe zugrunde liegt** (early / advanced / investigational) einheitlich regelt. Für unsere Spec ist EnLiST damit die strukturierende Achse, an der sich die Visualisierung und die FHIR-Modellierung von Therapielinien orientieren.

## 2. Übertragbares Muster: X.Y-Notation, Drei-Settings-Architektur, Mindestdatensatz

Drei strukturierende Elemente sind direkt übernehmbar:

**Settings-Trennung (separate Zählung):**
- **eLoT** – Early-stage (resektabel, neoadjuvant, adjuvant, perioperativ)
- **aLoT** – Advanced-stage (lokal fortgeschritten oder metastasiert)
- **iLoT** – Investigational: SACT mit ausschließlich nicht EMA/FDA-zugelassenen Komponenten, unabhängig vom Setting

**Notation pro Setting als X.Y:**
- X = Gesamtzahl der *New LoTs* (links vom Punkt)
- Y = Gesamtzahl der *Modified LoTs* seit der letzten New LoT (rechts vom Punkt; bei jedem X-Inkrement Reset auf 0)
- Gesamtdarstellung: `[eLoT + aLoT] + iLoT`, z. B. `[eLoT 2.0 + aLoT 2.1] + iLoT 1.0`

**Drei-Änderungstypen-Logik:**
- *New LoT* – bei klinischer Progression (cPD) oder fehlendem adäquatem Ansprechen
- *Modified LoT* – bei nicht-progressionsbedingten Änderungen (Intoleranz, Hinzunahme/Wechsel eines Wirkstoffs, finanzielle/logistische Gründe)
- *Same LoT* – bei prospektiv geplanten Änderungen (Dosis, Zeitplan, Applikationsweg, Erhaltungstherapie, Therapiepause mit unveränderter Reintroduktion)

**Mindestdatensatz (10 Items, 100 % Delphi-Konsens):**
1. Clinical setting · 2. Treatment intent · 3. Datum letzte cPD · 4. Anticancer modality · 5. SACT-Agent(en) · 6. Startdatum · 7. Stoppdatum · 8. Grund des Absetzens · 9. Kommentare · 10. Lines of therapy

**Vier Konsens-Leitlinien** regeln Re-Challenge nach Therapiepause, Wechsel ohne cPD, Hinzunahme/Wegfall von Wirkstoffen (siehe Sektion 3 für Mapping auf unsere Spec).

## 3. Anwendungsbeispiel (aus dem Paper)

Mammakarzinom Stage III mit kurativer Intention:
- FEC × 6 → BCS + EBRT → Tamoxifen 2 J → Letrozol 3 J geplant; Letrozol-Intoleranz, Wechsel auf Anastrozol = `eLoT 1.1` (Modified)
- Isoliertes Lokalrezidiv → Mastektomie + Exemestan = `eLoT 2.0` (New)
- Spätere nicht-resektable Manifestation → Ribociclib + Fulvestrant = `aLoT 1.0` (im fortgeschrittenen Setting eigene Zählung)
- Phase-I LAG3-Antikörper nach cPD = `iLoT 1.0`

Gesamtnotation: `[eLoT 2.0 + aLoT 1.0] + iLoT 1.0`. Das Beispiel zeigt, dass die Notation gleichzeitig Zeitverlauf, Setting-Übergänge und Studienbeteiligung in kompakter Form abbildet – direkt nutzbar als Achsenmodell für unsere Visualisierung.

## 4. Lücken in EnLiST und Lösungsansätze für unsere Spec

| Lücke / Designentscheidung in EnLiST | Lösungsansatz für unsere Spec |
|---|---|
| **Nur solide Tumoren** im Scope; Hämatologie ausgeklammert | Setting-Achse parametrierbar (`lot_axis_type` = `solid-setting` oder `haem-phase`); Hämatologie-Adaption als separate IG-Seite |
| **Lokoregionale Therapien** (Chirurgie, Strahlentherapie, Ablation) ohne LoT | Eigene Modalitäten-Spur in der Visualisierung, nicht in LoT-Zählung |
| Keine harte **Treatment-Holiday-Dauer** als Cut-off | Entitäts- und protokollspezifische Heuristiken zulassen; optional als Konfiguration |
| **"Locally advanced"** unter aLoT geführt – tumorspezifisch diskutabel | aLoT führen, aber `clinicalSetting` codiert (early / advanced-locally / advanced-metastatic) erhalten |
| **Chemoradiotherapie-LoT** abhängig von SACT-Dosis und klinischem Urteil | Im Mindestdatensatz optional als codiertes Kommentar-Feld "CRT included"; explizite Doku im IG |
| **Intent vs. Setting** entkoppelt – Paper rät zur Setting-Achse als primärer Strukturierung | Beide Felder erhalten: `clinicalSetting` und `treatmentIntent` separat, Setting impliziert nicht 1:1 Intent (z. B. palliativer Frühphasen-Einsatz) |
| Kein **FHIR-Profil-Set** – EnLiST ist konzeptionell, nicht profiltechnisch | Eigene Profile: `OnkoTherapyLine`, `OnkoTherapyIntent` (Extension), `OnkoClinicalSetting` (Extension); CodeSysteme `onko-lot-setting`, `onko-treatment-intent` |
| Keine direkte **Anbindung an MII KDS** | Mapping-Tabellen: EnLiST `anticancer_modality` × MII-Medikation; EnLiST `cPD` × oncoBox/oBDS-Progression; `stop_reason` × oBDS-Therapieendegrund |
| Keine **Transformationsereignisse** (auch in soliden Tumoren relevant, z. B. NSCLC → SCLC unter EGFR-TKI) | Eigenes Event-Konzept analog zur Hämatologie-Adaption; ValueSet `onko-transformation-event` |

## 5. Direkt übernehmbare Elemente

- **X.Y-Notation** mit `[eLoT + aLoT] + iLoT`-Gesamtdarstellung – als computable Repräsentation in einem `OnkoLineOfTherapy`-Profil mit Slot-basierten Komponenten
- **Drei-Änderungstypen-Logik** (New/Modified/Same) – ValueSet `onko-lot-change-type` und Pflichtfeld
- **Mindestdatensatz mit 10 Items** als MustSupport-Set des LoT-Profils
- **Vier Konsens-Leitlinien** als Invariants/Guidance im IG (z. B. `inv-onko-1`: "Re-Challenge nach Therapiepause ohne dazwischenliegendes anderes Regime ergibt Same LoT")
- **SACT-Definition** mit acht Subkategorien (zytotoxisch, endokrin, zielgerichtet, Immuntherapie, Zell-/Gentherapie, Krebsvakzine, Radiopharmaka, Sonstige) – CodeSystem `onko-anticancer-modality`
- **iLoT-Konzept** als Differenzierungsachse für Studienteilnahme – essenziell für RWD-Auswertbarkeit gemischter Real-World-/Studien-Verläufe
- **Trennung Intent / Setting / LoT-Zählung** als drei orthogonale Achsen – auch als Kommunikationsmuster für Workshop 1

## 6. Fazit: Was wir übernehmen und warum

**Übernehmen:**
- **X.Y-Notation und Drei-Settings-Architektur** als zentrale Strukturachse unseres Therapielinien-Konzepts. Begründung: einziger paneuropäischer Delphi-Konsens für solide Tumoren mit hohem Konsensgrad; international anschlussfähig; existierende Alternativen (Saini & Twelves 2021, NHS England, OPTUM Claims, ChemoCare) sind entweder Vorläufer oder kontextlimitiert; mCODE/PCO/IPS adressieren das Problem strukturell nicht.
- **Mindestdatensatz mit 10 Items** als MustSupport-Set. Begründung: 100 %-Konsens-Item-Liste, deckt sich semantisch mit MII-KDS-Medikation und oBDS-Therapie zu ~80 %; die im EnLiST-Mindestdatensatz zusätzlich strukturierten Felder (cPD-Datum, Treatment Intent, Stop-Reason als codiertes Set) sind in der MII teilweise abgedeckt (z. B. *SystemtherapieEndeGrund* in `Procedure.outcome` und der Onko-Verlauf), EnLiST aggregiert sie aber auf einer linienübergreifenden Ebene, die in MII bisher fehlt.
- **Trennung von Treatment Intent und Clinical Setting** als orthogonale Felder. Begründung: für deutsche Versorgung (palliative Frühphasen-Therapie, kurative Intention auch im fortgeschrittenen Setting bei Oligometastasen) ist die 1:1-Kopplung "advanced = palliativ" empirisch falsch; EnLiST entkoppelt sie sauber.
- **iLoT-Konzept** für Studienteilnahme. Begründung: in deutschen onkologischen Zentren (besonders Comprehensive Cancer Centers, NCTs) ist Studienbeteiligung Versorgungsstandard; ohne iLoT-Trennung wird die Erstattungslogik (Linien-gebundene Zulassung) verfälscht.

**Optional langfristig erweitern (jetzt nicht im Hauptpfad):**
- **Hämatologie-Adaption** durch Phasen-Achse statt Setting-Achse. Begründung: hämatologische Patient\*innen sind in deutschen Tumorzentren regelmäßig vertreten, aber ein hämatologisches EnLiST-Pendant ist nicht konsensual etabliert (außer Rajkumar 2015 für Multiples Myelom). Ohne Konsens und Evidenz würden wir uns die Spec unnötig erschweren; die Adaption wird daher als langfristige Erweiterung beschrieben, nicht als Pflichtinhalt von LG-03.
- **Transformationsereignisse** (z. B. NSCLC → SCLC unter EGFR-TKI). Begründung: klinisch relevant, aber tumorspezifisch und ohne breite Standardisierung – als optionale Extension einplanen, nicht als Pflichtfeld.

**Bewusst offen halten:**
- **Locally-advanced-Setting:** EnLiST führt es pauschal unter aLoT. Wir halten die Setting-Codierung über ein **`extensible` oder `preferred` Binding** offen, damit tumorspezifische Granularität (early / advanced-locally / advanced-metastatic) als Option möglich bleibt, ohne die Entscheidung im Hauptpfad zu erzwingen. Die finale Bindungsstärke ist mit der onkologischen Fachkommission abzustimmen.
- **Reine Konzeptebene:** wir liefern Profile, ValueSets, Extensions, Invariants in FHIR; das ist unser Mehrwert gegenüber dem rein konzeptionellen EnLiST.

## 7. Vor LG-01-Release zu verifizieren

- **Konformitätsstrategie:** EnLiST-Notation strikt oder mit Erweiterungen (Phasenachse Hämatologie, Transformationsevents) – Auswirkung auf internationalen Anschluss klären
- **GRADE-Bewertungsangaben** (qualityOfEvidence / strengthOfRecommendation) für Anbindung an S3-Leitlinien klären
- **Status des Frameworks:** "road testing" durch ESMO 2026–2027 – unsere Spec versionskompatibel zu möglichen Updates halten
- **Onkologische Fachkommission der KIG** einbinden für Validierung der Übertragbarkeit auf deutsche Versorgungsrealität (Konsiliumsärzte, Tumorboard-Strukturen). Verteilung dieses Berichts bzw. einer Kurzfassung über die **AG Interoperabilität in der Onkologie**.
- **Erhaltungstherapie und CRT:** Versorgungspraxis in DE gegen EnLiST-Auslegung spiegeln. EnLiST behandelt prospektiv geplante Erhaltungstherapie als *Same LoT* (z. B. CDK4/6-Inhibitor-Maintenance, Olaparib-Maintenance, FOLFIRINOX-TNT rectal); das passt für solide Tumoren. Hämatologische Erhaltungs- und Konsolidierungstherapie folgt einer anderen Logik (Induktion–Konsolidierung–Maintenance als eine Linie) und ist außerhalb des Hauptscope.

## 8. Quellen

- Saini KS, Koopman M, Martins-Branco D et al. *ESMO adaptation of Lines of Systemic Therapy (EnLiST): a consensus framework for standardising the designation of lines of therapy in solid tumours.* Annals of Oncology 2026;37(5):608–623. DOI: [10.1016/j.annonc.2026.02.008](https://doi.org/10.1016/j.annonc.2026.02.008)
- Saini KS, Twelves C. *Determining lines of therapy in patients with solid cancers: a proposed new systematic and comprehensive framework.* Br J Cancer 2021;125(2):155–163. (EnLiST-Vorgänger)
- Rajkumar SV, Richardson PG, San Miguel JF. *Guidelines for determination of the number of prior lines of therapy in multiple myeloma.* Blood 2015;126(7):921–922. (Hämatologie-Vorbild für Multiples Myelom, außerhalb des Hauptscope unserer Spec)
