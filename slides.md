---
theme: seriph
background: https://news.blr.com/app/uploads/sites/3/2016/10/Llama-1.jpg
title: Episode II - The Prompt Strikes Back
info: Faggruppe – KI fra førsteprinsipp, samling 2
class: text-center
drawings:
  persist: false
transition: slide-left
mdc: true
---

# Episode II: The Prompt Strikes Back

### Kapittel 1 & 2 — Foundations of Language AI

*Alammar & Grootendorst · O'Reilly 2024*
<!--
Velkommen alle sammen til samling nummer to.

I dag tar vi for oss de to første kapitlene i boken. Det handler egentlig om én stor historie: hvordan kom vi fra enkle dataprogrammer på femtitallet til ChatGPT? Og hva skjer egentlig inni disse modellene?

Vi starter bredt med historikk, og går gradvis dypere. Mot slutten blir det litt mer teknisk — tokens og embeddings — men jeg lover å holde det så konkret som mulig.
-->

---

# Kvelden i dag

<div class="grid grid-cols-4 gap-3 mt-6 text-sm">

<div class="p-4 bg-green-50 rounded-lg text-center">
  <div class="text-2xl mb-2">🍕</div>
  <div class="font-bold">16:00 – 16:30</div>
  <div class="text-slate-600 mt-1">Mat og mingling</div>
</div>

<div class="p-4 bg-blue-50 rounded-lg text-center">
  <div class="text-2xl mb-2">📖</div>
  <div class="font-bold">16:30 – 17:30</div>
  <div class="text-slate-600 mt-1">Kapittel 1<br>Historikk, arkitekturer, bruksområder</div>
</div>

<div class="p-4 bg-purple-50 rounded-lg text-center">
  <div class="text-2xl mb-2">🔬</div>
  <div class="font-bold">17:30 – 18:30</div>
  <div class="text-slate-600 mt-1">Kapittel 2<br>Tokens, embeddings + aktivitet</div>
</div>

<div class="p-4 bg-orange-50 rounded-lg text-center">
  <div class="text-2xl mb-2">💬</div>
  <div class="font-bold">18:30 – 19:00</div>
  <div class="text-slate-600 mt-1">Oppsummering og diskusjon</div>
</div>

</div>

<div class="mt-4 p-3 bg-slate-50 rounded-lg border border-dashed border-slate-300 text-sm text-center text-slate-500">
  ⏱️ <strong>Hvis vi har tid:</strong> KI-verktøyrunde — alle viser hvordan de bruker KI i jobb og privat
</div>

<div class="text-sm text-slate-400 text-center mt-2">
Diskusjonspauser underveis — si fra om noe er uklart!
</div>
<!--
Her er planen for kvelden.

Første halvtimen bruker vi på å spise og mingle — fra klokken fire til halv fem. Så går vi gjennom kapittel én fra halv fem til halv seks: historikken, hvilke typer modeller som finnes, og hva de brukes til.

Etter en kort pause tar vi kapittel to fra halv seks til halv syv — tokens og embeddings, pluss en praktisk aktivitet der alle får prøve en tokenizer selv.

Siste halvtimen er diskusjon og oppsummering. Si fra underveis om noe er uklart — det er lagt inn pauser for det.
-->

---

# Hva er Store Språkmodeller?

<div class="grid grid-cols-3 gap-4 mt-5 text-sm">

<div class="p-4 bg-slate-50 rounded-lg border-l-4 border-slate-400">
  <div class="font-bold mb-2">🤔 Hva er en modell?</div>
  <span class="text-slate-600">En matematisk funksjon som tar inn data og produserer et svar. Arkitekturen er kode — men <em>atferden</em> er ikke håndkodet med regler. Den lærer mønstre fra eksempler.<br><br>
  Ingen har skrevet <code>if spørsmål om Oslo → svar "hovedstad"</code>. Det kom frem av trening.</span>
</div>

<div class="p-4 bg-purple-50 rounded-lg border-l-4 border-purple-400">
  <div class="font-bold mb-2">💬 Hvorfor språk?</div>
  <span class="text-slate-600">Disse modellene er trent spesifikt på <strong>tekst</strong> — bøker, nettsider, kode, samtaler.<br><br>
  Språk er unikt fordi det bærer mening, resonnering og kunnskap. Modellen lærer ikke bare ord — den lærer mønstre i <em>tanker</em>.</span>
</div>

<div class="p-4 bg-blue-50 rounded-lg border-l-4 border-blue-400">
  <div class="font-bold mb-2">📏 Hvorfor store?</div>
  <span class="text-slate-600">Samme prinsipp som mindre modeller, men trent på <strong>astronomiske mengder data</strong> med <strong>milliarder av parametere</strong>.<br><br>
  Skalaen er det som gir evnen til å resonnere, oversette og generere sammenhengende tekst.</span>
</div>

</div>

<div class="mt-4 p-3 bg-slate-100 rounded text-sm text-center">
  KI er et bredt felt — store språkmodeller er én type. Det finnes også bildegenerering, talegjenkjenning, anbefalingssystemer og mye mer. I dag fokuserer vi på språkmodeller. <em>Språk inn, språk ut</em>.
</div>
<!--
La oss begynne med selve begrepet — og det er egentlig tre spørsmål.

Hva er en modell? En modell er en matematisk funksjon som tar inn data og produserer et svar. Og her er det viktig å presisere: det er absolutt en implementasjon — arkitekturen er kode, treningsløkken er kode. Men atferden er ikke håndkodet med regler. Ingen har skrevet "if spørsmål om Oslo then svar hovedstad". Den kunnskapen vokste frem av å lese enorme mengder tekst under trening.

