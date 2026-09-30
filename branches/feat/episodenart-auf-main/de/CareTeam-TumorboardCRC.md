# Interdisziplinäres Tumorboard (Beispiel) - Implementierungsleitfaden Therapieziele Onkologie v1.0.0-ballot

## Beispiel CareTeam: Interdisziplinäres Tumorboard (Beispiel)

-------

**German**

-------

**status**: Active

**name**: Interdisziplinäres Tumorboard Kolorektales Karzinom

**subject**: [Erika Musterfrau Female, DoB: 1961-09-12](Patient-PatientinCRC.md)

### Participants

| | |
| :--- | :--- |
| - | **Member** |
| * | [Practitioner Petra Musterarzt ](Practitioner-OnkologinCRC.md) |

**managingOrganization**: [Organization Onkologisches Zentrum Musterklinik](Organization-TumorzentrumCRC.md)



## Resource Content

```json
{
  "resourceType" : "CareTeam",
  "id" : "TumorboardCRC",
  "status" : "active",
  "name" : "Interdisziplinäres Tumorboard Kolorektales Karzinom",
  "subject" : {
    "reference" : "Patient/PatientinCRC"
  },
  "participant" : [{
    "member" : {
      "reference" : "Practitioner/OnkologinCRC"
    }
  }],
  "managingOrganization" : [{
    "reference" : "Organization/TumorzentrumCRC"
  }]
}

```
