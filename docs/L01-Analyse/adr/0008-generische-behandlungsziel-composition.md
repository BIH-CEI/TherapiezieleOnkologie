# ADR-0008: Generische Behandlungsziel-Composition, Krankheits-Spezifik nur via Value Sets

- **Status:** accepted
- **Datum:** 2026-07-24
- **Beteiligte:** Thomas Debertshäuser
- **Bezug:** ADR-0001, ADR-0004, ADR-0007, ADR-0015, ADR-0016; [KBV PKA](https://mio.kbv.de/display/PKA/); FHIR `Composition`

## Kontext

Das Inhaltsmodell (übergeordnetes Ziel → Phasen/Episoden → Episodenziele →
Empfehlungen) ist **domänenneutral in der Form**; nur die Wertelisten sind
onkologiespezifisch. Die Composition (Dokumentstruktur/Sektionen) ist im
Wesentlichen ein Spiegel dieses Modells und zugleich das **Render-Rückgrat**
(Section-Reihenfolge/-Titel + `text`-Narrative). Frage: braucht jede Entität
(Onkologie, Asthma, Diabetes …) eine eigene Composition?

## Entscheidung

**Eine generische „Behandlungsziel-Composition"** als Struktur-Template (Sektionen
= allgemeines Inhaltsmodell). Krankheits-Spezifik lebt in den **Value Sets /
Codes** der referenzierten Ressourcen, **nicht** in der Sektions-Architektur. Nur
wenn eine Entität strukturell **verpflichtende Zusatz-Sektionen** braucht (Onko:
TNM/Staging/Tumorboard), wird ein **dünnes** krankheitsspezifisches Profil
abgeleitet. **Keine** N unabhängigen Compositions. In *diesem* Leitfaden wird nur
die **Onkologie-Composition** ausmodelliert; Asthma/Diabetes/CED bleiben narrative
Illustrationen der gleichen Form. Ein „MIO Onkologie" ist genau *eine*
Instanziierung des Templates (nötig fürs Rendering).

## Konsequenzen

### Positiv

- Ein Render-Template statt N; Wiederverwendbarkeit über Entitäten.
- Konsistent mit der Generalitäts-Entscheidung des Inhaltsmodells (ADR-0016).

### Negativ / Trade-offs

- Weniger „maßgeschneidert" als eine je-Krankheit-Composition; verpflichtende Spezial-Sektionen nur über dünne Ableitung.
- ePA-/MIO-Governance-Kultur ist „ein MIO pro Anwendungsfall" — Produktisierung anderer Entitäten würde je ein MIO erzeugen (aber dasselbe Template instanziieren).

### Folgeaufgaben

- Section-Set der generischen Composition festlegen (Diagnose, übergeordnetes Ziel, Episoden/Phasen, Episodenziele, Empfehlungen).
- Onkologie-spezifische Pflicht-Sektionen als dünne Ableitung prüfen.

## Alternativen

### Alternative A — Eine Composition je Krankheit (N unabhängige)

- **Verworfen weil:** Profil-Proliferation ohne strukturellen Mehrwert; dieselbe Falle wie bei je-Art-EpisodeOfCare (ADR-0016).

### Alternative B — Krankheits-Spezifik über Extensions statt Value Sets

- **Verworfen weil:** die Unterschiede sind Werte/Codes, nicht Struktur — Value-Set-Spezialisierung ist das richtige Mittel.

## Offene Punkte

- Ob/welche Onko-Pflicht-Sektionen eine dünne Ableitung rechtfertigen.