Hvorfor språk? Disse modellene er trent spesifikt på tekst — bøker, nettsider, kode, samtaler. Og språk er unikt fordi det bærer mening, resonnering og kunnskap. Modellen lærer ikke bare hvilke ord som henger sammen — den lærer mønstre i tanker og argumentasjon.

Hvorfor store? Samme grunnprinsipp som mindre modeller, men i en helt annen skala. Trent på astronomiske mengder data med milliarder av parametere. Det er skalaen som gir evnene vi ser: å resonnere, oversette, oppsummere og generere sammenhengende tekst.
-->

---
layout: section
# Kapittel 1

## Historikk og arkitekturer

*Hvordan kom vi fra enkle ordtellinger til ChatGPT?*
<!--
Da starter vi med kapittel én. Det handler om historikken bak store språkmodeller — hvordan vi kom fra enkle ordtellinger til ChatGPT.
-->

---

# What is Language AI?

<div class="grid grid-cols-2 gap-4 mt-6 text-sm">

<div class="p-4 bg-slate-50 rounded-lg border-l-4 border-slate-400">
  <div class="font-bold mb-2">Definisjon</div>
  <div class="text-slate-600">Language AI er en undergren av AI som fokuserer på å forstå, prosessere og generere menneskelig språk (ofte brukt synonymt med NLP).</div>
</div>

<div class="p-4 bg-blue-50 rounded-lg border-l-4 border-blue-400">
  <div class="font-bold mb-2">Ikke bare LLM</div>
  <div class="text-slate-600">Language AI inkluderer også retrieval-systemer, embeddings og klassiske modeller som bag-of-words. LLM er en (stor) del av helheten.</div>
</div>

</div>

<div class="mt-4 p-3 bg-slate-100 rounded text-sm">
  Boka bruker <em>Language AI</em> som ramme og viser hvordan flere teknikker spiller sammen.
</div>

---

# Hva er en LLM?

<div class="grid grid-cols-2 gap-4 mt-6 text-sm">

<div class="p-4 bg-purple-50 rounded-lg">
  <div class="font-bold mb-2">Vanlig bruk</div>
  <div class="text-slate-600">LLM brukes ofte om store generative modeller (decoder-only) som GPT.</div>
</div>

<div class="p-4 bg-green-50 rounded-lg">
  <div class="font-bold mb-2">Bokas definisjon</div>
  <div class="text-slate-600">Boka bruker en bredere definisjon der både encoder-only (BERT) og decoder-only (GPT) inngår i LLM-familien.</div>
</div>

</div>

<div class="mt-4 p-3 bg-amber-50 rounded text-sm">
  LLM er et flytende begrep – viktigere å forstå arkitekturen enn etiketten.
</div>

---




# En kort historikk

<div class="mt-4 p-3 bg-slate-100 rounded text-sm">
  Mål: å representere språk i en struktur datamaskiner kan jobbe med.
</div>

<div class="grid grid-cols-3 gap-3 mt-4 text-sm">

<div class="bg-slate-100 rounded-lg p-3">
  <div class="font-bold text-slate-500 text-xs mb-1">~1950s</div>
  <div class="font-bold">Bag-of-Words</div>
  <div class="mt-1 text-slate-600">Tekst som ordtellinger. Enkelt, men mister all kontekst og betydning.</div>
</div>

<div class="bg-slate-100 rounded-lg p-3">
  <div class="font-bold text-slate-500 text-xs mb-1">2013</div>
  <div class="font-bold"><a href="https://arxiv.org/abs/1301.3781" target="_blank">word2vec</a></div>
  <div class="mt-1 text-slate-600">Tette vektorer fanger semantisk likhet. <em>King − man + woman ≈ queen.</em></div>
</div>

<div class="bg-slate-100 rounded-lg p-3">
  <div class="font-bold text-slate-500 text-xs mb-1">2014</div>
  <div class="font-bold">Attention</div>
  <div class="mt-1 text-slate-600">Modeller lærer å fokusere på relevante deler av input under oversettelse.</div>
</div>

<div class="bg-yellow-100 rounded-lg p-3">
  <div class="font-bold text-yellow-700 text-xs mb-1">2017</div>
  <div class="font-bold"><a href="https://arxiv.org/abs/1706.03762" target="_blank">Transformer</a></div>
  <div class="mt-1 text-slate-600">"Attention is all you need" — parallell trening. Alt endrer seg.</div>
</div>

<div class="bg-yellow-100 rounded-lg p-3">
  <div class="font-bold text-yellow-700 text-xs mb-1">2018</div>
  <div class="font-bold">BERT & GPT-1</div>
  <div class="mt-1 text-slate-600">Encoder-only og decoder-only arkitekturer skilles. To ulike filosofier.</div>
</div>

<div class="bg-green-100 rounded-lg p-3">
  <div class="font-bold text-green-700 text-xs mb-1">2022–23</div>
  <div class="font-bold">ChatGPT-æraen</div>
  <div class="mt-1 text-slate-600">Store språkmodeller blir mainstream. <strong>100M brukere på 2 måneder.</strong></div>
</div>

</div>
<!--
La oss se på tidslinjen.

Helt tilbake på femtitallet hadde vi "bag-of-words" — å telle ord i tekst. Enkelt, men det mister all mening og sammenheng.

I 2013 kom word2vec — et gjennombrudd fordi det begynte å fange betydningen av ord, ikke bare telle dem.

I 2014 fikk vi attention-mekanismen, og i 2017 kom Transformer. Paperet het "Attention is all you need", og det var ikke bare en fancy tittel.

I 2018 ble BERT og GPT-1 lansert — to ulike veier videre. Og i 2022 kom ChatGPT. Hundre millioner brukere på to måneder. Det er rekord.

