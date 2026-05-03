---
theme: default
highlighter: shiki
transition: slide-left
---

# Velkommen til Faggruppen 👋
## Vi prøver oss på en ny vri

---

# Finn dere en partner

- Helst en som har lest boken
- Eller en som **charismamaxer**

---
layout: center
---

# Slik funker det

1. Jeg viser ett bilde
2. Dere får **2–5 minutter** til å diskutere
3. Startgruppen forklarer først
4. Andre grupper kan tilføye og stjele poeng

---
layout: center
---

# Poenggiving

| Situasjon | Poeng |
|---|---|
| God forklaring | ⭐⭐⭐ |
| Delvis god forklaring | ⭐ |
| Vesentlig tillegg fra annen gruppe | ⭐ |

---
layout: center
---

# Runde 1

## Hva er Transformers?

![](/images/holl_0301.png)

<!--
Figure 3-1: Transformer LLMs tar en tekst-prompt og genererer tekst
-->

---
layout: center
---

# Runde 2

## Forward pass? Transformer Loop?

<div class="grid grid-cols-2 gap-4">

![](/images/holl_0302.png)

![](/images/holl_0303.png)

</div>

<!--
Figure 3-2: Transformer LLMs genererer én token om gangen
Figure 3-3: Output token legges til promten, deretter ny forward pass
-->

---
layout: center
---

# Runde 3

## LM Head - hva er det?

<div class="grid grid-cols-2 gap-4">

![](/images/holl_0304.png)

![](/images/holl_0306.png)

</div>

<!--
Figure 3-4: Transformer LLM består av tokenizer, stack av Transformer blocks, og language modeling head
Figure 3-6: Ved slutten av forward pass predikerer modellen probability score for hver token i vocabulary
-->

---
layout: center
---

# Runde 4

## Tokenizer vocabulary – hva har det å si «for modellen»?

![](/images/holl_0305.png)

<!--
Figure 3-5: Tokenizer har vocabulary på 50,000 tokens. Modellen har token embeddings assosiert med disse.
-->

---
layout: center
---

# Runde 5

## Hva er Temperatur? Hva vil det si å være Grådig?

![](/images/holl_0307.png)

<!--
Figure 3-7: Tokens med høyest probability etter forward pass. Decoding strategy bestemmer hvilken token som outputes ved sampling basert på probabilities.
-->

---
layout: center
---

# Runde 6

## Parallel processing: Hvorfor beregner vi alle token-streams hvis vi bare bruker den siste?

<div class="grid grid-cols-2 gap-4">

![](/images/holl_0308.png)

![](/images/holl_0309.png)

</div>

<!--
Figure 3-8 & 3-9: Hver token prosesseres gjennom sin egen stream av beregninger. Selv om bare den siste outputvektoren brukes til å predikere neste token, trengs alle tidligere streams i attention-mekanismen. De tidlige outputs i hver Transformer block brukes av attention for å inkorporere kontekst. Context size = antall streams modellen kan håndtere samtidig.
-->

---
layout: center
---

# Runde 7 ⭐ Bonuspoeng

## Hvorfor cache?

![](/images/holl_0310.png)

<!--
Figure 3-10: Ved tekstgenerering er det viktig å cache computation results fra tidligere tokens istedenfor å gjenta samme beregning om og om igjen
-->

---
layout: center
---

# Runde 8

## Transformer Block - hva består den av?

![](/images/holl_0312.png)

<!--
Figure 3-12: En Transformer block består av self-attention layer og feedforward neural network
-->

---
layout: center
---

# Runde 9

## Hva gjør Feedforward Neural Network i en Transformer block?

![](/images/holl_0313.png)

<!--
Figure 3-13: Feedforward neural network (FFN) gjør mesteparten av memorisering og interpolering i modellen. Dette er hvor faktisk kunnskap som "The Shawshank Redemption" lagres. FFN er det største komponentet i hver block - inneholder faktisk det meste av modellens parametere. Den prosesserer hver token uavhengig etter attention-steget.
-->

---
layout: center
---

# Runde 10

## Forklar bildet

![](/images/holl_0314.png)

<!--
Figure 3-14: Self-attention layer inkorporerer relevant informasjon fra tidligere posisjoner som hjelper å prosessere nåværende token
-->

---
layout: center
---

# Runde 11

## Hva forklares her?

![](/images/holl_0317.png)

<!--
Figure 3-17: Vi får bedre LLMs ved å kjøre attention flere ganger parallelt, noe som øker modellens kapasitet til å fokusere på ulike typer informasjon
-->

