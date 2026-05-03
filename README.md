# Faggruppe - KI fra forsteprinsipp

Slidev-presentasjon for den andre samlingen i faggruppen om KI fra forsteprinsipp. Basert pa *Hands-On Large Language Models* (kapittel 1-2): Language AI, tokens og embeddings. Lysbildene er pa norsk og ment for kolleger/internt bruk og andre GitHub-besokende. Oppdater denne oppsummeringen hvis innholdet i `slides.md` endres.

Live slides: https://sjoenH.github.io/faggruppe-ki-fra-forsteprinsipp/

## Presentasjoner

Dette repoet inneholder flere presentasjoner:

- **`slides.md`** - Hovedpresentasjon (Kapittel 1-2: Historikk, tokens, embeddings)
- **`slides-may4.md`** - Quiz-format for 4. mai (Kapittel 3: Looking Inside LLMs)

### Kjøre en spesifikk presentasjon

Standard (slides.md):
```bash
pnpm dev
```

May 4th quiz (slides-may4.md):
```bash
pnpm dev slides-may4.md
```

Åpne http://localhost:3030

## Reading plan (Ch. 3-12) - 2026

Cadence and format
- Minimum 1 meeting/month, except July and the first half of August.
- Front-load extra meetings in May and June (2 each).
- 50/50 split: ~45-60 min book + ~45-60 min application.
- Application segment is group work by default with short share-out.
- Alternate mini-lab and tool demo by default; bonus topics allowed.

Schedule (front-loaded before summer)
- May (2 meetings)
  - M1: **May 4** - Chapter 3 - Looking Inside Large Language Models + Quiz format (`slides-may4.md`)
  - M2: Chapter 4 - Text Classification + Tool demo
- June (2 meetings)
  - M1: Chapter 5 - Text Clustering and Topic Modeling + Mini-lab
  - M2: Chapter 6 - Prompt Engineering + Tool demo
- July: no meetings
- Late August (1 meeting)
  - M1: Chapters 7-8 (bundled) + Mini-lab
    - Chapter 7 - Advanced Text Generation Techniques and Tools
    - Chapter 8 - Semantic Search and Retrieval-Augmented Generation
- September (1 meeting)
  - Chapter 9 - Multimodal Large Language Models + Tool demo
- October (1 meeting)
  - Chapter 10 - Creating Text Embedding Models + Mini-lab
- November (1 meeting)
  - Chapter 11 - Fine-Tuning Representation Models for Classification + Tool demo
- December (1 meeting)
  - Chapter 12 - Fine-Tuning Generation Models + Mini-lab

## Quick start

Forutsetning: pnpm (anbefalt) eller npm

```bash
pnpm install
pnpm dev
```

Apne http://localhost:3030

Rediger `slides.md` for a oppdatere innholdet.

## Prosjektstruktur

- `slides.md` - hovedinnhold for presentasjonen (Kapittel 1-2)
- `slides-may4.md` - quiz-format presentasjon for 4. mai (Kapittel 3)
- `public/images/` - bilder fra boken (Chapter 3 figures)
- `components/` - tilpassede Vue-komponenter
- `snippets/` - kodesnutter brukt i lysbilder
- `pages/` - importerte slides
