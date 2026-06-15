**mCODE STU4**

Minimal Common Oncology Data Elements

HL7 FHIR Implementation Guide v4.0.0

*Summary & Analysis*

<img
src="/Users/thome/code/projects/kig-onko-therapy-goal/L01-Analyse/_master/media/media/image1.png"
title="mCODE Conceptual Diagram"
style="width:5.41667in;height:5.36458in"
alt="Overview of mCODE STU4 profiles and their relationships" />

Published: February 16, 2025

FHIR R4 \| US Realm \| License: CC0-1.0

# 1. Overview

mCODE (Minimal Common Oncology Data Elements) is an HL7 FHIR
Implementation Guide that defines a core set of structured data elements
for oncology electronic health records. Developed by the CodeX FHIR
Accelerator through MITRE Corporation and the American Society of
Clinical Oncology (ASCO), mCODE aims to increase interoperability and
enable comparative effectiveness research across healthcare systems.

STU4 (Standard for Trial Use 4, v4.0.0) was published on February 16,
2025, based on FHIR R4. It represents the most comprehensive release to
date, with approximately 53 FHIR profiles organized into six thematic
groups, over 103 value sets, and 130+ examples.

## Key Facts

| **Version**       | 4.0.0 (STU4)                              |
|-------------------|-------------------------------------------|
| **Published**     | February 16, 2025                         |
| **FHIR Version**  | R4 (also usable with R4B)                 |
| **Realm**         | US (depends on US Core v6.1.0)            |
| **License**       | CC0-1.0 (Public Domain)                   |
| **Profiles**      | ~53 FHIR profiles across 6 domains        |
| **Value Sets**    | 103+ value sets, 14 external code systems |
| **Canonical URL** | hl7.org/fhir/us/mcode                     |
| **Build IG**      | build.fhir.org/ig/HL7/fhir-mCODE-ig/      |

# 2. Conceptual Architecture

mCODE organizes oncology data into six interconnected domains, with the
CancerPatient profile serving as the central hub connecting all other
elements. The following diagram illustrates the overall structure:

<img
src="/Users/thome/code/projects/kig-onko-therapy-goal/L01-Analyse/_master/media/media/image1.png"
title="mCODE STU4 Conceptual Diagram"
style="width:6.04167in;height:5.98958in"
alt="Complete overview of mCODE profiles showing relationships between Patient, Disease, Assessment, Treatment, Genomics, and Outcomes groups" />

*Figure 1: mCODE STU4 Conceptual Overview (Source:
hl7.org/fhir/us/mcode/STU4)*

mCODE does not mandate what data must be collected for every patient.
Instead, it provides patterns and templates with controlled
terminologies to be used when certain data types are shared. Data not
covered by mCODE profiles can still be exchanged using standard FHIR
resources.

# 3. Domain Profiles

The following table summarizes the six mCODE domains, their key
profiles, and scope:

| **Domain** | **Key Profiles** | **Scope** |
|----|----|----|
| **Patient Information** | CancerPatient, HumanSpecimen, MCODEPatientBundle, MCODEPatientGroup | Demographics, specimens, patient bundles for data exchange |
| **Disease Characterization** | PrimaryCancerCondition, SecondaryCancerCondition, CancerStage, TNMStageGroup, TumorMarkerTest, Tumor, TumorSize, HistologicBehaviorAndType\*, HistologicGrade\*, TumorMorphology\*, CancerRiskAssessment\*, ALLRiskAssessment\*, RhabdomyosarcomaRiskAssessment\* | Cancer diagnosis, staging (TNM + 15 non-TNM systems), morphology, risk assessment (\* = new in STU4) |
| **Health Assessment** | ECOGPerformanceStatus, KarnofskyPerformanceStatus, LanskyPlayPerformanceStatus\*, DeauvilleScale\*, BodySurfaceArea\*, Comorbidities, HistoryOfMetastaticCancer | Functional status, pediatric performance, lymphoma response, body metrics (\* = new in STU4) |
| **Genomics** | GenomicsReport, GenomicVariant, GenomicRegionStudied | Genomic testing results, variants (HGVS/ISCN), regions studied; aligned with Genomic Reporting IG |
| **Cancer Treatments** | CancerRelatedMedicationRequest, CancerRelatedMedicationAdministration, CancerRelatedSurgicalProcedure, RadiotherapyCourseSummary, RadiotherapyVolume | Medication orders/admin, surgery, radiotherapy with modality/technique/dose details |
| **Outcomes** | CancerDiseaseStatus, TumorSize | Disease trend tracking (responding, stable, progressing), tumor measurement over time |

## 3.1 Disease Characterization

The Disease Characterization group is the largest domain, covering
cancer diagnosis, staging, and morphology:

- **Staging:** TNM staging (AJCC) plus 15 non-TNM systems including
  Binet (CLL), FIGO, Rai (CLL), Breslow/Clark (melanoma), ISS/R-ISS
  (myeloma), Gleason (prostate), and new pediatric systems (INRGSS,
  INSS, Wilms, PRETEXT, retinoblastoma, rhabdomyosarcoma)

<!-- -->

- **Morphology (NEW):** HistologicBehaviorAndType, HistologicGrade, and
  TumorMorphology profiles enable structured ICD-O-3 morphology coding

- **Risk Assessment (NEW):** Generic CancerRiskAssessment framework with
  disease-specific profiles for ALL and Rhabdomyosarcoma

## 3.2 Cancer Treatments

Covers the full spectrum of oncology treatment modalities:

