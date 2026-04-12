# README Design: Faggruppe - KI fra forsteprinsipp

Date: 2026-04-12
Scope: Public-facing README update

## Goals
- Present a short, clear overview for GitHub visitors.
- Explain what this repository contains and who it is for.
- Provide a minimal, reliable quick start.
- Keep content aligned with the current Slidev deck.

## Non-Goals
- Detailed build/export instructions.
- Contributor guidelines or governance.
- Long technical background or theory.

## Audience
- Public GitHub visitors and colleagues looking for context.
- Readers of Norwegian slide content.

## Information Architecture
1) Title and overview
2) Quick start
3) Project structure

## Proposed Content

### 1) Title and overview
- Title: "Faggruppe - KI fra forsteprinsipp"
- Summary (2-3 sentences):
  - This repo hosts the Slidev presentation for the second meetup in the series.
  - Based on Hands-On Large Language Models (Ch. 1-2): Language AI, tokens, embeddings.
  - Audience: internal faggruppe/colleagues; slides are in Norwegian.
  - Note: summary should be updated if slides.md scope changes.

### 2) Quick start
Commands:
- Prereq: pnpm (recommended) or npm
- pnpm install
- pnpm dev
- open http://localhost:3030
- edit slides.md to update content

### 3) Project structure
- slides.md: main presentation content
- components/: custom Vue components for slides
- snippets/: code snippets
- pages/: imported slides

## Content Decisions
- Exclude build/export/cspell section per user preference.
- Keep prose short and skimmable.
- Use ASCII in headings ("forsteprinsipp") to avoid encoding issues.

## Success Criteria
- README gives clear context in < 1 minute of reading.
- New visitor can run the deck quickly.
- Links and paths are accurate to this repo.
