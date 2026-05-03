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

## Transformer Block?

![](/images/holl_0312.png)

<!--
Figure 3-12: En Transformer block består av self-attention layer og feedforward neural network
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

## LM Head?

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

# Runde 6

## Hva er Temperatur? Hva vil det si å være Grådig?

![](/images/holl_0307.png)

<!--
Figure 3-7: Tokens med høyest probability etter forward pass. Decoding strategy bestemmer hvilken token som outputes ved sampling basert på probabilities.
-->

---
layout: center
---

# Runde 7

## Forklar bildet

![](/images/holl_0314.png)

<!--
Figure 3-14: Self-attention layer inkorporerer relevant informasjon fra tidligere posisjoner som hjelper å prosessere nåværende token
-->

---
layout: center
---

# Runde 8 ⭐ Bonuspoeng

## Hvorfor cache?

![](/images/holl_0310.png)

<!--
Figure 3-10: Ved tekstgenerering er det viktig å cache computation results fra tidligere tokens istedenfor å gjenta samme beregning om og om igjen
-->

---
layout: center
---

# Runde 9

## Hva er Attention?

![](/images/holl_0312.png)

<!--
Transformer Block: Self-attention layer og feedforward neural network
-->

---
layout: center
---

# Runde 10

## Hva forklares her?

*(Attention heads)*

![](/images/holl_0317.png)

<!--
Figure 3-17: Vi får bedre LLMs ved å kjøre attention flere ganger parallelt, noe som øker modellens kapasitet til å fokusere på ulike typer informasjon
-->

---
layout: center
---

# Takk for i dag! 🎉

### Vinner: **\_\_\_\_\_\_\_\_\_\_**
