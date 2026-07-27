Extension: OnkoTherapyLineMedicationRequestExt
Id: onko-therapy-line-medication-request
Title: "Therapielinie – Medikationsverordnung (Extension)"
Description: """
Referenz auf die `MedicationRequest`-Ressource(en), die den Anlass bzw. die Verordnung für
diese Therapielinie bilden.

`EpisodeOfCare.referralRequest` ist im FHIR-Core auf `Reference(ServiceRequest)` beschränkt
und kann in einem Profil nicht auf weitere Zieltypen erweitert werden (Profile dürfen
Referenzziele nur einschränken, nicht erweitern). Für Therapielinien, deren Auslöser eine
Medikationsverordnung statt eines ServiceRequest ist (z. B. eine antineoplastische
Systemtherapie), wird daher diese Extension ergänzend zu `referralRequest` verwendet.
"""
* insert Translation(^title, en, Line of therapy – medication request extension)
* insert Translation(^description, en, Reference to the MedicationRequest resource or resources that gave rise to or order this line of therapy. EpisodeOfCare.referralRequest is restricted to a Reference of type ServiceRequest in FHIR core and profiles cannot widen reference target types. For lines of therapy triggered by a medication order rather than a ServiceRequest\, e.g. an antineoplastic systemic therapy\, this extension is used alongside referralRequest.)
* ^context.type = #element
* ^context.expression = "EpisodeOfCare"

* value[x] only Reference(MedicationRequest)
* insert Label(value[x], Medikationsverordnung, Referenz auf die der Therapielinie zugrunde liegende Medikationsverordnung.)
* insert Translation(value[x] ^short, en, Medication request)
* insert Translation(value[x] ^definition, en, Reference to the medication request underlying the line of therapy.)
