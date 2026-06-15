# Architekturentscheidung – Dokumentenarchitektur für die ePA-Einbettung

Ergänzung zu `00_Architekturentscheidung.md` · Baustein für LG-01 · BIH-CEI

> **Hinweis:** Die einzelnen Entscheidungen sind als atomare ADRs unter `adr/` referenzierbar:
> [ADR-0001 Dokumentenbasierte Architektur](adr/0001-dokumentenbasierte-architektur.md) ·
> [ADR-0002 PKA-Versionierungsmuster](adr/0002-pka-versionierungsmuster.md) ·
> [ADR-0003 Drei parallele Document Bundles](adr/0003-drei-parallele-document-bundles.md) ·
> [ADR-0004 Eigenes Profil statt PKA-Ableitung](adr/0004-eigenes-profil-statt-pka-ableitung.md) ·
> [ADR-0005 FHIR-Interaktionsmodell](adr/0005-fhir-interaktionsmodell.md).
> Dieses Dokument bleibt als narratives Überblicksdokument bestehen.

## Kernaussage

Die Spezifikation wird als **dokumentenbasierte FHIR-Architektur** ausgeliefert. Jedes Dokument ist ein eigenständiges **FHIR Document Bundle** (`Bundle.type = document`) mit einer **Composition als Anker**. Mehrere parallele Dokumente decken die Domäne ab und sind über `Composition.relatesTo` lose miteinander verknüpft. Das Versionierungs- und Lebenszyklusmuster folgt der **Patientenkurzakte (PKA)** als Vorbild — aber als eigenständiges Profil, nicht als Profilableitung von `kbv-pr-mio-pka-composition`.

## Warum dokumentenbasiert

- **ePA-Schreibsemantik:** Die ePA „für alle" akzeptiert strukturierte Inhalte praktisch ausschließlich als Document Bundle mit Composition (Analog zu allen MIOs und zum geplanten Laborbefund-Modul). Lose Ressourcen werden vom Schreibinterface nicht angenommen.
- **Update-fähigkeit über Composition-Versionierung:** FHIR-Dokumente sind per Spec immutable Snapshots — Updates erfolgen durch neue Composition-Version mit `relatesTo` (`code = replaces`) auf den Vorgänger. Die ePA hält die Versionskette, Default-Read liefert die aktuelle Version, History ist abrufbar.
- **Schreibhoheit pro Dokument trennbar:** Unterschiedliche Akteure (Onkologe, Studienzentrum, Patient/Anamnese) schreiben unterschiedliche Dokumente, ohne sich gegenseitig zu überschreiben.
- **Governance-Pfad:** Festlegung durch gematik (Auftraggeber) ist schneller und passender als ein Umweg über mio42/KBV-MIO-Status.

## Die drei Document Bundles

| # | Dokument | Schreibhoheit | Status im IG | Scope-Risiko |
|---|----------|---------------|--------------|--------------|
| 1 | **Therapieziel Onkologie** | Behandelnder Onkologe / Tumorboard | Kernspezifikation | – (Vertragsgegenstand) |
| 2 | **Studienteilnahme Onkologie** | Studienzentrum / Prüfarzt | Erweiterung, Scope mit gematik klären | mittel |
| 3 | **Eigenmedikation / CAM** | überwiegend patient-reported, optional erhebend durch Onkologe | Erweiterung, Scope mit gematik klären | **hoch** |

### Verknüpfung zwischen den Dokumenten

- Lose Kopplung über `Composition.relatesTo` mit `code = appends`, **nicht als harter Constraint** — jedes Dokument kann ohne die anderen existieren.
- Bidirektionale Verweise möglich (Therapieziel ↔ Studienteilnahme: „Therapielinie 2 erfolgt im Rahmen Studie X"; Therapieziel ↔ CAM: „Kontextinformation zur Risikobewertung von Wechselwirkungen").
- Identifier-Systeme sauber trennen — sonst Auflösbarkeitsprobleme bei der späteren ePA-Festlegung.

