// Behandlungsmodalität einer Behandlungsepisode — eigenes Merkmal, bewusst
// NICHT Teil der Episodenart (EpisodeOfCare.type): die Episodenart sagt,
// WAS für ein Versorgungsabschnitt vorliegt (Therapielinie, Diagnostiklinie …),
// die Modalität sagt, WOMIT behandelt wird (Chemo, Immuntherapie, Bestrahlung …).

Extension: OnkoModalitaetExt
Id: onko-modalitaet
Title: "Behandlungsmodalität (Extension)"
Description: "Behandlungsmodalität der Behandlungsepisode — z. B. Chemotherapie, Immuntherapie, Hormontherapie, Bestrahlung, Operation. Eigenes Merkmal neben der Episodenart (`EpisodeOfCare.type`); mehrere Modalitäten je Episode sind zulässig (z. B. Radiochemotherapie)."
* insert Translation(^title, en, Treatment modality extension)
* insert Translation(^description, en, Treatment modality of the care episode — e.g. chemotherapy\, immunotherapy\, hormone therapy\, radiotherapy\, surgery. A characteristic of its own next to the episode type; multiple modalities per episode are allowed\, e.g. radiochemotherapy.)
* ^context.type = #element
* ^context.expression = "EpisodeOfCare"
* value[x] only CodeableConcept
* value[x] 1..1
* valueCodeableConcept from BehandlungsmodalitaetVS (example)
* insert Label(value[x], Behandlungsmodalität, Modalität der Behandlung — z. B. Chemotherapie\, Immuntherapie\, Bestrahlung\, Operation.)
* insert Translation(value[x] ^short, en, Treatment modality)
* insert Translation(value[x] ^definition, en, Modality of treatment — e.g. chemotherapy\, immunotherapy\, radiotherapy\, surgery.)