- Medications: CancerRelatedMedicationRequest and
  MedicationAdministration profiles using RxNorm + NCI Thesaurus (for
  clinical trial drugs)

- Surgery: CancerRelatedSurgicalProcedure with ProcedureIntent extension
  (curative, palliative, diagnostic, etc.)

- Radiotherapy: RadiotherapyCourseSummary with detailed modality,
  technique, dose-per-volume, and session tracking

- **NEW - NormalizationBasis extension:** Supports medication dosing
  normalized to body surface area or weight (critical for pediatric
  oncology)

# 4. What's New in STU4

STU4 represents a major expansion driven primarily by the CC-DIRECT
initiative for pediatric oncology. Key additions are organized by
category:

## 4.1 Pediatric Oncology

- LanskyPlayPerformanceStatus - pediatric functional assessment

- ALLRiskAssessment - acute lymphoblastic leukemia risk stratification

- RhabdomyosarcomaRiskAssessment - rhabdomyosarcoma risk classification

- BodySurfaceArea - critical for pediatric dosage calculations

- NormalizationBasis extension - medication dosing based on BSA or
  weight

- New staging systems: INRGSS, INSS, Wilms, PRETEXT, retinoblastoma,
  rhabdomyosarcoma

## 4.2 Disease Characterization

- HistologicBehaviorAndType - ICD-O-3 morphology coding

- HistologicGrade - tumor grade assessment

- TumorMorphology - summary morphology report

- CancerRiskAssessment - generic risk assessment framework

## 4.3 Assessment & Response

- DeauvilleScale - PET response assessment for lymphoma

- ConditionStatusTrendVS restructured - remission codes moved to maximum
  value set

# 5. Terminology & Value Sets

mCODE leverages 14 external code systems and defines over 103 value
sets. The primary terminologies are:

| **Code System**      | **Usage in mCODE**                                |
|----------------------|---------------------------------------------------|
| **SNOMED CT**        | Disorders, body structures, findings, qualifiers  |
| **ICD-10-CM**        | Cancer diagnosis coding                           |
| **ICD-O-3**          | Cancer morphology and topology                    |
| **LOINC**            | Observations, laboratory codes                    |
| **RxNorm**           | FDA-approved medications                          |
| **NCI Thesaurus**    | Cancer-specific terminology, clinical trial drugs |
| **HGNC / HGVS**      | Gene identification, variant nomenclature         |
| **UCUM**             | Units of measure                                  |
| **CPT / ICD-10-PCS** | Procedure coding                                  |

Terminology selection principles: (1) Fit for purpose, (2) Conformance
with US Core and FHIR, (3) Commonly used in real-world practice.

# 6. Conformance & Implementation

mCODE defines two participant roles:

- **mCODE Data Sender:** Systems that provide oncology data (e.g., EHRs,
  cancer registries)

- **mCODE Data Receiver:** Systems that accept and process
  mCODE-conformant data (e.g., research databases, decision support
  systems)

## Mandatory Requirements (SHALL)

1.  Identify in-scope patients (all confirmed cancer diagnoses)

2.  Follow profile conformance requirements

3.  Populate and process Must-Support elements

4.  Support querying mCODE-conforming resources (RESTful GET)

5.  Publish a CapabilityStatement via GET \[base\]/metadata

6.  Comply with US Core requirements

Minimum profile support: All systems must support CancerPatient and
PrimaryCancerCondition. The \$mcode-patient-everything operation is
recommended for retrieving complete patient bundles.

# 7. Use Cases & Audience

## Foundational Use Cases

1.  **Comparative Effectiveness Analysis:** Enabling clinicians and
    patients to compare treatment outcomes across health systems for
    cooperative decision making

2.  **NGS Integration:** Integrating next-generation sequencing data
    into treatment effectiveness analysis for precision oncology

## Intended Audience

- Healthcare systems and EHR vendors

- Clinical oncology researchers

- Cancer registries (aligned with NAACCR standards)

- Radiation oncology and pediatric oncology providers

- Clinical trial organizations

- Health IT interoperability stakeholders

# 8. Relevance for Therapy Goal Specification

mCODE STU4 is the international baseline standard for oncology data
modeling. For the KIG Onko Therapy Goal specification, the following
elements are directly relevant:

- **Treatment Intent:** The ProcedureIntent extension (curative,
  palliative, diagnostic, preventive, supportive, screening) provides
  the foundation upon which structured therapy goals can be built

- **Disease Status Tracking:** CancerDiseaseStatus and
  ConditionStatusTrendVS (responding, stable, progressing, remission)
  provide outcome vocabulary that therapy goals must reference

- **Staging & Prognosis:** Cancer staging profiles and the new risk
  assessment framework inform the clinical context in which therapy
  goals are set

- **Performance Status:** ECOG, Karnofsky, and the new Lansky scale are
  key inputs for therapy goal determination

- **Gap - Therapy Goals:** mCODE does not model explicit therapy goals
  (e.g., cure, life prolongation, symptom control, quality of life).
  This is the gap the KIG Onko specification aims to fill while
  maintaining compatibility with mCODE

# 9. References

[mCODE STU4 Published IG](https://hl7.org/fhir/us/mcode/STU4/)

[mCODE CI Build (latest)](https://build.fhir.org/ig/HL7/fhir-mCODE-ig/)

[CodeX FHIR
Accelerator](https://confluence.hl7.org/display/COD/CodeX+Home)

[mCODE GitHub Repository](https://github.com/HL7/fhir-mCODE-ig)

[mCODE Data Dictionary
(STU4)](https://hl7.org/fhir/us/mcode/STU4/dictionary.html)
