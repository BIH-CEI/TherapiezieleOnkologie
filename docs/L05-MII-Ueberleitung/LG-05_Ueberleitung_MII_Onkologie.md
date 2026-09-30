# Überleitung der Datenpunkte in das MII-Kerndatensatzmodul Onkologie

Liefergegenstand LG-05 · Spezifikation „Onkologische Therapieziele" · Gematik-Auftrag C002717 · BIH-CEI

**Stand:** 30. September 2026
**Bezugsfassung des Leitfadens:** aktueller Stand nach Umsetzung der Ballot-Kommentare und dem Episodenart-Umbau, aufsetzend auf der kommentierten Fassung `1.0.0-ballot`
**Adressat:** Koordinierungsgremium für Interoperabilität im Gesundheitswesen (KIG) / Auftraggeber
**Einreichungsweg:** Kommentierungskommentar in die laufende Kommentierung des MII-Moduls Onkologie
**Zieltermin der vollzogenen Überleitung:** Ende 2027
**Projektleitung:** Sylvia Thun
**Technische Leitung FHIR:** Thomas Debertshäuser


# Zusammenfassung

Der Implementierungsleitfaden „Therapieziele Onkologie" (`de.bih-cei.therapieziele-onkologie`) wird derzeit auf GitHub entwickelt und gehostet: Quellen unter [github.com/BIH-CEI/TherapiezieleOnkologie](https://github.com/BIH-CEI/TherapiezieleOnkologie), gerendert unter [bih-cei.github.io/TherapiezieleOnkologie](https://bih-cei.github.io/TherapiezieleOnkologie/). Er ist so konstruiert, dass er **kein paralleles Datenmodell** aufbaut, sondern das MII-Kerndatensatzmodul Onkologie als Datenelemente- und Terminologiebasis nutzt (Architekturentscheidung ADR-0013). Dieses Dokument weist nach, dass **jeder** im Leitfaden eingeführte Datenpunkt einen definierten Landeplatz hat, und benennt für jeden Datenpunkt Ziel, Überleitungsweg, Abhängigkeit und Entscheidungsbedarf.

**Kernaussagen**

1. **Der Leitfaden schließt eine substanzielle Lücke.** Das MII-Modul Onkologie kennt weder ein `Goal`- noch ein `EpisodeOfCare`-Profil. Behandlungsziel, Zielakzeptanz (Shared Decision), Zielerreichung und der Behandlungsabschnitt als eigene Entität sind im Kerndatensatz derzeit nicht abbildbar. Das ist keine Randlücke: Sie betrifft genau die Datenpunkte, die die gematik beauftragt hat.

2. **Die Überleitung folgt fünf Wegen** — neue Profile im MII-Modul Onkologie (Therapieziel, Behandlungsepisode), Aufgehen in bestehenden MII-Profilen (Empfehlungsplan und Tumorboard-Empfehlungen in `MII_PR_Onko_Tumorkonferenz` und die Therapieempfehlungs-Profile), bereits gedeckte Artefakte, die bei der Überleitung ersatzlos entfallen (Tumordiagnose), Einreichung bei ISiK — perspektivisch Überführung in die Kernprofile — mit onkologischer Ableitung im MII-Modul (Behandlungs- und Diagnostikplan) sowie Verbleib im Leitfaden (Szenarien, logisches Modell, entitätsübergreifende Kapitel).

3. **Die Einreichung erfolgt jetzt, die Integration bis Ende 2027.** Die Überleitung wird als **Kommentierungskommentar in die laufende Kommentierung** des Moduls eingebracht — das ist der reguläre Weg, auf dem eine Änderung in ein MII-Modul gelangt, und er steht offen, solange die Kommentierungsfrist läuft. Die inhaltliche Aufnahme der Profile und Terminologien erfolgt anschließend mit dem Release des Moduls; Zieltermin für die vollzogene Integration ist **Ende 2027**.

4. **Zwei Abstimmungen sind Voraussetzung, nicht Folge.** Erstens mit dem MII-Modul **Molekulares Tumorboard (MTB)**: Es leitet seinen `MII_PR_MTB_Therapieplan` bereits von `mii-pr-onko-tumorkonferenz` ab und führt seinerseits eine „Behandlungsepisode" — allerdings als `ClinicalImpression` mit anderer fachlicher Bedeutung. Zweitens mit **ISiK**, das den Behandlungsplan als versorgungsnahes Artefakt aufnimmt — mit der Perspektive, ihn später auf die Ebene der **Kernprofile** zu heben, sobald er sich im Krankenhausbetrieb bewährt hat.

5. **Bei der Intention sind beide Seiten deckungsgleich, bei der Modalität nicht.** Der Leitfaden trennt inzwischen wie das MII-Modul: Intention beantwortet das *Wozu* (kurativ, palliativ, supportiv), die Stellung zur Operation (neoadjuvant, adjuvant, intraoperativ, additiv) steht in einer eigenen Kontext-Achse und deckt damit `mii-cs-onko-therapie-stellungzurop` ab. Offen bleibt `mii-cs-onko-therapie-typ`, das Behandlungsmodalität (Chemo-, Hormon-, Immuntherapie) und Versorgungsstrategie (Watchful Waiting, Active Surveillance) in einer Liste vermischt, die der Leitfaden in zwei Merkmale trennt — Episodenart und Modalität. Das ist über ConceptMaps auflösbar, muss aber entschieden werden.

**Mengengerüst der Überleitung**

| Weg | Artefakte | Ziel |
|---|---:|---|
| **A** — Neues Artefakt im MII-Modul Onkologie | 2 Profile, 8 Extensions, 5 CodeSystems, 11 ValueSets, 4 ConceptMaps | MII KDS Onkologie |
| **B** — Aufgehen in bestehendem MII-Profil | 4 bestehende Profile werden ergänzt | MII KDS Onkologie |
| **C** — Bereits gedeckt | Tumordiagnose und Ergebnis-Observations; im Leitfaden bereits vollzogen | — |
| **D** — Einreichung bei ISiK, später Kernprofile, Ableitung im MII-Modul | 1 Profil (zwei Ausprägungen) | ISiK → Kernprofile → MII |
| **E** — Verbleibt im Leitfaden | logisches Modell, Beispiele, 4 Entitätskapitel | BIH-CEI |


# 1 Auftrag, Gegenstand und Abgrenzung

## 1.1 Auftrag

Die Spezifikation „Onkologische Therapieziele" wurde am 02.04.2026 von der gematik (Vertrag C002717) beauftragt und soll als FHIR-Implementation-Guide vorliegen, **ergänzt um ein Konzept zur MII-Integration**. Dieses Dokument ist dieses Konzept in seiner ausführenden Form: Es beschreibt nicht, *ob* integriert wird, sondern *wie* jeder einzelne Datenpunkt in das MII-Modul übergeht.

## 1.2 Gegenstand

Gegenstand sind sämtliche im Leitfaden definierten Artefakte im aktuellen Stand:

- **5 Profile** — `OnkoTherapyGoal` (Goal), `OnkoCarePlan` (CarePlan), `OnkoBehandlungsepisode` (EpisodeOfCare), `TumorboardServiceRequest`, `TumorboardMedicationRequest`
- **9 Extensions**, davon 8 projekteigene
- **5 CodeSystems, 11 ValueSets, 1 ConceptMap**
- **1 logisches Modell** (`TherapiezielDreieck`) mit 51 Datenelementen
- **6 Invarianten**

Gegenüber der kommentierten Ballot-Fassung entfallen zwei Profile ersatzlos: `DiagnosticCarePlan` und `OnkoCondition`. Der diagnostische Abschnitt wird seither über `CarePlan.category` (ValueSet `onko-care-plan-phase`) vom therapeutischen unterschieden statt über ein zweites Profil; die Tumordiagnose wird direkt über das MII-Diagnoseprofil referenziert, ohne eigene Ableitung. Beides geht auf die Kommentierung zurück und ist für die Überleitung eine Erleichterung — zwei Artefakte weniger, die überzuleiten wären.

Die Datenpunkt-Ebene dieses Dokuments ist das **logische Modell**, nicht die FHIR-Elementliste. Das logische Modell ist die fachliche Normalform des Leitfadens; die FHIR-Pfade sind seine Realisierung. Die Überleitung muss auf der fachlichen Ebene tragen, sonst überträgt sie Implementierungszufälle.

## 1.3 Abgrenzung

Zielmodul dieser Überleitung ist ausschließlich das **MII-Kerndatensatzmodul Onkologie**. Ob überhaupt Landeplätze in Nachbarmodulen (Medikation, Prozedur, Fall, PROs, Studie) benötigt werden, ist noch zu prüfen; wo sie die Überleitung berühren, werden sie benannt, aber nicht ausmodelliert. Für die Terminologie-Anbindung an das MII-Modul MTB gilt dasselbe: Abstimmungsbedarf wird benannt, die Abstimmung selbst ist nicht Gegenstand dieses Dokuments.

Nicht Gegenstand sind ferner die ePA-Dokumentenarchitektur (ADR-0001 ff.), die CPG-on-FHIR-Anbindung (ADR-0011) und die EHDS-Brücke nach IPS/EPS (ADR-0014). Diese Schichten liegen oberhalb bzw. seitlich des Kerndatensatzes, da sie sich mit den strukturellen Datenaustauschformaten bzw. der abstrakten Abbildung von Leitlinien befassen und nicht mit den konkreten instanziierten Datenelementen selbst.


# 2 Ausgangslage

