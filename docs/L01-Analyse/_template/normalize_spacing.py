"""Normalisiert Zeilenabstände im finalen DOCX.

Probleme aus den unterschiedlichen Quelldokumenten:
- pandoc nutzt "Compact" für viele Absätze (besonders nach docx-Roundtrip).
  Compact hat space-after=0 → erzeugt enge Blöcke.
- Manche pandoc-Absätze sind FirstParagraph oder BodyText mit eigenem Spacing.

Lösung:
1. Direkte <w:spacing>-Overrides aus Body-Absätzen entfernen
   (Heading/Title/TOC bleiben unberührt).
2. Absätze außerhalb von Tabellen, die "Compact" verwenden,
   auf "BodyText" umstellen — so greift einheitliche Body-Spacing.
"""

from __future__ import annotations

import shutil
import tempfile
import zipfile
from pathlib import Path

W = "{http://schemas.openxmlformats.org/wordprocessingml/2006/main}"

PRESERVE_STYLES = {
    "Heading1", "Heading2", "Heading3", "Heading4", "Heading5", "Heading6",
    "Title", "Subtitle",
    "Caption",
    "TOCHeading", "TOC1", "TOC2", "TOC3",
}


def normalize_spacing(docx_path: Path) -> None:
    from lxml import etree

    with tempfile.TemporaryDirectory() as tmp:
        with zipfile.ZipFile(docx_path, "r") as z:
            z.extractall(tmp)
        doc_xml = Path(tmp) / "word" / "document.xml"
        tree = etree.parse(str(doc_xml))
        root = tree.getroot()

        removed_spacing = 0
        remapped_compact = 0

        # Sammle alle <w:p>-Elemente, die innerhalb einer <w:tbl> liegen
        in_table = set()
        for tbl in root.iter(f"{W}tbl"):
            for p in tbl.iter(f"{W}p"):
                in_table.add(id(p))

        for p in root.iter(f"{W}p"):
            pPr = p.find(f"{W}pPr")
            if pPr is None:
                continue
            pStyle = pPr.find(f"{W}pStyle")
            style_val = pStyle.get(f"{W}val") if pStyle is not None else "Normal"

            if style_val in PRESERVE_STYLES:
                continue

            # Outside-of-table Compact → BodyText
            if style_val == "Compact" and id(p) not in in_table:
                pStyle.set(f"{W}val", "BodyText")
                remapped_compact += 1
                style_val = "BodyText"

            # Direkte spacing-Overrides entfernen (Style soll gelten)
            spacing = pPr.find(f"{W}spacing")
            if spacing is not None:
                pPr.remove(spacing)
                removed_spacing += 1

        tree.write(str(doc_xml), xml_declaration=True, encoding="UTF-8", standalone=True)

        out_tmp = Path(tmp) / "out.docx"
        base = Path(tmp)
        with zipfile.ZipFile(out_tmp, "w", zipfile.ZIP_DEFLATED) as z:
            for f in base.rglob("*"):
                if f.is_file() and f.name != "out.docx":
                    z.write(f, f.relative_to(base))
        shutil.copy2(out_tmp, docx_path)
        print(
            f"Spacing normalisiert: {remapped_compact} Compact→BodyText, "
            f"{removed_spacing} direkte Overrides entfernt"
        )


if __name__ == "__main__":
    import sys
    normalize_spacing(Path(sys.argv[1]))
