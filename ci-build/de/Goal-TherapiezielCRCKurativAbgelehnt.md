# Therapieziel – kurative Resektion (abgelehnt, Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Beispiel Goal: Therapieziel – kurative Resektion (abgelehnt, Beispiel)

-------

**German**

-------

Profile: [Onkologisches Therapieziel](StructureDefinition-onko-therapy-goal.md)

**Onkologische Therapieintention (Extension)**: Kurativ

**Goal Reason Rejected**: Nicht resektable Fernmetastasierung — kuratives Ziel nicht erreichbar.

**lifecycleStatus**: Rejected

**category**: Heilung

**description**: Kurative Resektion des Primärtumors mit kurativer Absicht.

**subject**: [Erika Musterfrau Female, DoB: 1961-09-12](Patient-PatientinCRC.md)

**expressedBy**: [Practitioner Petra Musterarzt ](Practitioner-OnkologinCRC.md)

**addresses**: [Condition Bösartige Neubildung: Kolon, nicht näher bezeichnet](Condition-ConditionCRC.md)



## Resource Content

```json
{
  "resourceType" : "Goal",
  "id" : "TherapiezielCRCKurativAbgelehnt",
  "meta" : {
    "profile" : ["https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-goal"]
  },
  "extension" : [{
    "url" : "https://bih-cei.de/fhir/therapieziele-onkologie/StructureDefinition/onko-therapy-intent",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-intent",
        "code" : "kurativ",
        "display" : "Kurativ"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/goal-reasonRejected",
    "valueCodeableConcept" : {
      "text" : "Nicht resektable Fernmetastasierung — kuratives Ziel nicht erreichbar."
    }
  }],
  "lifecycleStatus" : "rejected",
  "category" : [{
    "coding" : [{
      "system" : "https://bih-cei.de/fhir/therapieziele-onkologie/CodeSystem/onko-therapy-goal-type",
      "code" : "heilung",
      "display" : "Heilung"
    }]
  }],
  "description" : {
    "text" : "Kurative Resektion des Primärtumors mit kurativer Absicht."
  },
  "subject" : {
    "reference" : "Patient/PatientinCRC"
  },
  "expressedBy" : {
    "reference" : "Practitioner/OnkologinCRC"
  },
  "addresses" : [{
    "reference" : "Condition/ConditionCRC"
  }]
}

```
