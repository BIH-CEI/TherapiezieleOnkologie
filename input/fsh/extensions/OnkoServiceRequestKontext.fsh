Extension: OnkoServiceRequestKontextExt
Id: onko-service-request-kontext
Title: "Kontext (Extension)"
Description: """
Zusätzlicher Kontext eines Behandlungsschritts, der – ergänzend zur Therapieintention – z. B.
kennzeichnet, ob eine Maßnahme lokal begrenzt, symptomatisch, präventiv, definitiv, additiv,
intraoperativ, elektiv oder im Notfall erfolgt.

Dieses Feld soll dazu dienen, neben der Therapieintention einzelnen Behandlungsschritten
weiteren Kontext zu geben.
"""
* insert Translation(^title, en, Context extension)
* insert Translation(^description, en, Additional context of a treatment step that\, complementing the therapy intent\, indicates for example whether a measure is local\, symptomatic\, preventive\, definitive\, additive\, intraoperative\, elective or an emergency. This field is intended to give individual treatment steps further context beyond the therapy intent.)
* ^context.type = #element
* ^context.expression = "ServiceRequest"
* value[x] only CodeableConcept
* valueCodeableConcept from OnkoServiceRequestKontextVS (required)
* insert Label(value[x], Kontext, Dieses Feld soll dazu dienen\, neben der Therapieintention einzelnen Behandlungsschritten weiteren Kontext zu geben.)
* insert Translation(value[x] ^short, en, Context)
* insert Translation(value[x] ^definition, en, This field is intended to give individual treatment steps further context beyond the therapy intent.)