## PKA-Pattern für Versionierung (alle drei Dokumente)

| Element | Festlegung |
|---|---|
| `Composition.identifier` | Stabile logische ID des Dokuments — bleibt über alle Versionen identisch (System pro Dokumenttyp definiert) |
| `Composition.id` | Technische ID, neu pro Version |
| `Composition.status` | `preliminary` → `final` → `amended` |
| `Composition.relatesTo` | **Pflicht** ab v2: `code = replaces`, Verweis auf vorherige Composition |
| `Composition.date` | Zeitpunkt der jeweiligen Version |
| `Bundle.timestamp` | neu pro Submission |
| Cross-Dokument-Link | `Composition.relatesTo` mit `code = appends` |

## Retention-Anforderung an die ePA-Festlegung

Vorgänger-Compositions werden im Aktenkonto **gespeichert, nicht gelöscht** — Statuswechsel auf „superseded", aber Auflösbarkeit der `relatesTo`-Kette muss erhalten bleiben. Begründung im IG: Übergänge wie kurativ → palliativ sind klinisch hochbedeutsam und müssen nachvollziehbar bleiben (Tumorboard-Dokumentation, qualitätssicherungsrechtliche Aspekte).

Diese Anforderung ist **nicht Teil unserer Profile**, sondern eine **Erwartung an den Aufnahmekontext**. Im IG als „Implementation Notes / Erwartungen an den Persistenzkontext" dokumentieren — gibt der gematik einen klaren Auftrag für die ePA-Festlegung.

## Scope-Flags für gematik-Status-Meeting Mai

**Dokument 2 (Studienteilnahme):**
Klinisch eng gekoppelt — Studieneinschluss *ist* oft die Therapielinie (iLoT in EnLiST). Drei Optionen für gematik:
- (a) als integraler Bestandteil mitspezifizieren
- (b) als Folgespezifikation markieren, Verknüpfungspunkt heute schon definieren
- (c) nur Referenzpunkte im Therapieziel-IG vorsehen, kein eigenes Bundle

**Dokument 3 (Eigenmedikation / CAM):**
- **Domänenkollision:** Eigenmedikation/OTC/Phytotherapie/Nahrungsergänzung gehört primär in die Medikations-Spezifikationen (eML, MIO Medikationsplan/eMP, MII-Modul Medikation). Eine vierte Parallelspezifikation neben diesen ist redundant und potenziell konfliktbehaftet.
- **Andere Datenqualitäts- und Authentifizierungs-Vertragsbasis:** Patient-reported vs. ärztlich autorisiert.
- **Vertraglicher Scope:** Nicht Teil der Ausschreibung „Therapieziel". Eigene Stakeholderkette (Apothekerkammer, AkdÄ, Heilpraktiker-Verbände) würde benötigt.
- **Klinisch trotzdem relevant:** Drug-Herb-Interaktionen (Johanniskraut/Chemo, Grapefruit/TKI, Antioxidantien/Strahlentherapie) sind sicherheitsrelevant und müssen im Therapiekontext sichtbar sein.

**Empfehlung an gematik:** CAM/Eigenmedikation nicht als eigenes Bundle in *dieser* Spezifikation, sondern als **Verlinkungspunkt zu eML/eMP/MII-Medikation**. Falls gematik die explizite Aufnahme will, muss Scope und Budget angepasst werden — sonst Risiko für Timeline 30.09.2026.

## Konsequenzen für die Folgephasen

