# Therapieziele (Goals) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Therapieziele (Goals)

### Therapieziele — worum es in diesem Leitfaden geht

Ein **Therapieziel** ist der gemeinsam von Patient:in und Behandlungsteam festgelegte, angestrebte Zustand einer onkologischen Behandlung. Es ist der zentrale Gegenstand dieses Leitfadens und wird als FHIR-`Goal` im Profil [`OnkoTherapyGoal`](StructureDefinition-onko-therapy-goal.md) abgebildet.

Ein Therapieziel beantwortet **nicht** „**was wird getan**" (das sind Maßnahmen wie `ServiceRequest`/`MedicationRequest`), sondern „**was soll erreicht werden**". Die **Zielart** wird codiert aus [OnkoTherapyGoalType](CodeSystem-onko-therapy-goal-type.md): Heilung, Lebensverlängerung, Symptomkontrolle, Lebensqualität, Funktionserhalt, Studienteilnahme.

### Das Ziel ist primär — der Plan folgt

Ein `Goal` ist eine **eigenständige Ressource, die dem Versorgungsplan vorausgeht**: Zuerst wird — im Rahmen der Therapieempfehlung (siehe unten) — das Ziel festgelegt, dann folgt der `CarePlan` zu seiner Erfüllung. `CarePlan.goal` ist daher eine **Verfolgungs-Referenz**, **kein Besitz**: derselbe Zielgegenstand kann von mehreren Plänen verfolgt werden, und das Ziel „gehört" keinem einzelnen Plan.

Dieses Muster ist an den [HL7 US MCC eCare Plan](https://build.fhir.org/ig/HL7/fhir-us-mcc/) angelehnt: das Therapieziel ist ein referenzierbares, eigenständiges Steuerobjekt.

### Zwei Ebenen: übergeordnetes Ziel und Episodenziele

Therapieziele treten auf **zwei Ebenen** auf:

* **Übergeordnetes Behandlungsziel** — genau **ein zu jedem Zeitpunkt aktives** Ziel, das die **strategische** Ausrichtung trägt: **kurativ** vs. **palliativ**. Es repräsentiert „worauf die Gesamtbehandlung hinauswill".
* **Episodenziele** — optionale, spezifischere Ziele, die einem konkreten Behandlungsabschnitt zugeordnet sind (z. B. „pathologische Komplettremission unter neoadjuvanter Therapie" oder „Rezidivfreiheit in der Nachsorge").

Die Zielart des übergeordneten Ziels wird durch die Extension [`OnkoTherapyIntent`](StructureDefinition-onko-therapy-intent.md) präzisiert (kurativ, neoadjuvant, adjuvant, Erhaltung, palliativ, supportiv).

> **Zielmodell.** Die saubere Trennung „ein aktives übergeordnetes Ziel + optionale Episodenziele" sowie die Behandlung eines Strategiewechsels (s. u.) sind architektonisch festgelegt und werden im laufenden Ausbau des Profilsatzes umgesetzt.

### Über die Onkologie hinaus — weitere Intentionen und Entitäten

Die oben genannten Zielarten und die Intentionen kurativ/palliativ sind **nicht abschließend**. Andere Entitäten kennen weitere, spezialisierte Intentionen bzw. Behandlungsphasen — hämatologische Erkrankungen etwa **Induktion**, **Konsolidierung** und **Erhaltungstherapie**. Zielart und Intention sind deshalb bewusst **offen (extensible)** kodiert.

Der zugrunde liegende Aufbau — ein übergeordnetes Ziel plus Phasen-/Episodenziele — ist **erkrankungsübergreifend** tragfähig. Für ausgewählte weitere Erkrankungen zeigen **eigene Seiten** denselben Aufbau mit entitätsspezifischen Werten: [Diabetes mellitus](entitaet-diabetes.md), [Asthma bronchiale](entitaet-asthma.md), [chronisch-entzündliche Darmerkrankungen](entitaet-ced.md) und [rheumatoide Arthritis](entitaet-rheuma.md). Sie illustrieren die Bandbreite der Phasenlogik — von Frühphasen-Remission plus paralleler Dauerkontrolle (Diabetes) über Step-up/Step-down (Asthma) bis Induktion→Erhalt (CED, Rheuma) — und, am Diabetes, wie das digitale DMP diese Ziele samt patientenberichteter Messgrößen bereits kodifiziert.

### Ein Strategiewechsel ersetzt das Ziel — er ändert es nicht

Die strategische Intention ist **nicht stabil**: Eine kurativ behandelte Erkrankung kann bei Progress in eine **palliative** Situation übergehen. Ein solcher Wechsel ist ein klinisch hochbedeutsames, nachvollziehbar zu dokumentierendes Ereignis.

Deshalb wird das übergeordnete Ziel bei einem Wechsel **nicht in-place geändert**, sondern **abgeschlossen und durch ein neues ersetzt** (verknüpft über die Ziel-Beziehung `replacement`/`successor`). So bleibt die Aussage „erst wurde Heilung angestrebt, dann Palliation" als Historie erhalten — statt in einem überschriebenen Feld verloren zu gehen.

### Die Intention wird bei der Therapieempfehlung gesetzt

Der entscheidende Punkt: **Die strategische Intention (kurativ/palliativ) wird dort festgelegt, wo die Therapie **empfohlen** wird** — typischerweise im interdisziplinären **Tumorboard**, nachdem die Diagnostik die für Grading und Staging nötige Information geliefert hat. Das Board synthetisiert aus Leitlinien, Studien, internen SOPs und Expertenmeinung eine **Empfehlung**; im Zuge dieser Empfehlung — und der anschließenden partizipativen Entscheidungsfindung mit der Patient:in — entsteht das übergeordnete Behandlungsziel.

Daraus folgt eine wichtige Unterscheidung, die die nächste Seite entfaltet: die **Empfehlung** (was das Board vorschlägt) und die **tatsächliche Behandlung** (was — ggf. an anderen Einrichtungen — umgesetzt wird) sind **verschiedene Gegenstände** mit unterschiedlicher Detailtiefe und zeitlicher wie organisatorischer Entkopplung.

→ Weiter: [Empfehlungs- und Behandlungsplan](empfehlung-behandlung.md)

### Beispiele

* [Anwendungsbeispiel mCRC (palliativ)](szenario-crc.md) — übergeordnetes Ziel **Lebensverlängerung** + **Symptomkontrolle**, inkl. eines abgelehnten kurativen Ziels.
* [Anwendungsbeispiel Mammakarzinom (neoadjuvant)](szenario-mamma.md) — kuratives übergeordnetes Ziel mit Episodenzielen entlang Therapie und Nachsorge.

