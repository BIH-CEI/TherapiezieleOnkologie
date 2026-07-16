Profile: TumorboardServiceRequest
Parent: ServiceRequest
Id: onko-tumorboard-service-request
Title: "Tumorboard ServiceRequest"
Description: """
Strukturierte Empfehlung des Tumorboards auf Basis von `ServiceRequest`.

Tumorboardspezifische Ergänzung:
- Im Element `category` muss der LOINC-Code `Tumor board Consult note` (85232-7) enthalten sein, um zu kennzeichnen, dass es sich um eine Empfehlung des Tumorboards handelt. Weitere Categories können zusätzlich angegeben werden.
"""
// Status und Absicht des Requests
* status MS
* intent MS

// Category: genau ein Tumorboard-Coding (Pflicht), weitere Categories erlaubt (open slicing)
* category 1..* MS
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains tumorboardConsult 1..1 MS
* category[tumorboardConsult] = http://loinc.org#85232-7 "Tumor board Consult note"

// Was durchgeführt werden soll
* code MS

// Verlinkungen
* subject only Reference(Patient)
* subject MS
* requester MS
* performer MS