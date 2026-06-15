"""Baut einen konsolidierten LG-01-Berichtsentwurf aus allen Bausteinen.

Workflow:
1. Konvertiert existierende .docx-Bausteine via pandoc nach Markdown
2. Normalisiert Heading-Levels (pandoc-Artefakte aus docx-Konvertierung)
3. Strippt redundante Baustein-Titel und -Untertitel
4. Setzt Kapitel-H1, Sektionen darunter als H2/H3
5. Konkateniert mit Deckblatt, Intro, Bausteinen und Synthese
6. Rendert via render.sh als BIH-Word
"""

from __future__ import annotations

import re
import shutil
import subprocess
from pathlib import Path

HERE = Path(__file__).parent
ROOT = HERE.parent
MASTER_MD = ROOT / "_master" / "LG-01_Analysebericht_Draft.md"
MASTER_DOCX = ROOT / "LG-01_Analysebericht_Draft.docx"

# Reihenfolge der Bausteine (Datei → Kapiteltitel)
# Reihenfolge nach Review-Iteration 1: MCC vor PCO (logischerer Ablauf von
# generischer CarePlan/Goal-Logik zu Patient-Centered Outcomes).
# eLTSS entfernt (keine Vorzüge gegenüber den anderen Quellen).
DOCX_BAUSTEINE = [
    ("mcode-stu4-summary_de.md", "mCODE STU4 — Minimal Common Oncology Data Elements"),
    ("IPS_EPS_Zusammenfassung_Onkologische_Therapieziele.docx", "International Patient Summary (IPS) und European Patient Summary (EPS)"),
    ("MCC_Zusammenfassung_Onkologische_Therapieziele.docx", "Multiple Chronic Conditions IG (MCC)"),
    ("pco-ig-summary.docx", "Patient-Centered Outcomes IG (PCO)"),
]

MD_BAUSTEINE = [
    ("EnLiST_Zusammenfassung_Onkologische_Therapieziele.md", "ESMO EnLiST 2026 — Lines of Systemic Therapy"),
    ("CPG-on-FHIR_Zusammenfassung_Onkologische_Therapieziele.md", "HL7 CPG-on-FHIR (CQF Recommendations)"),
]

EXAMPLE_MD = ("Beispiel_Leitlinienreferenz_S3_KRK.md", "Beispiel: Referenzierung einer S3-Leitlinien-Empfehlung")

# Honorary Mentions zwischen Quellen und Architektur
HONORARY_MD = ("Weitere_Initiativen_Honorary_Mentions.md", "Weitere relevante Initiativen")

# Architektur als finale Sektion
ARCHITEKTUR_MD = ("00_Architekturentscheidung.md", "Architekturentscheidung")


def docx_to_md(docx_path: Path, out_dir: Path) -> Path:
    out_md = out_dir / (docx_path.stem + ".md")
    subprocess.run(
        [
            "pandoc",
            str(docx_path),
            "--extract-media",
            str(out_dir / "media"),
            "-t",
            "gfm",
            "-o",
            str(out_md),
        ],
        check=True,
    )
    return out_md


def normalize_headings(text: str) -> str:
    """Reduziert >6 #-Heading-Levels auf 2; entfernt leere Hash-Pseudo-Heading-Zeilen."""
    lines = []
    for line in text.split("\n"):
        stripped = line.rstrip()
        # Leere Hash-Zeile (nur Hashes plus optional Whitespace) — komplett raus
        if re.match(r"^#{2,}\s*$", stripped):
            continue
        m = re.match(r"^(#{1,})\s+(.+)$", line)
        if m and len(m.group(1)) > 6:
            lines.append("## " + m.group(2))
        else:
            lines.append(line)
    return "\n".join(lines)


