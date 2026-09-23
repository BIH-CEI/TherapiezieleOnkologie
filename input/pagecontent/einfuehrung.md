### 1. Motivation des IG

Dieser Implementierungsleitfaden entsteht, weil die strukturierte Dokumentation onkologischer Therapieziele heute zwischen den beteiligten Versorgungssektoren kaum standardisiert ist. Drei Aspekte tragen die Motivation:

- **Intersektorale Kommunikation:** Der zentrale Mehrwert ist die strukturierte Kommunikation zwischen der Vielzahl der an einer onkologischen Behandlung beteiligten Ärzt:innen — z. B. beim Übergang zwischen ambulanter Onkologie, stationärer Versorgung, Tumorboard und Nachsorge. Therapieziele und -intentionen sollen dabei maschinenlesbar und einheitlich abgebildet werden, statt in Freitext verloren zu gehen.
- **Expliziter Kontext:** Der klinische Kontext eines Therapieziels — etwa der Bezug zu einer Leitlinie (z. B. S3-Leitlinie, CPG-on-FHIR-Empfehlung) — wird explizit und nachvollziehbar mitgeführt, statt implizit vorausgesetzt zu werden. Das schließt auch die Dokumentation bewusster oder unbewusster Abweichungen von der Leitlinie ein.
- **Nachnutzbarkeit durch Forschungsprojekte:** Die strukturierten Daten sollen über die unmittelbare Versorgung hinaus für Forschungsprojekte, Register und Sekundärnutzung nachnutzbar sein, ohne dass eine erneute Strukturierung aus Freitext nötig ist.

### 2. Auszug aus dem Analysebericht

Dieser IG baut auf dem [Analysebericht (LG-01)](analysebericht.html) auf, dem Liefergegenstand LG-01 des Gematik-Auftrags C002717 (BIH-CEI). Der Bericht analysiert sechs internationale und nationale FHIR-/Standardisierungs-Quellen (u. a. mCODE, IPS/EPS, MCC, PCO, ESMO EnLiST, HL7 CPG-on-FHIR) auf ihre Übertragbarkeit auf die deutsche Spezifikation „Onkologische Therapieziele" und leitet daraus die Architekturentscheidung für diesen IG ab.

Im Kern beruht die Spezifikation auf **vier Schichten mit klarer Rollenverteilung und einem expliziten Fallback-Pfad**: der Therapielinien-Strukturachse (EnLiST), der computable Leitlinien-Repräsentation (CPG-on-FHIR) als Primärpfad, der generischen Plan-/Ziel-Logik (CarePlan/Goal) als Fallback sowie den deutschen Datenelementen und Terminologien (MII Onkologie) als Interoperabilitätsbasis.

Details zu Methodik, den einzelnen Quellen und der vollständigen Architekturentscheidung finden sich auf der Seite [Analysebericht (LG-01)](analysebericht.html).

### 3. Wie ist dieser IG zu lesen?

Der Leitfaden ist so aufgebaut, dass er vom Allgemeinen zum Speziellen führt:

1. **Startseite** — gibt eine generelle Übersicht über den IG, seine Motivation und die ersten Profile.
2. **Konzepte** und ihre Unterpunkte — erläutern das Therapieziel-Dreieck, die Therapieziele (Goals), den Empfehlungs- und Behandlungsplan, Behandlungsepisoden sowie Zielwerte und Messgrößen.
3. **Anwendungsbeispiele** und dazugehörige **abweichende Szenarien** — zeigen die Konzepte anhand konkreter Fälle (z. B. mCRC palliativ, Mammakarzinom neoadjuvant) sowie typische Abweichungen vom Leitlinienpfad.
4. **Weitere Entitäten** — listet weitere chronische Erkrankungen (z. B. Diabetes mellitus, Asthma bronchiale, chronisch-entzündliche Darmerkrankungen, rheumatoide Arthritis) auf und skizziert, wie der IG diese künftig abbilden könnte. 
5. **Artefakte** — am Ende des IG stehen die technischen Artefakte (Profile, Extensions, ValueSets, CodeSystems) zum Nachschlagen zur Verfügung.