## 2.1 Der Leitfaden

Der Leitfaden modelliert das **Therapieziel-Dreieck**: Behandlungsepisode (*wer behandelt in welchem Abschnitt*), Therapieziel (*was soll erreicht werden*) und Versorgungsplan (*was ist geplant*). Das tragende Prinzip ist, dass **das Ziel dem Plan vorausgeht**: Erst wird — per Shared Decision bzw. Tumorboard — das Ziel festgelegt, dann folgt der Plan zu seiner Erfüllung. `CarePlan.goal` ist eine Verfolgungs-Referenz, kein Besitz.

Der Leitfaden ist bereits heute an MII gekoppelt: Die Abhängigkeit auf `de.medizininformatikinitiative.kerndatensatz.onkologie` ist in `sushi-config.yaml` gepinnt, und sämtliche Diagnosereferenzen zeigen über `targetProfile` direkt auf `mii-pr-onko-diagnose-primaertumor`. Die Überleitung ist damit kein Bruch, sondern die Fortsetzung einer bestehenden Kopplung.

**Zur Fassungslage.** Die Kommentierung lief auf `1.0.0-ballot` — zuletzt vor Beginn der Kommentarumsetzungen am 03.08.2026 veröffentlicht. Seither ist der Leitfaden in zwei Schritten fortentwickelt worden: zunächst durch die **Umsetzung der eingegangenen Kommentare** — dabei entfielen die Profile `DiagnosticCarePlan` und `OnkoCondition`, und es kamen die Kontext-Extension sowie die ValueSets für CarePlan-Phase und Zielbeginn hinzu —, anschließend durch den hier beschriebenen **Episodenart-Umbau**. Dieses Dokument beschreibt den Stand nach beiden Schritten. Wo er von der kommentierten Fassung abweicht, ist das ausgewiesen; der Kommentar selbst muss diese Fortentwicklung offenlegen (Risiko 6).

## 2.2 Das MII-Modul Onkologie

Das Modul ist oBDS-getragen: Sein logisches Modell (`MII_LM_Onko`) bildet Diagnose, Histologie, TNM, Residualstatus, Fernmetastasen, Leistungszustand, Operation, Strahlentherapie, systemische Therapie, Nebenwirkungen, Verlauf, Tumorkonferenz, Tod, genetische Variante und Studienteilnahme ab. Es ist damit stark auf **Befund und durchgeführte Maßnahme** ausgerichtet.

Was es **nicht** enthält (geprüft gegen `2027.0.0-ballot.1`, 98 StructureDefinitions):

| Fehlendes Konzept | Konsequenz |
|---|---|
| Kein `Goal`-Profil | Behandlungsziel, Zielwert, Zielerreichung und Zielakzeptanz sind nicht abbildbar |
| Kein `EpisodeOfCare`-Profil | Der Behandlungsabschnitt existiert nur implizit über Zeiträume an Prozeduren |
| Keine Therapielinien-Zählung | Line of Therapy (LoT) ist weder dokumentierbar noch auswertbar |
| Kein Shared-Decision-Element | Nur `Therapieabweichung auf Patientenwunsch` (J/N/U) am Empfehlungspunkt |
| Keine Ziel-Ergebnis-Verknüpfung | `Verlauf` und `Residualstatus` existieren, sind aber an kein Ziel gebunden |

Vorhanden und für die Überleitung tragend sind: `MII_PR_Onko_Tumorkonferenz` (CarePlan), `MII_PR_Onko_Therapieempfehlung_Medikation` (MedicationRequest), `MII_PR_Onko_Therapieempfehlung_Operation` (ServiceRequest), `MII_PR_Onko_Therapieempfehlung_Kombinationstherapie` (RequestGroup), `MII_PR_Onko_Systemische_Therapie` (Procedure), `MII_PR_Onko_Verlauf` und `MII_PR_Onko_Residualstatus` (Observation).

## 2.3 Das MII-Modul MTB als Nachbar

Das Modul Molekulares Tumorboard ist für diese Überleitung kein entferntes Nachbarmodul, sondern ein direkter Vorbelegungsfall:

- `MII_PR_MTB_Therapieplan` (CarePlan) **leitet bereits von `mii-pr-onko-tumorkonferenz` ab**. Das ist das Muster, dem die Überleitung des Empfehlungsplans folgen muss — und zugleich die Randbedingung: Jede Ergänzung an `Tumorkonferenz` wirkt sich auf MTB aus.
- `MII_PR_MTB_Behandlungsepisode` trägt denselben Begriff wie unser Profil, ist aber eine **`ClinicalImpression`** — fachlich eine Fallvorstellung mit Zustandsbild und Voruntersuchungen, nicht ein Versorgungsabschnitt mit Intention und Zeitraum. Begriffskollision bei unterschiedlicher Semantik.
- `MII_EX_MTB_Empfehlung_Prioritaet` und `MII_EX_MTB_Empfehlung_Evidenzgraduierung` sind funktional benachbart zu unserer Zielpriorität bzw. Leitlinienbindung. Dabei ist die Ausgangslage im MTB eine besondere: Patientinnen und Patienten, die eine vertiefende Diagnostik an einem Molekularen Tumorboard erhalten, sind häufig entweder bereits „austherapiert" — die Leitlinien sehen keine weiteren Therapien vor —, oder es handelt sich um seltene Tumore, für die es keine oder wenig übergreifende Evidenz gibt und die daher direkt personalisiert behandelt werden. Eine Leitlinienbindung des Zielwerts trägt in diesen Fällen nicht; das Ziel muss individuell begründbar bleiben.

## 2.4 Versionsbezug

| Artefakt | Version | Anmerkung |
|---|---|---|
| Leitfaden | `1.0.0-ballot` | `de.bih-cei.therapieziele-onkologie` |
| Abhängigkeit im Leitfaden gepinnt | `2026.0.3` | Stand `sushi-config.yaml` |
| Analysegrundlage dieses Dokuments | `2027.0.0-ballot.1` | aktuell ballotierendes Modul |
| Zielversion der Überleitung | Fassung, die aus der laufenden Kommentierung hervorgeht | Einreichung als Kommentierungskommentar; Integration bis Ende 2027 |

**Folgeaufgabe:** Das Pinning im Leitfaden ist auf die Release-Version nachzuziehen, sobald das Modul veröffentlicht ist (AP 8). Bis dahin beziehen sich alle Aussagen dieses Dokuments auf `2027.0.0-ballot.1`; Abweichungen zum jeweils aktuellen Kommentierungsstand sind vor der endgültigen Disposition erneut zu prüfen.


# 3 Überleitungsstrategie

## 3.1 Fünf Wege

| Weg | Bedeutung | Kriterium |
|---|---|---|
| **A** | Neues Artefakt im MII-Modul Onkologie | Kein Pendant vorhanden; das Artefakt geht ins MII-Modul Onkologie über und wird dort weiterentwickelt und gepflegt |
| **B** | Aufgehen in bestehendem MII-Profil | Pendant vorhanden, Erweiterung reicht aus; kein zweites Profil für dieselbe Sache |
| **C** | Bereits gedeckt | Der Leitfaden leitet ab bzw. referenziert; bei Überleitung entfällt das eigene Artefakt |
| **D** | Einreichung bei ISiK, später Kernprofile, Ableitung im MII-Modul | Versorgungsnahes, nicht onkologiespezifisches Artefakt mit onkologischer Ausprägung |
| **E** | Verbleibt im Leitfaden | Erläuternd, beispielhaft oder entitätsübergreifend; gehört nicht in einen Kerndatensatz |

Leitprinzip bei der Zuordnung: **kein zweites Profil für dieselbe Sache.** Wo das MII-Modul bereits eine Entität führt, wird sie ergänzt, nicht dupliziert. Das ist der Grund, warum der Empfehlungsplan in `Tumorkonferenz` aufgeht und nicht als eigenes Profil danebentritt.

## 3.2 Zeitpunkt und Einreichungsweg

Einreichung und Integration fallen zeitlich auseinander, und das ist beabsichtigt.

**Einreichung: jetzt, als Kommentierungskommentar.** Die Überleitung wird als Kommentar in die **laufende Kommentierung** des Moduls `de.medizininformatikinitiative.kerndatensatz.onkologie` eingebracht. Das ist kein Umweg, sondern der reguläre Weg: Die Kommentierung ist genau das Verfahren, in dem inhaltliche Änderungen an einem MII-Modul vorgebracht und disponiert werden. Wer eine Erweiterung erst nach Abschluss der Kommentierung anmeldet, verliert einen vollen Modulzyklus.

Eingereicht wird **ein geschlossener Kommentar** mit diesem Dokument als Grundlage — nicht eine Zerlegung in Einzelvorschläge. Der Grund ist inhaltlich: Das Therapieziel-Dreieck trägt nur als Ganzes. Ein Therapieziel ohne Behandlungsepisode verliert das Episodenziel und die Linienzuordnung; eine Episode ohne Ziel ist ein Zeitraum ohne Zweck; die Terminologien haben ohne die Profile keinen Anker. Eine stückweise Disposition — dieses Element ja, jenes vertagt — ergäbe einen Torso, der weder die beauftragten Datenpunkte abdeckt noch in sich konsistent wäre. Die Überleitung ist deshalb als **eine** Entscheidung vorzulegen und als eine zu disponieren.