def strip_baustein_header(text: str) -> str:
    """Entfernt redundante Baustein-Titel-Zeilen und Untertitel/Quelle/Status-Header,
    damit der Kapitel-H1 das einzige Titel-Element bleibt."""
    lines = text.split("\n")
    out = []
    skip_until_first_heading = True
    for line in lines:
        if skip_until_first_heading:
            stripped = line.strip()
            # Erste echte Heading (H1-H3) beendet den Header-Bereich
            if re.match(r"^#{1,3}\s+", line):
                skip_until_first_heading = False
                out.append(line)
                continue
            # Überspringe Bold-Titel und kursive Untertitel und Leerzeilen am Anfang
            if not stripped:
                continue
            if stripped.startswith("**") and stripped.endswith("**"):
                continue
            if stripped.startswith("*") and stripped.endswith("*"):
                continue
            if stripped.startswith("Baustein für Liefergegenstand"):
                continue
            if stripped.startswith("**Quelle:**") or stripped.startswith("Quelle:"):
                continue
            if stripped.startswith("**Status:**") or stripped.startswith("Status:"):
                continue
            # Hier ist eine andere Zeile — die behalten wir (Inhalt vor Heading)
            out.append(line)
            continue
        out.append(line)
    return "\n".join(out).strip() + "\n"


def shift_headings_down(text: str, by: int = 1) -> str:
    """Schiebt alle Headings um N Level runter (H1 → H2 etc.)."""
    def repl(m):
        new_level = "#" * min(6, len(m.group(1)) + by)
        return f"{new_level} {m.group(2)}"

    return re.sub(r"^(#{1,6})\s+(.+)$", repl, text, flags=re.MULTILINE)


def fix_media_paths(text: str, baustein_dir: Path) -> str:
    """Korrigiert relative Bildpfade aus _master/media → _master/media (bereits relativ zum master.md)."""
    # Pandoc extrahiert media nach _master/media, die master.md liegt in _master/ — passt schon.
    return text


def chapter(title: str, body: str) -> str:
    return f"# {title}\n\n{body}\n"


