# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repository Is

AIMMS documentation site built with Sphinx (reStructuredText). Published to https://documentation.aimms.com/. Source files are `.rst` and the build output goes to `_build/`.

## Build Commands

Dependencies are managed via `pyproject.toml` using [uv](https://docs.astral.sh/uv/). The two AIMMS plugins are installed directly from the in-repo `aimms-plugins/` sources — no PyPI publish step needed.

```bash
# One-time setup: install uv (if not already installed)
pip install uv          # or: winget install astral-sh.uv  (Windows)

# Install all dependencies into a local .venv
uv sync
```

| Task | Command |
|---|---|
| Build HTML | `uv run sphinx-build -W --keep-going -b html . _build/html` |
| Spell check | `uv run sphinx-build -W --keep-going -b spelling . _build/spelling` |
| Link check | `uv run sphinx-build -W --keep-going -b linkcheck . _build/linkcheck` |
| Build PDF | `uv run make latexpdf` (requires MikTeX on Windows) |

> **Spell check system dependency:** `sphinxcontrib-spelling` requires the native `enchant` library.
> Linux: `apt install libenchant-2-2` · macOS: `brew install enchant` · Windows: usually works out of the box.

**CI uses `-W --keep-going`** — any Sphinx warning fails the pipeline. Build locally and confirm zero warnings before pushing.

## Custom Sphinx Plugins

Two AIMMS-owned packages live in `aimms-plugins/` and are installed as editable installs directly from source via `pyproject.toml`:

- **`sphinx-aimms-theme`** — custom HTML theme, AIMMS domain (`:aimms:set:`, etc.), AIMMS lexer for syntax highlighting, and spelling filters. Source: `aimms-plugins/sphinx-aimms-theme/`.
- **`aimms-pygments-style`** — Pygments lexer/style for AIMMS language syntax. Source: `aimms-plugins/aimms-pygments-style/`.

When changes to these plugins are needed, update the source in `aimms-plugins/` and run `uv sync` — changes are reflected immediately without any publish step. To release a new version to PyPI (for external consumers), bump the version in `setup.py` and publish manually.

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
