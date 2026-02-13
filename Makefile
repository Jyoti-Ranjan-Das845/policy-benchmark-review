SHELL := /bin/bash

.PHONY: ingest fetch extract analyze analyze-parallel status backfill-engineering analyze-engineering analyze-engineering-parallel status-engineering validate

# Usage:
# make ingest SLUG=paper-slug TITLE="Paper Title" URL="https://...pdf" YEAR=2025 OWNER=name NOTES="optional"
ingest:
	@test -n "$(SLUG)" && test -n "$(TITLE)" && test -n "$(URL)" || (echo "SLUG, TITLE, URL are required" && exit 1)
	./scripts/add_paper.sh "$(SLUG)" "$(TITLE)" "$(URL)" "$(YEAR)" "$(OWNER)" "$(NOTES)"

fetch:
	./scripts/fetch_pdfs.sh

extract:
	./scripts/extract_text.sh

# Single paper automated review (uses codex CLI)
analyze:
	@test -n "$(PAPER)" || (echo "PAPER is required" && exit 1)
	./scripts/review_one_paper.sh "$(PAPER)"

# Parallel automated review for all papers
analyze-parallel:
	./scripts/run_parallel_review.sh "$(WORKERS)"

status:
	./scripts/status_report.sh

backfill-engineering:
	./scripts/backfill_engineering_templates.sh

analyze-engineering:
	@test -n "$(PAPER)" || (echo "PAPER is required" && exit 1)
	./scripts/review_engineering_one_paper.sh "$(PAPER)"

analyze-engineering-parallel:
	./scripts/run_parallel_engineering_review.sh "$(WORKERS)"

status-engineering:
	./scripts/status_report_engineering.sh

validate:
	bash -lc 'for d in papers/*; do [[ -d "$$d" ]] || continue; for f in 01_intent.md 02_argument_map.md 03_pipeline.md 04_evidence_audit.md 05_validity_blindspots.md 06_local_positioning.md 07_synthesis.md 08_engineering_internals.md 09_mermaid_diagrams.md 10_metric_semantics.md 11_adopt_adapt_reject.md meta.yaml; do [[ -f "$$d/$$f" ]] || { echo "Missing $$d/$$f"; exit 1; }; done; done; echo "Structure OK"'