def main():
    out_dir = MASTER_MD.parent
    out_dir.mkdir(exist_ok=True)
    # media-Verzeichnis aufräumen
    media = out_dir / "media"
    if media.exists():
        shutil.rmtree(media)

    chapters: list[str] = []

    # Deckblatt + Intro
    chapters.append(
        """# LG-01 Analysebericht — Spezifikation „Onkologische Therapieziele"

Liefergegenstand LG-01 · Gematik-Auftrag C002717 · BIH-CEI

**Stand:** Entwurf · Mai 2026
**Projektleitung:** Sylvia Thun
**Technische Leitung FHIR:** Thomas Debertshäuser
"""
    )

    # Methodik
    chapters.append(
        """# Auftrag und Methodik

## Auftrag

Die Spezifikation „Onkologische Therapieziele" wurde am 02.04.2026 von der gematik (Vertrag C002717) beauftragt. Sie soll bis 30.09.2026 als FHIR-Implementation-Guide vorliegen, ergänzt um ein Konzept zur MII-Integration. Dieser Analysebericht (LG-01) bildet die Grundlage für die Anforderungserhebung im ersten Workshop und für das Informationsmodell sowie den IG-Entwurf in den Folgephasen.

## Methodik

Untersucht wurden sechs internationale und nationale FHIR-/Standardisierungs-Quellen, mit Fokus auf Übertragbarkeit auf die deutsche Versorgungsrealität:

1. **mCODE STU4** — Minimal Common Oncology Data Elements (HL7 International)
2. **International Patient Summary (IPS) / European Patient Summary (EPS)** — generische Patientenzusammenfassungen
3. **Multiple Chronic Conditions IG (MCC)** — chronische, parallele Erkrankungen, CarePlan-/Goal-Logik
4. **Patient-Centered Outcomes IG (PCO)** — patientenzentrierte Ergebniskonzepte
5. **ESMO EnLiST 2026** — Therapielinien-Konsens für solide Tumoren
6. **HL7 CPG-on-FHIR (CQF Recommendations)** — computable Leitlinien-Repräsentation

Pro Quelle ist die Analyse einheitlich strukturiert: übertragbares Muster, Anwendungsbeispiel, Lücken & Lösungsansätze, direkt übernehmbare Elemente, Fazit "Was nutzen wir warum", Quellen. Den Quellen folgt eine **Synthese mit Architekturentscheidung**.
"""
    )

    # Per-spec bausteine — DOCX_BAUSTEINE-Liste kann auch .md-Dateien enthalten
    for fname, title in DOCX_BAUSTEINE:
        path = ROOT / fname
        if fname.endswith(".docx"):
            md_path = docx_to_md(path, out_dir)
            text = md_path.read_text(encoding="utf-8")
        else:
            text = path.read_text(encoding="utf-8")
        text = normalize_headings(text)
        text = strip_baustein_header(text)
        text = shift_headings_down(text, by=1)
        chapters.append(chapter(title, text))

    for fname, title in MD_BAUSTEINE:
        text = (ROOT / fname).read_text(encoding="utf-8")
        text = strip_baustein_header(text)
        text = shift_headings_down(text, by=1)
        chapters.append(chapter(title, text))

    # Honorary Mentions
    fname, title = HONORARY_MD
    text = (ROOT / fname).read_text(encoding="utf-8")
    text = strip_baustein_header(text)
    text = shift_headings_down(text, by=1)
    chapters.append(chapter(title, text))

    # Architektur am Schluss
    fname, title = ARCHITEKTUR_MD
    text = (ROOT / fname).read_text(encoding="utf-8")
    text = strip_baustein_header(text)
    text = shift_headings_down(text, by=1)
    chapters.append(chapter(title, text))

    MASTER_MD.write_text("\n\n".join(chapters), encoding="utf-8")
    print(f"Geschrieben: {MASTER_MD}")

    # Snapshot der aktuellen SharePoint-/lokalen-Version sichern, falls vorhanden.
    # So gehen Reviewer-Kommentare vor dem Rebuild nicht verloren.
    snapshot_dir = ROOT / "_snapshots"
    snapshot_dir.mkdir(exist_ok=True)
    sp_path = Path(
        "/Users/thome/Library/CloudStorage/"
        "OneDrive-FreigegebeneBibliotheken–Charité-UniversitätsmedizinBerlin/"
        "Core Unit eHealth & Interoperability - General/Projekte/"
        "01 - Laufende Projekte/Gematik KIG Therapieziel Onko/L01-Analyse/"
        "LG-01_Analysebericht_Draft.docx"
    )
    from datetime import datetime
    candidates = []
    if sp_path.exists():
        candidates.append(("sharepoint", sp_path))
    if MASTER_DOCX.exists():
        candidates.append(("local", MASTER_DOCX))
    for label, src in candidates:
        ts = datetime.fromtimestamp(src.stat().st_mtime).strftime("%Y%m%d-%H%M")
        snap_name = f"LG-01_Analysebericht_Draft_{ts}_{label}_pre-rebuild.docx"
        snap_path = snapshot_dir / snap_name
        if not snap_path.exists():
            import shutil
            shutil.copy2(src, snap_path)
            print(f"Snapshot: {snap_path.name}")

    # Rendern via render.sh
    subprocess.run(
        [str(HERE / "render.sh"), str(MASTER_MD), str(MASTER_DOCX)],
        check=True,
    )

    # Spacing-Overrides aus den Quelldokumenten entfernen, damit
    # die Reference-DOCX-Body-Styles einheitlich greifen.
    from normalize_spacing import normalize_spacing
    normalize_spacing(MASTER_DOCX)

    # Deckblatt als erste Seite injizieren
    from datetime import date
    from inject_cover import inject_cover
    inject_cover(
        MASTER_DOCX,
        title="LG-01 Analysebericht",
        subtitle="Spezifikation „Onkologische Therapieziele\"",
        metadata={
            "Liefergegenstand": "LG-01 · Fachliche Analyse",
            "Auftrag": "Gematik C002717",
            "Stand": date.today().strftime("%d.%m.%Y") + " · Entwurf",
            "Projektleitung": "Prof. Dr. Sylvia Thun",
            "Technische Leitung FHIR": "Thomas Debertshäuser",
        },
    )
    print(f"Deckblatt injiziert: {MASTER_DOCX}")


if __name__ == "__main__":
    main()
