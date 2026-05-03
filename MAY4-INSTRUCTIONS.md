# May 4th Session - Quiz Instructions

## Overview
This is a new interactive quiz format where participants work in pairs to explain concepts from Chapter 3 of the Hands-On LLMs book using images/figures as prompts.

## How to Run the Presentation

```bash
cd faggruppe-ki-2026
pnpm dev slides-may4.md
```

Then open: http://localhost:3030

## Format

1. **Partner up** - Participants find a partner (preferably someone who read the book)
2. **View image** - You show one figure from Chapter 3
3. **Discuss (2-5 min)** - Pairs discuss what the image shows
4. **Explain** - Starting group explains first
5. **Add points** - Other groups can add details and steal points

## Scoring

| Situation | Points |
|-----------|--------|
| God forklaring (good explanation) | ⭐⭐⭐ |
| Delvis god forklaring (partial) | ⭐ |
| Vesentlig tillegg fra annen gruppe (substantial addition) | ⭐ |

## Quiz Rounds (17 total)

Rundene følger **bokens kronologiske rekkefølge** (Figure 3-1 → 3-33).

### Runde 1: Hva er Transformers?
- **Figure 3-1**: Text-in, text-out overview of Transformer LLMs

### Runde 2: Forward pass? Transformer Loop?
- **Figure 3-2**: Token-by-token generation
- **Figure 3-3**: Output token appended to prompt, then next forward pass

### Runde 3: LM Head - hva er det?
- **Figure 3-4**: Full architecture (tokenizer → transformer blocks → LM head)
- **Figure 3-6**: Probability scores for each token in vocabulary

### Runde 4: Tokenizer vocabulary – hva har det å si «for modellen»?
- **Figure 3-5**: 50,000 token vocabulary with associated embeddings

### Runde 5: Hva er Temperatur? Hva vil det si å være Grådig?
- **Figure 3-7**: Top probability tokens and decoding strategy (greedy vs. sampling)

### Runde 6: Parallel processing - hvorfor beregne alle streams?
- **Figure 3-8**: Each token processed through its own stream
- **Figure 3-9**: Earlier streams needed for attention mechanism

### Runde 7: Hvorfor cache? ⭐ BONUSPOENG
- **Figure 3-10**: Caching computation results instead of repeating calculations

### Runde 8: Transformer Block - hva består den av?
- **Figure 3-12**: Self-attention layer + feedforward neural network

### Runde 9: Hva gjør Feedforward Neural Network?
- **Figure 3-13**: FFN does memorization and interpolation - where actual knowledge is stored

### Runde 10: Forklar bildet
- **Figure 3-14**: Self-attention incorporating information from previous positions

### Runde 11: Hva forklares her? (Attention heads)
- **Figure 3-17**: Multiple parallel attention heads increasing model capacity

### Runde 12: Queries, Keys, Values - forklar de tre matrisene
- **Figure 3-19**: Q, K, V matrices and their roles in attention

### Runde 13: Sparse/Local attention - hvorfor er dette nødvendig?
- **Figure 3-22**: Local attention limiting context window
- **Figure 3-23**: Full vs sparse attention patterns

### Runde 14: Hva viser dette bildet? Forklar fargekodingen.
- **Figure 3-24**: How to read attention visualization diagrams

### Runde 15: Multi-head vs Multi-query vs Grouped-query? ⭐ BONUSPOENG
- **Figure 3-26**: Multi-head attention (original)
- **Figure 3-28**: Grouped-query attention (Llama 2/3)

### Runde 16: Transformer Block - 2017 vs 2024?
- **Figure 3-29**: Original Transformer block (2017)
- **Figure 3-30**: Modern Transformer block (2024 - Llama 3)

### Runde 17: RoPE - når og hvorfor?
- **Figure 3-32**: RoPE applied in attention step
- **Figure 3-33**: RoPE added before relevance scoring

## Winner Announcement

The final slide has a blank space for the winner's name:
```
### Vinner: **__________**
```

Fill this in during the presentation!

## Tips for Facilitation

- Keep time strictly (2-5 min per round)
- Encourage ALL groups to participate
- Award bonus points generously for good additions
- Make it fun and competitive but supportive
- Have a scoreboard visible (whiteboard/screen)

## File Locations

- Presentation: `slides-may4.md`
- Images: `public/images/holl_03*.png`
- Main slides (Ch 1-2): `slides.md`
