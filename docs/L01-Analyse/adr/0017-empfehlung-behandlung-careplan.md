# ADR-0017: Empfehlungs-/Behandlungs-CarePlan getrennt, `basedOn` statt `partOf`

- **Status:** accepted
- **Datum:** 2026-07-24
- **Beteiligte:** Thomas Debertshäuser
- **Bezug:** ADR-0012, ADR-0015, ADR-0016, ADR-0021 (multimodale Orchestrierung), ADR-0022 (Vorlagen-Ebenen), `CONTEXT.md` (Versorgungspläne); FHIR `CarePlan.basedOn`/`partOf`

## Kontext

In der Onkologie erstellt das Tumorboard nach abgeschlossener Diagnostik eine
**Empfehlungsliste**, die von (ggf. anderen, sektorenübergreifend verteilten)
Behandler:innen umgesetzt wird — oder nicht. FHIR bietet `CarePlan.partOf`
(Komponente eines übergeordneten Plans) und `CarePlan.basedOn` (erfüllt einen
anderen Plan). Es ist zu entscheiden, wie Empfehlung und reale Behandlung
zusammenhängen.

## Entscheidung

Zwei CarePlan-Rollen: **EmpfehlungsCarePlan** (Tumorboard-Empfehlung, trägt das
[[Übergeordnetes Behandlungsziel]], je Board-Entscheidung ein eigener) und
**BehandlungsCarePlan** (episoden-spezifische, tatsächlich erbrachte Versorgung),
verknüpft über **`basedOn`** (Behandlung *erfüllt* Empfehlung). **Kein
`partOf`/Umbrella-Plan.** Die Umsetzung einzelner Empfehlungen läuft auf
Request-Ebene (`ServiceRequest`/`MedicationRequest.basedOn` → Empfehlungs-Request),
da `CarePlan.basedOn` in R4 nur `Reference(CarePlan)` ist.

## Konsequenzen

### Positiv

- Bildet die **deutsche intersektorale Realität** ab: keine zentrale Steuerinstanz;
  autonome Erbringer erfüllen Empfehlungen dezentral.
- Empfehlung vs. reale Umsetzung sauber getrennt und unabhängig auswertbar.
- Selbstständige Pläne je Organisation (`custodian`), lose über `basedOn` gekoppelt.

### Negativ / Trade-offs

- Kein einzelnes „Gesamtfall"-Objekt; die Fallsicht wird aus dem `basedOn`-Graphen rekonstruiert.
- Zwei CarePlan-Profile statt einem.

### Folgeaufgaben

- Profile `OnkoEmpfehlungsCarePlan` / `OnkoBehandlungsCarePlan` (oder ein Profil mit Rollen-Slicing) festlegen.
- Beispiel: Tumorboard-Requests in den EmpfehlungsCarePlan; ausgeführte Requests `basedOn` verknüpfen.

## Alternativen

### Alternative A — Umbrella-CarePlan mit `partOf`

- **Beschreibung:** ein Masterplan je Intentions-Ära, Phasenpläne via `partOf`.
- **Verworfen weil:** `partOf` unterstellt eine **zentrale Steuerung**, die intersektoral nicht existiert; verzerrt die Versorgungsrealität.

### Alternative B — Ein flacher CarePlan ohne Empfehlung/Behandlung-Trennung

- **Beschreibung:** Empfehlung und Umsetzung im selben Plan.
- **Verworfen weil:** vermischt „vorgeschlagen" und „durchgeführt"; verliert die Schreibhoheits- und Lifecycle-Trennung.

## Offene Punkte

- Verknüpfung zur [[Behandlungsepisode]] via `workflow-episodeOfCare` (s. ADR-0016) am BehandlungsCarePlan.
