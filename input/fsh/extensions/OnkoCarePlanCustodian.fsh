Extension: OnkoCarePlanCustodianExt
Id: onko-careplan-custodian
Title: "CarePlan Custodian (Extension)"
Description: """
Verantwortliche Stelle für Pflege und Aktualisierung des Versorgungsplans (Custodian).

Übernahme der **MCC eCare Plan** Extension
[custodian](https://build.fhir.org/ig/HL7/fhir-us-mcc/StructureDefinition-custodian.html)
(`http://hl7.org/fhir/us/mcc/StructureDefinition/custodian`). Es handelt sich um einen
R5-Backport: In FHIR R5 wurde `CarePlan.author` entfernt; `CarePlan.custodian` benennt die
für Pflege und Wartung des Plans verantwortliche Partei. Der Custodian kann, muss aber kein
Contributor sein.

Hier als lokale Extension nachgebildet, um die US-Realm-Abhängigkeit (US MCC / US Core) zu
vermeiden; Wertebereich an die Referenztypen der MCC-Extension angelehnt.
"""
* ^context.type = #element
* ^context.expression = "CarePlan"
* value[x] only Reference(Practitioner or PractitionerRole or Organization or CareTeam or Patient or RelatedPerson or Device)
