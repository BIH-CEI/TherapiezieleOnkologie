# Anforderung Nachsorge-Mammographie (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v0.1.0

## Beispiel ServiceRequest: Anforderung Nachsorge-Mammographie (Beispiel)

-------

**German**

-------

**status**: Active

**intent**: Plan

**code**: Nachsorge-Mammographie beidseits (jährlich)

**subject**: [Sabine Baumann Female, DoB: 1977-06-24](Patient-PatientinMamma.md)

**occurrence**: 2027-04-15

**requester**: [Practitioner Katrin Musterarzt ](Practitioner-OnkologinMamma.md)

**reasonReference**: [Condition Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse](Condition-ConditionMamma.md)



## Resource Content

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "ServiceRequestMammographieNachsorge",
  "status" : "active",
  "intent" : "plan",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "24606-6",
      "display" : "MG Breast Screening"
    }],
    "text" : "Nachsorge-Mammographie beidseits (jährlich)"
  },
  "subject" : {
    "reference" : "Patient/PatientinMamma"
  },
  "occurrenceDateTime" : "2027-04-15",
  "requester" : {
    "reference" : "Practitioner/OnkologinMamma"
  },
  "reasonReference" : [{
    "reference" : "Condition/ConditionMamma"
  }]
}

```
