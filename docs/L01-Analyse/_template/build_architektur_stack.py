"""Rendert das Vier-Schichten-Architekturdiagramm als PNG (BIH-Farben)."""

from pathlib import Path

import matplotlib.pyplot as plt
from matplotlib.patches import FancyBboxPatch

HERE = Path(__file__).parent
OUT = HERE.parent / "00_architektur_stack.png"

# Theme-Rollen aus BIH_16x9.pptx (theme1.xml, 04.03.2026):
# dk1 Navy / dk2 + accent1 Dunkelrot (Primär-Akzent) /
# accent2 Koral / accent5 Teal / accent6 Slate-Purple
BIH_NAVY = "#003754"      # dk1 — Schicht 1 (Strukturachse)
BIH_BLUE = "#AF1821"      # dk2/accent1 — Schicht 2 (Primärpfad)
BIH_PLUM = "#009AA9"      # accent5 — Schicht 3 (Fallback)
BIH_SLATE = "#7876B6"      # accent6 — Schicht 4 (Datenbasis)
BIH_TAN = "#EA5451"        # accent2 — Reserve
BIH_GREY_LIGHT = "#F2F2F2"

LAYERS = [
    {
        "title": "1 — Strukturachse Therapielinien",
        "source": "ESMO EnLiST 2026",
        "body": "eLoT / aLoT / iLoT in X.Y-Notation · drei Änderungstypen · Mindestdatensatz",
        "color": BIH_NAVY,
        "role": "Strukturachse",
    },
    {
        "title": "2 — Methodik & computable Repräsentation",
        "source": "HL7 CPG-on-FHIR (CQF Recommendations) v2.0.0 STU2",
        "body": "PlanDefinition (Pathway / Strategy / Recommendation) · ActivityDefinition · Library/CQL\nLeitlinienreferenz via instantiatesCanonical und relatedArtifact",
        "color": BIH_BLUE,
        "role": "Primärpfad",
    },
    {
        "title": "3 — Plan- & Ziel-Logik",
        "source": "CarePlan / Goal — aus MCC eCare Plan, mCODE-Patterns; IPS/EPS als Boundary Exchange Format",
        "body": "greift, wenn keine computable Leitlinie existiert oder der konkrete Fall abweicht\nIPS/EPS für Prepopulate / Writeback an Sektorengrenzen — verpflichtend",
        "color": BIH_PLUM,
        "role": "Fallback",
    },
    {
        "title": "4 — Datenelemente & Terminologie",
        "source": "MII KDS-Onkologie (+ MII-Medikation, -Prozedur, -Diagnose) · oBDS / oncoBox",
        "body": "ICD-10-GM · SNOMED CT (MII-Kernset) · LOINC · ATC · OPS",
        "color": BIH_SLATE,
        "role": "Datenbasis",
    },
]

# Layout-Parameter
fig_w, fig_h = 11.5, 7.2  # Inch
fig, ax = plt.subplots(figsize=(fig_w, fig_h), dpi=160)
ax.set_xlim(0, 100)
ax.set_ylim(0, 100)
ax.axis("off")

# Vertikale Verteilung
top = 96
gap = 1.6
layer_height = (top - 4 - gap * 3) / 4  # 4 Schichten plus 3 Gaps

for idx, layer in enumerate(LAYERS):
    y_top = top - idx * (layer_height + gap)
    y_bottom = y_top - layer_height
    # Hauptbox in BIH-Layer-Farbe (links: Rolle-Banner; rechts: Inhalt hell)
    banner_w = 16
    # Banner links (Rolle)
    banner = FancyBboxPatch(
        (2, y_bottom),
        banner_w,
        layer_height,
        boxstyle="round,pad=0,rounding_size=0.8",
        linewidth=0,
        facecolor=layer["color"],
    )
    ax.add_patch(banner)
    ax.text(
        2 + banner_w / 2,
        (y_top + y_bottom) / 2,
        layer["role"],
        color="white",
        fontsize=13,
        ha="center",
        va="center",
        fontweight="bold",
        family="DejaVu Sans",
    )
    # Inhalt rechts (heller Hintergrund mit Layer-Farbe als Rand)
    content = FancyBboxPatch(
        (2 + banner_w + 0.6, y_bottom),
        100 - 4 - banner_w - 0.6,
        layer_height,
        boxstyle="round,pad=0,rounding_size=0.8",
        linewidth=1.4,
        edgecolor=layer["color"],
        facecolor="white",
    )
    ax.add_patch(content)
    # Titelzeile
    ax.text(
        2 + banner_w + 1.8,
        y_top - 2.5,
        layer["title"],
        color=BIH_NAVY,
        fontsize=12,
        fontweight="bold",
        va="top",
        family="DejaVu Sans",
    )
    # Quelle (kursiv, Layer-Farbe)
    ax.text(
        2 + banner_w + 1.8,
        y_top - 6.5,
        layer["source"],
        color=layer["color"],
        fontsize=10,
        fontstyle="italic",
        va="top",
        family="DejaVu Sans",
    )
    # Body
    ax.text(
        2 + banner_w + 1.8,
        y_top - 11,
        layer["body"],
        color="#222222",
        fontsize=10,
        va="top",
        family="DejaVu Sans",
    )

# Titel oben
ax.text(
    50,
    99,
    "Vier-Schichten-Architektur · Spezifikation „Onkologische Therapieziele\"",
    color=BIH_NAVY,
    fontsize=14,
    fontweight="bold",
    ha="center",
    va="top",
    family="DejaVu Sans",
)

# Fußzeile
ax.text(
    50,
    1.2,
    "BIH-CEI · Gematik KIG Onkologische Therapieziele · LG-01",
    color="#888888",
    fontsize=8,
    ha="center",
    va="bottom",
    family="DejaVu Sans",
)

plt.savefig(OUT, dpi=200, bbox_inches="tight", facecolor="white")
print(f"Geschrieben: {OUT}")