**Integration: mit dem Modul-Release, Zieltermin Ende 2027.** Die tatsächliche Aufnahme der Profile, Extensions und Terminologien erfolgt in der Fassung, die aus der Kommentierung hervorgeht. Vollzogen — einschließlich der ConceptMaps, der MII-Ableitung des Behandlungsplans und des Rückbaus der Duplikate im Leitfaden — soll die Überleitung **bis Ende 2027** sein. Davon ausgenommen sind technische Änderungen, die sich aus der Integration der Ressourcen und aus der laufenden Kommentierung des Onkologie-Moduls ergeben, sowie die Korrektur redaktioneller und technischer Fehler.

**Zwei Randbedingungen bleiben dabei bestehen:**

- `MII_PR_Onko_Tumorkonferenz` wird durch Weg B verändert und ist Basis von `MII_PR_MTB_Therapieplan`. Die Kommentare zu Weg B betreffen damit zwei Module und sind entsprechend zu adressieren (siehe 3.3).
- Die Ballot-Fassung kann sich im Verlauf der Kommentierung noch ändern. Die Analyse dieses Dokuments bezieht sich auf `2027.0.0-ballot.1` und ist vor der endgültigen Disposition gegen den dann aktuellen Stand zu prüfen.

## 3.3 Abstimmungsbedarf vor Einreichung

| Gegenüber | Gegenstand | Warum vorgelagert |
|---|---|---|
| MII AG Onkologie / TF KDS | Aufnahme von Therapieziel und Behandlungsepisode als neue Profile; Ergänzung von `Tumorkonferenz` | Modulhoheit |
| MII-Modul MTB | Begriff „Behandlungsepisode"; Auswirkung der `Tumorkonferenz`-Ergänzung auf `MII_PR_MTB_Therapieplan`; Verhältnis Zielpriorität ↔ `MII_EX_MTB_Empfehlung_Prioritaet` | MTB erbt von `Tumorkonferenz` und belegt den Begriff bereits anders |
| ISiK | Aufnahme des Behandlungsplan-Profils | Besprochen und für die kommende **Version 7.0** angedacht; Weg D setzt diese Aufnahme voraus, bevor das MII-Profil davon ableiten kann |
| HL7 Deutschland — Kernprofile | Perspektivische Überführung des Behandlungsplans auf die nationale Basisebene | Zielbild der Stufung; die Entscheidung fällt erst nach Bewährung in ISiK, die Kompatibilität ist aber von Beginn an zu wahren |
| TC Terminologien / Interop Council | Trennung Episodenart ↔ Modalität gegenüber `mii-cs-onko-therapie-typ` | Betrifft die oBDS-Kompatibilität des Kerndatensatzes. Die Intentionsfrage ist mit der Trennung von Intention und Kontext (6.2) entschieden und nur noch redaktionell nachzuziehen |


# 4 Überleitung nach Artefakten

## 4.1 Therapieziel (`Goal`) → Weg A

**Ziel:** neues Profil im MII-Modul Onkologie, Arbeitstitel `MII_PR_Onko_Therapieziel`, abgeleitet aus `OnkoTherapyGoal`.

Es gibt im MII-Modul kein `Goal`-Profil und kein Element, das ein Behandlungsziel trägt. Die Überleitung ist daher eine echte Neuaufnahme, keine Erweiterung. Sie bringt fünf Fähigkeiten in den Kerndatensatz, die dort heute fehlen:

1. **Zielart** (`Goal.category`, ValueSet `onko-therapy-goal-type`): Heilung, Lebensverlängerung, Symptomkontrolle, Lebensqualität, Funktionserhalt. Mit ConceptMap auf SNOMED-CT-Zielzustände; die Beziehungsqualität ist ehrlich dokumentiert, einschließlich des `unmatched` bei Funktionserhalt. *Folgeaufgabe für die finale Onko-Spezifikation (nicht für dieses Dokument): eine Tabelle mit Anwendungsbeispielen je Zielart.*
2. **Zielwert** (`Goal.target`): Zielgröße, angestrebter Wert, Frist. Der Anschluss an die Leitlinienversionierung ist in ADR-0023 geregelt.
3. **Zielerreichung** (`Goal.lifecycleStatus` × `Goal.achievementStatus`): Warum die Zielverfolgung endet, und mit welchem Grad. Die Statuskonvention ist bewusst restriktiv. Zugelassen sind nur die vier **Zustands-Codes** `in-progress`, `achieved`, `not-achieved` und `not-attainable`; `completed` im Lebenszyklus nur bei Erfolg. Nicht zugelassen sind die fünf **Trajektorie-Codes** `improving`, `worsening`, `no-change`, `sustaining` und `no-progress`: `Goal.achievementStatus` ist `0..1` und führt keine Historie, und die Codes definieren keinen Bezugspunkt — es bliebe offen, ob gegen Baseline, Nadir oder Vorwert verglichen wird. Verlauf und Ansprechen gehören deshalb in die zeitgestempelten Ergebnis-Observations (RECIST, `MII_PR_Onko_Verlauf`), die ihren Bezug selbst definieren (ADR-0018).
4. **Zielakzeptanz** (`goal-acceptance`, `goal-reasonRejected`): der Shared-Decision-Kern. Die Akzeptanz wohnt am Ziel, nicht am Plan und nicht an der Maßnahme.
5. **Zielbeziehung** (`goal-relationship`): `predecessor`/`successor` für die zeitliche Journey, `replacement` für die Intentions-Pivotierung kurativ → palliativ.

**Anschluss an Bestehendes:** `Goal.addresses` referenziert `mii-pr-onko-diagnose-primaertumor`. `Goal.outcomeReference` referenziert `MII_PR_Onko_Verlauf` bzw. `MII_PR_Onko_Residualstatus` — beide existieren im Modul bereits und werden durch die Überleitung erstmals **zielgebunden** auswertbar. Das ist der konkrete Mehrwert für die Sekundärnutzung: Ein Verlaufsbefund allein sagt, wie der Tumor steht; erst die Zielbindung sagt, ob das Behandlungsziel erreicht wurde.

**Offen:** Verhältnis von `Goal.priority` zu `MII_EX_MTB_Empfehlung_Prioritaet`. Beide drücken Priorität aus, aber an verschiedenen Objekten (Ziel vs. Empfehlung). Eine Doppelung ist inhaltlich vertretbar, muss aber bewusst entschieden werden.

## 4.2 Behandlungsepisode (`EpisodeOfCare`) → Weg A

**Ziel:** neues Profil im MII-Modul Onkologie, Arbeitstitel `MII_PR_Onko_Behandlungsepisode`, abgeleitet aus `OnkoBehandlungsepisode`.

Auch hier kein Pendant. Das MII-Modul bildet Behandlungsabschnitte heute nur implizit ab — über `Procedure.performed` an systemischer Therapie bzw. Strahlentherapie. Damit ist ein Abschnitt so lang wie seine Prozedur; ein sektorenübergreifend fortgeführter Abschnitt ist nicht darstellbar.

Das Profil bringt mit:

- **Episodenart** (`type`, extensible aus `episodenart`): systemische Therapielinie, lokoregionale Behandlungslinie, Diagnostiklinie, Active Surveillance, Watchful Waiting.
- **Intention** (`onko-therapy-intent`) als für jede Episodenart bestimmbares Merkmal, nicht nur für therapeutische — beschränkt auf kurativ, palliativ und supportiv; die **Stellung zur Operation** (neoadjuvant, adjuvant …) ist ein eigenes Kontext-Merkmal daneben (6.2).
- **Behandlungsmodalität** (`onko-modalitaet`) als eigenes Merkmal neben der Episodenart, mehrfach belegbar (Radiochemotherapie).
- **EnLiST-Linienzählung** (`enlist-lot`, `enlist-line-segment`, `enlist-countable`) nach dem ESMO-Konsens 2026: Eine Therapielinie ist ein fachliches Kontinuum, das organisatorisch in mehrere Episoden zerfällt, weil `EpisodeOfCare` organisationsgebunden ist. Genau eine führende Episode je Linie trägt die Designation; ausführende Einrichtungen dokumentieren Segmente mit gemeinsamer Linien-Id (ADR-0025).

**Zwei Abstimmungspunkte:**

*Erstens der Begriff.* `MII_PR_MTB_Behandlungsepisode` besetzt denselben Namen für eine `ClinicalImpression`. Beide Konzepte sind legitim und beide werden gebraucht, aber sie dürfen nicht denselben Namen tragen. Vorschlag: Der MTB-Begriff bezeichnet die Fallvorstellung, unser Begriff den Versorgungsabschnitt; eine der beiden Bezeichnungen wird angepasst. Die Entscheidung liegt bei den Modulverantwortlichen, nicht bei uns.

*Zweitens der Andockpunkt der EnLiST-Extensions.* Die Extensions `enlist-lot` und `enlist-line-segment` sind bewusst mit **zwei Kontexten** definiert: `EpisodeOfCare` **und** `Procedure`. Damit können sie auch ohne das neue Episoden-Profil an `MII_PR_Onko_Systemische_Therapie` angebracht werden. Das ist die Rückfallebene, falls die Aufnahme eines `EpisodeOfCare`-Profils im Modul nicht konsensfähig ist — mit dem Preis, dass die Linie dann wieder an die Prozedur gebunden ist und die sektorenübergreifende Fortführung verloren geht. Wir empfehlen den Episoden-Weg und führen den Prozedur-Kontext als Kompatibilitätsbrücke, nicht als Alternative.

## 4.3 Empfehlungsplan und Tumorboard-Empfehlungen → Weg B