Det viktige poenget: dette skjedde veldig fort. Fra femtitallet til ChatGPT er ikke veldig lenge i det store bildet.
-->

---
layout: two-cols
# Fra Bag-of-Words til Embeddings

::left::

### Bag-of-Words

- Tokeniser tekst til ord
- Bygg vokabular av unike ord
- Tell ordforekomster → vektor
- ❌ Ignorerer rekkefølge og mening
- ✅ Fortsatt nyttig som supplement

<br>

*"Hunden bet mannen" = "Mannen bet hunden"*

::right::

### word2vec (2013)

- Tette vektor-embeddings
- Fanger semantisk mening
- Trent ved å predikere om to ord er **naboer** i en setning
- Lignende ord → nærliggende vektorer
- Grunnlaget for moderne store språkmodeller

<br>

*king − man + woman ≈ queen* 🤯
<!--
La oss ta bag-of-words mer konkret.

Tenk deg at du tar en tekst, river den fra hverandre ord for ord, kaster dem i en pose og rister. Du vet hvilke ord som er der, men ikke rekkefølgen eller hva de betyr i sammenheng. "Hunden bet mannen" og "Mannen bet hunden" gir nøyaktig samme representasjon.

word2vec fra 2013 var noe helt annet. Det trenes ved å stille ett enkelt spørsmål millioner av ganger: "Er disse to ordene naboer i en setning?" Gjennom det lærer modellen at lignende ord hører sammen.

Det klassiske eksemplet: king minus man pluss woman er omtrent lik queen. Modellen har aldri fått beskjed om kjønn — det lærte den bare av teksten.

Men — word2vec gir ett og samme svar uansett kontekst. Hvert ord har én fast vektor. Det problemet løser Transformer-arkitekturen.
-->

---
layout: two-cols
# Attention & Transformer

::left::

### RNN + Attention (2014)

- Encoder-decoder for oversettelse
- Sekvensiell prosessering (ord for ord)
- Attention fremhever relevante input-ord
- ❌ Flaskehals: begrenset kontekstvindu

::right::

### Transformer (2017)

- Self-attention erstatter rekurrens
- ✅ **Parallell trening** — nøkkelforbedringen!
- Encoder + decoder-stacker
- Multi-head attention
- Skalerer til milliarder av parametere
- Decoder er fortsatt autoregressiv

<br>

<div class="p-3 bg-blue-50 rounded border-l-4 border-blue-400 text-sm">
💡 Transformer = arkitekturen bak alle moderne store språkmodeller
</div>
<!--
Så hvordan fungerte modellene før Transformer?

De brukte RNN — rekurrente nevrale nettverk. De leste tekst ord for ord, som å lese en bok mens du dekker over alt annet enn det ene ordet du er på. Det fungerte, men det var tregt og hadde begrensninger.

I 2017 kom Transformer. Den store nyvinningen: den kan se hele teksten på én gang — som å ha boken åpen og jobbe med alle sidene parallelt. Det betyr at treningen kan kjøre parallelt på mange prosessorer, noe som gjør det mulig å trene på astronomiske mengder data.

Transformer er arkitekturen bak alle moderne store språkmodeller. BERT, GPT, Llama — alle er basert på den.
-->

---
layout: two-cols
# To Modellfamilier

::left::

### 🔍 Representasjonsmodeller

**Encoder-only (f.eks. BERT)**

- Fokus på å *forstå* språk
- Genererer embeddings, ikke tekst
- Bidireksjonell self-attention
- Trent via maskert språkmodellering
- Bra for: klassifisering, søk, clustering
- Kalles ofte <em>representation models</em>

::right::

### ✍️ Generative modeller

**Decoder-only (f.eks. GPT)**

- Fokus på å *generere* tekst
- Autoregressiv: predikerer neste token
- Kausal self-attention (ser kun bakover)
- Skalert fra 117M til 175B+ parametere
- Driver chatbots, oppsummeringer, koding
- Kalles ofte <em>generative models</em>
<!--
Etter Transformer delte feltet seg i to retninger.

Den første er representasjonsmodeller, som BERT. Disse fokuserer på å forstå språk. De leser tekst i begge retninger og er veldig gode til å klassifisere, søke og gruppere tekst. De genererer ikke tekst selv.

Den andre er generative modeller, som GPT-familien. Disse fokuserer på å skrive tekst. De leser kun bakover og predikerer neste ord om og om igjen.

Enkel huskeregel: BERT leser og forstår, GPT skriver og genererer.
-->

---

# Generative LLMs = Completion Models

<div class="grid grid-cols-2 gap-4 mt-6 text-sm">

<div class="p-4 bg-slate-50 rounded-lg">
  <div class="font-bold mb-2">Completion</div>
  <div class="text-slate-600">Generative LLMs tar en prompt og <em>kompletterer</em> den, token for token.</div>
</div>

<div class="p-4 bg-blue-50 rounded-lg">
  <div class="font-bold mb-2">Instruct / Chat</div>
  <div class="text-slate-600">Finjustering gjør dem til instruksjonsmodeller som svarer på spørsmål.</div>
</div>

</div>

---

# Context length / context window

<div class="p-4 bg-slate-50 rounded text-sm mt-6">
  Maks antall tokens modellen kan se i en forespørsel. Alt utenfor er usynlig.
</div>

<div class="p-4 bg-amber-50 rounded text-sm mt-3">
  Pga. autoregressiv generering utvides konteksten mens modellen produserer nye tokens.
</div>

---
layout: center
class: text-center
---

# 💬 Borddiskusjon (5 min)

<br>

### BERT leser og forstår. GPT skriver og genererer