- **Workshop 1 (29.05.):** Schreibhoheit-Modell pro Dokument klären (Autor, Update-Trigger, Versionskette). CAM-Fall als klinisches Szenario durchspielen — auch wenn kein eigenes Bundle, muss der Verlinkungspunkt belastbar sein.
- **Mai-Status-Meeting mit gematik:** Scope-Frage für Dokumente 2 und 3 explizit auf die Agenda. Entscheidung dokumentieren.
- **Informationsmodell (LG-02):** drei Composition-Profile + Cross-Document-Verknüpfungsmuster.
- **IG-Entwurf (LG-03):** dedizierte Seite „Versionierung & Lebenszyklus" mit PKA-Pattern-Referenz und Beispielinstanzen, die eine Versionskette zeigen (v1 preliminary → v2 final → v3 amended mit replaces-Link), nicht nur Einzel-Snapshots.
- **Implementation Notes:** Retention-Erwartung an ePA-Festlegung explizit.
- **LG-05 (MII-Integration):** Querverweis auf MII-Modul Medikation für den CAM-Kontext.

## FHIR-Interaktionsmodell (Create / Update / Read)

Wichtigste Grundregel: **„Update" eines FHIR-Dokuments ist kein PUT auf die Vorgänger-Ressource, sondern ein Create einer neuen Composition mit `relatesTo replaces`.** Die Vorgänger-Composition bleibt unverändert; ihre logische Ablösung ergibt sich aus der Versionskette über `Composition.identifier`.

### Create (neue Erstanlage eines Dokuments)

| Aspekt | Festlegung |
|---|---|
| Operation | `POST [base]/Bundle` mit `Bundle.type = document` — alternativ `$process-document` als dedizierte Document-Operation, falls die ePA-Festlegung dies vorsieht |
| Inhalt | Vollständiges Document Bundle: Composition als erster Eintrag + alle referenzierten Ressourcen vollständig enthalten (closed-world Document) |
| `Composition.status` | `preliminary` oder `final` |
| `Composition.identifier` | neu zugewiesen, stabile logische Dokument-ID (System pro Dokumenttyp) |
| `Composition.relatesTo` | leer (keine Vorgängerversion) |
| Antwort | Server bestätigt Aufnahme; Identifier ist ab jetzt unter dem Aktenkonto auflösbar |
| Idempotenz | Wiederholtes Create mit gleichem `Composition.identifier` MUSS vom ePA-Endpunkt abgelehnt werden (Conflict) — sonst Versionierung unterminiert |

### Update (neue Version eines existierenden Dokuments)

| Aspekt | Festlegung |
|---|---|
| Operation | `POST [base]/Bundle` (erneut Create) — **nicht** PUT auf die alte Composition |
| `Composition.identifier` | **identisch** mit dem Vorgänger (logische Dokument-ID bleibt stabil) |
| `Composition.id` | **neu** (technische Ressourcen-ID) |
| `Composition.status` | `final` oder `amended` |
| `Composition.relatesTo` | **Pflicht**: `code = replaces`, `targetReference` oder `targetIdentifier` auf Vorgänger-Composition |
| `Composition.date` | Zeitpunkt der Update-Version |
| ePA-seitiges Verhalten | Vorgängerversion wird **auf `superseded` gesetzt, nicht gelöscht**; bleibt über History abrufbar |
| Schreibhoheit-Prüfung | Festlegungs-Sache: darf nur derselbe Akteurstyp updaten, oder ist Übergabe an anderen Autor erlaubt? Pro Dokument klären (siehe Workshop 1) |

### Read

| Modus | Operation | Liefert |
|---|---|---|
| Aktuelle Version | `GET [base]/Composition?identifier=<logische-doc-id>&status:not=superseded` | nur die aktuelle Composition |
| Vollständige Versionskette | `GET [base]/Composition?identifier=<logische-doc-id>` oder `$everything` auf Composition | alle Versionen, Statuskennzeichnung |
| Vollständiges Dokument (Bundle) | `GET [base]/Composition/{id}/$document` | rekonstruiert das Document Bundle mit allen referenzierten Ressourcen |
| Versionshistorie einer Ressource | `GET [base]/Composition/{id}/_history` | technische FHIR-Versionshistorie, *nicht* die Dokument-Versionskette |

