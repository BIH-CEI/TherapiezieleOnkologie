#!/usr/bin/env bash
# Render ein Markdown-Dokument mit BIH-Layout zu .docx (oder PDF).
#
# Nutzung:
#   ./render.sh <input.md> [output.docx]
#   ./render.sh <input.md> output.pdf      (benötigt LaTeX-Engine)
#
# Standard-Output: <input>.docx im selben Verzeichnis wie das Input-Markdown.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REF_DOC="${SCRIPT_DIR}/BIH_Report_unofficial_reference.docx"

if [[ ! -f "${REF_DOC}" ]]; then
  echo "Reference-Doc fehlt — baue es neu mit build_bih_reference_docx.py …"
  python3 "${SCRIPT_DIR}/build_bih_reference_docx.py"
fi

INPUT="${1:?Bitte Eingabedatei angeben (Markdown).}"
OUTPUT="${2:-${INPUT%.md}.docx}"

case "${OUTPUT}" in
  *.docx)
    pandoc "${INPUT}" \
      --from=gfm+pipe_tables+yaml_metadata_block \
      --to=docx \
      --reference-doc="${REF_DOC}" \
      --toc --toc-depth=2 \
      -M toc-title:"Inhaltsverzeichnis" \
      -V lang=de-DE \
      -o "${OUTPUT}"
    ;;
  *.pdf)
    pandoc "${INPUT}" \
      --from=gfm+pipe_tables+yaml_metadata_block \
      --pdf-engine=xelatex \
      -V mainfont="Fira Sans" \
      -V geometry:margin=2.5cm \
      --toc --toc-depth=2 \
      -o "${OUTPUT}"
    ;;
  *)
    echo "Unbekanntes Output-Format: ${OUTPUT}" >&2
    exit 1
    ;;
esac

echo "Geschrieben: ${OUTPUT}"
