Profile: TumorboardServiceRequest
Parent: ServiceRequest
Id: onko-tumorboard-service-request
Title: "Tumorboard ServiceRequest"
Description: """
Strukturierte Empfehlung des Tumorboards auf Basis von `ServiceRequest`.

Tumorboardspezifische Ergänzung:
- Im Element `category` muss der LOINC-Code `Tumor board Consult note` (85232-7) enthalten sein, um zu kennzeichnen, dass es sich um eine Empfehlung des Tumorboards handelt. Weitere Categories können zusätzlich angegeben werden.
"""
* insert Translation(^title, en, Tumor board service request)
* insert Translation(^description, en, Structured tumor board recommendation based on ServiceRequest. The category must contain the LOINC code Tumor board Consult note 85232-7 to mark it as a tumor board recommendation.)

// Status und Absicht des Requests
* status MS
* insert Label(status, Status, Status des Requests – z. B. active\, completed\, cancelled.)
* insert Translation(status ^short, en, Status)
* insert Translation(status ^definition, en, Status of the request – e.g. active\, completed\, cancelled.)
* intent MS
* insert Label(intent, Absicht, Absicht des Requests – z. B. proposal\, plan\, order.)
* insert Translation(intent ^short, en, Intent)
* insert Translation(intent ^definition, en, Intent of the request – e.g. proposal\, plan\, order.)

// Category: genau ein Tumorboard-Coding (Pflicht), weitere Categories erlaubt (open slicing)
* category 1..* MS
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains tumorboardConsult 1..1 MS
* category[tumorboardConsult] = http://loinc.org#85232-7 "Tumor board Consult note"
* insert Label(category, Kategorie, Kategorisierung des Requests – enthält verpflichtend das Tumorboard-Coding.)
* insert Translation(category ^short, en, Category)
* insert Translation(category ^definition, en, Categorization of the request – mandatorily contains the tumor board coding.)
* insert Label(category[tumorboardConsult], Tumorboard-Kennzeichnung, Kennzeichnung als Tumorboard-Empfehlung – LOINC 85232-7 Tumor board Consult note.)
* insert Translation(category[tumorboardConsult] ^short, en, Tumor board marker)
* insert Translation(category[tumorboardConsult] ^definition, en, Marks the request as a tumor board recommendation – LOINC 85232-7 Tumor board Consult note.)

// Was durchgeführt werden soll
* code MS
* insert Label(code, Leistung, Empfohlene Leistung bzw. Prozedur.)
* insert Translation(code ^short, en, Service)
* insert Translation(code ^definition, en, Recommended service or procedure.)

// Verlinkungen
* subject only Reference(Patient)
* subject MS
* insert Label(subject, Patientin/Patient, Person\, für die die Empfehlung gilt.)
* insert Translation(subject ^short, en, Patient)
* insert Translation(subject ^definition, en, The person the recommendation applies to.)
* requester MS
* insert Label(requester, Anfordernde/r, Person oder Stelle\, die die Empfehlung veranlasst hat.)
* insert Translation(requester ^short, en, Requester)
* insert Translation(requester ^definition, en, Person or party that initiated the recommendation.)
* performer MS
* insert Label(performer, Durchführende/r, Für die Umsetzung vorgesehene Person oder Stelle.)
* insert Translation(performer ^short, en, Performer)
* insert Translation(performer ^definition, en, Person or party intended to carry out the recommendation.)