<br>

<div class="p-4 bg-blue-50 rounded-lg max-w-xl mx-auto text-left text-sm">

Diskuter med sidepersonen:

1. Dere får 100.000 kundeklager på e-post. Hvilken type modell velger dere for å **sortere** dem?
2. Dere vil lage en chatbot som **svarer** kundene. Hvilken type da?
3. Kjenner dere igjen denne forskjellen fra verktøy dere bruker i dag?

</div>
<!--
Nå tar vi en kort borddiskusjon. Snakk med sidepersonen i fem minutter.

Tenk på dette: dere får hundre tusen kundeklager på e-post. Hvilken type modell velger dere for å sortere dem? Og hvis dere vil lage en chatbot som svarer kundene — hvilken type da? Kjenner dere igjen denne forskjellen fra verktøy dere bruker i dag?

Bruk fem minutter. Jeg kaller inn igjen.
-->


---

# Bag-of-Words: steg for steg

<div class="grid grid-cols-3 gap-3 mt-6 text-sm">

<div class="p-3 bg-slate-50 rounded">
  <div class="font-bold">1) Tokenization</div>
  <div class="text-slate-600">Del opp teksten i tokens (ofte ord).</div>
</div>

<div class="p-3 bg-slate-50 rounded">
  <div class="font-bold">2) Vocabulary</div>
  <div class="text-slate-600">Lag et vokabular av unike ord.</div>
</div>

<div class="p-3 bg-slate-50 rounded">
  <div class="font-bold">3) Counts</div>
  <div class="text-slate-600">Tell forekomster og lag en vektor.</div>
</div>

</div>

<div class="mt-4 p-3 bg-slate-100 rounded text-sm">
  Resultatet er en <em>vektorrepresentasjon</em> av teksten, men uten rekkefølge og kontekst.
</div>

---

# Dense Embeddings (word2vec)

<div class="grid grid-cols-2 gap-4 mt-6 text-sm">

<div class="p-3 bg-purple-50 rounded-lg">
  <strong>Embedding</strong> = vektor som forsøker å fange mening.
  word2vec lærer dette ved å predikere om to ord er naboer.
</div>

<div class="p-3 bg-purple-50 rounded-lg">
  Treningen skjer i et nevralt nettverk med mange <strong>parametere</strong> (weights).
  Embeddings oppdateres slik at semantisk like ord blir nære.
</div>

</div>

---

# RNN encoder-decoder + Attention (2014)

<div class="grid grid-cols-2 gap-4 mt-6 text-sm">

<div class="p-3 bg-slate-50 rounded">
  <strong>Encoder</strong> lager en kontekst-embedding av hele inputsekvensen.
</div>

<div class="p-3 bg-slate-50 rounded">
  <strong>Decoder</strong> genererer output token for token (autoregressivt).
</div>

</div>

<div class="mt-4 p-3 bg-blue-50 rounded text-sm">
  <strong>Attention</strong> lar modellen fokusere på relevante deler av input under oversettelse.
</div>

---

# Treningsparadigmet

<div class="grid grid-cols-2 gap-6 mt-4">

<div class="p-4 bg-blue-50 rounded-lg border-l-4 border-blue-500">

### 1️⃣ Fortrening (Pretraining)

Tren på **massivt internettkorpus** – bøker, Wikipedia, kode, artikler.

Modellen lærer grammatikk, fakta og språkmønstre.

→ Resulterer i en **base/foundation model**

*Eksempel: Llama 2 trent på 2 billioner tokens*

</div>

<div class="p-4 bg-green-50 rounded-lg border-l-4 border-green-500">

### 2️⃣ Finjustering (Fine-Tuning)

Videre trening på **smalere oppgave** – instruksjonsfølging, klassifisering, norsk språk.

→ Sparer enorm mengde beregning

→ Gjør kraftige modeller tilgjengelige for spesifikke behov

</div>

</div>

<div class="mt-4 p-3 bg-slate-100 rounded text-sm text-center">
<strong>Tradisjonell ML:</strong> Tren direkte for én oppgave &nbsp;|&nbsp; <strong>LLM-tilnærming:</strong> Fortren bredt → finjuster for oppgaver
</div>

<div class="mt-3 p-3 bg-purple-50 rounded text-sm border-l-4 border-purple-400">
  <strong>Foundation model</strong> — en modell trent på så bred data og i så stor skala at den kan tilpasses et bredt spekter av oppgaver. GPT-4, Llama og BERT er alle foundation models. Begrepet ble introdusert av Stanford i 2021 (<a href="https://arxiv.org/abs/2108.07258" target="_blank">arxiv</a>).
</div>
<!--
Så hvordan trener man disse modellene?

Det skjer i to steg. Først fortrening — man mater modellen med enorme mengder tekst og lar den lære mønstrene i språket. Det produserer det vi kaller en foundation model — en modell trent på så bred data og i så stor skala at den kan tilpasses et bredt spekter av oppgaver. Begrepet ble introdusert av Stanford i 2021 (<a href="https://arxiv.org/abs/2108.07258" target="_blank">arxiv</a>).

Deretter finjustering — man tar foundation model-en og trener videre på en smalere oppgave. Det er mye billigere og raskere enn å starte fra null.

Forskjellen fra tradisjonell maskinlæring er stor. Før trente man én modell for én oppgave. Nå fortrener man bredt én gang, og finjusterer for mange ulike behov etterpå.
-->

---

# The Year of Generative AI (2023)

<div class="grid grid-cols-2 gap-4 mt-6 text-sm">