---
layout: center
---

# Runde 12

## Queries, Keys, Values - forklar de tre matrisene

![](/images/holl_0319.png)

<!--
Figure 3-19: Attention bruker tre projeksjoner av input:
- Query (Q): representerer "hva leter jeg etter?" for nåværende token
- Keys (K): representerer "hva tilbyr jeg?" for alle tidligere tokens  
- Values (V): inneholder faktisk informasjon som skal kombineres

Q multipliseres med K for å score relevans (steg 1).
Scores brukes til å vekte V-vektorene som summeres (steg 2).
Hver attention head har sine egne Q, K, V projection matrices.
-->

---
layout: center
---

# Runde 13

## Sparse/Local attention - hvorfor er dette nødvendig?

<div class="grid grid-cols-2 gap-4">

![](/images/holl_0322.png)

![](/images/holl_0323.png)

</div>

<!--
Figures 3-22 & 3-23: 
Local/sparse attention begrenser hvilke tidligere tokens modellen kan se. Istedenfor full attention til ALLE tidligere tokens (dyrt for lange sekvenser), ser man kun på et "vindu" av nylige tokens.

GPT-3 vekslet mellom full attention (blocks 1,3,5...) og sparse attention (blocks 2,4,6...).
Dette gir dramatisk speedup for lange sekvenser uten for mye kvalitetstap.
Fullt autoregressiv = kan kun se bakover, ikke fremover (decoder-only).
-->

---
layout: center
---

# Runde 14 ⭐ Bonuspoeng

## Hva er forskjellen på Multi-head, Multi-query og Grouped-query attention?

<div class="grid grid-cols-2 gap-4">

![](/images/holl_0326.png)

![](/images/holl_0328.png)

</div>

<!--
Figures 3-26 & 3-28:
- Multi-head attention (original 2017): Hver head har egne Q, K, V matrices
- Multi-query attention: Alle heads deler én K og én V matrix, kun Q er unik per head (mye raskere, litt dårligere kvalitet)
- Grouped-query attention (Llama 2/3): Heads gruppes, hver gruppe deler K og V (balanse mellom hastighet og kvalitet)

Grouped-query reduserer minne brukt i KV cache under inferens, spesielt viktig for lange contexts.
-->

---
layout: center
---

# Runde 15

## Transformer Block: Hva har endret seg fra 2017 til 2024?

<div class="grid grid-cols-2 gap-4">

![](/images/holl_0329.png)

![](/images/holl_0330.png)

</div>

<!--
Figures 3-29 & 3-30:
2017 (original Transformer):
- LayerNorm etter attention/FFN
- ReLU activation
- Standard multi-head attention

2024 (Llama 3):
- Pre-normalization (LayerNorm FØR attention/FFN) - raskere trening
- RMSNorm istedenfor LayerNorm - enklere og mer effektiv
- SwiGLU activation istedenfor ReLU - bedre ytelse
- Grouped-query attention - raskere inferens
- Rotary embeddings (RoPE) - bedre posisjonell informasjon

Residual connections er fortsatt der!
-->

---
layout: center
---

# Runde 16

## RoPE (Rotary Positional Embeddings) - når og hvorfor?

<div class="grid grid-cols-2 gap-4">

![](/images/holl_0332.png)

![](/images/holl_0333.png)

</div>

<!--
Figures 3-32 & 3-33:
Original Transformer: Absolutt posisjonsinformasjon legges til i starten (token 1, 2, 3...).
Problem: Ikke fleksibelt for document packing under trening, hvor flere dokumenter pakkes i samme context.

RoPE (2024): Posisjonell info legges til INNE i attention-steget, rett før relevance scoring (Q·K).
Fordeler:
- Fanger både absolutt og relativ posisjon
- Basert på rotasjon av vektorer i embedding space
- Fungerer bedre med document packing
- Bedre generalisering til lengre sekvenser enn sett under trening
-->

---
layout: center
---

# Takk for i dag! 🎉

### Vinner: **\_\_\_\_\_\_\_\_\_\_**

---
layout: two-cols
---

# Henrik's Rant Corner 🎤

*Før vi tar pause...*

### Mulige temaer:

- Transformer hype vs realitet
- Misforståelser om attention
- "Attention is all you need" (er det?)
- Overengineering av arkitekturer
- Flash Attention marketing
- Context window kappløp
- Parameter count flexing

::right::

<div class="mt-12 text-6xl">

💭

*[Henrik's tid å shine]*

</div>