**Ziel:** Ergänzung der bestehenden MII-Profile. Es entsteht **kein** neues CarePlan-Profil für den Empfehlungsplan.

| Leitfaden-Artefakt | Bestehendes MII-Profil | Ergänzung |
|---|---|---|
| `OnkoCarePlan` mit `intent = proposal/plan` (Empfehlungsplan) | `MII_PR_Onko_Tumorkonferenz` | `goal` (Referenz auf Therapieziel), `extension[workflow-episodeOfCare]`, `extension[onko-therapy-intent]`, `extension[onko-careplan-custodian]` |
| `TumorboardMedicationRequest` | `MII_PR_Onko_Therapieempfehlung_Medikation` | `extension[enlist-change]`, `statusReason` als Pflicht-unterstütztes Element |
| `TumorboardServiceRequest` | `MII_PR_Onko_Therapieempfehlung_Operation` | `extension[request-statusReason]` |
| Multimodale Empfehlung (ADR-0021) | `MII_PR_Onko_Therapieempfehlung_Kombinationstherapie` | keine Ergänzung nötig |

Die Tumorboard-Kennzeichnung über `category` mit LOINC `85232-7` *(Tumor board Consult note)*, die der Leitfaden an seinen Request-Profilen verpflichtend führt, wird bei der Überleitung **nicht** mit übernommen: Im MII-Modul ergibt sich der Tumorboard-Kontext bereits aus der Zugehörigkeit zum `Tumorkonferenz`-CarePlan. Die Kennzeichnung ist im Leitfaden nötig, weil dort ein Request auch ohne Planbezug auftreten kann; im Kerndatensatz wäre sie Redundanz.

**Abstimmung mit MTB ist hier zwingend.** Jede Ergänzung an `MII_PR_Onko_Tumorkonferenz` erbt `MII_PR_MTB_Therapieplan` mit. Da wir ausschließlich optionale Elemente ergänzen (`0..*`, `0..1`), ist die Änderung abwärtskompatibel — bestehende MTB-Instanzen bleiben gültig. Diese Zusage ist Teil des Einreichungsvorschlags und vor Einreichung zu verifizieren.

## 4.4 Behandlungs- und Diagnostikplan → Weg D

**Ziel:** Einreichung eines eigenen CarePlan-Profils bei **ISiK**; perspektivisch Überführung in die **Kernprofile**; das MII-Modul Onkologie leitet in beiden Stufen eine onkologische Ausprägung davon ab.

Der Behandlungsplan ist der episodenspezifische Plan **tatsächlich erbrachter** Versorgung — `basedOn` auf den Empfehlungsplan, verknüpft mit der Behandlungsepisode über `workflow-episodeOfCare`, verfolgend das Episodenziel. Er ist damit ein versorgungsnahes Artefakt, getragen vom KIS oder von onkologischer Spezialsoftware wie Tumordokumentationssystemen, und gehört seiner Natur nach in die ISiK-Schiene; seine onkologische Ausprägung gehört in den Kerndatensatz.

Der **diagnostische Abschnitt** ist damit bereits abgedeckt. Der Leitfaden hat sein früheres Profil `DiagnosticCarePlan` aufgegeben und unterscheidet Diagnostik von Therapie seither über `CarePlan.category`, gebunden an das ValueSet `onko-care-plan-phase` (`261004008` Diagnostic intent, `262202000` Therapeutic intent, `363676003` Palliative intent). Das ist dieselbe Lösung, die auch für die Überleitung trägt: ein Profil, zwei Ausprägungen über die Kategorie — ergänzt um die Episodenart „Diagnostiklinie" an der zugehörigen Episode.

**Die Stufung ISiK → Kernprofile ist Teil des Zielbilds.** ISiK ist der richtige *erste* Kanal, weil dort die Krankenhaus-Implementierungen entstehen, an denen sich das Profil bewähren muss. Ein Planungsartefakt, das Terminvergabe und Apothekenanbindung trägt, gehört danach aber nicht dauerhaft in eine sektorspezifische Spezifikation: Sobald die Praxistauglichkeit belegt ist, ist die Überführung auf die Ebene der **Kernprofile** anzustreben, damit auch der ambulante Sektor, Reha und die Vernetzungsstandards darauf aufsetzen können, ohne ISiK zu implementieren. Die MII-Ableitung zieht dann auf die Kernprofil-Fassung um. Praktisch heißt das für die jetzige Modellierung: Die ISiK-Einreichung darf keine Festlegungen treffen, die nur im stationären Kontext tragen — die Kernprofil-Fähigkeit ist von Beginn an mitzudenken, auch wenn die Überführung erst später ansteht.

Die Doppelung ISiK + MII ist bewusst: ISiK trägt das generische Muster, das MII-Modul die onkologische Verengung (`addresses` auf die Tumordiagnose, `goal` auf das onkologische Therapieziel, Aktivitäten auf die onkologischen Request- und Prozedur-Profile). Die MII-Ableitung ist damit an die ISiK-Aufnahme gebunden — das ist die einzige Abhängigkeit in diesem Plan, die außerhalb der MII-Governance liegt und deshalb früh adressiert werden muss.

### Warum ISiK der richtige Kanal ist: krankenhausinterne Verwendung

Der Zweck des Behandlungsplans ist schlicht: **Erst mit ihm lassen sich die Therapien selbst direkt mitmodellieren.** Geplante Maßnahmen hängen als `activity.reference` am Plan, durchgeführte als `activity.outcomeReference` — und tragen über den Plan den Kontext, der ihnen einzeln fehlt: die Therapieintention, die Behandlungsepisode, das verfolgte Ziel und den Bezug auf den Board-Beschluss. Ohne dieses Dach sind Verordnung, Termin, Durchführung und Ergebnis lauter Einzelressourcen ohne gemeinsamen Halt.

Das ist ein operatives Erfordernis des laufenden Krankenhausbetriebs, kein Auswertungsbedarf — und genau deshalb geht das Profil zu ISiK und nicht allein in den Kerndatensatz. Die folgenden drei Verwendungen im KIS bzw. im Tumordokumentationssystem sind Ausprägungen dieses einen Punktes, keine drei eigenen Anforderungen:

**Terminfindung für geplante diagnostische Maßnahmen.** Der Diagnostikplan listet die Schritte des Diagnosepfads als Aktivitäten (`activity.reference` → `ServiceRequest` bzw. `Appointment`). Die Terminvergabe für Bildgebung, Biopsie und Befundbesprechung greift auf diese Liste zu: Was noch keinen Termin hat, ist offen; was terminiert ist, trägt einen `Appointment`-Bezug; das Ergebnis kommt über `activity.outcomeReference` (`DiagnosticReport`, `Observation`) zurück an dieselbe Aktivität. Der Plan wird damit zur Arbeitsliste der Leitstelle, ohne dass ein zweites Planungsartefakt gepflegt werden muss. Für das Tumorboard ist derselbe Plan die Antwort auf die Frage, ob die Diagnostik vollständig ist — die Voraussetzung dafür, dass überhaupt eine belastbare Empfehlung ausgesprochen werden kann.

**Terminfindung und Koordination geplanter therapeutischer Maßnahmen.** Beim multimodalen Konzept — etwa neoadjuvante Systemtherapie, Operation, adjuvante Bestrahlung — hängt die Terminierung jedes Schritts von der Fertigstellung des vorigen ab. Der Behandlungsplan hält die Abfolge mit ihren Abhängigkeiten zusammen; die Zuordnung zur Behandlungsepisode über `workflow-episodeOfCare` sagt, welcher Abschnitt gerade läuft und welche Organisation ihn führt. Die Verlegung zwischen Abteilungen oder in die ambulante Weiterbehandlung bricht die Kette nicht, weil der Plan an der Episode hängt und nicht am Aufenthalt.

**Grundlage einer Medikationsbestellung bei der Zentralapotheke.** Die Zubereitung einer Zytostatika-Applikation in der Krankenhausapotheke setzt auf dem `MedicationRequest` auf, der als Aktivität im Behandlungsplan steht. Für die Apotheke sind dabei genau die Angaben entscheidend, die der Plan im Kontext trägt und die am isolierten Request fehlen würden: Protokoll und Zyklus über den Planbezug, Therapieintention und Behandlungsepisode über die Verknüpfungen, sowie der Umsetzungsstatus der Einzelmaßnahme — eine auf Patientenwunsch verworfene Empfehlung sollte möglichst nicht zubereitet werden. Der `basedOn`-Bezug auf den Empfehlungsplan des Tumorboards macht zusätzlich nachvollziehbar, auf welchen Board-Beschluss die Bestellung zurückgeht; das ist im Zytostatika-Kontext auch haftungsrelevant.

In allen drei Fällen ist es dasselbe Profil und dieselbe Mechanik; unterschiedlich sind nur die Kategorie und die referenzierten Maßnahmen. Sie ist für die Onkologie exemplarisch, aber nicht onkologiespezifisch — jede terminierte, mehrstufige Behandlung braucht sie. Genau deshalb gehört das generische Profil nach ISiK und nur seine onkologische Verengung in den Kerndatensatz.

## 4.5 Tumordiagnose (`Condition`) → Weg C

Hier ist die Überleitung bereits vollzogen. Der Leitfaden führte zur Ballot-Fassung noch ein eigenes Profil `OnkoCondition`, das unverändert von `mii-pr-onko-diagnose-primaertumor` ableitete und nichts hinzufügte außer dem Profil-Status. Es wurde im Zuge der Kommentierung gestrichen; sämtliche Referenzen — `Goal.addresses`, `CarePlan.addresses`, `EpisodeOfCare.diagnosis.condition` — zeigen seither über `targetProfile` **direkt auf das MII-Diagnoseprofil**.

