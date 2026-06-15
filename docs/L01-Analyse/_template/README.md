# BIH-Reference-DOCX (unoffiziell)

**Status:** Unoffizielles, projektinternes Word-Reference-Dokument. **Kein** Ersatz für eine offizielle Charité/BIH-Vorlage bei extern verteilten Dokumenten — nur für interne Berichtsentwürfe und Liefergegenstands-Entwürfe gedacht.

## Inhalt

- `bih-logo.png` — BIH-Logo, extrahiert aus dem offiziellen PowerPoint-Template `BIH_16x9_latest.potx` (bih-presentation Skill).
- `build_bih_reference_docx.py` — Python-Skript, das `BIH_Report_unofficial_reference.docx` aus dem Logo und den Corporate-Farben erzeugt.
- `BIH_Report_unofficial_reference.docx` — fertige Reference-DOCX für pandoc.
- `render.sh` — Helper-Skript, das ein Markdown via pandoc + Reference-DOCX zu Word/PDF rendert.

## Verwendete Corporate-Assets

Aus `BIH_16x9_latest.potx` extrahiert:

- **Schrift:** Fira Sans (Regular / Bold / Italic / BoldItalic) — bereits im Skill `~/.claude/skills/bih-presentation/assets/fonts/` vorhanden, ggf. systemweit installieren.
- **Farben:**
  - `#70ACC0` — BIH-Blau (Primär)
  - `#003754` — Dunkelnavy (H1, Titel)
  - `#C12075` — BIH-Magenta (Akzent)
  - `#723C5D` — Plum (H3, Hervorhebungen)
  - `#4C626C` — Slate (H4, Captions)
  - `#9D9D9D` — Grey (Footer, Sekundärtext)
  - `#BE9E7C` — Tan (Sekundärakzent)

## Verwendung

### Einmalig: Reference-DOCX bauen

```bash
cd L01-Analyse/_template
python3 build_bih_reference_docx.py
```

### Markdown → BIH-Word rendern

```bash
./render.sh ../EnLiST_Zusammenfassung_Onkologische_Therapieziele.md
# → schreibt EnLiST_Zusammenfassung_Onkologische_Therapieziele.docx
```

### Markdown → BIH-PDF (benötigt XeLaTeX und Fira Sans systemweit)

```bash
./render.sh ../EnLiST_Zusammenfassung_Onkologische_Therapieziele.md ../EnLiST.pdf
```

## Limitationen

- Header mit Logo, Footer mit Projektzeile, BIH-Farben in Überschriften — kein vollständiges Corporate Design (kein Deckblatt-Layout, keine Marginalspalten, keine speziellen Boxen).
- Pandoc-Tabellen verwenden den Standard "Table Grid"-Stil, nicht ein BIH-Custom-Tabellendesign.
- Logo wird im Header rechts ausgerichtet eingebunden; in Word manuell verschiebbar.
- Sobald eine offizielle BIH-`.dotx` vorliegt, sollte sie diese Vorlage ersetzen.

## Pflege

Wenn Brand-Assets im Skill `bih-presentation` aktualisiert werden:
1. Logo und Farben neu extrahieren (`unzip BIH_16x9_latest.potx`, dann `ppt/media/image1.png` und `ppt/theme/theme1.xml`).
2. `build_bih_reference_docx.py` anpassen.
3. Reference-DOCX neu bauen.
