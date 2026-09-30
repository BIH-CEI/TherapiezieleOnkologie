# Antwortmatrix — Kommentare zu LG-05 V1

Kommentare aus `LG-05_Ueberleitung_MII_Onkologie.docx` (V1, kommentiert am 30.09.2026 von
Thomas Debertshäuser), eingearbeitet in die Markdown-Quelle. Alle Kommentartexte im
Originalwortlaut, mit Ankertext.

| # | Anker | Kommentar (wörtlich) | Disposition | Stelle in V2 |
|---:|---|---|---|---|
| 1 | „de.bih-cei.therapieziele-onkologie)" | Hier richtige URL von GitHub einfügen und erwähnen, das es momentan auf GitHub gehostet wird | Übernommen — Quellen- und Rendering-URL ergänzt, Hosting benannt | Zusammenfassung, 1. Absatz |
| 2 | „Der größte inhaltliche Klärungsbedarf liegt in der Terminologie …" | Hier hatten wir im Bild eigentlich entschieden, dass neoadjuvant, adjuvant zum kontext gehört und nicht zur intention | Übernommen — Kernaussage 5 umgeschrieben; beide Modelle laufen damit zusammen | Zusammenfassung, Kernaussage 5 |
| 3 | „Mengengerüst der Überleitung" | In der Unten | Übernommen — dieselbe Bitte wie Kommentar 14: Binding-Spalte und ausgeschriebene Antwortmöglichkeiten in der Terminologietabelle | 6.1 |
| 4 | „Zielmodul dieser Überleitung ist ausschließlich das MII-Kerndatensatzmodul Onkologie …" | Ja, müssen wir gucken ob das überhaupt der Fall ist. | Übernommen — als offene Prüfung formuliert statt als Feststellung | 1.3 |
| 5 | „Kerndatensatzes." | Da sie sich mit den strukturellen Datenaustauschformaten bzw. der abstrakten Abbildung von Leitlinien befassen und nicht mit den konkreten instanziierten Datenelementen selbst. | Übernommen — Begründung wörtlich angefügt | 1.3 |
| 6 | „Leitlinienbindung" | Ergänzen: Häufig sind Patienten, die eine vertiefende Diagnostik an einem Molekularen Tumorboard bekommen, jedoch entweder bereits „austherapiert", d.h. die Leitlinien sehen keine weiteren Therapien vor, oder es handelt sich um seltene Tumore, für die es keine oder wenig übergreifende Evidenz gibt und daher direkt personalisiert behandelt werden | Übernommen — mit der Folgerung, dass eine Leitlinienbindung des Zielwerts in diesen Fällen nicht trägt | 2.3 |
| 7 | „in den onkologischen Kerndatensatz" | Ins MII-Modul Onkologie und wird dort weiterentwickelt und -gepflegt | Übernommen — Kriterium für Weg A umformuliert | 3.1, Wegetabelle |
| 8 | „Integration: mit dem Modul-Release, Zieltermin Ende 2027 …" | Davon ausgenommen sind technische Änderungen, die sich aus der Integration der Ressourcen und die aktuelle Kommentierung des Onkologie-Moduls ergeben, sowie die Korrektur von redaktionellen und technischen Fehlern. | Übernommen — Ausnahmeklausel angefügt | 3.2 |
| 9 | „Weg D setzt die ISiK-Aufnahme voraus …" | Die ISiK übernahme wurde besprochen und ist für die kommende Version 7.0 angedacht | Übernommen — in 3.3 nachgetragen, Risiko 3 entsprechend entschärft | 3.3, Risiko 3 |
| 10 | „einschließlich des unmatched bei Funktionserhalt." | Hier vielleicht dann auch nochmal eine Tabelle mit Beispielen einfügen – also nicht hier, sondern in der finalen Onko-Spec | Übernommen als Folgeaufgabe-Vermerk; Tabelle bewusst nicht in diesem Dokument | 4.1, Punkt 1 |
| 11 | „Trajektorie-Codes werden" | Das muss hier besser erklärt werden, welche Antwortmöglichkeiten lassen wir nicht zu? | Übernommen — die vier zugelassenen Zustands-Codes und die fünf ausgeschlossenen Trajektorie-Codes namentlich benannt, mit Begründung | 4.1, Punkt 3 |
| 12 | „KIS" | KIS oder onkologischer Spezialsoftware wie Tumordokumentationssysteme | Übernommen — an beiden Stellen | 4.4 |
| 13 | „darf" | Sollte möglichst | Übernommen | 4.4, Zentralapotheke |
| 14 | „ConceptMapOnkoTherapyGoalTypeSct … Zielarten → SNOMED-Zielzustände" | In der obenstehenden Tavelle das binding als extraspalte und auch die antwortmöglichkeiten explizit auflisten | Übernommen — Tabelle um Spalte „Bindung" erweitert, alle Konzepte je Artefakt ausgeschrieben | 6.1 |
| 15 | „neoadjuvant · adjuvant ·" | Das muss meines verständnisses raus, weil das Kontext und nich tintention ist und mit den anderen sachen zusammen kann. | Übernommen — 6.2 vollständig neu geschrieben; Intention auf kurativ/palliativ/supportiv reduziert, Stellung zur OP als eigenes Merkmal. **Folge: Umbau des IG-ValueSets `onko-therapy-intent` als AP 5a, Voraussetzung der Einreichung** | 6.2, 4.2, 5.1 Zeile 3/3a, AP 5a, Risiko 4a |
| 16 | „dann zwei bzw. drei Modalitäts-Extensions." | Über FHIR Invarianten D | Übernommen — Konsistenz zwischen Kombinationscode und Mehrfachbelegung wird über FHIR-Invarianten abgesichert | 6.3 |

## Hinweis zur Fassungsverwaltung

Die kommentierte V1-`.docx` wurde beim Re-Rendering überschrieben; eine Archivkopie lag
nicht vor. Die Kommentare sind in dieser Matrix vollständig im Originalwortlaut erhalten.
Für künftige Runden gilt: kommentierte Rückläufer vor dem Re-Rendering als
`…_V<n>_kommentiert.docx` archivieren.