Damit ist an dieser Stelle nichts mehr zu tun, und der Leitfaden demonstriert bereits das Muster, das die übrige Überleitung anstrebt: kein eigenes Artefakt, wo das MII-Modul eines führt.

Dasselbe gilt für die Ergebnis-Referenzen: `MII_PR_Onko_Verlauf` und `MII_PR_Onko_Residualstatus` existieren im Modul und werden lediglich zum Referenzziel von `Goal.outcomeReference`.

## 4.6 Was im Leitfaden verbleibt → Weg E

| Artefakt | Begründung |
|---|---|
| Logisches Modell `TherapiezielDreieck` | Fachliche Normalform und Lesehilfe des Leitfadens; das MII-Modul führt sein eigenes `MII_LM_Onko` |
| Szenario-Bundles (mCRC palliativ, Mamma neoadjuvant, abweichende Szenarios) | Beispielinstanzen; Kerndatensätze führen eigene Testdaten |
| Kapitel zu weiteren Entitäten (Diabetes, Asthma, CED, Rheumatoide Arthritis) | Belegen die Übertragbarkeit des Dreiecks über die Onkologie hinaus — außerhalb des onkologischen Moduls |
| ePA-Dokumentenarchitektur, CPG-on-FHIR-Anbindung, IPS/EPS-Brücke | Liegen oberhalb bzw. seitlich des Kerndatensatzes |
| Zweisprachigkeit (de/en) mit Übersetzungsdateien | Leitfaden-Eigenschaft |


# 5 Datenpunkt-Überleitung im Einzelnen

Die folgende Tabelle führt jeden Datenpunkt des logischen Modells `TherapiezielDreieck`. Spalte „MII-Ziel" nennt den Landeplatz nach vollzogener Überleitung.

## 5.1 Behandlungsepisode

| # | Datenpunkt | FHIR im Leitfaden | MII-Ziel | Weg |
|---:|---|---|---|:--:|
| 1 | Patientin/Patient | `EpisodeOfCare.patient` | `EpisodeOfCare.patient` → MII Patient | A |
| 2 | Art der Episode | `EpisodeOfCare.type` (VS `episodenart`) | neues Element; ConceptMap ← `mii-cs-onko-therapie-typ` | A |
| 3 | Intention (kurativ, palliativ, supportiv) | `extension[onko-therapy-intent].hauptintention` | neues Element; ConceptMap ↔ `mii-cs-onko-intention` (6.2) | A |
| 3a | Stellung zur Operation (neoadjuvant, adjuvant, intraoperativ, additiv) | `extension[onko-behandlungs-kontext]` an der Maßnahme | deckt `mii-cs-onko-therapie-stellungzurop` (A/N/I/Z) ab | A |
| 4 | Behandlungsphase | `extension[onko-therapy-intent].phase` | neues Element (SNOMED Induktion/Konsolidierung/Intensivierung/Erhaltung) | A |
| 5 | Behandlungsmodalität | `extension[onko-modalitaet]` | neues Element; ConceptMap ← `mii-cs-onko-therapie-typ` | A |
| 6 | Zeitraum | `EpisodeOfCare.period` | neues Element; fachlich verwandt mit `Procedure.performed` an `MII_PR_Onko_Systemische_Therapie` | A |
| 7 | Status | `EpisodeOfCare.status` | neues Element; Beendigungsgrund über `mii-cs-onko-therapie-ende-grund` anschließbar | A |
| 8 | Statusverlauf | `EpisodeOfCare.statusHistory` | neues Element | A |
| 9 | Verantwortliche Organisation | `EpisodeOfCare.managingOrganization` | neues Element | A |
| 10 | Fallverantwortliche Person | `EpisodeOfCare.careManager` | neues Element | A |
| 11 | Behandlungsteam | `EpisodeOfCare.team` | neues Element | A |
| 12 | Diagnosebezug | `EpisodeOfCare.diagnosis.condition` | Referenz auf `mii-pr-onko-diagnose-primaertumor` | A/C |
| 13 | Zugrunde liegende Anforderung | `EpisodeOfCare.referralRequest` | neues Element | A |
| 14 | Zugrunde liegende Medikationsverordnung | `extension[onko-therapy-line-medication-request]` | neues Element; Referenzziel `MII_PR_Onko_Therapieempfehlung_Medikation` | A |
| 15 | EnLiST-Designation (Setting, Linie X, Modifikation Y, Notation, Linien-Id) | `extension[enlist-lot]` | neues Element; alternativ an `MII_PR_Onko_Systemische_Therapie` | A |
| 16 | EnLiST-Segment-Marker | `extension[enlist-line-segment]` | neues Element | A |
| 17 | EnLiST-Zählstatus | `extension[enlist-countable]` | neues Element | A |

## 5.2 Therapieziel

| # | Datenpunkt | FHIR im Leitfaden | MII-Ziel | Weg |
|---:|---|---|---|:--:|
| 18 | Zielebene (übergeordnet / Episodenziel) | implizit über den Plan-Graphen | bleibt implizit — bewusst kein eigenes Element (ADR-0015) | A |
| 19 | Zielart | `Goal.category` (VS `onko-therapy-goal-type`) | neues Element + ValueSet + SNOMED-ConceptMap | A |
| 20 | Zielbeschreibung | `Goal.description` | neues Element | A |
| 21 | Adressierte Erkrankung | `Goal.addresses` | Referenz auf `mii-pr-onko-diagnose-primaertumor` | A/C |
| 22 | Zielgröße | `Goal.target.measure` | neues Element; Leitlinienbindung nach ADR-0023 | A |
| 23 | Zielwert-Ausprägung | `Goal.target.detail[x]` | neues Element | A |
| 24 | Frist | `Goal.target.due[x]` | neues Element | A |
| 25 | Ergebnis | `Goal.outcomeReference` | Referenz auf `MII_PR_Onko_Verlauf`, `MII_PR_Onko_Residualstatus` | A/C |
| 26 | Lebenszyklus-Status | `Goal.lifecycleStatus` | neues Element | A |
| 27 | Erreichungsgrad | `Goal.achievementStatus` | neues Element; Brücke zu `mii-cs-onko-verlauf-gesamtbeurteilung` | A |
| 28 | Zielakzeptanz (wer, Status) | `extension[goal-acceptance]` | neues Element; HL7-Standard-Extension, keine eigene Definition nötig | A |
| 29 | Ablehnungsgrund | `extension[goal-reasonRejected]` | neues Element; Brücke zu `mii-cs-onko-therapieabweichung` | A |
| 30 | Zielbeziehung (Art, bezogenes Ziel) | `extension[goal-relationship]` | neues Element; HL7-Standard-Extension | A |
| 31 | Priorität | `Goal.priority` | neues Element; Abgrenzung zu `MII_EX_MTB_Empfehlung_Prioritaet` klären | A |
| 32 | Verfasser | `Goal.expressedBy` | neues Element | A |
| 33 | Zielbeginn | `Goal.start[x]` | neues Element | A |

## 5.3 Versorgungsplan

| # | Datenpunkt | FHIR im Leitfaden | MII-Ziel | Weg |
|---:|---|---|---|:--:|
| 34 | Planart Empfehlung | `CarePlan.intent = proposal/plan` | `MII_PR_Onko_Tumorkonferenz` (vorhanden) | B |
| 35 | Planart Behandlung | `CarePlan.intent = plan/order` | ISiK-Profil, später Kernprofile, MII-Ableitung | D |
| 35a | Diagnostischer vs. therapeutischer Abschnitt | `CarePlan.category` (VS `onko-care-plan-phase`) | **Ergänzung** an `Tumorkonferenz`; ersetzt das entfallene Profil `DiagnosticCarePlan` | B |
| 36 | Plan-Status | `CarePlan.status` | vorhanden in `Tumorkonferenz` | B |
| 37 | Verfolgtes Ziel | `CarePlan.goal` | **Ergänzung** an `Tumorkonferenz` | B |
| 38 | Bezug zur Behandlungsepisode | `extension[workflow-episodeOfCare]` | **Ergänzung** an `Tumorkonferenz` | B |
| 39 | Custodian | `extension[onko-careplan-custodian]` | **Ergänzung** an `Tumorkonferenz` (R5-Backport aus MCC) | B |
| 40 | Therapieintention am Plan | `extension[onko-therapy-intent]` | **Ergänzung** an `Tumorkonferenz` | B |
| 41 | Basiert auf (Behandlung → Empfehlung) | `CarePlan.basedOn` | am ISiK-/MII-Behandlungsplan | D |
| 42 | Adressierte Erkrankung | `CarePlan.addresses` | vorhanden in `Tumorkonferenz` | C |
| 43 | Maßnahme: Medikations-Anforderung | `TumorboardMedicationRequest` | `MII_PR_Onko_Therapieempfehlung_Medikation` | B |
| 44 | Maßnahme: Prozedur-Anforderung | `TumorboardServiceRequest` | `MII_PR_Onko_Therapieempfehlung_Operation` | B |
| 45 | Maßnahme: multimodale Kombination | `RequestGroup` (ADR-0021) | `MII_PR_Onko_Therapieempfehlung_Kombinationstherapie` | C |
| 46 | Umsetzungsstatus der Einzelempfehlung | `MedicationRequest.status` / `ServiceRequest.status` | vorhanden | C |
| 47 | Statusgrund der Einzelempfehlung | `MedicationRequest.statusReason`, `ServiceRequest.extension[request-statusReason]` | **Ergänzung**; ersetzt fachlich das binäre `activity.detail.statusReason` | B |
| 48 | EnLiST-Änderungstyp | `extension[enlist-change]` am MedicationRequest | **Ergänzung** an `Therapieempfehlung_Medikation` | B |
| 49 | Durchführung (Vollzugslink) | `CarePlan.activity.outcomeReference` | `MII_PR_Onko_Systemische_Therapie`, `_Operation`, `_Strahlentherapie`, `_Systemische_Therapie_Medikation` | C |
| 50 | Zugrunde liegende PlanDefinition | `CarePlan.instantiatesCanonical` | verbleibt im Leitfaden (CPG-Schicht) | E |