**Wichtige Unterscheidung:** `_history` ist die FHIR-technische Versionierung *einer* Ressource (Audit), die Dokument-Versionskette läuft über `relatesTo` *zwischen* Ressourcen. Beides nicht verwechseln — der IG muss das explizit klarstellen, weil Implementierer hier regelmäßig stolpern.

### Delete

| Aspekt | Festlegung |
|---|---|
| Operation | Nicht durch normales Update — nur durch **Patientenrecht (Widerspruch / Löschung)** über die ePA-Patientenoberfläche, nicht durch Behandelnde |
| Effekt auf Versionskette | Bei Löschung MUSS der ePA-Server `relatesTo`-Auflösbarkeit als `gone`/Tombstone signalisieren, nicht als Hard-Delete-404 — sonst sind verbleibende Compositions unbrauchbar |
| Im IG | Nicht als Profil-Constraint, sondern als Anforderung an die ePA-Festlegung dokumentieren |

### Search-Parameter (zu definieren)

Mindestens diese Parameter müssen auflösbar sein, damit die Dokumente klinisch nutzbar sind:

- `Composition?identifier=<logische-doc-id>` — Dokument-Lookup über Versionen hinweg
- `Composition?patient=<patient-ref>&type=<therapieziel|studie|cam>` — alle Dokumente eines Typs pro Patient
- `Composition?patient=<patient-ref>&status=current` — aktuelle Zustände
- `Composition?_has:Composition:relatesTo:identifier=<id>` — Nachfolger eines Dokuments finden (Reverse Chaining)

Genaues Set in LG-03 festschreiben, mit ePA-Festlegung abgleichen.

### Cross-Dokument-Konsistenz

Wenn Therapieziel-Dokument auf Studienteilnahme-Dokument verweist (`relatesTo appends`), muss der Reader damit umgehen, dass:

- das Ziel-Dokument **fehlen** kann (z. B. Patient nicht in Studie)
- das Ziel-Dokument eine **andere aktuelle Version** hat, als zum Zeitpunkt der Verlinkung
- der Verweis auf eine **konkrete Version** oder auf den **logischen Identifier** zeigt (Default: logischer Identifier, dann ist der Verweis „auf die jeweils aktuelle Fassung")

Im IG als Lese-Empfehlung formulieren.

### Was die ePA-Festlegung liefern muss (nicht der IG selbst)

Diese Punkte gehören in die ePA-Festlegung der gematik, nicht in das FHIR-Profil-Set — der IG dokumentiert sie aber als **Anforderungen / Erwartungen**:

1. Endpunkt-URL und Authentifizierung der Schreibschnittstelle
2. Welche Profile gegen welchen Endpunkt validieren
3. Schreibhoheit-Modell pro Dokumenttyp (welche Akteurs-Rolle darf was)
4. Retention-Verhalten der Vorgänger-Compositions (siehe oben)
5. Sichtbarkeitsregeln (insb. für Studienteilnahme bei Blinding, für CAM datenschutz-spezifisch)
6. Such-Parameter-Indizierung
7. Verhalten bei Patient-initiated Delete

## Verworfen: Alternative Architektur-Pfade

- **PKA-Section-Erweiterung (Therapieziel als Section innerhalb der PKA):** verworfen wegen Schreibhoheit-Problem (PKA wird typischerweise vom Hausarzt geführt, atomar geschrieben), Governance-Trägheit (mio42-Releasezyklus), Profil-Aufblähung für >95 % nicht-onkologische Patienten.
- **Lose Ressourcen ohne Document-Wrapper:** verworfen wegen ePA-Schreibsemantik (akzeptiert nur Document Bundles oder DocumentReference+Binary).
- **PDF-basierter Pfad über DocumentReference:** verworfen — würde den Zweck der Strukturierung verfehlen.
- **Profilableitung von `kbv-pr-mio-pka-composition`:** verworfen wegen harter Versions-Kopplung an mio42. Strukturelles Pattern wird übernommen, formale Vererbung nicht.
