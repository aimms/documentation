# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repository Is

AIMMS documentation site built with Sphinx (reStructuredText). Published to https://documentation.aimms.com/. Source files are `.rst` and the build output goes to `_build/`.

## Build Commands

The preferred way to build locally is via Docker, using the image built from `docker/Dockerfile`:

```bash
# Build the image once (from repo root)
docker build -t sphinx-doc-builder docker/

# Build HTML documentation
docker run --rm -it -v .:/src sphinx-doc-builder sphinx-build -W --keep-going -b html /src /src/_build/html

# Spell check
docker run --rm -it -v .:/src sphinx-doc-builder sphinx-build -W --keep-going -b spelling /src /src/_build/spelling

# Link check
docker run --rm -it -v .:/src sphinx-doc-builder sphinx-build -W --keep-going -b linkcheck /src /src/_build/linkcheck
```

Alternatively, install dependencies natively and use `make`:

```bash
python3 -m pip install sphinx sphinxcontrib.spelling sphinx-aimms-theme aimms-pygments-style
```

| Task | Command |
|---|---|
| Build HTML | `make html` |
| Spell check | `python3 -m sphinx -b spelling . _build/spelling` |
| Link check (internal) | `make linkcheck` |
| Link check (with external) | `python3 -m sphinx -W --keep-going -b linkcheck . _build/linkcheck` |
| Build PDF | `make latexpdf` (requires MikTeX on Windows) |

**CI uses `-W --keep-going`** — any Sphinx warning fails the pipeline. Build locally and confirm zero warnings before pushing.

## Custom Sphinx Plugins

Two AIMMS-owned packages are published to PyPI and installed via `docker/requirements.txt`:

- **`sphinx-aimms-theme`** — custom HTML theme, AIMMS domain (`:aimms:set:`, etc.), AIMMS lexer for syntax highlighting, and spelling filters. Source: `aimms-plugins/sphinx-aimms-theme/`.
- **`aimms-pygments-style`** — Pygments lexer/style for AIMMS language syntax. Source: `aimms-plugins/aimms-pygments-style/`.

When changes to these plugins are needed, update the source in `aimms-plugins/`, bump the version in `setup.cfg`, build and upload to PyPI manually, then update the pinned version in `docker/requirements.txt` and rebuild the Docker image.

## Architecture

Each product or library has its own top-level directory (`/cloud/`, `/pro/`, `/webui/`, `/cdm/`, `/dataexchange/`, etc.) with its own `index.rst`. The root `index.rst` ties all sections together. Shared images live in `/Images/`; section-local images in `<section>/images/`.

`conf.py` has platform-specific behavior:
- **Windows (local):** Shows "Edit on GitLab" button, disables cloud extensions (Algolia, GA).
- **Linux (CI/CD):** Enables Algolia search, Google Analytics, and `sphinx_sitemap` / `sphinx_last_updated_by_git`.

Intersphinx is configured for cross-repo linking to `functionreference`, `language-reference`, `how-to`, `user-guide`, `aimmsxllibrary`, and `webui`.

## RST Conventions

- Heading markers in order: `===` (title), `---` (section), `^^^` (subsection).
- Title underlines must be at least as long as the title text — Linux builds are strict about this.
- Use `:ref:` anchors for cross-references (not bare title links) to survive title renames.
- Use `:doc:` to link to other files within this repo.
- File names are **case-sensitive on Linux** even if Windows builds succeed locally.

## Spelling

Unknown words go in `spelling_wordlist.txt` (one word per line). Custom filters are in `spellingFilters.py`.

## Branching and Publishing

- Work on a feature branch; merge to `develop` for weekly review cycle.
- `master` branch triggers production deployment — do not push directly unless urgent.
- Each push to a non-master branch deploys to a staging URL at `documentation-staging/<branch-name>`.