<div class="p-4 bg-slate-50 rounded-lg">
  <div class="font-bold mb-2">ChatGPT = produkt</div>
  <div class="text-slate-600">ChatGPT er et produkt; modellen under var GPT-3.5 og senere GPT-4.</div>
</div>

<div class="p-4 bg-blue-50 rounded-lg">
  <div class="font-bold mb-2">Foundation models</div>
  <div class="text-slate-600">Åpne + proprietary modeller kom i raskt tempo og kunne finjusteres for oppgaver.</div>
</div>

</div>

<div class="mt-4 p-3 bg-amber-50 rounded text-sm">
  Nye arkitekturer dukker opp: <strong>Mamba</strong> og <strong>RWKV</strong> utfordrer Transformer på visse egenskaper.
</div>

---

# Bruksområder

<div class="p-3 bg-slate-100 rounded-lg text-sm mb-3 text-center">
  De fleste bruker allerede disse via verktøy som <strong>ChatGPT, Claude, Cursor</strong> — uten å nødvendigvis vite hva som skjer under panseret
</div>

<div class="grid grid-cols-3 gap-3 text-sm">

<div class="p-3 bg-blue-50 rounded-lg">
  <div class="text-xl mb-1">🏷️</div>
  <div class="font-bold">Klassifisering</div>
  <div class="text-slate-600 mt-1">Sentimentanalyse, spamdeteksjon — encoder-modeller</div>
</div>

<div class="p-3 bg-purple-50 rounded-lg">
  <div class="text-xl mb-1">🔍</div>
  <div class="font-bold">Semantisk søk & RAG</div>
  <div class="text-slate-600 mt-1">Hent relevante dokumenter til LLM via embeddings</div>
</div>

<div class="p-3 bg-yellow-50 rounded-lg">
  <div class="text-xl mb-1">📊</div>
  <div class="font-bold">Topic Modeling</div>
  <div class="text-slate-600 mt-1">Oppdag temaer i umerkede data via clustering</div>
</div>

<div class="p-3 bg-green-50 rounded-lg">
  <div class="text-xl mb-1">🤖</div>
  <div class="font-bold">Chatbots & Agenter</div>
  <div class="text-slate-600 mt-1">Prompt engineering + verktøy, instruksjonsmodeller</div>
</div>

<div class="p-3 bg-red-50 rounded-lg">
  <div class="text-xl mb-1">🌐</div>
  <div class="font-bold">Oversettelse</div>
  <div class="text-slate-600 mt-1">Tverrspråklig forståelse — encoder-decoder</div>
</div>

<div class="p-3 bg-orange-50 rounded-lg">
  <div class="text-xl mb-1">🖼️</div>
  <div class="font-bold">Multimodal</div>
  <div class="text-slate-600 mt-1">Syn + språk, bilde-til-tekst, analyse</div>
</div>

</div>
<!--
Hva kan man bruke store språkmodeller til?

Først — en viktig observasjon: de fleste i dette rommet bruker allerede disse bruksområdene, bare pakket inn i et verktøy. ChatGPT er chatbot og oversettelse. Cursor og Claude Code er KI-agenter som bruker RAG og kodeforståelse. Det tekniske vi snakker om skjer under panseret.

Bruksområdene er ganske brede: klassifisering av tekst, semantisk søk, finne temaer i store mengder data, chatbots, oversettelse, og multimodale modeller som kombinerer tekst og bilde.

Hvilke av disse bruker dere mest i hverdagen?
-->

---
layout: two-cols
# Grensesnitt mot store språkmodeller

::left::

### 🔒 Proprietære modeller

**GPT-4, Claude, Gemini...**

- Tilgang via API — ingen lokal GPU nødvendig
- Høyere ytelse, kommersiell støtte
- Data deles med tilbyderens servere
- Betalt tjeneste, begrenset finjusteringstilgang

::right::

### 🔓 Åpne modeller

**Llama, Mistral, Phi, Command R...**

- Kjør lokalt — full kontroll over modell og data
- Finjuster på egne data
- Ingen ekstern datadeling
- Krever GPU-maskinvare og mer ekspertise
<!--
Hvordan bruker man disse modellene i praksis?

Det er to hovedveier. Proprietære modeller som GPT-4, Claude og Gemini er tilgjengelige via API. Du trenger ikke eget maskinvare, de er kraftige og har kommersiell støtte. Men data sendes til tilbyderens servere, og du har begrenset kontroll.

Åpne modeller som Llama, Mistral og Phi kan kjøres lokalt. Full kontroll, kan finjusteres på egne data, ingenting forlater dine servere. Men det krever GPU-maskinvare og mer teknisk kompetanse.

For norske virksomheter med krav om databehandling innenfor EØS, er åpne modeller ofte det eneste alternativet.
-->

---
layout: section
# Pause ☕

### 5 minutter
<!--
Da tar vi en kort pause. Fem minutter — strekk på beina og hent kaffe.
-->

---
layout: section
# Kapittel 2

## Tokens & Embeddings

*Byggesteinene som gjør menneskelig språk til tall modellen kan beregne med*
<!--
Da går vi over til kapittel to: tokens og embeddings.

Dette er de to grunnleggende byggesteinene som gjør at en datamaskin kan jobbe med menneskelig språk. En stor språkmodell ser aldri råtekst — den ser bare tall. Tokens og embeddings er oversettelsen mellom menneske og maskin.
-->

---

# Tokens + Embeddings (overview)

<div class="p-4 bg-slate-50 rounded text-sm mt-6">
  Language models jobber med tekst i <strong>tokens</strong> og gjør dem om til <strong>embeddings</strong> (tallvektorer).
</div>

<div class="p-4 bg-blue-50 rounded text-sm mt-3">
  Tokens → embeddings → modellens lag → nye tokens.
</div>

