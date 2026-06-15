# Weitere relevante Initiativen

Baustein für Liefergegenstand LG-01 · Gematik-Auftrag · BIH-CEI

Zwei weitere Initiativen sind für den Kontext dieser Spezifikation relevant, wurden hier aber bewusst nicht in der gleichen Tiefe analysiert wie die in Kapitel 3 untersuchten Standards. Sie werden im weiteren Projektverlauf — insbesondere in der Phase LG-05 (MII-Integrationskonzept) — eng angebunden.

## MII-Erweiterungsmodul Onkologie

Das MII-Erweiterungsmodul Onkologie ist die nationale FHIR-Spezifikation für die strukturierte Erfassung onkologischer Versorgungsdaten in der Medizininformatik-Initiative. Es baut auf dem MII-Kerndatensatz auf, integriert die Datensätze des oBDS (onkologischer Basisdatensatz, ADT/GEKID) und liefert die Datenelemente, mit denen die deutschen Datenintegrationszentren (DIZ) und Cancer Centers heute arbeiten.

Diese Spezifikation **baut auf dem MII-Erweiterungsmodul Onkologie auf**: die in unserer Spec eingeführten Profile (z. B. `OnkoTherapyLine`, `OnkoCarePlan`, `OnkoTherapyGoal`) referenzieren die MII-Profile als Datenelemente-Basis. Auf eine eigene Tiefenanalyse wird hier verzichtet, weil die Ausschreibung explizit darauf aufbaut und in Phase LG-05 ein **schriftliches Integrationskonzept** in das MII-Erweiterungsmodul vorgesehen ist, das die finale Verzahnung herstellt.

Ergänzend ist das BMBF-geförderte **PM4Onko** (Personalisierte Medizin für die Onkologie) als komplementäre Initiative zu nennen — Miteinbeziehung erfolgt im Rahmen der Workshop-Phase über die Comprehensive Cancer Centers und NCTs.

Quellen:
- MII Kerndatensatz Modul Onkologie: [simplifier.net/medizininformatikinitiative-modulonkologie](https://simplifier.net/medizininformatikinitiative-modulonkologie)
- MII GitHub: [github.com/medizininformatik-initiative/kerndatensatzmodul-onkologie](https://github.com/medizininformatik-initiative/kerndatensatzmodul-onkologie)
- oBDS / ADT-GEKID: Klinische Krebsregister, Datenstandard der Gesellschaft der epidemiologischen Krebsregister in Deutschland

## European Common Cancer Data Model (HL7 Europe)

Das **European Common Cancer Data Model** ist eine HL7-Europe-Initiative zur gemeinsamen Strukturierung onkologischer Daten auf europäischer Ebene. Es zielt darauf ab, EHDS-konforme Datenaustausch- und Auswertungsstrukturen für Krebspatient\*innen über Sektoren- und Ländergrenzen hinweg zu ermöglichen.

Der Reifegrad ist derzeit **konzeptionell und logisch**: es liegen konzeptuelle und logische Modelle vor, aber **noch keine validierten FHIR-Profile**. Eine direkte Übernahme in unsere Spec ist daher zum jetzigen Zeitpunkt nicht möglich. Die Initiative ist gleichwohl wichtig zu beobachten, weil:

- sie ein natürliches **Andockziel für EHDS-/EPS-Konformität** im onkologischen Kontext darstellt,
- die in dieser Spec entstehenden Modelle (insb. die `OnkoTherapyLine`- und `OnkoTherapyGoal`-Strukturen, der CarePlan-/Goal-Pfad und die Leitlinienreferenz-Mechanik) **sehr wahrscheinlich Eingang in zukünftige Versionen** des Common Cancer Data Model finden werden,
- eine bidirektionale Mapping-Strategie schon jetzt mitgedacht werden sollte, um spätere Konvergenz zu erleichtern.

Quelle: [build.fhir.org/ig/hl7-eu/cancer-common](https://build.fhir.org/ig/hl7-eu/cancer-common/index.html)

## Konsequenz für die Spec

Beide Initiativen sind in der Architekturentscheidung implizit berücksichtigt:

- **MII-Erweiterungsmodul Onkologie** ist in Schicht 4 (Datenelemente & Terminologie) der tragende Standard und wird in LG-05 mit einem Integrationskonzept formal angeschlossen.
- **European Common Cancer Data Model** wird über die EHDS-/EPS-Mapping-Schicht (siehe IPS/EPS-Baustein) anschlussfähig gehalten; eine eigene Profilbindung ist zum jetzigen Zeitpunkt nicht sinnvoll.