## 5.4 Tumordiagnose

| # | Datenpunkt | FHIR im Leitfaden | MII-Ziel | Weg |
|---:|---|---|---|:--:|
| 51 | Tumordiagnose insgesamt | `targetProfile` auf `mii-pr-onko-diagnose-primaertumor` an `Goal.addresses`, `CarePlan.addresses`, `EpisodeOfCare.diagnosis.condition` | bereits das MII-Profil — kein eigenes Artefakt mehr | C |


# 6 Terminologie-Überleitung und semantische Brücken

## 6.1 Zu übernehmende Terminologie-Artefakte

| Artefakt | Typ | Konzepte | Bindung | Weg |
|---|---|---|---|:--:|
| `onko-therapy-goal-type` | CodeSystem + ValueSet | `heilung`, `lebensverlaengerung`, `symptomkontrolle`, `lebensqualitaet`, `funktionserhalt` | extensible an `Goal.category` | A |
| `episodenart` | CodeSystem + ValueSet | `systemische-therapielinie`, `lokoregionale-behandlungslinie`, `diagnostiklinie`, `active-surveillance`, `watchful-waiting` | extensible an `EpisodeOfCare.type` | A |
| `enlist-lot-setting` | CodeSystem + ValueSet | `eLoT`, `aLoT`, `iLoT` | required in `enlist-lot.setting` | A |
| `enlist-change-type` | CodeSystem + ValueSet | `new`, `modified`, `same` | required in `enlist-change` | A |
| `enlist-countable` | CodeSystem + ValueSet | `counted`, `not-counted` | required in `enlist-countable` | A |
| `onko-therapy-intent` | ValueSet (SNOMED CT) | `373808002` Curative · `363676003` Palliative · `399707004` Supportive | extensible in `onko-therapy-intent.hauptintention` | A |
| `onko-service-request-kontext` | ValueSet (SNOMED CT) | `373847000` Neoadjuvant · `373846009` Adjuvant · `277671009` Intraoperative · `260364009` Additive · `255470001` Local · `264931009` Symptomatic · `129428001` Preventive · `261002007` Definitive · `103390000` Elective · `25876001` Emergency | required in `onko-behandlungs-kontext` | A |
| `onko-care-plan-phase` | ValueSet (SNOMED CT) | `261004008` Diagnostic intent · `262202000` Therapeutic intent · `363676003` Palliative intent | in `CarePlan.category` | A |
| `onko-goal-start-event` | ValueSet (SNOMED CT + HL7) | HL7 `goal-start-event` plus `264908009` Post-radiation · `262502001` Post-chemotherapy · `262061000` Postoperative period u. a. | example in `Goal.start[x]` | A |
| `onko-therapy-phase` | ValueSet (SNOMED CT) | `450827009` Induction · `816151001` Consolidation · `1254741007` Intensification · `1345242003` Maintenance | extensible in `onko-therapy-intent.phase` | A |
| `onko-behandlungsmodalitaet` | ValueSet (SNOMED CT) | `385786002` Chemotherapy care · `315601005` Ambulatory chemotherapy · `385798007` Radiation therapy care · `76334006` Immunological therapy · `169413002` Hormone therapy · `387713003` Surgical procedure | example in `onko-modalitaet` | A |
| `ConceptMapOnkoTherapyGoalTypeSct` | ConceptMap | 5 Zielarten → SNOMED-Zielzustände; Beziehungsqualität `equivalent` / `relatedto` / `unmatched` | — | A |

**Neu zu erstellen im Zuge der Überleitung** (drei ConceptMaps, die es heute in keinem der beiden Artefakte gibt):

| Neue ConceptMap | Richtung | Zweck |
|---|---|---|
| `episodenart` ← `mii-cs-onko-therapie-typ` | MII → Leitfaden | WW, AS, WS, OP, ST auf Episodenarten abbilden |
| `onko-behandlungsmodalitaet` ← `mii-cs-onko-therapie-typ` | MII → Leitfaden | CH, HO, IM, ZS, SZ und die Kombinationscodes auf Modalitäten abbilden |
| `onko-therapy-intent` ↔ `mii-cs-onko-intention` + `mii-cs-onko-therapie-stellungzurop` | bidirektional | Ein-Achsen- auf Zwei-Achsen-Kodierung abbilden (siehe 6.2) |

## 6.2 Intention und Kontext trennen

Hier laufen beide Seiten auf dasselbe Modell zu — das ist die wichtigste inhaltliche Korrektur gegenüber dem bisherigen Stand des Leitfadens.

Das MII-Modul kodiert oBDS-basiert auf **zwei** Achsen:

> `mii-cs-onko-intention`: K kurativ · P palliativ · D diagnostisch · R Revision/Komplikation · S Sonstiges · X fehlende Angabe · O lokal kurativ bei Oligometastasierung
> `mii-cs-onko-therapie-stellungzurop`: O ohne Bezug · A adjuvant · N neoadjuvant · I intraoperativ · Z additiv · S Sonstiges

Für den Leitfaden ist entschieden, dass **neoadjuvant und adjuvant ebenfalls zum Kontext gehören und nicht zur Intention**. Die Begründung ist fachlich, nicht formal: Beide Begriffe sagen nichts darüber, *was* erreicht werden soll — eine neoadjuvante Therapie ist in aller Regel kurativ intendiert —, sondern *wo im Behandlungsablauf* die Maßnahme steht, nämlich in ihrer Stellung zur Operation. Sie sind deshalb mit der Intention **kombinierbar**, nicht zu ihr alternativ. Sie in eine gemeinsame Liste mit kurativ und palliativ zu stellen, erzwingt eine Entscheidung, die es fachlich nicht gibt, und macht die häufigste Angabe — „kurativ, neoadjuvant" — unausdrückbar.

Die Intention des Leitfadens reduziert sich damit auf **kurativ, palliativ und supportiv**; die Stellung zur Operation wird ein eigenes Merkmal und deckt sich mit `mii-cs-onko-therapie-stellungzurop`.

**Im Leitfaden vollzogen.** Das ValueSet `onko-therapy-intent` führt die Codes `373847000` *(Neoadjuvant intent)* und `373846009` *(Adjuvant - intent)* nicht mehr; sie stehen in `onko-service-request-kontext`, gebunden über die Extension `onko-behandlungs-kontext` an `ServiceRequest`, `Procedure`, `MedicationRequest` und `MedicationAdministration`. Damit ist die Kontext-Achse dort verankert, wo die Stellung zur Operation entsteht — an der einzelnen Maßnahme, nicht an der Episode.

Bei der Gelegenheit korrigiert wurde auch die Herkunftsangabe des Intentions-ValueSets: Es nannte `362961001 | Procedure by intent` als Quellhierarchie. Gegen SNOMED CT International 20260501 geprüft — mit Kontrollfällen, die die Funktionsfähigkeit des Subsumptions-Endpunkts belegen — subsumiert dieser Code **keinen** der geführten Codes, auch *Curative* nicht. Tatsächlich liegen sie unter `362981000 | Qualifier value`.

**Terminologischer Befund, der die Trennung stützt.** Intention und Kontext liegen beide unter `362981000 | Qualifier value` — deshalb lassen sich neoadjuvant und adjuvant ohne Hierarchiebruch zwischen den Listen verschieben, und deshalb ist die Grenze zwischen ihnen fachlich zu ziehen, nicht terminologisch erzwungen. Dass sie ausfranst, zeigt `129428001`, das wörtlich *„Preventive - procedure intent"* heißt und in der Kontextliste steht. Die **Modalität** dagegen liegt unter `71388002 | Procedure` — einer anderen obersten Hierarchie. Modalität ist eine Handlung, Intention und Kontext sind Qualifier zu einer Handlung; die drei Achsen sind damit nicht nur fachlich, sondern terminologisch verschieden.

**Folge für die Überleitung:** Die Brücke wird damit nahezu trivial. Das MII-Modul führt mit `mii-cm-onko-intention-sct` bereits eine ConceptMap seiner Intentionscodes nach SNOMED CT und mappt K → `373808002` und P → `363676003` — also genau auf zwei der drei verbleibenden Codes. Zu ergänzen bleibt nur die Behandlung der Codes, die jeweils nur eine Seite kennt:

| Code | Seite | Behandlung |
|---|---|---|
| `399707004` Supportive | nur Leitfaden | im MII-Modul über die extensible Bindung ergänzbar |
| `D` diagnostisch | nur MII | im Leitfaden über die Episodenart „Diagnostiklinie" ausgedrückt, nicht über die Intention |
| `R` Revision/Komplikation | nur MII | kein Intentionsbegriff im Sinne des Leitfadens; als `unmatched` zu führen |
| `O` lokal kurativ bei Oligometastasierung | nur MII | auf `373808002` mit Beziehungsqualität `wider` — der Zusatz geht in der Rückrichtung verloren |
| `X` fehlende Angabe | nur MII | über `dataAbsentReason` statt über einen Intentionscode |

## 6.3 Brücke Episodenart und Modalität: eine Liste gegen zwei Merkmale

`mii-cs-onko-therapie-typ` enthält in **einer** Liste:

- Modalitäten: CH, HO, IM, ZS, SZ und die Kombinationen CI, CZ, CIZ, IZ
- Versorgungsstrategien: WW (Watchful Waiting), AS (Active Surveillance), WS (Wait and see)
- Lokoregionale Verfahren: OP, ST
- Negativaussage: KW (keine weitere tumorspezifische Therapie empfohlen)

Der Leitfaden trennt das bewusst in **Episodenart** (was für ein Abschnitt) und **Modalität** (womit behandelt wird), weil die Merkmale unabhängig variieren: Eine systemische Therapielinie kann Chemotherapie *und* Immuntherapie sein, und Active Surveillance ist keine Modalität, sondern das Ausbleiben einer Behandlung bei aktiver Überwachung.

Die Kombinationscodes CI, CZ, CIZ, IZ sind dafür der beste Beleg: Sie existieren nur, weil eine Ein-Listen-Kodierung Mehrfachbelegung nicht zulässt. Im Leitfaden entfallen sie — die Episode trägt dann zwei bzw. drei Modalitäts-Extensions. Die Konsistenz zwischen Kombinationscode und Mehrfachbelegung wird über **FHIR-Invarianten** abgesichert, nicht über Konvention.

**Empfehlung:** `mii-cs-onko-therapie-typ` bleibt für die Therapieempfehlung unverändert (oBDS-Bindung). Das neue Episoden-Profil führt Episodenart und Modalität getrennt, mit ConceptMaps in beide Richtungen. `KW` bildet keine Episode ab, sondern deren Ausbleiben — dieser Code wird in der ConceptMap ausdrücklich als `unmatched` geführt statt künstlich zugeordnet.

## 6.4 Brücke Zielerreichung und Verlauf

`mii-cs-onko-verlauf-gesamtbeurteilung` (V, T, K, P, D, B, R, Y, U, X) beschreibt den **Tumorstatus**; `Goal.achievementStatus` beschreibt die **Zielerreichung**. Das ist nicht dasselbe, hängt aber zusammen: Vollremission bei kurativem Ziel bedeutet `achieved`, Progression bei kurativem Ziel bedeutet in der Regel den Pivot auf ein palliatives Ziel mit `not-achieved` und `replacement`-Beziehung.

Eine ConceptMap wäre hier **falsch**, weil die Zuordnung von der Zielart abhängt: Progression bei einem Symptomkontroll-Ziel sagt nichts über die Zielerreichung aus. Stattdessen bleibt die Verknüpfung referenziell — `Goal.outcomeReference` zeigt auf die Verlaufs-Observation, die Interpretation bleibt beim auswertenden System. Das ist bewusst und in ADR-0018 begründet.

## 6.5 Brücke Statusgrund und Therapieabweichung

Das MII-Modul führt `activity.detail.statusReason` gebunden an `mii-cs-onko-therapieabweichung` mit genau drei Codes: J / N / U. Es beantwortet damit die Frage *„Wurde auf Patientenwunsch abgewichen?"* — aber nicht *„Warum?"*.

Der Leitfaden nutzt dieselbe Stelle für den fachlichen Grund (Patientenwunsch, Komorbidität, Progress) an `MedicationRequest.statusReason` bzw. `ServiceRequest.extension[request-statusReason]`. Für die nächste Tumorboard-Runde ist dieser Grund die eigentlich versorgungsrelevante Information.

**Empfehlung:** Beides nebeneinander führen. `activity.detail.statusReason` bleibt oBDS-konform am Tumorkonferenz-Plan; der fachliche Grund kommt am Request hinzu. Doppelpflege entsteht nicht, weil die Ebenen verschieden sind — Plan-Ebene gegen Einzelmaßnahmen-Ebene.

## 6.6 EnLiST: ohne Pendant im MII-Modul

Die vier EnLiST-Artefakte haben im MII-Modul keinerlei Entsprechung. `mii-cs-onko-therapie-ende-grund` ist das Nächstliegende und für die Zähllogik nutzbar: `P` (Abbruch wegen Progress) ist der EnLiST-Trigger für eine *New LoT*, `R` und `W` (Dosisreduktion, Substanzwechsel) für eine *Modified LoT*, `V` (Patient verweigert weitere Therapie) für einen nicht-progressionsbedingten Abbruch. Eine ConceptMap `enlist-change-type` ← `mii-cs-onko-therapie-ende-grund` ist damit möglich und sollte Teil der Überleitung sein, auch wenn sie nicht vollständig determiniert — der Ende-Grund allein trägt die Zählentscheidung nicht, er indiziert sie nur.

**Reifegrad-Hinweis, der in den Einreichungsunterlagen stehen muss:** EnLiST ist ein bis zum Abschluss des ESMO-Road-Testings experimentelles Konzept. Sein Nutzen liegt in der Sekundärnutzung (Auswertung, CDS, Studieneinschluss), nicht in der Versorgung. Die Überleitung sollte die EnLiST-Artefakte deshalb als optional und ausdrücklich experimentell einbringen, nicht als Pflichtbestandteil des Kerndatensatzes. Das ist keine Schwäche des Konzepts, sondern die ehrliche Einordnung seines Reifegrads.


# 7 Was der Leitfaden dem MII-Modul hinzufügt

Für die Bewertung des Nutzens durch den Auftraggeber, in der Reihenfolge des Gewichts:

1. **Das Behandlungsziel als eigenständige, dem Plan vorausgehende Entität.** Heute lässt sich im Kerndatensatz dokumentieren, *was getan wurde*, aber nicht, *wozu*. Die Intention hängt als Attribut an der einzelnen Prozedur; ein patientenbezogenes, über Episoden hinweg verfolgtes Ziel existiert nicht.

2. **Die Zielakzeptanz als strukturiertes Element.** Shared Decision Making ist im Kerndatensatz derzeit auf ein Ja/Nein/Unbekannt am Empfehlungspunkt reduziert. Wer welchem Ziel mit welcher Begründung zugestimmt oder widersprochen hat, ist nicht abbildbar — obwohl genau das die Grundlage für die Bewertung von Versorgungsqualität und Patientenpräferenz wäre.

3. **Der Behandlungsabschnitt als organisationsübergreifendes Kontinuum.** Die Bindung des Abschnitts an die Prozedur bricht an jeder Sektorengrenze. Das Episoden-Profil mit gemeinsamer Linien-Id hält eine Therapielinie über den Wechsel von der Klinik in die niedergelassene Praxis zusammen.

4. **Die Zielbindung vorhandener Ergebnisdaten.** `Verlauf` und `Residualstatus` liegen bereits im Modul. Erst die Verknüpfung mit einem Ziel macht aus einem Tumorstatus eine Aussage über Zielerreichung — ohne ein einziges neues Ergebnis-Datenelement.

5. **Die Therapielinienzählung nach europäischem Konsens.** Voraussetzung für vergleichbare Real-World-Auswertungen und für linienspezifische Zulassungs- und Erstattungsentscheidungen.

6. **Die Trennung von Episodenart und Modalität.** `mii-cs-onko-therapie-typ` führt heute Chemotherapie, Watchful Waiting und die Kombinationscodes `CI`, `CZ`, `CIZ`, `IZ` in einer Liste. Die Kombinationscodes existieren nur, weil eine Ein-Listen-Kodierung Mehrfachbelegung nicht zulässt — sie sind der Preis der Vermischung, nicht ihr Zweck. Mit getrennten Merkmalen entfallen sie, und eine Radiochemotherapie trägt schlicht zwei Modalitäten.


# 8 Umsetzungsplan

Zieltermin für die vollzogene Überleitung: **Ende 2027.**

| AP | Arbeitspaket | Voraussetzung | Ergebnis |
|---|---|---|---|
| 1 | **Einreichung als ein geschlossener Kommentierungskommentar** in die laufende Kommentierung, mit diesem Dokument als Grundlage (Weg A und B) | laufende Kommentierungsfrist | eingereichter Kommentar mit Vorgangsnummer |
| 2 | Abstimmung mit MII AG Onkologie: Aufnahme Therapieziel + Behandlungsepisode | parallel zu AP 1 | Grundsatzentscheidung zur Aufnahme |
| 3 | Abstimmung mit MII-Modul MTB: Begriff „Behandlungsepisode", Abwärtskompatibilität der `Tumorkonferenz`-Ergänzung, Verhältnis der Prioritäts-Extensions | AP 1 | abgestimmte Änderungszusage |
| 4 | Einreichung des Behandlungsplan-Profils bei ISiK | unabhängig, früh starten | ISiK-Aufnahmeentscheidung |
| 5 | Terminologie-Entscheidung: Trennung Episodenart/Modalität gegenüber `mii-cs-onko-therapie-typ` | AP 2, TC Terminologien | Festlegung, Grundlage für AP 6 |
| 6 | Erstellung der vier ConceptMaps (3 neu + EnLiST-Änderungstyp ← Ende-Grund) | AP 5 | lauffähige, validierte ConceptMaps |
| 7 | Begleitung der Disposition; Nachreichen von Profilmaterial, wo der Kommentar es verlangt | AP 1–3, 6 | disponierter Kommentar |
| 8 | Modul-Release abwarten; Analyse und Pinning im Leitfaden auf die Release-Fassung nachziehen | AP 7 | `sushi-config.yaml`, grüner Build |
| 9 | Ableitung des onkologischen Behandlungsplan-Profils vom ISiK-Profil | AP 4, 8 | MII-Profil |
| 10 | Rückbau im Leitfaden: übergeleitete Artefakte durch Referenzen auf die MII-Fassung ersetzen | AP 8, 9 | Leitfaden-Release ohne Duplikate — **Ende 2027** |
| 11 | Nach Bewährung im Krankenhausbetrieb: Überführung des Behandlungsplan-Profils in die Kernprofile; MII-Ableitung auf die Kernprofil-Fassung umstellen | AP 9, Praxiserfahrung aus ISiK-Umsetzungen | Kernprofil, nachgezogene MII-Ableitung (nach 2027) |