---

# Hvordan tokenisering fungerer

<div class="flex items-center gap-3 my-4 text-sm font-mono flex-wrap">
  <div class="px-3 py-2 bg-blue-100 rounded">"Write an email apolog<strong>izing</strong>..."</div>
  <div class="text-slate-400">→ Tokenizer →</div>
  <div class="px-2 py-1 bg-green-100 rounded">Write</div>
  <div class="px-2 py-1 bg-yellow-100 rounded">an</div>
  <div class="px-2 py-1 bg-green-100 rounded">email</div>
  <div class="px-2 py-1 bg-purple-100 rounded">apolog</div>
  <div class="px-2 py-1 bg-orange-100 rounded">izing</div>
  <div class="text-slate-400">→</div>
  <div class="px-3 py-2 bg-green-100 rounded font-mono">[14350, 385, 4876, 17901, 5281...]</div>
</div>

<div class="p-2 bg-amber-50 rounded text-sm mb-3 border-l-4 border-amber-400">
  ⚡ LLM genererer <strong>én token om gangen</strong> — og bruker sin egen output som neste input (autoregressiv)
</div>

<div class="p-2 bg-slate-100 rounded text-sm mb-3 border-l-4 border-slate-300">
  Tokenizer konverterer tekst til <strong>token IDs</strong> som modellen faktisk bruker.
</div>

<div class="grid grid-cols-2 gap-3 text-sm">

<div class="p-3 bg-slate-50 rounded">
  <strong>Ord-tokenisering</strong><br>
  <span class="text-slate-600">Hele ord. Enkelt, men stort vokabular og håndterer ikke nye ord.</span>
</div>

<div class="p-3 bg-blue-50 rounded border-2 border-blue-300">
  <strong>⭐ Subord (BPE / WordPiece)</strong><br>
  <span class="text-slate-600">Beste balanse — brukt av GPT og BERT. Deler opp: "apolog" + "izing", "token" + "izer".</span>
</div>

<div class="p-3 bg-slate-50 rounded">
  <strong>Tegn-tokenisering</strong><br>
  <span class="text-slate-600">Individuelle tegn. Lite vokabular, men svært lange sekvenser.</span>
</div>

<div class="p-3 bg-slate-50 rounded">
  <strong>Byte-tokenisering</strong><br>
  <span class="text-slate-600">Råbytes (0–255). Språkagnostisk — håndterer emojis og alle språk.</span>
</div>

</div>
<!--
Når du sender tekst til en stor språkmodell, er det første som skjer at teksten brytes ned i tokens.

Se på eksemplet. "Write an email apologizing..." — modellen bryter ned i biter: "Write", "an", "email", "apolog", "izing". "Apologizing" blir to tokens fordi disse delene dukker opp i mange andre ord. Det gjør vokabularet mer effektivt.

Hvert token oversettes til et tall — en ID — og det er disse tallene modellen jobber med.

Viktig: store språkmodeller genererer én token om gangen. ChatGPT skriver ikke hele svaret på én gang — det produserer ett token, bruker det som input, produserer neste. Det kalles autoregressiv generering.

Subord, eller BPE, er den mest brukte metoden — brukt av både GPT og BERT.
-->

---

# Tokenizer → token IDs → model input

<div class="grid grid-cols-3 gap-3 mt-6 text-sm">

<div class="p-3 bg-slate-50 rounded">
  <div class="font-bold">1) Prompt</div>
  <div class="text-slate-600">Tekst inn</div>
</div>

<div class="p-3 bg-blue-50 rounded">
  <div class="font-bold">2) Tokenizer</div>
  <div class="text-slate-600">Tekst → token IDs</div>
</div>

<div class="p-3 bg-purple-50 rounded">
  <div class="font-bold">3) Model input</div>
  <div class="text-slate-600">input_ids → generering</div>
</div>

</div>

<div class="mt-4 p-3 bg-slate-100 rounded text-sm">
  <code>decode()</code> mapper token IDs tilbake til lesbar tekst.
</div>

---

# Token-typer

<div class="grid grid-cols-2 gap-3 mt-6 text-sm">

<div class="p-3 bg-slate-50 rounded">
  <strong>Word</strong> — hele ord, stort vokabular
</div>

<div class="p-3 bg-blue-50 rounded">
  <strong>Subword</strong> — GPT/BERT, balansert og vanligst
</div>

<div class="p-3 bg-slate-50 rounded">
  <strong>Character</strong> — små tokens, lange sekvenser
</div>

<div class="p-3 bg-slate-50 rounded">
  <strong>Byte</strong> — språkagnostisk, håndterer alt
</div>

</div>

---

# Tokenizer-valg påvirker modellen

<div class="grid grid-cols-3 gap-3 mt-6 text-sm">

<div class="p-3 bg-slate-50 rounded">
  <div class="font-bold">Method</div>
  <div class="text-slate-600">BPE / WordPiece</div>
</div>

<div class="p-3 bg-slate-50 rounded">
  <div class="font-bold">Vocab + specials</div>
  <div class="text-slate-600">Størrelse og special tokens</div>
</div>

<div class="p-3 bg-slate-50 rounded">
  <div class="font-bold">Training data</div>
  <div class="text-slate-600">Språk og domene</div>
</div>

</div>

---

# Tokenizer-sammenligning

<div class="grid grid-cols-3 gap-3 mt-6 text-sm">

<div class="p-3 bg-slate-50 rounded">
  <strong>BERT (uncased)</strong><br>
  Newlines/emoji kan forsvinne (<code>[UNK]</code>)
</div>

<div class="p-3 bg-blue-50 rounded">
  <strong>GPT-2</strong><br>
  Bevarer newlines, byte-fallback
