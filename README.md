# Policy-Following Agent Paper Review

This repository standardizes deep review of research papers using a 7-step analysis workflow.

## Folder Layout

- `papers/index.csv`: paper registry
- `papers/<slug>/paper.pdf`: source paper
- `papers/<slug>/paper.txt`: extracted text (optional but recommended)
- `papers/<slug>/meta.yaml`: metadata
- `papers/<slug>/01_intent.md` ... `07_synthesis.md`: research analysis files
- `papers/<slug>/08_engineering_internals.md`: benchmark internals from an engineering view
- `papers/<slug>/09_mermaid_diagrams.md`: benchmark-specific mermaid architecture and sequence diagrams
- `papers/<slug>/10_metric_semantics.md`: metric meaning, blind spots, and gaming risks
- `papers/<slug>/11_adopt_adapt_reject.md`: implementation decision table
- `templates/`: reusable markdown templates
- `scripts/`: ingestion/download/extraction/review/status scripts

## Core Analysis Files

1. `01_intent.md`
2. `02_argument_map.md`
3. `03_pipeline.md`
4. `04_evidence_audit.md`
5. `05_validity_blindspots.md`
6. `06_local_positioning.md`
7. `07_synthesis.md`

## Engineering Add-On Files

1. `08_engineering_internals.md`
2. `09_mermaid_diagrams.md`
3. `10_metric_semantics.md`
4. `11_adopt_adapt_reject.md`

## Quick Start

1. Add a paper scaffold:

```bash
make ingest SLUG=constitutional-ai TITLE="Constitutional AI" URL="https://example.com/paper.pdf" YEAR=2022 OWNER=jyoti
```

2. Download all PDFs from `papers/index.csv`:

```bash
make fetch
```

3. Extract paper text:

```bash
make extract
```

4. Analyze one paper (automated mode):

```bash
make analyze PAPER=constitutional-ai
```

5. Analyze all papers in parallel:

```bash
make analyze-parallel WORKERS=4
```

6. See status:

```bash
make status
```

7. Backfill engineering templates for existing papers:

```bash
make backfill-engineering
```

8. Run engineering add-on analysis for one paper:

```bash
make analyze-engineering PAPER=constitutional-ai
```

9. Run engineering add-on analysis in parallel:

```bash
make analyze-engineering-parallel WORKERS=3
```

10. See engineering add-on status:

```bash
make status-engineering
```

## Collaboration Model

- One PR per paper folder.
- Set `owner` in `papers/index.csv`.
- Merge only if all required markdown files are present and meaningful.
- CI validates structure on push/PR.

## Publishing to Remote (GitHub)

If this repo is local-only, run:

```bash
git init
git add .
git commit -m "Initialize paper review pipeline"
git branch -M main
git remote add origin <YOUR_GITHUB_REPO_URL>
git push -u origin main
```

Then invite collaborators on GitHub.

## Notes

- If `pdftotext` is missing, install `poppler`.
- `scripts/review_one_paper.sh` writes `.status` as `RUNNING`, `DONE`, `FAILED`, or `MANUAL`.