**Kritisch ist AP 1**, weil es an die Kommentierungsfrist gebunden ist: Wird sie verpasst, verschiebt sich die gesamte Kette um einen Modulzyklus und der Zieltermin Ende 2027 ist nicht mehr zu halten. AP 4 (ISiK) ist der zweite kritische Strang, weil er außerhalb der MII-Governance liegt und AP 9 blockiert. AP 2, 4 und 5 laufen parallel.


# 9 Risiken und offene Entscheidungen

| # | Risiko / Entscheidung | Wirkung | Vorschlag |
|---:|---|---|---|
| 1 | Aufnahme eines `EpisodeOfCare`-Profils im MII-Modul nicht konsensfähig | Therapielinie fällt auf Prozedur-Bindung zurück, sektorenübergreifende Fortführung entfällt | Rückfallebene ist vorbereitet: EnLiST-Extensions sind auch für `Procedure` kontextualisiert |
| 2 | Begriffskollision „Behandlungsepisode" mit MTB bleibt ungelöst | Zwei gleichnamige Artefakte mit verschiedener Semantik im selben Kerndatensatz | Vor Einreichung entscheiden (AP 4); eine der Bezeichnungen wird angepasst |
| 3 | Die für ISiK 7.0 angedachte Aufnahme des Behandlungsplans verschiebt sich oder entfällt | Weg D bricht; das Profil müsste doch im MII-Modul geführt werden | Zusage für Version 7.0 liegt vor (3.3); Ausweichplan bleibt das eigenständige MII-Profil |
| 4 | Überführung in die Kernprofile erfolgt nie oder unter abweichender Modellierung | Zwei Behandlungsplan-Fassungen (ISiK und Kernprofil) mit Migrationsaufwand für die MII-Ableitung | ISiK-Einreichung von Beginn an sektorneutral halten (4.4); Überführung als Zielbild dokumentieren, nicht als Zusage |
| 5 | Terminologie-Entscheidung zugunsten reiner oBDS-Kodierung bei Episodenart und Modalität | SNOMED-Anschluss und EnLiST-Kompatibilität leiden | ConceptMap-Weg (6.3) statt Ersetzung; SNOMED bleibt am Ziel- und Episoden-Profil |
| 6 | Der eingereichte Stand ist gegenüber der kommentierten Fassung fortentwickelt: `1.0.0-ballot` enthielt weder den Episodenart-Umbau noch die Trennung von Intention und Kontext | Der Kommentar beschreibt ein Modell, das die Kommentierenden in dieser Form nicht gesehen haben | Im Kommentar ausdrücklich als Fortentwicklung kennzeichnen und die beiden Schritte benennen (2.1); der Leitfaden selbst trägt den beschriebenen Stand |
| 7 | EnLiST-Road-Testing bringt Änderungen am Framework | Nachziehen der Extensions und Zählregeln | Als experimentell einbringen (6.6); Versionierung über die Extension-Definition |
| 8 | Ergänzungen an `Tumorkonferenz` sind doch nicht abwärtskompatibel | MTB-Instanzen würden ungültig | Vor Einreichung gegen MTB-Beispielinstanzen validieren (AP 4) |
| 9 | Kommentierungsfrist wird verpasst oder der Kommentar wird nicht disponiert; Zieltermin Ende 2027 fällt | Verschiebung um einen vollen Modulzyklus; Leitfaden und Kerndatensatz driften | AP 1 hat Vorrang vor allen anderen Arbeitspaketen; Leitfaden bleibt eigenständig lauffähig, der Rückbau (AP 10) ist bewusst als letzter Schritt geplant |
| 10 | Abgrenzung `Goal.priority` ↔ `MII_EX_MTB_Empfehlung_Prioritaet` ungeklärt | Doppelte Prioritätsführung | In AP 4 entscheiden; inhaltlich sind es verschiedene Objekte, Doppelung ist vertretbar |


# Anhang A — Artefaktverzeichnis mit Überleitungsweg

Canonical-Basis des Leitfadens: `https://bih-cei.de/fhir/therapieziele-onkologie`

## A.1 Profile

| Id | Basis | Weg | Ziel |
|---|---|:--:|---|
| `onko-therapy-goal` | `Goal` | A | neues MII-Profil |
| `onko-behandlungsepisode` | `EpisodeOfCare` | A | neues MII-Profil |
| `onko-care-plan` (Empfehlung) | `CarePlan` | B | `mii-pr-onko-tumorkonferenz` |
| `onko-care-plan` (Behandlung) | `CarePlan` | D | ISiK → Kernprofile → MII-Ableitung |
| `onko-diagnostic-care-plan` *(entfallen)* | `CarePlan` | — | im Zuge der Kommentierung gestrichen; Unterscheidung läuft über `CarePlan.category` |
| `onko-tumorboard-medication-request` | `MedicationRequest` | B | `mii-pr-onko-therapieempfehlung-medikation` |
| `onko-tumorboard-service-request` | `ServiceRequest` | B | `mii-pr-onko-therapieempfehlung-operation` |
| `onko-condition` *(entfallen)* | `mii-pr-onko-diagnose-primaertumor` | C | im Zuge der Kommentierung gestrichen; Referenzen zeigen direkt auf das MII-Profil |

## A.2 Extensions

| Id | Kontext | Weg |
|---|---|:--:|
| `onko-therapy-intent` | CarePlan, Goal, EpisodeOfCare | A |
| `onko-modalitaet` | EpisodeOfCare | A |
| `onko-behandlungs-kontext` | ServiceRequest, Procedure, MedicationRequest, MedicationAdministration | A |
| `onko-careplan-custodian` | CarePlan | A (mit B an `Tumorkonferenz`) |
| `onko-therapy-line-medication-request` | EpisodeOfCare | A |
| `enlist-lot` | EpisodeOfCare, Procedure | A |
| `enlist-line-segment` | EpisodeOfCare, Procedure | A |
| `enlist-countable` | EpisodeOfCare | A |
| `enlist-change` | MedicationRequest | A (mit B an `Therapieempfehlung_Medikation`) |

Verwendete HL7-Standard-Extensions ohne Überleitungsbedarf: `goal-acceptance`, `goal-reasonRejected`, `goal-relationship`, `workflow-episodeOfCare`, `request-statusReason`.

## A.3 Invarianten

| Id | Gegenstand | Weg |
|---|---|:--:|
| `onko-enlist-1` | Designation nur bei Zählstatus `counted` | A |
| `onko-enlist-2` | Notation muss aus Setting, Linie und Modifikation zusammengesetzt sein | A |
| `onko-enlist-3` | `counted` erfordert Designation oder Segment-Marker | A |
| `onko-enlist-4` | Designation und Segment-Marker schließen einander aus | A |
| `onko-episode-1` | Therapeutische Episodenarten erfordern Diagnosebezug | A |
| `onko-episode-2` | EnLiST-Angaben nur bei Episodenart „systemische Therapielinie" | A |


# Anhang B — Grundlagen

- Implementierungsleitfaden „Therapieziele Onkologie", `de.bih-cei.therapieziele-onkologie` 1.0.0-ballot, BIH-CEI
- MII Kerndatensatzmodul Onkologie, `de.medizininformatikinitiative.kerndatensatz.onkologie` 2027.0.0-ballot.1 (Analysegrundlage) bzw. 2026.0.3 (im Leitfaden gepinnt)
- MII Kerndatensatzmodul Molekulares Tumorboard, `de.medizininformatikinitiative.kerndatensatz.mtb` 2027.0.0-ballot.1
- ADR-0013 — MII KDS Onkologie als Datenelemente- und Terminologiebasis
- ADR-0015 — Zweischichtiges Zielmodell · ADR-0016 — Generelle Behandlungsepisode · ADR-0017 — Empfehlungs- und Behandlungs-CarePlan
- ADR-0018 — `achievementStatus` mit Zustandscodes · ADR-0021 — Multimodale Orchestrierung über RequestGroup
- ADR-0023 — `target.measure` leitlinienversioniert · ADR-0025 — EnLiST-Abbildung
- Saini KS, Koopman M, Martins-Branco D et al. *ESMO adaptation of Lines of Systemic Therapy (EnLiST).* Annals of Oncology 2026;37(5):608–623. DOI: 10.1016/j.annonc.2026.02.008
- Liefergegenstand LG-01 — Analysebericht „Onkologische Therapieziele", BIH-CEI