</div>

<div class="p-3 bg-purple-50 rounded">
  <strong>GPT-4</strong><br>
  Whitespace/code-vennlige tokens
</div>

</div>

---

# Mini-code-eksempel (fra boka)

```python
from transformers import AutoModelForCausalLM, AutoTokenizer

tokenizer = AutoTokenizer.from_pretrained("microsoft/Phi-3-mini-4k-instruct")
prompt = "Write an email apologizing..."
input_ids = tokenizer(prompt, return_tensors="pt").input_ids
print(input_ids)
print(tokenizer.decode(input_ids[0]))
```

---
layout: center
class: text-center
---

# 🔬 Aktivitet: Utforsk tokenizeren (10 min)

<br>

### Gå til **platform.openai.com/tokenizer**

<br>

<div class="p-4 bg-blue-50 rounded-lg max-w-2xl mx-auto text-left text-sm">

Prøv disse og se hva som skjer — diskuter med sidepersonen:

1. **Norsk vs. engelsk:** Skriv "Jeg liker å programmere" og "I like to code". Hvilket språk bruker flest tokens? Hva betyr det for kostnad og ytelse?
2. **Kode:** Lim inn en Python-funksjon. Hvordan tokeniseres innrykk og spesialtegn?
3. **Emojis og tall:** Prøv "🎵🎶" og "3.14159". Blir de flere tokens enn du forventer?
4. **Lange vs. korte ord:** Sammenlign "the" med "antidisestablishmentarianism"

</div>

<br>

<div class="text-sm text-slate-500">
Husk: Modellen ser aldri tekst — bare disse tallene. Tokenisering er det aller første steget.
</div>
<!--
Nå skal vi gjøre noe praktisk. Gå inn på platform.openai.com/tokenizer på telefon eller laptop.

Dere har ti minutter. Prøv disse og diskuter med sidepersonen:

Skriv en setning på norsk og en på engelsk. Hvilket språk bruker flest tokens?

Lim inn en liten kodesnutt. Hvordan tokeniseres innrykk og spesialtegn?

Prøv emojis og tall — "🎵🎶" og "3.14159".

Sammenlign "the" med "antidisestablishmentarianism".

Husk: modellen ser aldri tekst, bare disse tallene. Tokenisering er det aller første steget.
-->

---

# Fra token til setningsembedding

<div class="grid grid-cols-3 gap-4 mt-6">

<div class="p-4 bg-blue-50 rounded-lg text-center">
  <div class="text-3xl mb-2">🔤</div>
  <div class="font-bold">Token-embeddings</div>
  <div class="text-sm mt-2 text-slate-600">
    Hvert token får én fast vektor.<br><br>
    word2vec er historisk grunnlag; LLM lærer embeddings end-to-end.<br><br>
    Fanger semantikk, men ikke kontekst.
  </div>
</div>

<div class="p-4 bg-purple-50 rounded-lg text-center">
  <div class="text-3xl mb-2">🧠</div>
  <div class="font-bold">Kontekstuelle embeddings</div>
  <div class="text-sm mt-2 text-slate-600">
    Samme ord, <em>ulik</em> vektor avhengig av kontekst.<br><br>
    Transformer-lag raffinerer basert på alle omliggende ord.<br><br>
    <em>"bank" (finansiell) ≠ "bank" (elv)</em>
  </div>
</div>

<div class="p-4 bg-green-50 rounded-lg text-center">
  <div class="text-3xl mb-2">📄</div>
  <div class="font-bold">Setningsembeddings</div>
  <div class="text-sm mt-2 text-slate-600">
    Én vektor per setning eller dokument.<br><br>
    Muliggjør semantisk søk, clustering og topic modeling.
  </div>
</div>

</div>
<!--
Nå til embeddings — og det er her det begynner å bli virkelig kraftig.

Tenk på token-embeddings som å slå opp et ord i en ordbok. Du får én definisjon, uansett kontekst. word2vec fungerer slik — hvert ord har én fast vektor.

Kontekstuelle embeddings er noe annet. Samme ord får ulik vektor avhengig av setningen. "Bank" i "jeg gikk i banken" får en annen vektor enn "bank" i "jeg satt ved elvebredden". Transformer-arkitekturen gjør dette mulig ved å se på alle ordene rundt.

Og til slutt: setningsembeddings komprimerer hele setningen til én enkelt vektor. Det muliggjør semantisk søk — du finner dokumenter som betyr det samme, selv om de ikke bruker de samme ordene.
-->

---
layout: center
class: text-center
---

# Nøkkelpunkter

<div class="grid grid-cols-2 gap-3 mt-6 text-left text-sm max-w-3xl mx-auto">

<div class="flex gap-2 p-3 bg-blue-50 rounded">
  <span class="font-bold text-blue-600 shrink-0">1</span>
  <span>Språk-KI gikk fra bag-of-words → Transformer på under ett tiår</span>
</div>

<div class="flex gap-2 p-3 bg-purple-50 rounded">
  <span class="font-bold text-purple-600 shrink-0">2</span>
  <span>Representasjonsmodeller (BERT) forstår; generative (GPT) skriver</span>
</div>

<div class="flex gap-2 p-3 bg-green-50 rounded">
  <span class="font-bold text-green-600 shrink-0">3</span>
  <span>Fortren bredt → finjuster for oppgaven — sparer enorm beregning</span>
</div>

<div class="flex gap-2 p-3 bg-yellow-50 rounded">
  <span class="font-bold text-yellow-600 shrink-0">4</span>
  <span>Tokenisering er første steg: tekst → tokens → IDs → <em>(embeddings inni LLM-en)</em> → transformer-lag</span>
</div>

<div class="flex gap-2 p-3 bg-red-50 rounded">
  <span class="font-bold text-red-600 shrink-0">5</span>
  <span>Embeddings på alle nivåer driver søk, klassifisering og generering</span>
</div>

<div class="flex gap-2 p-3 bg-orange-50 rounded">
  <span class="font-bold text-orange-600 shrink-0">6</span>
  <span>Ansvarlig utvikling: skjevhet, transparens og IP er reelle utfordringer</span>
</div>

</div>
<!--
La oss samle trådene.

Språk-KI gikk fra bag-of-words til Transformer på under ett tiår. Representasjonsmodeller som BERT forstår, generative som GPT skriver. Moderne modeller fortrenes bredt og finjusteres for spesifikke oppgaver. Tokenisering er første steg — modellen ser aldri tekst, bare tall. Og embeddings driver søk, klassifisering og generering.

Og midt i alt dette: ansvarlig utvikling er ikke noe vi kan parkere til siden.
-->

---
layout: center
class: text-center
---

# 📚 Ressurser & videre lesing

<div class="grid grid-cols-2 gap-3 mt-4 text-left text-sm max-w-3xl mx-auto">

<div class="p-3 bg-blue-50 rounded-lg">
  <div class="font-bold mb-1">📖 Boken</div>
  <a href="https://www.oreilly.com/library/view/hands-on-large-language/9781098150952/" target="_blank" class="text-blue-600">Hands-On Large Language Models</a><br>
  <span class="text-slate-500 text-xs">Alammar & Grootendorst · O'Reilly 2024</span>
</div>

<div class="p-3 bg-purple-50 rounded-lg">
  <div class="font-bold mb-1">📄 Nøkkelartikler</div>
  <a href="https://arxiv.org/abs/1706.03762" target="_blank" class="text-blue-600">Attention Is All You Need</a> (Transformer, 2017)<br>
  <a href="https://arxiv.org/abs/1301.3781" target="_blank" class="text-blue-600">word2vec</a> (Mikolov et al., 2013)<br>
  <a href="https://arxiv.org/abs/1810.04805" target="_blank" class="text-blue-600">BERT</a> (Devlin et al., 2018)
</div>

<div class="p-3 bg-green-50 rounded-lg">
  <div class="font-bold mb-1">🤖 Foundation models & LLM</div>
  <a href="https://arxiv.org/abs/2108.07258" target="_blank" class="text-blue-600">Foundation Models (Stanford, 2021)</a><br>
  <a href="https://huggingface.co/models" target="_blank" class="text-blue-600">Hugging Face — åpne modeller</a><br>
  <a href="https://platform.openai.com/tokenizer" target="_blank" class="text-blue-600">OpenAI Tokenizer</a>
</div>

<div class="p-3 bg-orange-50 rounded-lg">
  <div class="font-bold mb-1">🏛️ Regulering</div>
  <a href="https://www.datatilsynet.no/regelverk-og-verktoy/rapporter-og-utredninger/kunstig-intelligens/" target="_blank" class="text-blue-600">Datatilsynet om KI</a>
</div>

</div>
<!--
Her er ressursene vi har referert til i dag. Alle lenkene er klikkbare — dere finner presentasjonen delt ut etterpå.

De viktigste artiklene er Transformer-paperet fra 2017 og word2vec fra 2013. Hugging Face er stedet å gå for å utforske åpne modeller. Og Datatilsynet har god norskspråklig veiledning om KI og personvern.
-->

---
layout: center
class: text-center
---

# Diskusjon & avslutning 💬

<br>

<div class="p-4 bg-blue-50 rounded-lg max-w-xl mx-auto text-left text-sm">

- Hva var mest overraskende i dag?
- Hva vil dere utforske mer?
- Er åpne eller proprietære modeller mest relevant for dere?

</div>

<br>

### Neste samling: Kapittel 3 & 4

*Der ser vi innsiden av Transformer-arkitekturen i detalj*
<!--
Det var kapittel én og to.

Nå åpner vi for diskusjon. Hva var mest overraskende i dag? Hva vil dere utforske mer? Er åpne eller proprietære modeller mest relevant for dere?

Neste samling tar vi for oss kapittel tre og fire, der vi ser innsiden av Transformer-arkitekturen mer i detalj.

Takk for oppmerksomheten!
-->

---
layout: center
class: text-center
---

# 🛠️ KI-verktøyrunde
## *(hvis vi har tid)*

<br>

<div class="p-4 bg-slate-50 rounded-lg max-w-2xl mx-auto text-left text-sm">

Alle får 2–3 minutter til å vise:

- **Hvilket verktøy** bruker du mest? *(ChatGPT, Claude, Cursor, Copilot, Perplexity...)*
- **Hva bruker du det til** i jobb?
- **Noe privat** du har funnet nyttig?
- **En konkret prompt eller workflow** du vil dele?

</div>

<br>

<div class="text-slate-500 text-sm">
Del gjerne skjermen — det er ofte mer lærerikt enn å bare beskrive det
</div>
<!--
Hvis vi har tid igjen — og det håper jeg vi har — tar vi en runde der alle får vise frem hvordan de bruker KI.

Dette er ikke en presentasjon, men en uformell runde. Alle får 2-3 minutter. Vis gjerne skjermen — det er mye mer konkret enn å bare beskrive det.

Spørsmålene er: Hvilket verktøy bruker du mest? Hva bruker du det til i jobb? Noe privat du har funnet nyttig? Og gjerne en konkret prompt eller workflow hvis du har en favoritt.

Målet er å lære av hverandre — det er alltid noen som har funnet smarte løsninger ingen andre vet om.
-->
