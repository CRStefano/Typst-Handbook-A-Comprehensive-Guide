// ================================================================
//  TYPST: FROM ZERO TO HERO
// ================================================================

// ──────────────────────────────────────────────────────────────
//  METADATI DEL DOCUMENTO
// ──────────────────────────────────────────────────────────────
#set document(
  title: "Typst: FROM ZERO TO HERO",
  author: "Stefano Coelati Rama",
  date: datetime(year: 2026, month: 6, day: 5),
  keywords: ("typst", "manuale", "italiano", "handbook", "stefanocoelatirama"),
)

// ──────────────────────────────────────────────────────────────
//  IMPOSTAZIONI PAGINA
// ──────────────────────────────────────────────────────────────
#set page(
  paper: "a4",
  margin: (top: 2.6cm, bottom: 2.6cm, left: 3cm, right: 2.6cm),
  numbering: "1",
  number-align: center,
  header: context {
    let pn = counter(page).get().first()
    if pn > 4 {
      set text(size: 8.5pt, fill: luma(150))
      grid(
        columns: (1fr, auto),
        align(left)[_Typst: Dal Nulla alla Padronanza_],
        align(right)[Pag. #pn],
      )
      v(-0.4em)
      line(length: 100%, stroke: 0.4pt + luma(200))
    }
  },
  footer: context {
    let pn = counter(page).get().first()
    if pn > 4 {
      line(length: 100%, stroke: 0.4pt + luma(220))
      v(-0.3em)
    }
  },
)

// ──────────────────────────────────────────────────────────────
//  IMPOSTAZIONI TESTO
// ──────────────────────────────────────────────────────────────
#set text(
  font: ("Roboto"),
  size: 11pt,
  lang: "it",
  region: "IT",
  hyphenate: true,
)

#set par(
  justify: true,
  leading: 0.75em,
  spacing: 1.15em,
)

// ──────────────────────────────────────────────────────────────
//  NUMERAZIONE TITOLI
// ──────────────────────────────────────────────────────────────
#set heading(numbering: "1.1.1.")

// ──────────────────────────────────────────────────────────────
//  PALETTE COLORI
// ──────────────────────────────────────────────────────────────
#let C = (
  blu:     rgb("#1a3a5c"),
  blu2:    rgb("#2471a3"),
  blu3:    rgb("#aed6f1"),
  verde:   rgb("#1a5e3a"),
  verde2:  rgb("#27ae60"),
  arancio: rgb("#a04000"),
  rosso:   rgb("#922b21"),
  grigio:  rgb("#5d6d7e"),
  grigio2: rgb("#aab7b8"),
  sfondo:  rgb("#f8f9fa"),
  code:    rgb("#f0f3f4"),
  note:    rgb("#eaf4fb"),
  warn:    rgb("#fef5e7"),
  tip:     rgb("#eafaf1"),
  def:     rgb("#f9f0ff"),
  esempio: rgb("#fffde7"),
)

// ──────────────────────────────────────────────────────────────
//  STILE TITOLI
// ──────────────────────────────────────────────────────────────

// 1. Questa regola si occupa SOLO di mandare a capo i titoli di livello 1 in modo pulito
#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  it
}

// 2. Questa regola si occupa SOLO della grafica blu del capitolo
#show heading.where(level: 1): it => {
  v(0.5em)
  block(
    fill: C.blu,
    width: 100%,
    inset: (x: 1.3em, y: 1em),
    radius: 7pt,
  )[
    #set text(fill: white, size: 19pt, weight: "bold", font: ("Roboto"))
    #set par(justify: false)
    #context {
      let n = counter(heading).get()
      if it.numbering != none {
        numbering(it.numbering, ..n)
        h(0.5em)
      }
    }
    #it.body
  ]
  v(1em)
}

// Livello 2 — Sezione
#show heading.where(level: 2): it => {
  v(1.2em)
  block[
    #set text(size: 14pt, weight: "bold", fill: C.blu)
    #set par(justify: false)
    #context {
      let n = counter(heading).get()
      if it.numbering != none {
        numbering(it.numbering, ..n)
        h(0.4em)
      }
    }
    #it.body
    #v(-0.15em)
    #line(length: 100%, stroke: 1.8pt + C.blu2)
  ]
  v(0.5em)
}

// Livello 3 — Sottosezione
#show heading.where(level: 3): it => {
  v(0.9em)
  block[
    #set text(size: 12pt, weight: "bold", fill: C.blu2)
    #set par(justify: false)
    #context {
      let n = counter(heading).get()
      if it.numbering != none {
        numbering(it.numbering, ..n)
        h(0.4em)
      }
    }
    #it.body
  ]
  v(0.2em)
}

// Livello 4 — Paragrafo titolato
#show heading.where(level: 4): it => {
  v(0.6em)
  block[
    #set text(size: 11pt, style: "italic", fill: C.grigio)
    #set par(justify: false)
    #it.body
  ]
  v(0.1em)
}

// ──────────────────────────────────────────────────────────────
//  STILE BLOCCHI DI CODICE
// ──────────────────────────────────────────────────────────────
#show raw.where(block: true): it => {
  block(
    fill: C.code,
    width: 100%,
    inset: (x: 1.3em, y: 1em),
    radius: 6pt,
    stroke: 0.6pt + luma(200),
  )[
    #set text(  font: ("Roboto"), size: 9.5pt)
    #set par(justify: false, leading: 0.7em)
    #it
  ]
}

#show raw.where(block: false): it => {
  box(
    fill: C.code,
    inset: (x: 4pt, y: 2pt),
    radius: 4pt,
    stroke: 0.5pt + luma(210),
  )[
    #set text(  font: ("Roboto"), size: 9.5pt)
    #it
  ]
}

// ──────────────────────────────────────────────────────────────
//  LINK
// ──────────────────────────────────────────────────────────────
#show link: it => {
  set text(fill: C.blu2)
  underline(it)
}

// ──────────────────────────────────────────────────────────────
//  BOX INFORMATIVI
// ──────────────────────────────────────────────────────────────

#let nota(body) = block(
  fill: C.note,
  width: 100%,
  inset: (x: 1.1em, y: 0.85em),
  radius: 5pt,
  stroke: (left: 4.5pt + C.blu2),
  below: 1em,
)[
  #set par(spacing: 0.6em)
  #text(weight: "bold", fill: C.blu2)[Nota] \
  #body
]

#let attenzione(body) = block(
  fill: C.warn,
  width: 100%,
  inset: (x: 1.1em, y: 0.85em),
  radius: 5pt,
  stroke: (left: 4.5pt + C.arancio),
  below: 1em,
)[
  #set par(spacing: 0.6em)
  #text(weight: "bold", fill: C.arancio)[Attenzione] \
  #body
]

#let consiglio(body) = block(
  fill: C.tip,
  width: 100%,
  inset: (x: 1.1em, y: 0.85em),
  radius: 5pt,
  stroke: (left: 4.5pt + C.verde2),
  below: 1em,
)[
  #set par(spacing: 0.6em)
  #text(weight: "bold", fill: C.verde)[Consiglio] \
  #body
]

#let prova-tu(body) = block(
  fill: C.esempio,
  width: 100%,
  inset: (x: 1.1em, y: 0.85em),
  radius: 5pt,
  stroke: (left: 4.5pt + rgb("#f9a825")),
  below: 1em,
)[
  #set par(spacing: 0.6em)
  #text(weight: "bold", fill: rgb("#e65100"))[Prova tu!] \
  #body
]

#let definizione(termine, corpo) = block(
  fill: C.def,
  width: 100%,
  inset: (x: 1.1em, y: 0.85em),
  radius: 5pt,
  stroke: 0.8pt + luma(210),
  below: 1em,
)[
  #text(weight: "bold", size: 11pt)[#termine]
  #h(0.4em)#text(fill: C.grigio)[—]#h(0.4em)
  #corpo
]

// Box codice + risultato affiancati
#let esempio-box(codice, risultato: none, titolo: "Esempio") = {
  block(
    width: 100%,
    radius: 6pt,
    stroke: 0.8pt + luma(210),
    inset: 0pt,
    clip: true,
    below: 1em,
  )[
    #block(fill: C.blu, width: 100%, inset: (x: 1em, y: 0.45em))[
      #set text(fill: white, size: 9pt, weight: "bold")
      #set par(justify: false)
      ▶ #titolo
    ]
    #block(fill: white, width: 100%, inset: (x: 1em, y: 0.9em))[
      #if risultato != none {
        grid(
          columns: (1fr, 1fr),
          gutter: 1em,
          block(
            fill: C.code,
            width: 100%,
            inset: 0.9em,
            radius: 4pt,
            stroke: 0.5pt + luma(210),
          )[
            #set text(font: ("Roboto"), size: 9pt)
            #set par(justify: false, leading: 0.65em)
            #text(fill: C.grigio, size: 8pt, weight: "bold")[CODICE TYPST]\
            #v(0.3em)
            #codice
          ],
          block(
            fill: C.sfondo,
            width: 100%,
            inset: 0.9em,
            radius: 4pt,
            stroke: 0.5pt + luma(210),
          )[
            #text(fill: C.verde, size: 8pt, weight: "bold")[RISULTATO]\
            #v(0.3em)
            #risultato
          ],
        )
      } else {
        block(
          fill: C.code,
          width: 100%,
          inset: 0.9em,
          radius: 4pt,
        )[
          #set text(  font: ("Roboto"), size: 9pt)
          #set par(justify: false, leading: 0.65em)
          #codice
        ]
      }
    ]
  ]
}

// Tabella di sintesi (key–value)
#let tabella-sintesi(intestazioni: ("Elemento", "Sintassi", "Risultato"), ..righe) = {
  let cells = intestazioni.map(h =>
    table.cell(fill: C.blu)[
      #set text(fill: white, weight: "bold", size: 9.5pt)
      #set par(justify: false)
      #h
    ]
  )
  for riga in righe.pos() {
    cells += riga
  }
  set par(justify: false)
  table(
    columns: intestazioni.len(),
    stroke: 0.6pt + luma(210),
    fill: (col, row) => if row == 0 { C.blu }
                        else if calc.odd(row) { white }
                        else { C.sfondo },
    ..cells,
  )
}

// Separatore visivo
#let sep() = {
  v(0.4em)
  align(center, line(length: 40%, stroke: 1pt + C.blu3))
  v(0.4em)
}


// ================================================================
//  FRONTESPIZIO
// ================================================================
#page(
  margin: 0pt,
  header: none,
  footer: none,
  numbering: none,
)[
  // Sfondo a gradiente
  #place(
    top + left,
    block(
      width: 100%,
      height: 100%,
      fill: gradient.linear(
        rgb("#0d2137"),
        rgb("#1a3a5c"),
        angle: 150deg,
      ),
    ),
  )

  // Decorazione geometrica
  #place(top + right,
    dx: 0pt, dy: 0pt,
    block(
      width: 14.34%,
      height: 100%,
      fill: rgb(90, 15, 70, 45),
    ),
  )
  #place(top + right,
    dx: -3cm, dy: 0pt,
    block(width: 0.5cm, height: 100%, fill: white.transparentize(85%)),
  )

  // Logo / titolo
  #place(
    center + horizon,
    block(width: 78%)[
      #align(center)[
        #v(1fr)

        // Etichetta tipo
        #block(
          fill: white.transparentize(80%),
          inset: (x: 1.4em, y: 0.5em),
          radius: 20pt,
        )[
          #text(fill: rgb("#aed6f1"), size: 10pt, tracking: 4pt,
                weight: "bold")[HANDBOOK]
        ]

        #v(1.2em)

        // Titolo principale
        #text(
          fill: white,
          size: 64pt,
          weight: "bold",
            font: ("Roboto"),
        )[Typst]

        #v(0.4em)

        // Sottotitolo
        #text(fill: rgb("#aed6f1"), size: 22pt,
                font: ("Roboto"),)[
          From ZERO to HERO
        ]

        #v(1.8em)

        // Divisore
        #line(length: 55%, stroke: 2pt + rgb("#2471a3"))
        #v(1.1em)
        #text(fill: rgb("#d8e2f2"), size: 13pt,
                font: ("Roboto"),)[
       #link("https://stefanocoelatirama.com/")[#text(fill: white)[Stefano Coelati Rama]]
        ]

        #v(1.8em)

        // Descrizione
        #text(fill: rgb("#d6eaf8"), size: 12.5pt, style: "italic")[]

        #v(2.5em)

        // Badge argomenti
        #let badge(t) = box(
          fill: white.transparentize(82%),
          stroke: 0.7pt + white.transparentize(60%),
          inset: (x: 0.9em, y: 0.4em),
          radius: 4pt,
        )[#text(fill: rgb("#d6eaf8"), size: 9.5pt)[#t]]

        
        #h(0.5em)
        
        #h(0.5em)
        
        #h(0.5em)
        
        #h(0.5em)
        

        #v(1fr)
      ]
    ],
  )

  // Footer frontespizio
  #place(
    bottom + center,
    dy: -1.8cm,
    text(fill: rgb("#5d8aa8"), size: 9.5pt)[
      Scritto ed impaginato interamente in Typst],
  )
]

// ================================================================
//  COLOPHON
// ================================================================
#page(numbering: none, header: none, footer: none)[
  #v(1fr)
  #set text(size: 9.5pt, fill: luma(90))
  #set par(justify: false)

  *Typst: from ZERO to HERO* \
  Manuale (quasi) Completo in Italiano

  #v(0.8em)

  Questo documento è stato scritto _interamente_ nel linguaggio Typst, senza alcun ausilio di altri strumenti. Costituisce esso stesso una dimostrazione delle capacità di impaginazione e programmazione del  linguaggio. Potrebbe contenere un sacco di refusi (linguistici e non)...apprezzate l'impegno. 

  #v(0.8em)

  Versione 1.0 — Giugno 2026 \
  
  #v(0.8em)

  _Tutti gli esempi presenti in questo manuale sono direttamente
  eseguibili nell'editor online ufficiale:_
  #link("https://typst.app")[typst.app]

  #v(0.5em)
  #line(length: 30%, stroke: 0.5pt + luma(200))
  #v(0.5em)

  Il contenuto di questo manuale è rilasciato per uso didattico.
  In caso questo manuale diventi vecchio o non si trovino alcune informazioni, vi invito ad andare nella #link("https://forum.typst.app/")[community], o nei #link("https://typst.app/docs/")[docs] per cercare informazioni. Altrimenti, come tutti i comuni mortali, chiedere all'intellingenza artificiale (ho provato ad usarla anche io - claude in particolare - per la stesura del manuale. Mi ha aiutato con qualche box, ma (forse perchè typst è troppo nuovo) il codice è quasi sempre corrotto e va modificato a mano, ergo: studiate).
  Questo testo non è per fini di lucro, Typst è un progetto open‑source! #link("https://github.com/typst/typst")

  I miei contatti li trovate qui: #link("https://stefanocoelatirama.com")

  #v(1fr)
]



// ================================================================
//  INDICE
// ================================================================
#page(numbering: "i", header: none)[
  #show outline.entry.where(level: 1): it => {
    v(0.5em)
    strong(it)
  }
  #outline(
    title: [Indice],
    depth: 3,
    indent: 2em,
  )
]

// Reset numerazione pagine
#counter(page).update(1)



// ================================================================
//  PREFAZIONE
// ================================================================
#page(numbering: "i", header: none)[

= Prefazione

Questo manuale nasce da una domanda semplice: *è possibile imparare
Typst partendo da zero assoluto? (Anche senza aver mai programmato?)* La risposta è sì, e questo testo ve lo dimostrerà pagina dopo pagina.

Typst è un linguaggio moderno per creare documenti di qualità
professionale: articoli scientifici, tesi di laurea, presentazioni,
CV, libri, dispense. È più semplice di LaTeX, più potente di Word, versatile quanto markdown ma, mi permetto di dire, molto più elegante di tutti questi.

== A chi è rivolto

Questo manuale è pensato per:

- *Studenti e ricercatori* che vogliono produrre tesi e articoli
  impeccabili senza impazzire con la formattazione
- *Professionisti* che vogliono documenti belli senza dipendere da
  Word
- *Curiosi* che amano capire come funzionano le cose
- *Chiunque non abbia mai programmato*,  partiamo davvero da zero

Non è richiesta nessuna conoscenza di programmazione, LaTeX, o
HTML. Basta saper scrivere.

== Come usare questo manuale

Il manuale è diviso in sette parti, in ordine crescente di
complessità:

#block(
  fill: rgb("#f0f3f4"),
  width: 100%,
  inset: (x: 1.3em, y: 1em),
  radius: 6pt,
  stroke: 0.6pt + luma(200),
)[
  #set par(spacing: 0.5em)
  *Parte I — Fondamenti* (Cap. 1–5):
  Cos'è Typst, come si installa, come si scrive testo semplice,
  grassetto, corsivo, titoli, liste.

  *Parte II — Elementi aggiuntivi* (Cap. 6–10):
  Link, immagini, tabelle, formule matematiche, blocchi di codice.

  *Parte III — Il Linguaggio* (Cap. 11–16):
  Il sistema di scripting: variabili, tipi, condizioni, cicli,
  funzioni.

  *Parte IV — La Stilizzazione* (Cap. 17–19):
  Le regole `set` e `show`. Come personalizzare ogni aspetto del
  documento.

  *Parte V — Un po' di Layout Avanzato* (Cap. 20–23):
  Colori, box, impaginazione professionale, griglie e colonne.

  *Parte VI — Organizzazione del Progetto* (Cap. 24–25):
  File multipli, moduli, pacchetti della comunità.

  *Parte VII — Una parte di progetti Reali* (Cap. 26–28):
  Template completi: documento accademico, CV, presentazione.
]

#consiglio[
  Apri #link("https://typst.app")[typst.app] sul browser mentre
  leggi. Ogni volta che vedi un esempio di codice, copialo e
  incollalo nell'editor: vedrai il risultato in tempo reale. Se impari facendo in modo pratico, impari prima e sei anche più veloce.
]

== Mie convenzioni tipografiche

Nel testo troverai questi elementi ricorrenti:

#block(
  fill: rgb("#f8f9fa"),
  width: 100%,
  inset: (x: 1.3em, y: 1em),
  radius: 6pt,
  stroke: 0.6pt + luma(210),
)[
  #grid(
    columns: (auto, 1fr),
    gutter: (0.8em, 0.6em),
    raw("codice"), [Codice Typst, nomi di funzioni, file],
    block(fill: rgb("#eaf4fb"), inset: (x: 0.7em, y: 0.3em),
          radius: 3pt)[Nota],
      [Informazione utile da tenere a mente],
    block(fill: rgb("#fef5e7"), inset: (x: 0.7em, y: 0.3em),
          radius: 3pt)[Attenzione],
      [Errori comuni da evitare],
    block(fill: rgb("#eafaf1"), inset: (x: 0.7em, y: 0.3em),
          radius: 3pt)[Consiglio],
      [Trucchi e buone pratiche],
    block(fill: rgb("#fffde7"), inset: (x: 0.7em, y: 0.3em),
          radius: 3pt)[Prova tu!],
      [Esercizio pratico da eseguire#footnote[Alla fine non li ho usati...ma mi piaceva comunque l'idea di avere questa tag, quindi eccola qui.]],
  )
]
]




// ================================================================
//  PARTE I — FONDAMENTI
// ================================================================

// ────────────────────────────────────────────────────────────────
//  CAPITOLO 1 — COS'È TYPST
// ────────────────────────────────────────────────────────────────
= Cos'è Typst e perché usarlo

Typst è un linguaggio di _markup_ e di _programmazione_ progettato
per creare documenti di alta qualità tipografica. In parole semplici:
scrivi del testo in un file, aggiungi alcune istruzioni speciali, e
Typst produce automaticamente un PDF professionale.

Pensa a Typst come a qualcosa che si trova a metà strada tra Microsoft
Word e LaTeX.

== Markup: cos'è e come funziona

Prima di tutto, chiariamo il termine *markup*. Un linguaggio di
markup è un sistema in cui scrivi il tuo contenuto (testo, immagini,
equazioni...) insieme a delle _marcature_, delle istruzioni speciali che
descrivono come quel contenuto deve apparire.

Il principio è *separare il contenuto dalla forma*.

- In Word, clicchi su "Grassetto" e il testo diventa grassetto.
- In Typst, come in latex, scrivi `*testo in grassetto*` e Typst lo rende grassetto quando compila il PDF.

Questo approccio ha vantaggi enormi:
- Il documento è un semplice file di testo: leggero e portabile.
- La formattazione è consistente in tutto il documento
- Puoi concentrarti sul contenuto mentre scrivi, senza distrarti
  con i menu di formattazione
- Puoi automatizzare qualsiasi cosa: numeri di pagina, indici,
  riferimenti incrociati, tabelle generare dal codice. Non devi metterti le mani nei capelli (se ne hai...fortuntato tu...) se vuoi solamente modificare un pezzo dell'indice o l'ordine dei paragrafi, fa tutto typst in automatico. 

== Confronto con gli strumenti più comuni

=== Typst vs Microsoft Word / LibreOffice

#table(
  columns: (auto, 1fr, 1fr),
  stroke: 0.6pt + luma(210),
  fill: (col, row) => if row == 0 { C.blu }
                      else if calc.odd(row) { white }
                      else { C.sfondo },
  table.cell(fill: C.blu)[
    #set text(fill: white, weight: "bold"); Aspetto],
  table.cell(fill: C.blu)[
    #set text(fill: white, weight: "bold"); Word / LibreOffice],
  table.cell(fill: C.blu)[
    #set text(fill: white, weight: "bold"); Typst],
  [Tipo], [WYSIWYG (vedi subito il risultato)],
         [Markup (compili per vedere il risultato)],
  [Curva di apprendimento], [Bassa all'inizio], [Bassa — più semplice di LaTeX],
  [Consistenza], [Difficile da mantenere], [Perfetta automaticamente],
  [Formule matematiche], [Difficili], [Eccellenti, semplici],
  [File], [Formato binario .docx], [Testo puro .typ],
  [Velocità], [Lenta su documenti grandi], [Compilazione istantanea],
  [Automazione], [Macro VBA (complesse)], [Scripting integrato (semplice)],
  [Costo], [Costoso / gratuito], [Gratuito e open‑source],
)

=== Typst vs LaTeX

LaTeX è il re incontrastato della tipografia accademica da decenni.
Typst ne eredita l'eccellenza tipografica ma risolve i suoi "problemi"
storici:

#table(
  columns: (auto, 1fr, 1fr),
  stroke: 0.6pt + luma(210),
  fill: (col, row) => if row == 0 { C.blu }
                      else if calc.odd(row) { white }
                      else { C.sfondo },
  table.cell(fill: C.blu)[#set text(fill: white, weight: "bold"); Aspetto],
  table.cell(fill: C.blu)[#set text(fill: white, weight: "bold"); LaTeX],
  table.cell(fill: C.blu)[#set text(fill: white, weight: "bold"); Typst],
  [Errori], [Messaggi criptici da linguaggio di programmazione], [Messaggi molto chiari e precisi],
  [Compilazione], [Lenta (secondi/minuti)], [Istantanea e veloce anche su file enormi],
  [Sintassi], [Complicata e un po' vecchia], [Coincisa e molto nuova],
  [Imparare], [Ripida per un principiante], [Molto accessibile],
  [Pacchetti], [Migliaia (CTAN)], [In crescita (Universe)],
  [Qualità tipografica], [Eccellente], [Eccellente],
  [Matematica], [Ottima], [Ottima, ma sintassi più moderna],
)

== Come funziona Typst: il flusso di lavoro

Il processo è sempre lo stesso:

#block(
  fill: C.sfondo,
  width: 100%,
  inset: (x: 1.5em, y: 1.2em),
  radius: 6pt,
  stroke: 0.6pt + luma(210),
)[
  #align(center)[
    #set text(size: 12pt)
    #grid(
      columns: (auto, auto, auto, auto, auto),
      gutter: 0.6em,
      align: (center + horizon),
      block(
        fill: C.blu, inset: (x: 0.9em, y: 0.6em), radius: 5pt,)[#text(fill: white)[*Scrivi*\ #text(fill: C.blu2)[`.typ`]]],
      text(size: 18pt, fill: C.blu2)[→],
      block(
        fill: C.blu, inset: (x: 0.9em, y: 0.6em), radius: 5pt,
      )[#text(fill: white)[*Compila*\
        Typst]],
      text(size: 18pt, fill: C.blu2)[→],
      block(
        fill: C.verde, inset: (x: 0.9em, y: 0.6em), radius: 5pt,
      )[#text(fill: white)[*Ottieni*\ #text(fill: C.blu2)[`.pdf`]]],
    )
  ]
  #v(0.8em)
  *Nell'editor online* (typst.app), la compilazione avviene
  automaticamente mentre scrivi: ogni volta che fai una pausa
  di scrittura, il PDF si aggiorna in tempo reale nel pannello
  di destra. È sempre istantaneo (È istantaneo anche se avete un file enorme, come in questo caso, l'importante è scrivere/modificare pezzi di codice e non fare copia-incolla tutto insieme. In quel caso ci potrebbe volvere qualche secondo. \
  (Non vibecodate...).
]

== Un brevissimo cenno storico

Typst è nato come progetto di tesi magistrale di due studenti
dell'Università Tecnica di Berlino (TU Berlin), Laurenz Mädje e Martin Haug.
Il progetto ha aperto la sua beta pubblica nel marzo 2023, e da
allora ha raccolto una comunità entusiasta in tutto il mondo.
È open‑source (licenza Apache 2.0) e disponibile gratuitamente
sia come applicazione web che come strumento da riga di comando.

#nota[
  In questo manuale usiamo la versione online di Typst
  (typst.app) per tutti gli esempi. Non è necessario installare
  nulla sul proprio computer per iniziare. In caso vogliate, potete installarlo sul vostro dispositivo e scrivere con ciò che volete (Io questo documento l'ho scritto in LazyVIM).
]

// ────────────────────────────────────────────────────────────────
//  CAPITOLO 2 — INSTALLAZIONE E PRIMO DOCUMENTO
// ────────────────────────────────────────────────────────────────
= Installazione e primo documento

== Opzione 1: Editor online (consigliata per iniziare)

Il modo più semplice per iniziare è l'editor online ufficiale.
Non richiede installazioni, funziona su qualsiasi browser.

+ Apri il browser e vai su #link("https://typst.app")[typst.app]
+ Crea un account gratuito (o entra con Google/GitHub)
+ Clicca su *"Empty document"* (o *"Start from template"* se volete già qualcosa di pronto)
+ Si apre l'editor: a sinistra il codice, a destra il PDF in
  anteprima

L'editor online ha queste caratteristiche:
- Anteprima PDF in tempo reale
- Evidenziazione della sintassi
- Autocompletamento
- Messaggi di errore istantanei
- Possibilità di esportare il PDF (e non solo)
- Archiviazione dei progetti nel cloud
- Impostazione VIM della tastiera (consigliata)#footnote[Visto che si parla di tastiera, mi sembra giusto dirvi che se usate la versione online, come vi consiglio, ci sono tantissime scorciatoie da tastiera. Scopritene ed usatente quanto potete, vi velocizzano di molto il lavoro!]

#consiglio[
  Se sei alle prime armi, ti consiglio, sopratutto per i primi capitoli di questo manuale, di usare esclusivamente
  l'editor online. È il modo più rapido per sperimentare senza
  distrazioni, è semplicissimo e non devi fare altro che scrivere.
]

== Opzione 2: Installazione locale

Per chi vuole lavorare offline o integrare Typst nel proprio
flusso di lavoro con un editor di testo come VS Code (o VIM!!).

=== Installazione su Windows

```
winget install --id Typst.Typst
```

Oppure semplicemente scarica il file `.exe` dalla pagina delle release:
#link("https://github.com/typst/typst/releases")

=== Installazione su macOS

Con Homebrew:
```
brew install typst
```

=== Installazione su Linux

Con il gestore pacchetti del sistema (#emoji.heart Arch #emoji.heart #footnote[Amo archlinux, dovete amare arch linux anche voi. In questo handbook non le ho inserite, ma se volete anche voi queste bellissime emoji, trovate tutti i codici a questo indirizzo: #link("https://typst.app/docs/reference/symbols/emoji/")], NixOS, ecc.) o tramite:
```
cargo install --git https://github.com/typst/typst
```

Oppure scarica il binario pre‑compilato dalla pagina release.

=== Estensione VS Code

Per quanto non mi piacca VS so che tanti lo usano, quindi se anche tu usi Visual Studio Code (e dunque sei una brutta persona), installa l'estensione *Tinymist Typst*
dall'Extensions Marketplace. Fornisce:
- Anteprima PDF integrata
- Autocompletamento e suggerimenti
- Navigazione nel documento
- Evidenziazione errori

=== Compilare dalla riga di comando

Una volta installato, compila un file con:
```
typst compile mio-documento.typ
```

Per la modalità watch (ricompila automaticamente a ogni salvataggio):
```
typst watch mio-documento.typ
```

== Struttura di un file .typ

Un file Typst ha estensione `.typ` ed è un semplice file di testo.
Non c'è una struttura obbligatoria: puoi iniziare a scrivere
direttamente.

Un file tipico è composto da:

```typ
// Impostazioni del documento (opzionali ma consigliate)
#set document(title: "Il mio documento", author: "Stefano Coelati Rama")
#set page(paper: "a4", margin: 2cm)
#set text(font: "Linux Libertine", size: 11pt)

// Da qui in poi: il contenuto del documento
= Titolo del documento

Qui scrivo il mio testo normale.

== Una sezione

Altro testo...
```

Le righe che iniziano con `//` sono *commenti*: Typst le ignora
completamente. Sono utili per lasciare note a te stesso.//Hai visto? Tu che sei curioso? Non si vede nel pdf!

== Il tuo primo documento: "Hello, W...Typst!"

Apri l'editor online, cancella tutto quello che c'è (se c'è),
e scrivi questo:

#esempio-box(
  ```typ
= Ciao, Typst!

Questo è il mio primo documento scritto in Typst.
È molto semplice iniziare!

== Una sezione

Posso avere *grassetto*, _corsivo_ e anche `codice`.

- Prima voce
- Seconda voce
- Terza voce
```,
)

Compila (nell'editor online avviene in automatico) e vedrai
il PDF apparire a destra.

#prova-tu[
  Nell'editor online:
  + Copia il codice qui sopra
  + Modifica il titolo con il tuo nome
  + Aggiungi un'altra sezione con qualche testo
  + Aggiungi una lista con i tuoi tre cibi preferiti
]

#nota[
  In questo manuale gli esempi di codice sono mostrati con il
  linguaggio `typ` evidenziato. Quando copi il codice, copia
  *solo* il contenuto, non i tre backtick iniziali e finali
  (tre backtick: `\`,`\`,`\`) che sono solo la marcatura del blocco di codice
  nel manuale (è obbligatoria altrimenti da errore, vedrete questi "tag" spesso anche nelle sezioni).
]


// ────────────────────────────────────────────────────────────────
//  CAPITOLO 3 — TESTO E FORMATTAZIONE DI BASE
// ────────────────────────────────────────────────────────────────
= Testo e formattazione di base

Questo è il capitolo più pratico: qui impari a fare tutto quello
che fai normalmente in un editor di testo, ma in Typst.

== Scrivere testo normale

Per scrivere testo, scrivi e basta. Niente di speciale. Typst
considera tutto ciò che non inizia con un carattere speciale come testo normale.

```typ
Questo è testo normale.
Puoi scrivere tutto quello che vuoi.
Numeri: 42, 3.14, -7.
Punteggiatura: virgole, punti, punti esclamativi!
```

=== Paragrafi

Per creare un nuovo paragrafo, lascia *una riga vuota* tra due
blocchi di testo:

#esempio-box(
  "
Questo è il primo paragrafo.
Questa riga continua nello stesso paragrafo.

Questo è un secondo paragrafo, separato da
una riga vuota.
",
  risultato: [
    Questo è il primo paragrafo.
    Questa riga continua nello stesso paragrafo.

    Questo è un secondo paragrafo, separato da
    una riga vuota.
  ],
  titolo: "Paragrafi",
)

#nota[
  Andare a capo nel codice senza lasciare una riga vuota
  *non* crea un nuovo paragrafo, il testo continua sulla
  stessa riga nel PDF. Un po' come in latex.
  Per iniziare un paragrafo nuovo, serve la riga vuota.
]

=== Andare a capo senza nuovo paragrafo

Se vuoi andare a capo senza creare un nuovo paragrafo (come in
una poesia o un indirizzo), usa il backslash `\` seguito da uno
spazio:

#esempio-box(
  ```
Via Roma, 42 \
00100 Roma \
Italia
```,
  risultato: [
    Via Roma, 42 \
    00100 Roma \
    Italia
  ],
  titolo: "Interruzione di riga",
)

In alternativa puoi usare la funzione `#linebreak()`.

== Grassetto, corsivo e sottolineato

=== Grassetto

Racchiudi il testo tra asterischi `*...*`:

#esempio-box(
  ```
Questa parola è *in grassetto*.
Anche *più parole insieme* funzionano.
```,
  risultato: [
    Questa parola è *in grassetto*.
    Anche *più parole insieme* funzionano.
  ],
  titolo: "Grassetto",
)

=== Corsivo

Racchiudi il testo tra underscore `_..._`:

#esempio-box(
  ```
Questa parola è _in corsivo_.
Anche _una frase intera_ può essere in corsivo.
```,
  risultato: [
    Questa parola è _in corsivo_.
    Anche _una frase intera_ può essere in corsivo.
  ],
  titolo: "Corsivo",
)

=== Combinare grassetto e corsivo

Puoi combinarli annidandoli uno dentro l'altro:

#esempio-box(
  ```
Questo è *_grassetto e corsivo_* insieme.
Oppure _testo con parte in *grassetto*_.
```,
  risultato: [
    Questo è *_grassetto e corsivo_* insieme.
    Oppure _testo con parte in *grassetto*_.
  ],
  titolo: "Grassetto + Corsivo",
)

=== Testo cancellato (strikethrough)

Racchiudi il testo dentro `#strike[testo]` (non ho idea a cosa possa servirvi, ma tant'è):

#esempio-box(
  ```
Il prezzo era #strike[100 euro], ora è 50 euro.
```,
  risultato: [
    Il prezzo era #strike[100 euro], ora è 50 euro.
  ],
  titolo: "Testo cancellato",
)

=== Codice inline

Racchiudi tra backtick (si, l'apice inverso si chiama backtrick) `` `...` ``:

#esempio-box(
  ```
Usa la funzione `print()` per stampare.
Il file si chiama `documento.typ`.
```,
  risultato: [
    Usa la funzione `print()` per stampare.
    Il file si chiama `documento.typ`.
  ],
  titolo: "Codice inline",
)

=== Apice e pedice

Per l'apice usa `#super[...]`, per il pedice `#sub[...]`:

#esempio-box(
  ```
L'acqua è H#sub[2]O.
La formula è E = mc#super[2].
x#sub[1] + x#sub[2] = x#sub[1+2]
```,
  risultato: [
    L'acqua è H#sub[2]O.
    La formula è E = mc#super[2].
    x#sub[1] + x#sub[2] = x#sub[1+2]
  ],
  titolo: "Apice e pedice",
)

#nota[
  Per le formule matematiche vere e proprie (con lettere greche,
  frazioni, integrali...) esistono le modalità matematiche `$...$`
  che vedremo nel Capitolo 9. L'apice e il pedice con `#super` e
  `#sub` sono solo per testo normale, usateli con parsimonia.
]

== Caratteri speciali e come usarli

Alcuni caratteri hanno un significato speciale in Typst. Se vuoi
inserirli come testo normale, devi "escaparli" (fare l'escape, trattarli come testo normale) con il backslash `\`:

#table(
  columns: (auto, auto, auto),
  stroke: 0.6pt + luma(210),
  fill: (col, row) => if row == 0 { C.blu }
                      else if calc.odd(row) { white }
                      else { C.sfondo },
  table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
    Carattere],
  table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
    Come scriverlo],
  table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
    Significato speciale],
  [`*`], [`\*`], [Grassetto],
  [`_`], [`\_`], [Corsivo],
  [`~`], [`\~`], [Spazio insecabile],
  [#raw("`")], [#raw("`...`")], [Codice inline],
  [`$`], [`\$`], [Matematica],
  [`#`], [`\#`], [Istruzione codice],
  [`@`], [`\@`], [Riferimento],
  [`<`], [`\<`], [Etichetta],
  [`\`], [`\\`], [Backslash letterale],
)

== Virgolette tipografiche

Typst converte automaticamente le virgolette diritte in virgolette
tipografiche (curve) appropriate per la lingua del documento:

#esempio-box(
  ```
"Ciao" diventano "virgolette basse".
'Anche' le 'singole' funzionano uguale.
```,
  risultato: [
    "Ciao" diventano "virgolette italiane".
    'Anche' le 'singole' funzionano.
  ],
  titolo: "Virgolette tipografiche",
)

#nota[
  Le virgolette si adattano alla lingua impostata con
  `#set text(lang: "it")`. Con la lingua italiana, le
  doppie virgolette diventano «virgolette angolari» e
  le singole diventano ‹virgolette angolari singole›.
  Con `lang: "en"` diventano "curly quotes" inglesi.
]

== Spazi speciali

A volte hai bisogno di tipi di spaziatura particolari:

#table(
  columns: (auto, auto, 1fr),
  stroke: 0.6pt + luma(210),
  fill: (col, row) => if row == 0 { C.blu }
                      else if calc.odd(row) { white }
                      else { C.sfondo },
  table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
    Tipo],
  table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
    Sintassi],
  table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
    Uso],
  [Spazio normale], [`lascia lo spazio ` (barra spazio)], [Tra parole],
  [Spazio non divisibile], [`~`], [10~kg, Dr.~Rossi],
  [Spazio fine], [`#h(0.2em)`], [Dopo punti in abbreviazioni],
  [Spazio orizzontale], [`#h(1cm)`], [Spaziatura personalizzata],
  [Spazio verticale], [`#v(1cm)`], [Spaziatura verticale],
  [Spazio infinito], [`#h(1fr)`], [Spinge il testo ai lati],
)

#esempio-box(
  ```
Dott.~Rossi pesa 80~kg.
Sinistra #h(1fr) Destra
```,
  risultato: [
    Dott.~Rossi pesa 80~kg.
    #linebreak()
    Sinistra #h(1fr) Destra
  ],
  titolo: "Spazi speciali",
)

== Linea orizzontale

Per inserire una linea orizzontale separatrice si usa la funzione `#line()`:

#esempio-box(
  ```
Testo sopra la linea.

#line(length: 100%, stroke: 0.5pt)

Testo sotto la linea.
```,
  risultato: [
    Testo sopra la linea.
    #line(length: 100%, stroke: 0.5pt)
    Testo sotto la linea.
  ],
  titolo: "Linea orizzontale",
)

#attenzione[
  A differenza di Markdown, in Typst tre trattini `---` *non* producono
  una linea orizzontale: producono un trattino lungo (_em dash_, "—").
  Due trattini `--` danno invece un trattino medio (_en dash_, "–").
  Per una vera riga di separazione usa sempre `#line(length: 100%)`.
]

// ────────────────────────────────────────────────────────────────
// CAPITOLO 4 — TITOLI E STRUTTURA DEL DOCUMENTO
// ────────────────────────────────────────────────────────────────
= Titoli e struttura del documento
I titoli danno struttura al documento. In Typst si creano con il
simbolo `=` (uguale) all'inizio di una riga.
== I livelli di titolo
Typst supporta sei livelli di titolo, creati con un numero
crescente di `=`:
#esempio-box(
 ```
= Capitolo (livello 1)
== Sezione (livello 2)
=== Sottosezione (livello 3)
==== Paragrafo (livello 4)
===== Livello 5
====== Livello 6
```,
 titolo: "Livelli di titolo",
)
#attenzione[
 Il simbolo `=` deve essere all'*inizio di una riga* e seguito
 da uno spazio. `=Titolo` (senza spazio) non funziona come titolo, ma viene stampato come testo normale (= ciao, visto?).
]
== Numerazione automatica
Typst può numerare in modo automatico i titoli. Basta aggiungere nelle impostazioni:
#esempio-box(
 ```
#set heading(numbering: "1.1.1.")
= Primo capitolo
== Prima sezione
=== Prima sottosezione
== Seconda sezione
= Secondo capitolo
```,
 titolo: "Numerazione titoli",
)
Esistono vari stili di numerazione:
#table(
 columns: (auto, 1fr, auto),
 stroke: 0.6pt + luma(210),
 fill: (col, row) => if row == 0 { C.blu }
 else if calc.odd(row) { white }
 else { C.sfondo },
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Stringa di numerazione],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Descrizione],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Esempio],
 [`"1."`], [Arabi, un livello], [1. 2. 3.],
 [`"1.1."`], [Arabi, due livelli], [1.1. 1.2. 2.1.],
 [`"1.1.1."`], [Arabi, tre livelli], [1.1.1.],
 [`"I."`], [Romani maiuscoli], [I. II. III.],
 [`"i."`], [Romani minuscoli], [i. ii. iii.],
 [`"A."`], [Lettere maiuscole], [A. B. C.],
 [`"a."`], [Lettere minuscole], [a. b. c.],
 [`"(1)"`], [Arabi tra parentesi], [(1) (2) (3)],
)
== L'indice automatico con `#outline()`
Uno dei poteri di Typst è generare automaticamente l'indice del
documento. Metti questa riga dove vuoi che appaia l'indice:
```typ
#outline()
```
L'indice include tutti i titoli e le loro pagine. Ovviamente è personalizzabile:
```typ
// Indice fino al livello 3
#outline(depth: 3)
// Indice con titolo personalizzato
#outline(title: "Sommario")
// Indice con rientro automatico
#outline(depth: 3, indent: 2em)
// Indice con solo un certo tipo di elemento
#outline(title: "Lista delle figure", target: figure.where(kind: image))
#outline(title: "Lista delle tabelle", target: figure.where(kind: table))
```
== Titoli fuori dall'indice
A volte vuoi un titolo visivo che non compaia nell'indice
(per esempio nella prefazione o nell'appendice):
```typ
// Titolo non incluso nell'indice e non numerato
#heading(level: 1, numbering: none, outlined: false)[Prefazione]
```
== Etichette e riferimenti incrociati
Puoi assegnare un'_etichetta_ a qualsiasi titolo (o figura, o
equazione) e poi *riferirtici* da un'altra parte del documento.
=== Assegnare un'etichetta
Dopo il titolo, scrivi `<nome-etichetta>` tra parentesi angolari:
```typ
= Capitolo Introduttivo <cap-intro>
== La storia di Typst <storia>
Vedi la sezione sulla storia (@storia) nel capitolo @cap-intro.
```
=== Fare riferimento
Usa `@nome-etichetta` per riferirti al riferito. Typst genera
automaticamente il testo del link con il numero corretto:
- Se punta a un titolo di capitolo: "Capitolo 1"
- Se punta a una figura: "Figura 3"
- Se punta a un'equazione: "Equazione (5)"
#esempio-box(
 ```
== Il Teorema di Pitagora <teorema-pitagora>
Come dimostrato in @teorema-pitagora, il quadrato
dell'ipotenusa è uguale alla somma dei quadrati
dei cateti.
```,
 titolo: "Riferimento a una sezione",
)
#nota[
 Come nella programmazione normale, le etichette dei riferimenti devono essere *univoche* nel
 documento. Non puoi avere due `<intro>` nello stesso file.
 Quindi buona norma è usare nomi descrittivi come `<cap-risultati>` invece di `<1>` (e se puoi, commenta! Almeno chi leggerà il documento in futuro e vorrà modificarlo non impazzirà).
]
== Interruzione di pagina
Per forzare l'inizio di un nuovo capitolo su una nuova pagina:
```typ
#pagebreak()
= Nuovo capitolo
```
Con `weak: true`, la pagina si spezza solo se non è già all'inizio
di una pagina:
```typ
#pagebreak(weak: true)
```

// ────────────────────────────────────────────────────────────────
// CAPITOLO 5 — LISTE
// ────────────────────────────────────────────────────────────────
= Liste
Le liste sono fondamentali in quasi ogni documento. Typst ne
supporta tre tipi principali.
== Lista puntata
Inizia ogni voce con un trattino `-` seguito da uno spazio:
#esempio-box(
 ```
- Prima voce
- Seconda voce
- Terza voce
```,
 risultato: [
 - Prima voce
 - Seconda voce
 - Terza voce
 ],
 titolo: "Lista puntata",
)
=== Marcatori personalizzati
Il marcatore predefinito è `•`, ma puoi cambiarlo con `set list`:
```typ
#set list(marker: "→")
- Prima voce
- Seconda voce
```
Oppure puoi specificare marcatori diversi per ogni livello:
```typ
#set list(marker: ([•], [–], [○]))
```
== Lista numerata
Inizia ogni voce con `+` seguito da uno spazio:
#esempio-box(
 ```
+ Primo punto
+ Secondo punto
+ Terzo punto
```,
 risultato: [
 + Primo punto
 + Secondo punto
 + Terzo punto
 ],
 titolo: "Lista numerata",
)
=== Stile di numerazione
```typ
// Numerazione con lettere
#set enum(numbering: "a)")
+ Prima voce // a)
+ Seconda voce // b)
// Numerazione con romani
#set enum(numbering: "I.")
```
=== Iniziare da un numero specifico
```typ
#enum(start: 5,
 [Quinta voce],
 [Sesta voce],
 [Settima voce],
)
```
== Liste annidate
Per creare una sottolista, indenta le voci con due spazi (o un tab):
#esempio-box(
 ```
- Frutta
    - Mele
    - Pere
    - Banane
- Verdura
    - Carote
    - Spinaci
- Cereali
```,
 risultato: [
 - Frutta
  - Mele
  - Pere
  - Banane
 - Verdura
  - Carote
  - Spinaci
 - Cereali
 ],
 titolo: "Lista annidata",
)
Puoi mescolare liste puntate e numerate:
#esempio-box(
 ```
+ Prepara gli ingredienti:
  - Farina 500g
  - Acqua 300ml
  - Sale 10g
+ Impasta
+ Lascia riposare:
  - Almeno 2 ore
  - In luogo fresco
+ Cuoci
```,
 risultato: [
 + Prepara gli ingredienti:
  - Farina 500g
  - Acqua 300ml
  - Sale 10g
 + Impasta
 + Lascia riposare:
  - Almeno 2 ore
  - In luogo fresco
 + Cuoci
 ],
 titolo: "Mescolare liste",
)
== Lista di definizioni (termine: definizione)
Per creare un glossario o elenco di termini con definizioni, usa
`/ termine: definizione`:
#esempio-box(
 ```
/ Markup: Un linguaggio che usa marcatori speciali
 nel testo per descriverne la struttura e la
 formattazione.
/ Compilatore: Programma che trasforma il codice
 sorgente in un file di output (nel caso di Typst,
 in un PDF).
/ PDF: Portable Document Format. Formato di file
 universalmente leggibile.
```,
 risultato: [
/ Markup:
  Un linguaggio che usa marcatori speciali nel testo
  per descriverne la struttura e la formattazione.
/ Compilatore:
  Programma che trasforma il codice sorgente
 in un file di output (nel caso di Typst, in un PDF).
/ PDF:
  Portable Document Format. Formato di file
 universalmente leggibile.
 ],
 titolo: "Lista di definizioni",
)
== Voci su più righe
Le voci di una lista possono contenere più paragrafi. Basta far rientrare il testo successivo allo stesso livello:
#esempio-box(
 ```
- *Prima voce importante*
 Questo è il paragrafo di spiegazione per la
 prima voce. Può essere lungo quanto vuoi.
 Puoi anche avere più paragrafi per la stessa voce.
- *Seconda voce*
 Un'altra spiegazione.
```,
 risultato: [
- *Prima voce importante*
 Questo è il paragrafo di spiegazione per la
 prima voce. Può essere lungo quanto vuoi.
 Puoi anche avere più paragrafi per la stessa voce.
- *Seconda voce*
  Un'altra spiegazione.
 ],
 titolo: "Voci multi-paragrafo",
)
== Spaziatura tra le voci
Di default le voci di lista sono compatte. Puoi aumentare la
spaziatura tra le voci:
```typ
#set list(spacing: 1.5em)
- Prima voce
- Seconda voce (ora c'è più spazio tra le voci)
```

// ────────────────────────────────────────────────────────────────
// CAPITOLO 6 — LINK E RIFERIMENTI
// ────────────────────────────────────────────────────────────────
= Link e riferimenti
== Link a pagine web
=== Sintassi base
```typ
#link("https://typst.app")[Visita Typst]
```
Il primo argomento (tra parentesi tonde) è l'URL, il secondo
(tra parentesi quadre) è il testo da mostrare:
#esempio-box(
 ```
Visita #link("https://typst.app")[il sito ufficiale di Typst].
Oppure: documentazione su
#link("https://typst.app/docs")[typst.app/docs].
```,
 risultato: [
 Visita #link("https://typst.app")[il sito ufficiale di Typst].
 Oppure: documentazione su
 #link("https://typst.app/docs")[typst.app/docs].
 ],
 titolo: "Link a URL",
)
=== URL automatici
Se scrivi un URL direttamente nel testo, Typst lo riconosce e
lo rende cliccabile automaticamente:
```typ
Vai su https://typst.app per iniziare.
```
=== Link senza testo visibile (solo URL)
```typ
#link("https://typst.app")
// Mostra l'URL stesso come testo
```
=== Link a indirizzi email
```typ
Scrivimi a #link("mailto:info@esempio.it")[info@esempio.it]
```

== Note a piè di pagina
Le note a piè di pagina si inseriscono con `#footnote[...]`:
#esempio-box(
 ```
Il termine "markup"#footnote[
 Dal termine inglese "mark up", che significa
 "annotare" o "contrassegnare".
] risale agli anni '60.
```,
 risultato: [
 Il termine "markup"#footnote[
 Dal termine inglese "mark up", che significa
 "annotare" o "contrassegnare".
 ] risale agli anni '60.
 ],
 titolo: "Note a piè di pagina",
)
Le note vengono automaticamente numerate e appaiono in fondo
alla pagina corrente.
== Riepilogo link e riferimenti
#table(
 columns: (1fr, 1fr),
 stroke: 0.6pt + luma(210),
 fill: (col, row) => if row == 0 { C.blu }
 else if calc.odd(row) { white }
 else { C.sfondo },
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Sintassi],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Effetto],
 [`#link("url")[testo]`], [Link esterno con testo],
 [`https://...`], [URL automatico cliccabile],
 [`<etich>`], [Assegna etichetta],
 [`@etich`], [Riferimento all'etichetta],
 [`#footnote[testo]`], [Nota a piè di pagina],
)
// ────────────────────────────────────────────────────────────────
// CAPITOLO 7 — IMMAGINI E FIGURE
// ────────────────────────────────────────────────────────────────
= Immagini e figure
== Inserire un'immagine
La funzione per inserire immagini è `#image("percorso")`. Il
percorso è relativo alla posizione del file `.typ`:
```typ
// Immagine nella stessa cartella del file .typ
#image("foto.jpg")
// Immagine in una sottocartella
#image("immagini/grafico.png")
// Immagine con larghezza fissa
#image("logo.png", width: 5cm)
// Immagine con larghezza percentuale
#image("schema.png", width: 80%)
// Immagine con altezza fissa
#image("foto.jpg", height: 4cm)
```
=== Formati supportati
Typst supporta i formati immagine più comuni:
- PNG (`.png`)
- JPEG/JPG (`.jpg`, `.jpeg`)
- SVG (`.svg`) — vettoriale, ideale per loghi e schemi
- GIF (`.gif`) — solo il primo frame
=== Parametro `fit`
Quando specifichi sia `width` che `height`, puoi controllare
come l'immagine viene ridimensionata (così da non crare caos al cambio di dispositivo) con il parametro `fit`:
```typ
// "cover": riempie l'area (può tagliare)
#image("foto.jpg", width: 10cm, height: 6cm, fit: "cover")
// "contain": l'immagine intera (con spazio vuoto laterale)
#image("foto.jpg", width: 10cm, height: 6cm, fit: "contain")
// "stretch": deforma l'immagine per riempire
#image("foto.jpg", width: 10cm, height: 6cm, fit: "stretch")
```
== La funzione `#figure()`: figure con didascalia
Per le figure professionali (con didascalia, numerazione
automatica, e inclusione nell'indice delle figure) usa `#figure()`:
```typ
#figure(
 image("grafico.png", width: 80%),
 caption: [Andamento delle temperature nel 2024.],
) <fig-temperature>
```
=== Componenti di `#figure()`
La funzione `figure` accetta:
- Il *contenuto* come primo argomento (l'immagine, la tabella, ecc.)
- `caption`: la didascalia (tra parentesi quadre)
- `label`: puoi anche mettere l'etichetta `<nome>` dopo `)`
=== Personalizzare il supplemento
Di default le figure mostrano "Figura 1", "Figura 2", ecc. Puoi
personalizzare:
```typ
#set figure(supplement: "Fig.")
// Ora mostra "Fig. 1", "Fig. 2"
// In italiano, Typst potrebbe già usare "Figura"
// se hai impostato lang: "it"
```
=== Posizionamento delle figure
Per impostazione predefinita, le figure vengono posizionate "in
linea" con il testo. Puoi forzare il posizionamento:
```typ
#figure(
 image("schema.png"),
 caption: [Schema del sistema.],
 placement: top, // Metti in cima alla pagina
)
// Altre opzioni: bottom, none (inline)
```
== Allineamento
Puoi centrare o allineare il contenuto con `#align()`:
```typ
// Centrato
#align(center)[
 #image("logo.png", width: 4cm)
]
// A destra
#align(right)[
 #image("firma.png", width: 3cm)
]
```
== Immagini affiancate
Per mettere due immagini affiancate, usa `#grid()`:
```typ
#grid(
 columns: (1fr, 1fr),
 gutter: 1em,
 figure(image("prima.png"), caption: [Prima immagine.]),
 figure(image("seconda.png"), caption: [Seconda immagine.]),
)
```

== Formati e ottimizzazione delle immagini

=== Immagini SVG per grafica vettoriale

Il formato SVG è preferibile per loghi, schemi, diagrammi e
qualsiasi grafica che deve restare nitida a qualsiasi scala.
Typst include il renderer SVG nativamente, nessun pacchetto
extra è necessario:

`````typ
// SVG: nitido a qualsiasi risoluzione
#image("schema.svg", width: 100%)

// Puoi disegnare SVG inline nel documento
#image.decode("<svg xmlns='http://www.w3.org/2000/svg'
  width='100' height='100'>
  <circle cx='50' cy='50' r='40'
    stroke='#1a3a5c' stroke-width='3' fill='#aed6f1'/>
</svg>")
`````

=== Immagini: solo file locali (niente URL)

#attenzione[
  A differenza di altri strumenti, Typst *non* scarica immagini da
  internet: `#image()` accetta solo percorsi a file locali (o dati
  in memoria). Passare un URL produce l'errore `file not found`,
  perché Typst lo interpreta come un percorso sul disco.
]

Se vuoi usare un'immagine presa dal web, scaricala prima e poi
referenziala localmente:

`````typ
// Sbagliato: Typst NON scarica da rete → errore "file not found"
// #image("https://esempio.com/logo.svg")

// Corretto: scarica il file nella cartella del progetto e usa il path
#image("immagini/logo.svg", width: 4cm)
`````

=== Testo alternativo (accessibilità)

Per la conformità PDF/UA-1 è buona pratica aggiungere
una descrizione testuale all'immagine:

`````typ
#image("grafico-dati.png",
  width: 80%,
  alt: "Grafico a barre che mostra le vendite mensili del 2024",
)
`````

=== Clip e zoom: mostrare una porzione di immagine

`````typ
// Mostra solo la parte centrale dell'immagine
#box(
  clip: true,
  width: 5cm,
  height: 4cm,
)[
  #move(dx: -2cm, dy: -1cm)[
    #image("foto-larga.jpg", width: 9cm)
  ]
]
`````

=== Immagini affiancate con didascalie individuali

`````typ
#grid(
  columns: (1fr, 1fr),
  gutter: 1.5em,
  figure(
    image("prima.png"),
    caption: [Prima condizione sperimentale.],
  ) <fig-prima>,
  figure(
    image("seconda.png"),
    caption: [Seconda condizione sperimentale.],
  ) <fig-seconda>,
)

I risultati in @fig-prima e @fig-seconda mostrano...
`````

=== Rotazione e trasformazione

`````typ
// Ruota l'immagine
#rotate(90deg, image("schema.png", width: 6cm))

// Scala (specchio orizzontale)
#scale(x: -100%, image("logo.png", width: 3cm))

// Scala con percentuale
#scale(80%, image("foto.jpg", width: 10cm))
`````

=== Immagine come sfondo di pagina

`````typ
#set page(
  background: place(
    center + horizon,
    image("sfondo.png", width: 100%, height: 100%, fit: "cover"),
  ),
)
`````

== Consigli pratici
#consiglio[
 Per i documenti scientifici e accademici, *usa sempre `#figure()`*
 invece di `#image()` direttamente. Questo ti permette di:
 - Avere numerazione automatica delle figure
 - Fare riferimento con `@nome-figura` nel testo
 - Generare l'indice delle figure con `#outline(target: figure)`
]
#consiglio[
 Usa immagini *SVG* quando possibile per loghi, schemi e grafici:
 restano nitidi a qualsiasi dimensione nel PDF. Per fotografie
 usa JPEG o PNG (obbligatorio se vuoi il background invisibile).
]
#nota[
 Nell'editor online di typst.app puoi caricare le immagini
 direttamente trascinandole sull'editor o usando il pulsante
 di upload. I file caricati sono accessibili dal tuo progetto. La gestione ordinata del progetto per cartelle è importante anche per questo.
]

// ────────────────────────────────────────────────────────────────
// CAPITOLO 8 — TABELLE
// ────────────────────────────────────────────────────────────────
= Tabelle
Le tabelle in Typst sono potenti e flessibili. La funzione
principale è `#table()`.
== La prima tabella
```typ
#table(
 columns: 3, // numero di colonne
 [Nome], [Età], [Città],
 [Mario], [25], [Roma],
 [Lucia], [30], [Milano],
 [Carlo], [22], [Napoli],
)
```
Ogni elemento tra `[...]` è una cella. Le celle vengono riempite
riga per riga, da sinistra a destra.
#esempio-box(
 ```
#table(
 columns: 3,
 [Nome], [Età], [Città],
 [Mario], [25], [Roma],
 [Lucia], [30], [Milano],
 [Carlo], [22], [Napoli],
)
```,
 risultato: [
 #table(
 columns: 3,
 stroke: 0.6pt + luma(210),
 [Nome], [Età], [Città],
 [Mario], [25], [Roma],
 [Lucia], [30], [Milano],
 [Carlo], [22], [Napoli],
 )
 ],
 titolo: "Tabella base",
)
== Definire le colonne
Il parametro `columns` accetta:
- Un numero intero (colonne di larghezza uguale)
- Una lista di misure specifiche
```typ
// 3 colonne uguali
columns: 3
// Larghezze specifiche
columns: (3cm, 2cm, 4cm)
// Proporzioni: 1fr = "il resto dello spazio"
columns: (1fr, 2fr, 1fr)
// Prima e terza colonna uguali, seconda larga il doppio
// Mix di fisso e proporzionale
columns: (auto, 1fr, 2cm)
// Prima colonna: si adatta al contenuto
// Seconda: prende lo spazio rimanente
// Terza: fissa 2cm
```
== Intestazioni della tabella
Per creare intestazioni stilizzate, usa `table.header()`:
#esempio-box(
 ```
#table(
 columns: (1fr, auto, auto),
 stroke: 0.6pt + luma(180),
 fill: (col, row) => if row == 0 { rgb("#1a3a5c") }
 else if calc.odd(row) { white }
 else { rgb("#f4f6f7") },
 table.header(
 [*Prodotto*], [*Prezzo*], [*Disponibile*],
 ),
 [Laptop], [999 €], [Sì],
 [Mouse], [25 €], [Sì],
 [Monitor],[350 €], [No],
 [Tastiera],[45 €], [Sì],
)
```,
 risultato: [
 #table(
 columns: (1fr, auto, auto),
 stroke: 0.6pt + luma(180),
 fill: (col, row) => if row == 0 { rgb("#1a3a5c") }
 else if calc.odd(row) { white }
 else { rgb("#f4f6f7") },
 table.header(
 table.cell[#text(fill: white, weight: "bold")[Prodotto]],
 table.cell[#text(fill: white, weight: "bold")[Prezzo]],
 table.cell[#text(fill: white, weight: "bold")[Disponibile]],
 ),
 [Laptop], [999 €], [Sì],
 [Mouse], [25 €], [Sì],
 [Monitor], [350 €], [No],
 [Tastiera], [45 €], [Sì],
 )
 ],
 titolo: "Tabella con intestazione colorata",
)
== Allineamento del contenuto
```typ
#table(
 columns: 3,
 align: (left, center, right),
 [Testo a sinistra], [Testo centrato], [Testo a destra],
 [Mario], [25], [Roma],
)
```
Oppure un allineamento globale:
```typ
#table(
 columns: 3,
 align: center, // Tutte le celle centrate
 ...
)
```
Allineamento verticale:
```typ
align: (left + top, center + horizon, right + bottom)
```
== Colori alternati (zebra stripes)
Il parametro `fill` accetta una funzione che riceve riga e
colonna e restituisce un colore:
```typ
#table(
 columns: 3,
 fill: (col, row) => if calc.odd(row) { luma(240) } else { white },
 [A], [B], [C],
 [1], [2], [3],
 [4], [5], [6],
)
```
== Bordi (stroke)
```typ
// Bordo uniforme
stroke: 0.5pt + black
// Nessun bordo
stroke: none
// Bordo solo orizzontale
stroke: (top: 0.5pt + black, bottom: 0.5pt + black)
// Bordo personalizzato per cella
// (nella funzione fill puoi tornare stroke)
```
== Celle che si estendono su più colonne/righe
```typ
#table(
 columns: 3,
 // Questa cella occupa 2 colonne
 table.cell(colspan: 2)[Colonne 1 e 2 unite],
 [Colonna 3],
 [Normale], [Normale], [Normale],
 // Questa cella occupa 2 righe
 table.cell(rowspan: 2)[2 righe],
 [Riga 1], [Riga 1],
 [Riga 2], [Riga 2],
)
```
== Tabelle come figure
Per avere numerazione automatica e poter fare riferimento a una
tabella, wrappala in `#figure()`:
```typ
#figure(
 table(
 columns: 3,
 [A], [B], [C],
 [1], [2], [3],
 ),
 caption: [Dati sperimentali.],
) <tab-dati>
Come mostrato in @tab-dati...
```
#nota[
 `#figure(table(...), ...)` identifica automaticamente il
 contenuto come tabella (non come immagine), quindi nell'indice
 delle tabelle verrà elencato separatamente dalle figure.
]

// ────────────────────────────────────────────────────────────────
// CAPITOLO 9 — MATEMATICA
// ────────────────────────────────────────────────────────────────
= Matematica
Uno dei punti di forza di Typst è la sua sintassi matematica:
più pulita di LaTeX, facile da imparare, e con risultati
tipograficamente eccellenti.
== Modalità matematica
Come avvevamo accennato in precedenza, ci sono (essenzialmente) due modi per scrivere matematica in Typst:
=== Matematica inline
La matematica *inline* appare nel corpo del testo, circondata
da `$...$` (dollaro singolo, senza spazi):
#esempio-box(
 ```
La formula di Eulero è $e^(i pi) + 1 = 0$,
considerata la più bella della matematica.
Il teorema di Pitagora: $a^2 + b^2 = c^2$.
```,
 risultato: [
 La formula di Eulero è $e^(i pi) + 1 = 0$,
 considerata la più bella della matematica.
 Il teorema di Pitagora: $a^2 + b^2 = c^2$.
 ],
 titolo: "Matematica inline",
)
=== Matematica a blocco (display)
La matematica *a blocco* appare su una riga propria, centrata
e con simboli più grandi. Si ottiene con `$...$` su una riga
separata, oppure aggiungendo uno spazio dopo il `$` iniziale:
#esempio-box(
 ```
L'equazione di Einstein:
$ E = m c^2 $
Oppure l'identità di Eulero in grande:
$ e^(i pi) + 1 = 0 $
```,
 risultato: [
 L'equazione di Einstein:
 $ E = m c^2 $
 Oppure l'identità di Eulero in grande:
 $ e^(i pi) + 1 = 0 $
 ],
 titolo: "Matematica a blocco",
)
#nota[
 La differenza tra inline e display è lo spazio dopo `$`:
 - `$formula$` = inline (nel flusso del testo)
 - `$ formula $` = display (su riga propria, centrata)
]
#consiglio[
  È sempre prefiribile, per la chiarezza del testo, quando si introduce una nuova equazione/funzione matematica, utilizzare il display (blocco). Rimane tutto molto più ordinato. Il mio consiglio è: utilizzate sempre il display, occupa più spazio ma è più leggibile. L'inline funziona bene se avere poca matematica o state solamente facendo riferimento ad altro (che era in un display).
]
== Operatori di base
#table(
 columns: (auto, auto, auto),
 stroke: 0.6pt + luma(210),
 fill: (col, row) => if row == 0 { C.blu }
 else if calc.odd(row) { white }
 else { C.sfondo },
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Operazione],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Sintassi Typst],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Risultato],
 [Addizione], [`a + b`], [$a + b$],
 [Sottrazione], [`a - b`], [$a - b$],
 [Moltiplicazione], [`a dot b`], [$a dot b$],
 [Prodotto vettoriale], [`a times b`], [$a times b$],
 [Divisione], [`a / b`], [$a / b$],
 [Uguale], [`a = b`], [$a = b$],
 [Diverso], [`a != b`], [$a != b$],
 [Minore], [`a < b`], [$a < b$],
 [Maggiore], [`a > b`], [$a > b$],
 [Minore uguale], [`a <= b`], [$a <= b$],
 [Maggiore uguale], [`a >= b`], [$a >= b$],
 [Approssimato], [`a approx b`], [$a approx b$],
 [Proporzionale], [`a prop b`], [$a prop b$],
)
== Potenze e pedici
```typ
// Potenza semplice
$x^2$ // x²
$x^(n+1)$ // x elevato a (n+1) — serve la parentesi!
// Pedice semplice
$x_i$ // xᵢ
$x_(i,j)$ // con pedice composto
// Insieme
$x_i^2$ // xᵢ²
$x_(i+1)^(2n)$ // con espressioni composte
```
#esempio-box(
 ```
$x^2 + y^2 = r^2$ è la circonferenza.
$a_n = a_(n-1) + a_(n-2)$ è Fibonacci.
La serie $sum_(n=0)^(+infinity) x^n = 1/(1-x)$
converge per $|x| < 1$.
```,
 risultato: [
 $x^2 + y^2 = r^2$ è la circonferenza.
 $a_n = a_(n-1) + a_(n-2)$ è Fibonacci.
 La serie $sum_(n=0)^(+infinity) x^n = 1/(1-x)$
 converge per $|x| < 1$.
 ],
 titolo: "Potenze e pedici",
)
== Frazioni
```typ
$a/b$ // Frazione a/b (forma compatta in inline)
$frac(a, b)$ // Frazione esplicita (sempre con sbarra)
$(a+b)/(c+d)$ // Frazione con espressioni
```
#esempio-box(
 ```
La derivata: $frac(d f, d x) = lim_(h->0) frac(f(x+h)-f(x), h)$
L'integrale: $ integral_a^b f(x) d x = F(b) - F(a) $
```,
 risultato: [
 La derivata: $frac(d f, d x) = lim_(h->0) frac(f(x+h)-f(x), h)$
 L'integrale: $ integral_a^b f(x) d x = F(b) - F(a) $
 ],
 titolo: "Frazioni e integrali",
)
== Radici
```typ
$sqrt(x)$ // Radice quadrata
$sqrt(x + y)$ // Radice di un'espressione
$root(3, x)$ // Radice cubica
$root(n, x^n)$ // Radice n-esima
```
#esempio-box(
 ```
La soluzione è $x = frac(-b plus.minus sqrt(b^2 - 4a c), 2a)$.
```,
 risultato: [
 La soluzione è $x = frac(-b plus.minus sqrt(b^2 - 4a c), 2a)$.
 ],
 titolo: "Formula quadratica",
)
== Simboli speciali comuni
=== Lettere greche
#table(
 columns: (auto, auto, auto, auto, auto, auto),
 stroke: 0.6pt + luma(210),
 fill: (col, row) => if row == 0 { C.blu }
 else if calc.odd(row) { white }
 else { C.sfondo },
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Simbolo],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Codice],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Simbolo],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Codice],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Simbolo],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Codice],
 [$alpha$], [`alpha`], [$beta$], [`beta`], [$gamma$], [`gamma`],
 [$delta$], [`delta`], [$epsilon$],[`epsilon`],[$zeta$], [`zeta`],
 [$eta$], [`eta`], [$theta$], [`theta`], [$lambda$],[`lambda`],
 [$mu$], [`mu`], [$nu$], [`nu`], [$xi$], [`xi`],
 [$pi$], [`pi`], [$rho$], [`rho`], [$sigma$], [`sigma`],
 [$tau$], [`tau`], [$phi$], [`phi`], [$psi$], [`psi`],
 [$omega$], [`omega`], [$Delta$], [`Delta`], [$Sigma$], [`Sigma`],
 [$Omega$], [`Omega`], [$Lambda$],[`Lambda`], [$Pi$], [`Pi`],
)
=== Altri simboli frequenti
#table(
 columns: (auto, auto, auto, auto),
 stroke: 0.6pt + luma(210),
 fill: (col, row) => if row == 0 { C.blu }
 else if calc.odd(row) { white }
 else { C.sfondo },
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Simbolo],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Codice],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Simbolo],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Codice],
 [$infinity$], [`infinity`], [$partial$], [`partial`],
 [$nabla$], [`nabla`], [$forall$], [`forall`],
 [$exists$], [`exists`], [$in$], [`in`],
 [$subset$], [`subset`], [$union$], [`union`],
 [$inter$], [`inter`], [$arrow.r$], [`arrow.r`],
 [$arrow.l.r$], [`arrow.l.r`], [$arrow.r.double$],[`arrow.r.double`],
 [$plus.minus$], [`plus.minus`], [$minus.plus$], [`minus.plus`],
)
== Sommatorie, produttorie, limiti
```typ
// Sommatoria
$sum_(i=0)^n a_i$
// Produttoria
$product_(k=1)^n k = n!$
// Limite
$lim_(x -> 0) frac(sin x, x) = 1$
// In modalità display (più grande)
$ sum_(i=0)^n i^2 = frac(n(n+1)(2n+1), 6) $
```
#esempio-box(
 ```
$ sum_(i=1)^n i = frac(n(n+1), 2) $
$ lim_(n->infinity) (1 + 1/n)^n = e $
```,
 risultato: [
 $ sum_(i=1)^n i = frac(n(n+1), 2) $
 $ lim_(n->infinity) (1 + 1/n)^n = e $
 ],
 titolo: "Sommatoria e limite",
)
== Vettori e matrici
```typ
// Vettore colonna
$vec(a, b, c)$
// Matrice
$mat(a, b; c, d)$ // Il punto e virgola separa le righe
// Matrice con bordi
$mat(delim: "[", a, b; c, d)$
$mat(delim: "|", a, b; c, d)$ // Determinante
```
#esempio-box(
 ```
La matrice di rotazione è:
$ R(theta) = mat(cos theta, -sin theta; sin theta, cos theta) $
Un sistema lineare:
$ mat(a, b; c, d) dot vec(x, y) = vec(e, f) $
```,
 risultato: [
 La matrice di rotazione è:
 $ R(theta) = mat(cos theta, -sin theta; sin theta, cos theta) $
 Un sistema lineare:
 $ mat(a, b; c, d) dot vec(x, y) = vec(e, f) $
 ],
 titolo: "Matrici e vettori",
)
== Testo all'interno delle formule
Per inserire testo normale dentro una formula usa le virgolette:
```typ
$f(x) = x^2 quad "per" x > 0$
```
#esempio-box(
 ```
$f(x) = cases(x^2 &"se" x >= 0, -x^2 &"se" x < 0)$
```,
 risultato: [
 $f(x) = cases(x^2 &"se" x >= 0, -x^2 &"se" x < 0)$
 ],
 titolo: "Funzione a tratti",
)
== Formule numerate
Per le formule numerate in un documento scientifico:
```typ
#set math.equation(numbering: "(1)")
$ E = m c^2 $ <eq-einstein>
Come dimostrato in @eq-einstein...
```
== Spazi in matematica
In modalità matematica gli spazi normali vengono ignorati.
Per aggiungere spaziatura usa:
```typ
$a quad b$ // spazio grande
$a wide b$ // spazio molto grande
$a thin b$ // spazio sottile
$a med b$ // spazio medio
$a space b$ // spazio normale
```
// ────────────────────────────────────────────────────────────────
// CAPITOLO 10 — BLOCCHI DI CODICE
// ────────────────────────────────────────────────────────────────
= Blocchi di codice
Typst gestisce ottimamente la visualizzazione di codice sorgente
con evidenziazione della sintassi (*syntax highlighting*) per
decine di linguaggi.
== Codice inline
Usa un backtick singolo per codice inline nel testo:
```typ
Usa la funzione `print()` per visualizzare output.
La variabile `x` ha valore `42`.
```
== Blocco di codice
Usa tre backtick per un blocco di codice, con il nome del
linguaggio dopo i backtick iniziali:
````
```python
def fattoriale(n):
 if n <= 1:
 return 1
 return n * fattoriale(n - 1)
print(fattoriale(5)) # Output: 120
```
````
#esempio-box(
 "```python\ndef saluta(nome):\n return f\"Ciao, {nome}!
\"\n\nprint(saluta(\"Typst\"))\n```",
 titolo: "Codice Python con highlighting",
)
== Linguaggi supportati
Typst supporta l'evidenziazione per moltissimi linguaggi:
#table(
 columns: (auto, auto, auto, auto),
 stroke: 0.6pt + luma(210),
 fill: (col, row) => if row == 0 { C.blu }
 else if calc.odd(row) { white }
 else { C.sfondo },
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Linguaggio],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Identificatore],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Linguaggio],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Identificatore],
 [Python], [`python`], [JavaScript], [`javascript` o `js`],
 [Java], [`java`], [C/C++], [`c`, `cpp`],
 [Rust], [`rust`], [Go], [`go`],
 [HTML], [`html`], [CSS], [`css`],
 [SQL], [`sql`], [Bash], [`bash`, `sh`],
 [LaTeX], [`latex`], [Typst], [`typ`],
 [JSON], [`json`], [YAML], [`yaml`],
 [Markdown], [`markdown`], [R], [`r`],
 [MATLAB], [`matlab`], [Julia], [`julia`],
)
== Numeri di riga
Con il pacchetto `codly` (che vedremo nel Capitolo 25) puoi
aggiungere numeri di riga e molte altre opzioni. Per ora,
la visualizzazione base di Typst non include numeri di riga.
== Stile personalizzato del codice
Puoi personalizzare l'aspetto di tutto il codice usando `#set raw`:
```typ
// Cambia il font del codice
#set raw(theme: "halcyon") // tema scuro
// Oppure via show rule (come fatto in questo manuale)
#show raw.where(block: true): it => {
 block(
 fill: luma(245),
 inset: 1em,
 radius: 5pt,
 )[#it]
}
```
== Numero di riga e evidenziazione manuale
Puoi simulare i numeri di riga con un layout a griglia:
```typ
#let codice-con-numeri(src) = {
  let lines = src.split("\n")
  let celle = ()
  for (i, line) in lines.enumerate() {
    celle.push(text(fill: luma(150), str(i+1)))
    celle.push(raw(line))
  }
  grid(columns: (auto, 1fr), gutter: 0.5em, ..celle)
}
```
// ================================================================
// PARTE III — IL LINGUAGGIO TYPST
// ================================================================
// ────────────────────────────────────────────────────────────────
// CAPITOLO 11 — INTRODUZIONE AL CODICE: IL SIMBOLO #
// ────────────────────────────────────────────────────────────────
= Introduzione al codice: il simbolo #text(fill:blue)[`\#`]

Fino a qui hai usato Typst come un linguaggio di markup: scrivi
testo, aggiungi `*grassetto*`, `= Titoli`, e via dicendo.
Ma Typst ha un secondo volto: è anche un linguaggio di
*programmazione*. In questo capitolo iniziamo a esplorarlo.
== Due modalità: Markup e Codice
In Typst esistono due modalità di funzionamento:
#table(
 columns: (auto, 1fr, 1fr),
 stroke: 0.6pt + luma(210),
 fill: (col, row) => if row == 0 { C.blu }
 else if calc.odd(row) { white }
 else { C.sfondo },
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 ],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Modalità Markup],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Modalità Codice],
 [*Come si entra*], [È la default], [Con il simbolo `#`],
 [*Cosa scrivi*], [Testo normale con marcature], [Istruzioni di programmazione],
 [*Esempi*], [`*grassetto*`, `= Titolo`], [`#let x = 5`, `#if cond [...]`],
 [*Scopo*], [Contenuto del documento], [Logica, variabili, funzioni],
)
Il simbolo `#` è il *cancelletto* (hash). Quando lo scrivi nel
testo, stai dicendo a Typst: "quello che segue non è testo, è
un'istruzione di codice".
== Il simbolo `#` in azione
Ecco come funziona il passaggio tra le due modalità:
```typ
Questo è testo normale.
#let nome = "Fabiana" // Definisco una variabile
Ciao, #nome! Come stai? Sei molto bella! // Uso la variabile nel testo
Calcolo: #(2 + 3) fa cinque. // Calcolo inline
#if true [Questa frase appare.] // Condizione inline
```
Ogni riga che inizia con `#` (o che ha `#` nel mezzo del testo)
contiene codice Typst.
== Espressioni inline con `#`
Puoi inserire il risultato di qualsiasi espressione nel testo
usando `#(espressione)` o `#variabile`:
#esempio-box(
 ```
Il risultato di 7 × 6 è #(7 * 6).\
L'anno corrente è #datetime.today().year().\
Il testo in maiuscolo: #("ciao mondo".split(" ").map(s =>
 upper(s)).join(" ")).
```,
 risultato: [
 Il risultato di 7 × 6 è #(7 * 6).\
 #datetime.today().year().\
 Il testo in maiuscolo: #("ciao mondo".split(" ").map(s =>
 upper(s)).join(" ")).
 ],
 titolo: "Espressioni inline",
)
== Blocchi di codice con `{}`
Le parentesi graffe `{ }` contengono un *blocco di codice*:
più istruzioni eseguite in sequenza. Il risultato è il valore
dell'ultima espressione.
```typ
#{
 let a = 10
 let b = 20
 a + b // Restituisce 30
}
```
Nell'output del documento appare il valore restituito:
#esempio-box(
 ```
Il massimo tra 7 e 3 è #{
 let a = 7
 let b = 3
 if a > b { a } else { b }
}.
```,
 risultato: [
 Il massimo tra 7 e 3 è #{
 let a = 7
 let b = 3
 if a > b { a } else { b }
 }.
 ],
 titolo: "Blocco di codice",
)
== Blocchi di contenuto con `[ ]`
Le parentesi quadre `[ ]` contengono un *blocco di contenuto*:
testo e markup che viene trattato come contenuto del documento.
Puoi pensarle come "mini-documenti":
```typ
// Contenuto come argomento di una funzione
#block(fill: yellow)[
 Questo testo è dentro un blocco giallo.
 Posso usare *grassetto* e _corsivo_ normalmente.
]
// Contenuto assegnato a una variabile
#let messaggio = [Ciao, *mondo*!]
#messaggio // Stampa il contenuto
```
#esempio-box(
 ```
#let avviso = [
 *Attenzione:* questo è un avviso importante. 
]
#block(fill: rgb("#fff3cd"), inset: 0.8em,
 radius: 5pt)[#avviso]
```,
 risultato: [
 #let avviso = [
 *Attenzione:* questo è un avviso importante. 
 ]
 #block(fill: rgb("#fff3cd"), inset: 0.8em, radius: 5pt)[#avviso]
 ],
 titolo: "Blocchi di contenuto",
)
== La differenza fondamentale: `{}` vs `[]`
Questa distinzione è *cruciale* in Typst e vale la pena
ribadirla con una tabella:
#table(
 columns: (auto, 1fr, 1fr),
 stroke: 0.6pt + luma(210),
 fill: (col, row) => if row == 0 { C.blu }
 else if calc.odd(row) { white }
 else { C.sfondo },
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 ],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Graffe #text(fill: blue)[`{ }`]],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Quadre #text(fill: blue)[`[ ]`]],
 [*Contengono*], [Codice (istruzioni)], [Contenuto (testo/markup)],
 [*Dentro si usa*], [Sintassi di programmazione], [Sintassi di markup],
 [*`*bold*` funziona?*], [No], [Sì],
 [*`#let x = 5` funziona?*], [Sì], [Con il `#`],
 [*Restituiscono*], [Valore dell'ultima espressione], [Blocco di contenuto],
)

== Il principio di base: `#` per tutto il codice
Ogni volta che vuoi fare qualcosa di "programmativo" nel mezzo
del markup, usi `#`:
```typ
// Chiamare una funzione:
#upper("ciao") // "CIAO"
// Definire una variabile:
#let pi = 3.14159
// Usare una variabile:
Pi greco vale circa #pi.
// Condizione:
#if 2 > 1 [Vero!] else [Falso!]
// Ciclo:
#for i in (1, 2, 3) [Numero #i. ]
// Funzione integrata:
#text(fill: red)[Testo rosso]
// Impostazione:
#set text(size: 14pt)
```
#nota[
 Se sei nel mezzo di un blocco di codice (`#{ ... }`), non
 hai bisogno del `#` davanti a ogni cosa, sei già in
 modalità codice. Il `#` serve solo quando sei in modalità
 markup e vuoi "uscire" momentaneamente in codice.
]
== Il contesto di esecuzione
Typst esegue il codice nell'ordine in cui appare nel documento.
Le variabili definite con `#let` rimangono disponibili per
tutto il documento (o per lo scope in cui sono definite):
#esempio-box(
 ```
#let titolo = "Il Mio Libro: Frammenti brevi cronotropi"
#let autore = "Stefano Coelati Rama"
#let anno = 2026
= #titolo
Scritto da *#autore* nel #anno.
```,
 risultato: [
 #let titolo-es = "Il Mio Libro: Frammenti brevi cronotropi"
 #let autore-es = "Stefano Coelati Rama"
 #let anno-es = 2026
 #text(size: 14pt, weight: "bold")[#titolo-es]
 Scritto da *#autore-es* nel #anno-es.
 ],
 titolo: "Variabili nel documento",
)

// ────────────────────────────────────────────────────────────────
// CAPITOLO 12 — TIPI DI DATO
// ────────────────────────────────────────────────────────────────
= Tipi di dato
Come in programmazione normale, anche in Typst ogni valore ha un *tipo*, una categoria che determina
cosa puoi farci. Conoscere i tipi è fondamentale per capire
perché certi codici funzionano e altri no.
== Panoramica dei tipi
Typst ha questi tipi principali:
#table(
 columns: (auto, auto, 1fr),
 stroke: 0.6pt + luma(210),
 fill: (col, row) => if row == 0 { C.blu }
 else if calc.odd(row) { white }
 else { C.sfondo },
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Tipo],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Esempio],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Descrizione],
 [`string`], [`"ciao"`], [Testo tra virgolette],
 [`int`], [`42`, `-7`], [Numero intero],
 [`float`], [`3.14`, `-0.5`], [Numero decimale],
 [`bool`], [`true`, `false`], [Vero o falso],
 [`length`], [`2cm`, `12pt`], [Misura di lunghezza],
 [`ratio`], [`50%`], [Percentuale],
 [`color`], [`rgb("#ff0000")`], [Colore],
 [`array`], [`(1, 2, 3)`], [Lista ordinata di valori],
 [`dict`], [`(a: 1, b: 2)`], [Dizionario chiave-valore],
 [`content`], [`[*Ciao*]`], [Contenuto del documento],
 [`none`], [`none`], [Assenza di valore],
 [`auto`], [`auto`], [Valore automatico],
 [`function`],[`x => x + 1`], [Una funzione],
)
== Stringhe
Una stringa è una sequenza di caratteri racchiusa tra *doppie
virgolette* `"..."`:
```typ
#let nome = "Mario"
#let saluto = "Ciao, mondo!"
#let vuota = "" // Stringa vuota
// Non esiste la singola virgoletta in Typst per le stringhe:
// 'sbagliato' ← ERRORE!
// "corretto" ← OK
```
=== Operazioni sulle stringhe
```typ
// Concatenazione
#let nome-completo = "Mario" + " " + "Rossi"
// Lunghezza
#"ciao".len() // 4
// Maiuscolo/minuscolo
#upper("ciao") // "CIAO"
#lower("CIAO") // "ciao"
// Contenuto
#"ciao mondo".contains("mondo") // true
// Sostituzione
#"ciao mondo".replace("mondo", "Typst") // "ciao Typst"
// Dividi
#"a,b,c".split(",") // ("a", "b", "c")
// Elimina spazi
#" ciao ".trim() // "ciao"
```
=== Interpolazione di stringhe
Per inserire valori dentro una stringa, è più comodo usare
la concatenazione o direttamente il markup:
```typ
#let nome = "Mario"
// Nel markup:
Ciao, #nome!
// Nella stringa (con concatenazione):
#let msg = "Ciao, " + nome + "!"
```
== Numeri interi (int)
Un intero è un numero senza parte decimale:
```typ
#let n = 42
#let negativo = -7
#let zero = 0
// Operazioni:
#(10 + 3) // 13
#(10 - 3) // 7
#(10 * 3) // 30
#(10 / 3) // 3.333... (diventa float!)
#(10 // 3) // 3 (divisione intera)
#(10 mod 3) // 1 (resto della divisione)
#calc.pow(2, 8) // 256 (potenza)
#calc.abs(-5) // 5 (valore assoluto)
```
== Numeri decimali (float)
I float hanno la virgola (o il punto, dipende dalla notazione):
```typ
#let pi = 3.14159
#let gravita = -9.81
// Costante predefinita:
#calc.pi // 3.141592...
#calc.e // 2.718281...
// Funzioni matematiche:
#calc.sqrt(16.0) // 4.0
#calc.sin(calc.pi / 6) // 0.5
#calc.cos(0.0) // 1.0
#calc.log(100.0) // 2.0 (log base 10)
#calc.ln(calc.e) // 1.0 (log naturale)
#calc.floor(3.7) // 3 (arrotonda giù)
#calc.ceil(3.2) // 4 (arrotonda su)
#calc.round(3.5) // 4 (arrotonda)
```
== Booleani (bool)
Un booleano è semplicemente `true` o `false`:
```typ
#let sono-loggedin = true
#let ha-errori = false
// Operazioni logiche:
#(true and false) // false
#(true or false) // true
#(not true) // false
// Confronti (restituiscono bool):
#(5 > 3) // true
#(5 == 5) // true (DOPPIO uguale per confronto!)
#(5 != 3) // true
#("a" == "a") // true
```
#attenzione[
 In Typst (come nella maggior parte dei linguaggi), per
 *confrontare* due valori si usa il *doppio uguale* `==`,
 mentre per *assegnare* un valore a una variabile si usa
 il singolo uguale `=`. Confondere i due è un errore comune!
 ```
 // Assegnazione (in let), fai si che dentro la variabile x ci sia 5:
 #let x = 5
 // Confronto (nelle condizioni), è x uguale a 5? (restituisce il boleano si/no):
 #if x == 5 [Sì!]
 ```
]
== Lunghezze e misure
Le lunghezze sono fondamentali per il layout. Typst supporta
varie unità:
#table(
 columns: (auto, auto, 1fr),
 stroke: 0.6pt + luma(210),
 fill: (col, row) => if row == 0 { C.blu }
 else if calc.odd(row) { white }
 else { C.sfondo },
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Unità],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Esempio],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Descrizione],
 [`pt`], [`12pt`], [Punto tipografico (1/72 pollice)],
 [`cm`], [`2.5cm`], [Centimetro],
 [`mm`], [`10mm`], [Millimetro],
 [`in`], [`1in`], [Pollice (25.4mm)],
 [`em`], [`1.5em`], [Relativa alla dimensione del font corrente],
 [`%`], [`80%`], [Percentuale del contenitore],
 [`fr`], [`1fr`], [Frazione dello spazio disponibile (solo in grid)],
)
```typ
// Operazioni su lunghezze:
#(2cm + 5mm) // 2.5cm
#(1in - 1cm) // ~1.546cm
#(2 * 1.5cm) // 3cm
```
== Colori
I colori si specificano in vari modi:
```typ
// RGB con valori 0-255
#rgb(255, 0, 0) // Rosso puro
#rgb(0, 128, 255) // Blu
// RGB con stringa esadecimale
#rgb("#ff0000") // Rosso
#rgb("#2471a3") // Blu medio
// Scala di grigi
#luma(0) // Nero
#luma(128) // Grigio medio
#luma(255) // Bianco
// CMYK (per stampa)
#cmyk(0%, 100%, 100%, 0%) // Rosso CMYK
// Colori predefiniti
color.red
color.blue
color.green
color.black
color.white
color.gray
color.yellow
color.orange
color.purple
// Modificare un colore
#color.red.darken(30%) // Rosso più scuro
#color.blue.lighten(50%) // Blu più chiaro
#color.green.transparentize(70%) // Verde trasparente
```
== Array (liste)
Un array è una sequenza ordinata di valori:
```typ
// Creare un array
#let numeri = (1, 2, 3, 4, 5)
#let nomi = ("Mario", "Lucia", "Carlo")
#let misto = (1, "due", true, 3.14)
// Accedere agli elementi (gli indici partono da 0!)
#numeri.at(0) // 1 (primo elemento)
#numeri.at(4) // 5 (quinto elemento)
#numeri.first() // 1
#numeri.last() // 5
// Lunghezza
#numeri.len() // 5
// Aggiungere elementi
#let numeri = (1,2,3,4,5)
#let nuovi = numeri + (6,)   // (1,2,3,4,5,6)
//metodo push
#numeri.push(6) // Aggiunge 6 in fondo: ora numeri = (1,2,3,4,5,6). push() modifica la variabile sul posto. (Attenzione: gli array hanno semantica per copia, quindi passandoli a una funzione l'originale non viene toccato.)
// Slice (sottoarray)
#numeri.slice(1, 3) // (2, 3) — dal secondo al terzo
// Mappare (trasformare ogni elemento)
#numeri.map(n => n * 2) // (2, 4, 6, 8, 10)
// Filtrare
#numeri.filter(n => n > 2) // (3, 4, 5)
// Somma/concatenazione
#(1, 2) + (3, 4) // (1, 2, 3, 4)
// Contiene?
#numeri.contains(3) // true
// Invertire
#numeri.rev() // (5, 4, 3, 2, 1)
// Ordinare
#(3, 1, 4, 1, 5).sorted() // (1, 1, 3, 4, 5)
```
#nota[
 In Typst, come in tutti i linguaggi di programmazione seri (vero R?), gli indici degli array *partono da 0*: il primo
 elemento è `.at(0)`, il secondo `.at(1)`, ecc. Questo è
 standard in quasi tutti i linguaggi di programmazione moderni.
]
== Dizionari (dict)
Un dizionario associa *chiavi* (nomi) a *valori*:
```typ
// Creare un dizionario
#let persona = (
 nome: "Mario",
 età: 25,
 città: "Roma",
)
// Accedere ai valori
#persona.nome // "Mario"
#persona.at("età") // 25 (sintassi alternativa)
// Le chiavi sono stringhe (senza virgolette per comodità)
// Aggiungere o modificare 
#let persona = (nome: "Mario", età: 25, città: "Roma")
#let nuova_persona = (..persona, email: "mario@esempio.it")
//metodo insert: aggiunge (o aggiorna) una chiave modificando la variabile sul posto
#persona.insert("email", "mario@esempio.it") // ora persona contiene anche email
// Le chiavi
#persona.keys() // ("nome", "età", "città")
// I valori
#persona.values() // ("Mario", 25, "Roma")
// Contiene una chiave?
#persona.keys().contains("nome") // true
```
== Content
Il tipo `content` è il tipo nativo di Typst per il contenuto
del documento. Ogni testo, immagine, tabella... è content:
```typ
// Creare content con le quadre:
#let testo = [Ciao, *mondo*!]
// Content è diverso da stringa:
#let s = "Ciao" // string
#let c = [Ciao] // content (potrebbe avere markup)
// Usare content come argomento
#block(fill: yellow)[#testo]
```
== none e auto
```typ
// none: assenza di valore
#let valore = none
#if valore == none [Non c'è niente]
// auto: valore calcolato automaticamente da Typst
#set page(header: auto) // Typst decide da solo
```
== Scoprire il tipo di un valore
La funzione `type()` ti dice che tipo è un valore:
#esempio-box(
 ```
Il tipo di 42 è: #type(42)
Il tipo di "ciao" è: #type("ciao")
Il tipo di 3.14 è: #type(3.14)
Il tipo di true è: #type(true)
Il tipo di 2cm è: #type(2cm)
Il tipo di (1,2,3) è: #type((1,2,3))
```,
 risultato: [
 Il tipo di 42 è: #type(42)
 Il tipo di "ciao" è: #type("ciao")
 Il tipo di 3.14 è: #type(3.14)
 Il tipo di true è: #type(true)
 Il tipo di 2cm è: #type(2cm)
 Il tipo di (1,2,3) è: #type((1,2,3))
 ],
 titolo: "La funzione type()",
)
== Conversioni tra tipi
```typ
#int(3.7) // 3 (tronca, non arrotonda)
#float(5) // 5.0
#str(42) // "42"
#str(3.14) // "3.14"
#int("42") // 42
```
// ────────────────────────────────────────────────────────────────
// CAPITOLO 13 — VARIABILI
// ────────────────────────────────────────────────────────────────
= Variabili
Una variabile è un *nome* a cui associ un *valore*. Una volta
definita, puoi usare quel nome invece di riscrivere il valore
ogni volta.
== Definire una variabile con `#let`
La parola chiave per definire variabili è `let`:
```typ
#let x = 5
#let nome = "Mario"
#let attivo = true
#let colore-principale = rgb("#1a3a5c")
```
== Usare una variabile
Una volta definita, usi la variabile scrivendo `#nome-variabile`:
#esempio-box(
 ```
#let autore = "Giulia Bianchi"
#let anno = 2026
#let titolo = "La Mia Tesi"
= #titolo
Autore: *#autore* --- Anno: #anno
```,
 risultato: [
 #let autore-v = "Giulia Bianchi"
 #let anno-v = 2026
 #let titolo-v = "La Mia Tesi"
 #text(size: 16pt, weight: "bold")[#titolo-v]
 Autore: *#autore-v* --- Anno: #anno-v
 ],
 titolo: "Uso delle variabili",
)
== Perché usare le variabili?
Le variabili sono utili per:
+ *Evitare ripetizioni*: se il nome dell'autore compare in 10
 posti, basta cambiarlo una volta nella definizione.
+ *Rendere il codice leggibile*: `colore-accento` è più chiaro
 di `rgb("#1a3a5c")` ripetuto ovunque.
+ *Riusare contenuto*: puoi definire un blocco di testo e
 inserirlo più volte.
#esempio-box(
 ```
#let colore-titolo = rgb("#1a3a5c")
#let colore-testo = luma(50)
#let spaziatura = 1.5em
#set text(fill: colore-testo)
#set par(leading: spaziatura)
#text(fill: colore-titolo, size: 16pt, weight: "bold")[
 Il mio titolo ben configurato
]
Un paragrafo con la spaziatura impostata sopra.
```,
 titolo: "Variabili per la configurazione",
)
== Scope delle variabili
Le variabili sono disponibili nel punto in cui sono definite
e in tutto ciò che viene dopo:
```typ
#let a = 10
// 'a' è disponibile qui
#{
 let b = 20 // 'b' esiste solo dentro queste graffe
 a + b // OK: a è definita fuori
}
// 'b' NON è disponibile qui (fuori dallo scope)
```
#nota[
 Una variabile definita fuori da qualsiasi blocco `{}` o `[]`
 è disponibile per tutto il documento. Una definita dentro
 un blocco `{}` esiste solo dentro quel blocco.
]
== Variabili che contengono contenuto
Una delle cose più potenti: le variabili possono contenere
blocchi di contenuto (markup) da riutilizzare:
#esempio-box(
 ```
#let avviso-sicurezza = [
 *Attenzione:* Prima di procedere, assicurati 
 di aver salvato il lavoro.
]
== Passaggio 1
#avviso-sicurezza
Qui descrivo il primo passaggio...
== Passaggio 2
#avviso-sicurezza
Qui descrivo il secondo passaggio...
```,
 risultato: [
 #let avviso-sicurezza = [
 *Attenzione:* Prima di procedere, assicurati 
 di aver salvato il lavoro.
 ]
 #text(size: 12pt, weight: "bold")[Passaggio 1]
 #avviso-sicurezza
 Qui descrivo il primo passaggio...
 #v(0.5em)
 #text(size: 12pt, weight: "bold")[Passaggio 2]
 #avviso-sicurezza
 Qui descrivo il secondo passaggio...
 ],
 titolo: "Variabile contenuto riusabile",
)
== Costanti vs variabili
In Typst non esiste una distinzione formale tra "costante" e
"variabile". Per convenzione, i valori che non cambiano si
definiscono all'inizio del documento e si usano con nomi
descrittivi.
== Operazioni e calcoli
Le variabili numeriche supportano tutte le operazioni aritmetiche:
#esempio-box(
 ```
#let larghezza = 10cm
#let altezza = 7cm
#let area = larghezza * altezza / (1cm * 1cm)
Larghezza: #larghezza
Altezza: #altezza
Area: #area cm²
```,
 risultato: [
 #let larghezza-v = 10
 #let altezza-v = 7
 #let area-v = larghezza-v * altezza-v
 Larghezza: 10cm
 Altezza: 7cm
 Area: #area-v cm²
 ],
 titolo: "Calcoli con variabili",
)
// ────────────────────────────────────────────────────────────────
// CAPITOLO 14 — CONDIZIONI
// ────────────────────────────────────────────────────────────────
= Condizioni: if, else if, else
Le condizioni ti permettono di mostrare o eseguire cose
*solo quando una certa condizione è vera*. Sono uno strumento
fondamentale nella programmazione.
== La struttura if di base
```typ
#if condizione {
 // Codice eseguito se condizione è true
}
```
O con contenuto:
```typ
#if condizione [
 Contenuto mostrato se la condizione è vera.
]
```
#esempio-box(
 ```
#let temperatura = 35
#if temperatura > 30 [
 Fa molto caldo oggi!
]
#if temperatura < 0 [
 Attenzione: temperatura sotto zero!
]
```,
 risultato: [
 #let temperatura-v = 35
 #if temperatura-v > 30 [
 Fa molto caldo oggi!
 ]
 #if temperatura-v < 0 [
 Attenzione: temperatura sotto zero!
 ]
 ],
 titolo: "if di base",
)
== if ... else
Per gestire il caso in cui la condizione è falsa:
```typ
#if condizione [
 Mostrato se vero.
] else [
 Mostrato se falso.
]
```
#esempio-box(
 ```
#let punteggio = 72
#if punteggio >= 60 [
 *Promosso!* Punteggio: #punteggio/100.
] else [
 *Bocciato.* Punteggio: #punteggio/100.
]
```,
 risultato: [
 #let punteggio-v = 72
 #if punteggio-v >= 60 [
 *Promosso!* Punteggio: #punteggio-v/100.
 ] else [
 *Bocciato.* Punteggio: #punteggio-v/100.
 ]
 ],
 titolo: "if ... else",
)
== if ... else if ... else
Per più casi:
#esempio-box(
 ```
#let voto = 7
#if voto >= 9 [
 Eccellente!
] else if voto >= 7 [
 Buono.
] else if voto >= 6 [
 Sufficiente.
] else [
 Insufficiente.
]
```,
 risultato: [
 #let voto-v = 7
 #if voto-v >= 9 [
 Eccellente!
 ] else if voto-v >= 7 [
 Buono.
 ] else if voto-v >= 6 [
 Sufficiente.
 ] else [
 Insufficiente.
 ]
 ],
 titolo: "Condizioni multiple",
)
== Operatori di confronto
#table(
 columns: (auto, auto, auto),
 stroke: 0.6pt + luma(210),
 fill: (col, row) => if row == 0 { C.blu }
 else if calc.odd(row) { white }
 else { C.sfondo },
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Operatore],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Significato],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Esempio],
 [`==`], [Uguale], [`x == 5`],
 [`!=`], [Diverso], [`x != 5`],
 [`<`], [Minore], [`x < 10`],
 [`>`], [Maggiore], [`x > 0`],
 [`<=`], [Minore o uguale], [`x <= 100`],
 [`>=`], [Maggiore o uguale],[`x >= 18`],
)
== Operatori logici
Puoi combinare più condizioni:
#table(
 columns: (auto, auto, auto),
 stroke: 0.6pt + luma(210),
 fill: (col, row) => if row == 0 { C.blu }
 else if calc.odd(row) { white }
 else { C.sfondo },
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Operatore],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Significato],
 table.cell(fill: C.blu)[#set text(fill: white, weight: "bold")
 Esempio],
 [`and`], [Entrambe vere], [`x > 0 and x < 10`],
 [`or`], [Almeno una vera], [`x < 0 or x > 100`],
 [`not`], [Negazione], [`not (x == 0)`],
)
#esempio-box(
 ```
#let età = 25
#let ha-patente = true
#if età >= 18 and ha-patente [
 Può guidare.
] else if età >= 18 and not ha-patente [
 È maggiorenne ma non ha la patente.
] else [
 È minorenne.
]
```,
 risultato: [
 #let età-v = 25
 #let ha-patente-v = true
 #if età-v >= 18 and ha-patente-v [
 Può guidare.
 ] else if età-v >= 18 and not ha-patente-v [
 È maggiorenne ma non ha la patente.
 ] else [
 È minorenne.
 ]
 ],
 titolo: "Condizioni combinate",
)
== L'if come espressione
In Typst, `if` restituisce un valore! Questo significa che puoi
usarlo dove normalmente metteresti un valore:
#esempio-box(
 ```
#let dark-mode = true
#let sfondo = if dark-mode { rgb("#1a1a2e") } else { white }
#let colore-testo = if dark-mode { white } else { black }
#block(fill: sfondo, inset: 1em, radius: 5pt)[
 #text(fill: colore-testo)[
 Questa è una casella in modalità #if dark-mode [scura]
 else [chiara].
 ]
]
```,
 risultato: [
 #let dark-mode-v = true
 #let sfondo-v = if dark-mode-v { rgb("#1a1a2e") } else { white }
 #let colore-testo-v = if dark-mode-v { white } else { black }
 #block(fill: sfondo-v, inset: 1em, radius: 5pt)[
 #text(fill: colore-testo-v)[
 Questa è una casella in modalità #if dark-mode-v [scura]
 else [chiara].
 ]
 ]
 ],
 titolo: "if come espressione",
)

// ────────────────────────────────────────────────────────────────
// CAPITOLO 15 — CICLI
// ────────────────────────────────────────────────────────────────
= Cicli: for e while
I cicli ti permettono di *ripetere* un'operazione più volte.
Sono fondamentali per generare contenuto in modo automatico.
== Il ciclo for
=== Iterare su un array
La forma più comune: esegui qualcosa *per ogni elemento*
di una collezione:
#esempio-box(
 ```
#let frutta = ("Mele", "Pere", "Banane", "Arance")
#for frutto in frutta [
 - #frutto
]
```,
 risultato: [
 #for frutto in ("Mele", "Pere", "Banane", "Arance") [
 - #frutto
 ]
 ],
 titolo: "for su un array",
)
=== Iterare con range
`range(n)` genera i numeri da 0 a n-1:
#esempio-box(
 ```
#for i in range(5) [
 Il numero #i al quadrato è #(i * i).
]
```,
 risultato: [
 #for i in range(5) [
 Il numero #i al quadrato è #(i * i). \
 ]
 ],
 titolo: "for con range",
)
`range(start, end)` genera da `start` a `end - 1`:
#esempio-box(
 ```
#for n in range(1, 11) [
 #n × 7 = #(n * 7) \
]
```,
 risultato: [
 #for n in range(1, 11) [
 #n × 7 = #(n * 7) \
 ]
 ],
 titolo: "Tavola del 7",
)
=== range con step
```typ
// range(inizio, fine, step: passo)
#for n in range(0, 20, step: 5) [#n, ]
// 0, 5, 10, 15,
```
=== Generare una tabella con for
Ecco un esempio pratico: generare una tabella di moltiplicazione:
#esempio-box(
 ```
#let n-max = 5
#table(
 columns: n-max + 1,
 fill: (col, row) => if col == 0 or row == 0 { C.blu }
 else if calc.odd(col + row) { white }
 else { rgb("#f4f6f7") },
 // Prima riga: intestazione
 table.cell(fill: C.blu)[],
 ..range(1, n-max + 1).map(n =>
 table.cell()[#text(fill: white, weight: "bold")[#n]]
 ),
 // Righe dati
 ..range(1, n-max + 1).map(i =>
 (
 table.cell()[#text(fill: white, weight: "bold")[#i]],
 ..range(1, n-max + 1).map(j => [#(i * j)]),
 )
 ).flatten(),
)
```,
 titolo: "Tabella con ciclo for",
)
=== Iterare con indice
Per avere sia l'indice che il valore, usa `.enumerate()`:
#esempio-box(
 ```
#let colori = ("Rosso", "Verde", "Blu")
#for (i, colore) in colori.enumerate() [
 #(i + 1). #colore
]
```,
 risultato: [
 #for (i, colore) in ("Rosso", "Verde", "Blu").enumerate() [
 #(i + 1). #colore \
 ]
 ],
 titolo: "enumerate()",
)
=== Il for restituisce un array
Il ciclo `for` raccoglie i risultati in un array. Se non vuoi
che restituisca nulla (es. stai solo usando effetti collaterali),
puoi ignorarlo:
```typ
// Il for restituisce un array di risultati:
#let quadrati = for i in range(1, 6) { i * i }
// quadrati = (1, 4, 9, 16, 25)
// Per convertire in contenuto, usa map + join:
#range(1, 6).map(i => str(i * i)).join(", ")
// Risultato: 1, 4, 9, 16, 25
```
== Il ciclo while
Il `while` continua finché la condizione è vera:
```typ
#let i = 0
#while i < 5 {
 i += 1
 str(i) + " "
}
// Risultato: 1 2 3 4 5
```
#attenzione[
 Con il ciclo `while`, fai *molta* attenzione a non creare
 un ciclo infinito (una condizione che rimane sempre vera).
 Typst potrebbe bloccarsi. Assicurati sempre che la condizione
 prima o poi diventi `false`.
]
#esempio-box(
 ```
#let n = 1
#while n <= 1000 {
 [#n ]
 n *= 2
}
```,
 risultato: [
 #let n-w = 1
 #while n-w <= 1000 {
 [#n-w ]
 n-w *= 2
 }
 ],
 titolo: "Potenze di 2 con while",
)
== break e continue
Dentro un ciclo puoi:
- `break`: uscire dal ciclo immediatamente
- `continue`: saltare all'iterazione successiva
```typ
// Stampa i numeri da 1 a 10, ma salta il 5 e si ferma all'8
#for i in range(1, 11) {
 if i == 5 { continue } // Salta il 5
 if i == 9 { break } // Si ferma prima del 9
 [#i ]
}
// Risultato: 1 2 3 4 6 7 8
```
== Generare contenuto complesso con cicli
Esempio pratico: generare una serie di schede informative:
#esempio-box(
 ```
#let lingue = (
 (nome: "Python", anno: 1991, uso: "Dati e AI"),
 (nome: "Rust", anno: 2015, uso: "Sistemi"),
 (nome: "Typst", anno: 2023, uso: "Documenti"),
)
#for l in lingue {
 block(
 fill: rgb("#eaf4fb"),
 inset: 0.8em,
 radius: 5pt,
 stroke: (left: 3pt + rgb("#2471a3")),
 below: 0.7em,
 )[
 *#l.nome* (#l.anno) — #l.uso
 ]
}
```,
 risultato: [
 #let lingue-v = (
 (nome: "Python", anno: 1991, uso: "Dati e AI"),
 (nome: "Rust", anno: 2015, uso: "Sistemi"),
 (nome: "Typst", anno: 2023, uso: "Documenti"),
 )
 #for l in lingue-v {
 block(
 fill: rgb("#eaf4fb"),
 inset: 0.8em,
 radius: 5pt,
 stroke: (left: 3pt + rgb("#2471a3")),
 below: 0.7em,
 )[
 *#l.nome* (#l.anno) — #l.uso
 ]
 }
 ],
 titolo: "Schede generate con ciclo",
)

// ────────────────────────────────────────────────────────────────
// CAPITOLO 16 — FUNZIONI
// ────────────────────────────────────────────────────────────────
= Funzioni
Una funzione è un blocco di codice a cui dai un nome e che puoi
*richiamare* ogni volta che ne hai bisogno, passandogli diversi
input per ottenere diversi output.
Pensa a una funzione come a una ricetta: le fornisci gli
ingredienti (parametri) e lei ti restituisce il piatto
(risultato).
== Funzioni predefinite di Typst
Typst ha centinaia di funzioni già pronte. Ne hai già usate molte:
```typ
#text(size: 14pt, fill: red)[Ciao] // Funzione 'text'
#image("foto.png", width: 80%) // Funzione 'image'
#table(columns: 3, ...) // Funzione 'table'
#upper("ciao") // "CIAO"
#lower("CIAO") // "ciao"
#calc.sqrt(16) // 4.0
```
== Definire le proprie funzioni
Usa `let` per definire una funzione personalizzata:
```typ
#let nome-funzione(param1, param2) = corpo
```
=== Funzione semplice
#esempio-box(
 ```
// Funzione che saluta
#let saluta(nome) = "Ciao, " + nome + "!"
#saluta("Mario")
#saluta("Lucia")
```,
 risultato: [
 #let saluta-f(nome) = "Ciao, " + nome + "!"
 #saluta-f("Mario") \
 #saluta-f("Lucia")
 ],
 titolo: "Prima funzione",
)
=== Funzione con corpo complesso
Per funzioni con più istruzioni, usa le graffe:
#esempio-box(
 ```
#let classifica-voto(v) = {
 if v >= 9 { "Eccellente" }
 else if v >= 7 { "Buono" }
 else if v >= 6 { "Sufficiente" }
 else { "Insufficiente" }
}
- Voto 10: #classifica-voto(10)
- Voto 7.5: #classifica-voto(7.5)
- Voto 5: #classifica-voto(5)
```,
 risultato: [
 #let classifica-voto-f(v) = {
 if v >= 9 { "Eccellente" }
 else if v >= 7 { "Buono" }
 else if v >= 6 { "Sufficiente" }
 else { "Insufficiente" }
 }
 - Voto 10: #classifica-voto-f(10)
 - Voto 7.5: #classifica-voto-f(7.5)
 - Voto 5: #classifica-voto-f(5)
 ],
 titolo: "Funzione con logica",
)
== Parametri con nome e valori predefiniti
Puoi dare un valore predefinito ai parametri. Questo li rende
*opzionali*, se non li passi, usa il default:
#esempio-box(
 ```
#let badge(testo, colore: rgb("#2471a3"), testo-colore: white) = {
 box(
 fill: colore,
 inset: (x: 0.7em, y: 0.3em),
 radius: 4pt,
 )[
 #set text(fill: testo-colore, size: 9pt, weight: "bold")
 #testo
 ]
}
#badge("NUOVO")
#badge("URGENTE", colore: rgb("#c0392b"))
#badge("OK", colore: rgb("#27ae60"))
#badge("Bozza", colore: luma(180), testo-colore: luma(50))
```,
 risultato: [
 #let badge-f(testo, colore: rgb("#2471a3"), testo-colore: white) = {
 box(
 fill: colore,
 inset: (x: 0.7em, y: 0.3em),
 radius: 4pt,
 )[
 #set text(fill: testo-colore, size: 9pt, weight: "bold")
 #testo
 ]
 }
 #badge-f("NUOVO")
 #h(0.3em)
 #badge-f("URGENTE", colore: rgb("#c0392b"))
 #h(0.3em)
 #badge-f("OK", colore: rgb("#27ae60"))
 #h(0.3em)
 #badge-f("Bozza", colore: luma(180), testo-colore: luma(50))
 ],
 titolo: "Parametri con default",
)
Quando chiami la funzione:
- `#badge("NUOVO")` → usa i colori di default
- `#badge("URGENTE", colore: red)` → colore esplicito, il resto di default
- L'ordine dei *parametri con nome* non importa

== Funzioni che accettano contenuto
Il modo più idiomatico in Typst per passare contenuto
a una funzione è usare le parentesi quadre `[...]` direttamente
dopo la chiamata:
#esempio-box(
 ```
#let riquadro-colorato(colore, corpo) = block(
 fill: colore.lighten(70%),
 stroke: (left: 4pt + colore),
 inset: (x: 1em, y: 0.8em),
 radius: 4pt,
 width: 100%,
)[#corpo]
#riquadro-colorato(blue)[
 Questo è un riquadro blu con _corsivo_ e *grassetto*.
]
#riquadro-colorato(red)[
 Questo è un riquadro rosso.
]
```,
 risultato: [
 #let riqu-f(colore, corpo) = block(
 fill: colore.lighten(70%),
 stroke: (left: 4pt + colore),
 inset: (x: 1em, y: 0.8em),
 radius: 4pt,
 width: 100%,
 )[#corpo]
 #riqu-f(blue)[
 Questo è un riquadro blu con _corsivo_ e *grassetto*.
 ]
 #riqu-f(red)[
 Questo è un riquadro rosso.
 ]
 ],
 titolo: "Funzione che accetta contenuto",
)
Ed ecco spiegato come ho fatto questi box particolari, con le funzioni definite!
=== La sintassi speciale con parametro body
Per funzioni dove il contenuto è l'argomento principale, Typst
permette una sintassi abbreviata. Il *parametro finale* che
si chiama `body` (o qualsiasi altro nome che usi come ultimo
parametro posizionale) può essere passato con le `[...]` fuori
dalle parentesi:
```typ
#let evidenzia(colore: yellow, body) = highlight(
 fill: colore,
 body,
)
// Uso normale:
#evidenzia(body: [Testo evidenziato])
// Sintassi abbreviata (il body tra []):
#evidenzia[Testo evidenziato]
#evidenzia(colore: orange)[Testo arancione]
```
#esempio-box(
 ```
#let enfasi(corpo) = text(
 fill: rgb("#1a5276"),
 style: "italic",
 weight: "bold",
)[#corpo]
Nel testo puoi #enfasi[enfatizzare] certe parole
in modo #enfasi[coerente] su tutto il documento.
```,
 risultato: [
 #let enfasi-f(corpo) = text(
 fill: rgb("#1a5276"),
 style: "italic",
 weight: "bold",
 )[#corpo]
 Nel testo puoi #enfasi-f[enfatizzare] certe parole
 in modo #enfasi-f[coerente] su tutto il documento.
 ],
 titolo: "Funzione per enfasi nel testo",
)
== Funzioni che restituiscono valori
Le funzioni possono restituire qualsiasi tipo: numeri, stringhe,
contenuto, array, dizionari...
#esempio-box(
 ```
// Funzione che crea una palette di colori
#let palette(colore-base) = (
 chiaro: colore-base.lighten(60%),
 normale: colore-base,
 scuro: colore-base.darken(30%),
)
#let blu = palette(rgb("#2471a3"))
#block(fill: blu.chiaro, inset: 0.5em)[Chiaro]
#block(fill: blu.normale, inset: 0.5em)[
 #text(fill: gray)[Normale]
]
#block(fill: blu.scuro, inset: 0.5em)[
 #text(fill: white)[Scuro]
]
```,
 risultato: [
 #let palette-f(colore-base) = (
 chiaro: colore-base.lighten(60%),
 normale: colore-base,
 scuro: colore-base.darken(30%),
 )
 #let blu-v = palette-f(rgb("#2471a3"))
 #block(fill: blu-v.chiaro, inset: (x: 0.8em, y: 0.4em), radius: 3pt)[Chiaro]
 #block(fill: blu-v.normale, inset: (x: 0.8em, y: 0.4em), radius: 3pt)
[#text(fill: gray)[Normale]]
 #block(fill: blu-v.scuro, inset: (x: 0.8em, y: 0.4em), radius: 3pt)[#text(fill:
white)[Scuro]]
 ],
 titolo: "Funzione che restituisce un dizionario",
)
== Funzioni freccia (arrow functions / closures)
Typst supporta le funzioni "anonime" — funzioni senza nome,
definite al volo. Si usano molto con `map`, `filter`, ecc.:
```typ
// Funzione anonima: parametro => espressione
#let doppio = n => n * 2
#doppio(5) // 10
// Usata inline con map:
#(1, 2, 3, 4, 5).map(n => n * n)
// (1, 4, 9, 16, 25)
// Con più parametri: usa graffe
#let somma = (a, b) => a + b
#somma(3, 4) // 7
```
== Ricorsione
Una funzione può chiamare se stessa (ricorsione). Utile per
strutture annidate:
#esempio-box(
 ```
#let fattoriale(n) = {
 if n <= 1 { 1 }
 else { n * fattoriale(n - 1) }
}
- 5! = #fattoriale(5)
- 10! = #fattoriale(10)
```,
 risultato: [
 #let fattoriale-f(n) = {
 if n <= 1 { 1 }
 else { n * fattoriale-f(n - 1) }
 }
 - 5! = #fattoriale-f(5)
 - 10! = #fattoriale-f(10)
 ],
 titolo: "Funzione ricorsiva",
)
== Esempio completo: template di carta
Creare un template riusabile per lettere o schede:
#esempio-box(
 ```
#let carta(titolo: "Titolo", colore: C.blu, corpo) = block(
 width: 100%,
 radius: 8pt,
 stroke: 1pt + luma(210),
 clip: true,
 below: 1em,
)[
 #block(
 fill: colore,
 width: 100%,
 inset: (x: 1em, y: 0.6em),
 )[
 #text(fill: white, weight: "bold")[#titolo]
 ]
 #block(
 fill: white,
 width: 100%,
 inset: (x: 1em, y: 0.9em),
 )[#corpo]
]
#carta(titolo: " Nota Importante")[
 Ricordati di salvare il file prima di chiudere.
]
#carta(titolo: " Completato", colore: rgb("#1e8449"))[ 
 Il documento è stato consegnato con successo.
]
```,
 risultato: [
 #let carta-f(titolo: "Titolo", colore: C.blu, corpo) = block(
 width: 100%,
 radius: 8pt,
 stroke: 1pt + luma(210),
 clip: true,
 below: 1em,
 )[
 #block(fill: colore, width: 100%, inset: (x: 1em, y: 0.6em))[
 #text(fill: white, weight: "bold")[#titolo]
 ]
 #block(fill: white, width: 100%, inset: (x: 1em, y: 0.9em))[#corpo]
 ]
 #carta-f(titolo: " Nota Importante")[ 
 Ricordati di salvare il file prima di chiudere.
 ]
 #carta-f(titolo: " Completato", colore: rgb("#1e8449"))[ 
 Il documento è stato consegnato con successo.
 ]
 ],
 titolo: "Template carta riusabile",
)

// ================================================================
// PARTE IV — STILIZZAZIONE
// ================================================================
// ────────────────────────────────────────────────────────────────
// CAPITOLO 17 — LE REGOLE SET
// ────────────────────────────────────────────────────────────────
= Le regole set
Le regole `set` sono uno dei meccanismi più potenti e eleganti
di Typst. Ti permettono di modificare i *parametri predefiniti*
di qualsiasi elemento, una volta per tutte.
== Cos'è una regola set?
Immagina di volere che tutto il testo del tuo documento sia
di dimensione 12pt con font "Georgia". Potresti scrivere
`#text(size: 12pt, font: "Georgia")[...]` attorno a ogni
singolo paragrafo, giusto? Si, per pederede del tempo...sarebbe una follia, usiamo typst per ottimizzare!
Con `set`, dici una sola volta:
```typ
#set text(size: 12pt, font: "Georgia")
```
E da quel punto in poi, *tutto* il testo usa quelle impostazioni.
#definizione("Regola set", [
 Una regola `set` modifica i parametri di default di una
 funzione (o elemento) per tutto ciò che viene dopo.
 Sintassi: `#set funzione(parametro: valore)`.
])
== set text — il testo
```typ
#set text(
 font: "Linux Libertine", // Nome del font
 size: 11pt, // Dimensione
 fill: luma(30), // Colore (quasi nero)
 weight: "regular", // "bold", "light", "regular", ...
 style: "normal", // "italic", "oblique"
 tracking: 0pt, // Spaziatura tra le lettere
 spacing: 100%, // Spaziatura tra le parole
 lang: "it", // Lingua (per trattini, ecc.)
 hyphenate: true, // Sillabazione automatica
)
```
#esempio-box(
 ```
#set text(font: "Roboto", size: 13pt, fill: rgb("#2c3e50"))
Questo testo usa Roboto a 13pt in blu scuro.
Tutti i paragrafi che seguono useranno questo stile.
```,
 risultato: [
 #block[
 #set text(font: "Roboto", size: 13pt, fill: rgb("#2c3e50"))
 Questo testo usa Roboto a 13pt in blu scuro.
 Tutti i paragrafi che seguono useranno questo stile.
 ]
 ],
 titolo: "set text",
)
== set par — i paragrafi
```typ
#set par(
 justify: true, // Giustificazione (allineamento sx e dx)
 leading: 0.75em, // Interlinea (spazio tra le righe)
 spacing: 1.2em, // Spazio tra i paragrafi
 first-line-indent: 1.5em, // Rientro prima riga
 hanging-indent: 0pt, // Rientro sospeso
)
```
#esempio-box(
 ```
#set par(justify: true, leading: 1.2em, first-line-indent: 1.5em)
Questo è il primo paragrafo con giustificazione attivata
e interlinea aumentata. Noti come il testo si distribuisce
uniformemente su tutta la larghezza della colonna.
Questo è il secondo paragrafo. La prima riga ha un rientro
come in un libro tradizionale. L'interlinea più ampia rende
il testo più leggibile.
```,
 risultato: [
 #block[
 #set par(justify: true, leading: 1.2em,
 first-line-indent: 1em, spacing: 0.8em)
 #set text(size: 9.5pt)
 Questo è il primo paragrafo con giustificazione attivata
 e interlinea aumentata. Noti come il testo si distribuisce
 uniformemente su tutta la larghezza della colonna.
 Questo è il secondo paragrafo. La prima riga ha un rientro
 come in un libro tradizionale. L'interlinea più ampia rende
 il testo più leggibile.
 ]
 ],
 titolo: "set par",
)
== set heading — i titoli
```typ
#set heading(
 numbering: "1.1.", // Schema di numerazione
 outlined: true, // Appare nell'indice?
)
```
== set page — la pagina
```typ
#set page(
 paper: "a4", // Formato carta
 margin: ( // Margini
 top: 2.5cm,
 bottom: 2.5cm,
 left: 3cm,
 right: 2.5cm,
 ),
 numbering: "1", // Formato numero pagina
 number-align: center, // Posizione numero: center, right, left
 columns: 1, // Numero di colonne
 fill: white, // Colore sfondo pagina
 flipped: false, // Orientamento (true = landscape)
)
```
Formati carta disponibili:
#table(
 columns: (auto, auto, auto, auto),
 stroke: 0.6pt + luma(210),
 fill: (col, row) => if row == 0 { C.blu }
 else if calc.odd(row) { white }
 else { C.sfondo },
 table.cell(fill: C.blu)[#set text(fill:white,weight:"bold"); Formato],
 table.cell(fill: C.blu)[#set text(fill:white,weight:"bold"); Codice],
 table.cell(fill: C.blu)[#set text(fill:white,weight:"bold"); Formato],
 table.cell(fill: C.blu)[#set text(fill:white,weight:"bold"); Codice],
 [A0], [`"a0"`], [A5], [`"a5"`],
 [A1], [`"a1"`], [A6], [`"a6"`],
 [A2], [`"a2"`], [US Letter], [`"us-letter"`],
 [A3], [`"a3"`], [US Legal], [`"us-legal"`],
 [A4], [`"a4"`], [Presentazione], [`"presentation-16-9"`],
)
== set list e set enum
```typ
// Lista puntata
#set list(
 marker: "→", // Marcatore personalizzato
 indent: 1.5em, // Rientro
 spacing: 0.6em, // Spazio tra le voci
)
// Lista numerata
#set enum(
 numbering: "1.", // Schema numerazione
 indent: 1.5em,
 spacing: 0.6em,
)
```
== set table — le tabelle
```typ
#set table(
 stroke: 0.5pt + luma(200), // Bordo di default
 inset: 0.5em, // Padding celle
 align: left, // Allineamento
 fill: (col, row) => // Funzione colore
 if calc.odd(row) { luma(245) } else { white },
)
```
== set figure — le figure
```typ
#set figure(
 supplement: "Figura", // Testo prima del numero
 gap: 0.8em, // Spazio tra contenuto e didascalia
 numbering: "1", // Schema numerazione
 placement: none, // Posizionamento
)
```
== set math.equation — le equazioni
```typ
#set math.equation(
 numbering: "(1)", // Le equazioni vengono numerate
 supplement: "Eq.", // Testo nel riferimento
)
```
== Lo scope delle regole set
Le regole `set` hanno uno *scope*: si applicano da dove sono
definite in poi, oppure solo dentro il blocco `{}` o `[]`
in cui si trovano.
#esempio-box(
 ```
Testo normale in 11pt.
#{
 set text(size: 14pt, fill: red)
 [Questo testo è grande e rosso.]
 [Anche questo!]
}
Di nuovo testo normale in 11pt.
```,
 risultato: [
 Testo normale.
 #{
 set text(size: 14pt, fill: red)
 [Questo testo è grande e rosso.]
 [ Anche questo!]
 }
 Di nuovo testo normale.
 ],
 titolo: "Scope delle regole set",
)
== set in funzioni
Puoi usare `set` dentro una funzione per applicare stile
solo al contenuto di quella funzione:
#esempio-box(
 ```
#let capitolo-importante(corpo) = {
 set text(size: 12pt)
 set par(leading: 1em)
 block(
 fill: rgb("#fef9e7"),
 inset: 1.2em,
 radius: 6pt,
 stroke: 0.5pt + luma(210),
 )[#corpo]
}
#capitolo-importante[
 Questo contenuto ha stile personalizzato interno.
 Il testo è leggermente più grande e con più interlinea.
]
Questo testo è tornato normale.
```,
 risultato: [
 #let cap-imp-f(corpo) = {
 set text(size: 10.5pt)
 set par(leading: 0.95em)
 block(
 fill: rgb("#fef9e7"),
 inset: 1em,
 radius: 6pt,
 stroke: 0.5pt + luma(210),
 )[#corpo]
 }
 #cap-imp-f[
 Questo contenuto ha stile personalizzato.
 Il testo ha più interlinea e sfondo giallino.
 ]
 Questo testo è tornato normale.
 ],
 titolo: "set dentro una funzione",
)
// ────────────────────────────────────────────────────────────────
// CAPITOLO 18 — LE REGOLE SHOW
// ────────────────────────────────────────────────────────────────
= Le regole show
Le regole `show` sono più potenti delle `set`: non cambiano solo
i *parametri* di un elemento, ma ne *trasformano completamente
l'aspetto*, intercettando l'elemento prima che venga reso nel PDF.
#definizione("Regola show", [
 Una regola `show` intercetta un elemento (o tutti gli elementi
 di un certo tipo) e lo trasforma in qualcosa di diverso.
 Sintassi: `#show selettore: trasformazione`.
])
== La differenza tra set e show
```typ
// set: modifica i parametri → cambia proprietà
#set text(size: 14pt) // Il testo diventa più grande
// show: trasforma l'elemento → può cambiare struttura
#show strong: it => text(fill: red, it.body) // Il grassetto diventa rosso
```
== Trasformare il grassetto
#esempio-box(
 ```
// Rendi il grassetto di colore blu
#show strong: it => text(fill: rgb("#1a3a5c"), it.body)
Questo è testo normale.
Questo è *testo in grassetto*, ora appare blu.
*Anche questa frase* è in grassetto blu.
```,
 risultato: [
 #block[
 #show strong: it => text(fill: rgb("#1a3a5c"), it.body)
 Questo è testo normale.
 Questo è *testo in grassetto*, ora appare blu.
 *Anche questa frase* è in grassetto blu.
 ]
 ],
 titolo: "show strong",
)
== Trasformare i link
#esempio-box(
 ```
#show link: it => {
 set text(fill: rgb("#2471a3"))
 underline(stroke: (paint: rgb("#2471a3"), dash: "dashed"), it)
}
Visita #link("https://typst.app")[Typst] o
#link("https://github.com/typst/typst")[GitHub].
```,
 risultato: [
 #block[
 #show link: it => {
 set text(fill: rgb("#2471a3"))
 underline(stroke: (paint: rgb("#2471a3"), dash: "dashed"), it)
 }
 Visita #link("https://typst.app")[Typst] o
 #link("https://github.com/typst/typst")[GitHub].
 ]
 ],
 titolo: "show link",
)
== Trasformare il codice inline
#esempio-box(
 ```
#show raw.where(block: false): it => box(
 fill: rgb("#fff3e0"),
 inset: (x: 4pt, y: 2pt),
 radius: 3pt,
 stroke: 0.5pt + rgb("#ff8f00"),
)[
 #set text(fill: rgb("#e65100"), font: "Courier New")
 #it
]
Usa #raw("npm install") per installare i pacchetti.
La variabile #raw("n") è dichiarata con #raw("let n = 0").
```,
 risultato: [
 #block[
 #show raw.where(block: false): it => box(
 fill: rgb("#fff3e0"),
 inset: (x: 4pt, y: 2pt),
 radius: 3pt,
 stroke: 0.5pt + rgb("#ff8f00"),
 )[#set text(fill: rgb("#e65100"), font: ("Roboto"), size:
9.5pt); #it]
 Usa `npm install` per installare i pacchetti.
 La variabile `n` è dichiarata con `let n = 0`.
 ]
 ],
 titolo: "show raw (codice inline)",
)
== Selettori: .where()
Puoi applicare la regola `show` solo a un sottoinsieme di elementi
usando `.where()`:
```typ
// Solo i titoli di livello 1
#show heading.where(level: 1): it => ...
// Solo il codice a blocco (non inline)
#show raw.where(block: true): it => ...
// Solo le figure che contengono immagini
#show figure.where(kind: image): it => ...
// Solo le figure che contengono tabelle
#show figure.where(kind: table): it => ...
```
== Trasformare i titoli
#esempio-box(
 ```
#show heading.where(level: 2): it => {
 v(1em)
 block[
 #set text(fill: rgb("#7d3c98"), size: 14pt)
 #it.body 
 #v(-0.2em)
 #line(length: 100%, stroke: 2pt + rgb("#7d3c98"))
 ]
 v(0.4em)
}
== Prima sezione viola
Testo sotto la prima sezione.
== Seconda sezione viola
Testo sotto la seconda sezione.
```,
 risultato: [
 #block[
 #show heading.where(level: 3): it => {
 v(0.5em)
 block[
 #set text(fill: rgb("#7d3c98"), size: 12pt)
 #it.body 
 #v(-0.2em)
 #line(length: 100%, stroke: 2pt + rgb("#7d3c98"))
 ]
 v(0.3em)
 }
 === Prima sezione viola
 Testo sotto la prima sezione.
 === Seconda sezione viola
 Testo sotto la seconda sezione.
 ]
 ],
 titolo: "show heading personalizzato",
)
== Trasformare il documento intero (show globale)
La forma più potente: trasforma il contenuto di tutto il
documento wrappandolo in qualcosa:
```typ
// Metti tutto il documento in una colonna con max-width
#show: body => block(
 width: 80%,
 inset: 2cm,
)[#body]
// Oppure applica impostazioni globali
#show: body => {
 set text(size: 11pt, font: "Linux Libertine")
 set par(justify: true)
 body
}
```
Questa è la base di tutti i *template* Typst.
== Trasformare le figure
#esempio-box(
 ```
#show figure.where(kind: image): it => {
 align(center)[
 #block(
 stroke: 2pt + luma(200),
 radius: 6pt,
 clip: true,
 inset: 0pt,
 )[#it.body]
 #v(0.3em)
 #text(size: 9pt, fill: luma(100), style: "italic")[
 #it.supplement #context it.counter.display(): #it.caption.body
 ]
 ]
}
```,
 titolo: "show figure personalizzato",
)
== show per sostituzione testo
Puoi usare `show` per sostituire automaticamente stringhe
di testo con altro contenuto:
#esempio-box(
 ```
// Ogni volta che scrivi "Typst", aggiunge il logo
#show "Typst": [*Typst*#box(
 baseline: -0.25em,
 height: 0.8em,
)[#text(size: 0.6em, fill: rgb("#239dad"), baseline: 0pt)[™]
]]
Benvenuti nel mondo di Typst.
Typst è un linguaggio potente.
```,
 risultato: [
 #block[
 #show "Typst": name => text(fill: rgb("#1a3a5c"), weight: "bold")[#name]
 Benvenuti nel mondo di Typst.
 Typst è un linguaggio potente.
 Usiamo Typst ogni giorno.
 ]
 ],
 titolo: "show per sostituzione testo",
)

// ────────────────────────────────────────────────────────────────
// CAPITOLO 19 — COLORI E GRAFICA
// ────────────────────────────────────────────────────────────────
= Colori e grafica
== Sistemi di colore
Typst supporta diversi modi per specificare i colori.
=== RGB
Il più comune: tre valori (Rosso, Verde, Blu) da 0 a 255:
```typ
#rgb(255, 0, 0) // Rosso puro
#rgb(0, 0, 255) // Blu puro
#rgb(128, 128, 128) // Grigio medio
// Con stringa esadecimale (come in CSS):
#rgb("#ff0000") // Rosso
#rgb("#1a3a5c") // Blu scuro
#rgb("#27ae60") // Verde
```
=== Scala di grigi
```typ
#luma(0) // Nero
#luma(128) // Grigio 50%
#luma(255) // Bianco
```
=== OKLCH (moderno, perceptually uniform)
```typ
// oklch(luminosità, croma, tonalità)
#oklch(60%, 0.2, 240deg) // Blu medio
#oklch(80%, 0.15, 30deg) // Arancio chiaro
```
=== Colori predefiniti
```typ
black white gray silver
red maroon orange yellow
olive green teal navy
blue aqua purple fuchsia
lime lime ...
```
Usali con il prefisso `color.`:
```typ
color.red color.blue color.green
// Oppure direttamente (senza prefisso nei contesti colore):
red blue green
```
== Manipolare i colori
```typ
// Schiarire
#color.red.lighten(30%) // Rosso più chiaro del 30%
#rgb("#1a3a5c").lighten(50%)
// Scurire
#color.blue.darken(20%)
// Trasparenza (0% = opaco, 100% = invisibile)
#color.green.transparentize(60%)
// Mescolare due colori
#color.mix(red, blue) // Mix 50/50
#color.mix((red, 30%), (blue, 70%)) // Mix pesato
// Invertire
#color.red.negate()
```
#esempio-box(
 ```
#let base = rgb("#2471a3")
#for p in (0%, 20%, 40%, 60%, 80%) {
 block(
 fill: base.lighten(p),
 width: 100%,
 inset: 0.4em,
 radius: 3pt,
 below: 0.3em,
 )[
 #text(fill: if p > 50% { black } else { white })[
 Schiarito del #p
 ]
 ]
}
```,
 risultato: [
 #let base-v = rgb("#2471a3")
 #for p in (0%, 20%, 40%, 60%, 80%) {
 block(
 fill: base-v.lighten(p),
 width: 100%,
 inset: 0.4em,
 radius: 3pt,
 below: 0.3em,
 )[
 #text(fill: if p > 50% { black } else { white },
 size: 9pt)[Schiarito del #p]
 ]
 }
 ],
 titolo: "Sfumatura colori",
)
== Gradienti
I gradienti sono transizioni fluide tra due o più colori.
=== Gradiente lineare
```typ
gradient.linear(colore1, colore2)
gradient.linear(colore1, colore2, angle: 45deg)
gradient.linear(
 (colore1, 0%), // Colore all'inizio
 (colore2, 60%), // Colore al 60%
 (colore3, 100%), // Colore alla fine
 angle: 135deg,
)
```
=== Gradiente radiale
Io ve li faccio vedere, ma non usateli, li odiano tutti.
```typ
gradient.radial(colore-centro, colore-bordo)
gradient.radial(
 white,
 blue,
 center: (30%, 40%), // Centro spostato
 radius: 60%,
)
```
#esempio-box(
 ```
#block(
 width: 100%,
 height: 3cm,
 radius: 8pt,
 fill: gradient.linear(
 rgb("#1a5276"), rgb("#2980b9"), rgb("#aed6f1"),
 angle: 135deg,
 ),
)[
 #align(center + horizon)[
 #text(fill: white, size: 16pt, weight: "bold")[
 Gradiente blu
 ]
 ]
]
```,
 risultato: [
 #block(
 width: 100%,
 height: 2.5cm,
 radius: 8pt,
 fill: gradient.linear(
 rgb("#1a5276"), rgb("#2980b9"), rgb("#aed6f1"),
 angle: 135deg,
 ),
 )[
 #align(center + horizon)[
 #text(fill: white, size: 14pt, weight: "bold")[Gradiente blu]
 ]
 ]
 ],
 titolo: "Blocco con gradiente",
)
== Disegnare forme base
=== Linea
```typ
#line(length: 100%, stroke: 1pt + black) // Orizzontale
#line(start: (0pt, 0pt), end: (2cm, 1cm), stroke: red) // Diagonale
```
=== Rettangolo
```typ
#rect(
 width: 4cm,
 height: 2cm,
 fill: rgb("#eaf4fb"),
 stroke: 1pt + rgb("#2471a3"),
 radius: 5pt,
)
```
=== Cerchio ed ellisse
```typ
#circle(radius: 1cm, fill: red)
#ellipse(width: 4cm, height: 2cm, fill: blue)
```
#esempio-box(
 ```
#grid(
 columns: (1fr, 1fr, 1fr),
 gutter: 1em,
 align: center,
 rect(width: 100%, height: 1.5cm, fill: rgb("#eaf4fb"),
 stroke: 2pt + C.blu2, radius: 8pt),
 circle(radius: 0.75cm, fill: rgb("#eafaf1"),
 stroke: 2pt + C.verde2),
 ellipse(width: 100%, height: 1.5cm,
 fill: rgb("#fef5e7"),
 stroke: 2pt + C.arancio),
)
```,
 risultato: [
 #grid(
 columns: (1fr, 1fr, 1fr),
 gutter: 1em,
 align: center,
 rect(width: 100%, height: 1.5cm, fill: rgb("#eaf4fb"),
 stroke: 2pt + C.blu2, radius: 8pt),
 circle(radius: 0.75cm, fill: rgb("#eafaf1"),
 stroke: 2pt + C.verde2),
 ellipse(width: 100%, height: 1.5cm,
 fill: rgb("#fef5e7"),
 stroke: 2pt + C.arancio),
 )
 ],
 titolo: "Forme geometriche",
)

Ed è così che ho creato la copertina di questo handbook. Il mio consiglio è di sperimentare un po' con gli hex e gli rgb (online ci sono delle palette stupende, prendete quelle).
== Lo stroke
Lo `stroke` definisce il bordo di una forma. Puoi specificarlo
in modo semplice o molto dettagliato:
```typ
// Semplice (spessore + colore)
stroke: 2pt + black
// Dettagliato
stroke: stroke(
 thickness: 2pt,
 paint: rgb("#1a3a5c"),
 cap: "round", // "butt", "round", "square"
 join: "round", // "miter", "round", "bevel"
 dash: "dashed", // "solid", "dashed", "dotted", "dot-dash"
)
// Solo lato sinistro (per i box)
stroke: (left: 4pt + blue)
// Bordi diversi per ogni lato
stroke: (
 top: 2pt + black,
 bottom: 1pt + gray,
 left: none,
 right: none,
)
```
// ================================================================
// PARTE V — LAYOUT AVANZATO
// ================================================================
// ────────────────────────────────────────────────────────────────
// CAPITOLO 20 — BOX E BLOCCHI
// ────────────────────────────────────────────────────────────────
= Box e blocchi
`box` e `block` sono i due contenitori fondamentali in Typst.
Capire la differenza è essenziale per controllare il layout.
== box vs block: la differenza
#table(
 columns: (auto, 1fr, 1fr),
 stroke: 0.6pt + luma(210),
 fill: (col, row) => if row == 0 { C.blu }
 else if calc.odd(row) { white }
 else { C.sfondo },
 table.cell(fill: C.blu)[#set text(fill:white,weight:"bold")],
 table.cell(fill: C.blu)[#set text(fill:white,weight:"bold"); box],
 table.cell(fill: C.blu)[#set text(fill:white,weight:"bold"); block],
 [Tipo], [Inline (nel flusso del testo)], [Block (occupa tutta la
larghezza)],
 [Uso], [Dentro una riga di testo], [Elemento separato],
 [Dimensione], [Si adatta al contenuto], [Larghezza 100% di default],
 [Va a capo?], [No (sta in riga)], [Sì (nuovo rigo)],
)
#esempio-box(
 ```
Testo con #box(fill: yellow, inset: 3pt)[parola evidenziata]
nel mezzo della frase.
#block(fill: rgb("#eaf4fb"), inset: 1em, radius: 5pt)[
 Questo è un blocco separato che occupa
 tutta la larghezza disponibile.
]
Testo che riprende dopo il blocco.
```,
 risultato: [
 Testo con #box(fill: yellow, inset: 3pt)[parola evidenziata]
 nel mezzo della frase.
 #block(fill: rgb("#eaf4fb"), inset: 1em, radius: 5pt)[
 Questo è un blocco separato che occupa
 tutta la larghezza disponibile.
 ]
 Testo che riprende dopo il blocco.
 ],
 titolo: "box vs block",
)
== Parametri di box e block
Entrambi condividono questi parametri principali:
```typ
#block(
 // Dimensioni
 width: 80%, // Larghezza (length, ratio, o auto)
 height: auto, // Altezza

 // Spaziatura interna
 inset: 1em, // Uguale su tutti i lati
 inset: (x: 1em, y: 0.5em), // Orizzontale e verticale
 inset: (top: 0.5em, bottom: 0.5em, left: 1em, right: 1em),

 // Spaziatura esterna (solo block)
 above: 1em, // Spazio sopra
 below: 1em, // Spazio sotto

 // Aspetto
 fill: white, // Colore sfondo
 stroke: 1pt + black, // Bordo
 radius: 5pt, // Angoli arrotondati

 // Comportamento
 clip: false, // Taglia il contenuto che eccede?
 breakable: true, // Si spezza tra le pagine? (solo block)
)
```
=== Angoli arrotondati personalizzati
```typ
#block(
 radius: (top-left: 10pt, top-right: 10pt,
 bottom-left: 0pt, bottom-right: 0pt),
)
```
=== Inset dettagliato
```typ
inset: (top: 0.5em, bottom: 0.5em, left: 1.5em, right: 0.5em)
inset: (x: 1em, y: 0.5em) // Scorciatoia
```
== Impedire le interruzioni di pagina
Se non vuoi che un blocco venga spezzato tra due pagine:
```typ
#block(breakable: false)[
 Questa tabella importante non deve essere spezzata
 a metà tra due pagine.

 #table(...)
]
```
== Posizionamento con place()
`#place()` posiziona un elemento in modo *assoluto* rispetto
al suo contenitore, senza spostare il flusso del testo:
```typ
#place(
 top + right, // Dove posizionare
 dx: -1cm, // Spostamento orizzontale
 dy: 0.5cm, // Spostamento verticale
 float: false, // true = fluttua nell'area di testo
)[
 #badge("BOZZA")
]
```
Posizioni disponibili:
- Orizzontale: `left`, `center`, `right`
- Verticale: `top`, `horizon`, `bottom`
- Combinazioni: `top + left`, `center + horizon`, ecc.
#esempio-box(
 ```
#block(width: 100%, height: 3cm,
 fill: rgb("#f4f6f7"), stroke: 1pt + luma(200),
 radius: 8pt)[
 #place(top + left, dx: 0.5em, dy: 0.3em)[
 #text(size: 8pt, fill: luma(120))[In alto a sinistra]
 ]
 #place(center + horizon)[
 #text(weight: "bold")[Al centro]
 ]
 #place(bottom + right, dx: -0.5em, dy: -0.3em)[
 #text(size: 8pt, fill: luma(120))[In basso a destra]
 ]
]
```,
 risultato: [
 #block(width: 100%, height: 3cm,
 fill: rgb("#f4f6f7"), stroke: 1pt + luma(200),
 radius: 8pt)[
 #place(top + left, dx: 0.5em, dy: 0.3em)[
 #text(size: 8pt, fill: luma(120))[In alto a sinistra]
 ]
 #place(center + horizon)[
 #text(weight: "bold")[Al centro]
 ]
 #place(bottom + right, dx: -0.5em, dy: -0.3em)[
 #text(size: 8pt, fill: luma(120))[In basso a destra]
 ]
 ]
 ],
 titolo: "Posizionamento con place()",
)
== Stack: impilare elementi
`#stack()` impila elementi uno sopra l'altro o affiancati:
```typ
// Impila verticalmente (default)
#stack(dir: ttb, spacing: 1em,
 block(fill: red, width: 100%, height: 1cm)[],
 block(fill: green, width: 100%, height: 1cm)[],
)
// Impila orizzontalmente
#stack(dir: ltr, spacing: 0.5em,
 rect(width: 2cm, fill: red),
 rect(width: 3cm, fill: blue),
)
```
== Allineamento
`#align()` allinea il contenuto dentro il suo contenitore:
```typ
#align(center)[Centrato]
#align(right)[A destra]
#align(left)[A sinistra]
#align(center + top)[Centro in alto]
#align(right + bottom)[Destra in basso]
```
#esempio-box(
 ```
#block(width: 100%, height: 2cm, fill: luma(245),
 stroke: 0.5pt + luma(200), radius: 5pt)[
 #align(center + horizon)[
 Questo testo è centrato orizzontalmente e verticalmente.
 ]
]
```,
 risultato: [
 #block(width: 100%, height: 2cm, fill: luma(245),
 stroke: 0.5pt + luma(200), radius: 5pt)[
 #align(center + horizon)[
 Questo testo è centrato orizzontalmente e verticalmente.
 ]
 ]
 ],
 titolo: "align() centrato",
)

// ────────────────────────────────────────────────────────────────
// CAPITOLO 21 — IMPAGINAZIONE AVANZATA
// ────────────────────────────────────────────────────────────────
= Impaginazione avanzata
== Intestazioni e piè di pagina
Le intestazioni (`header`) e i piè di pagina (`footer`) si
definiscono dentro `#set page()`.
=== Intestazione semplice
```typ
#set page(
 header: [
 Il Mio Documento
 #h(1fr)
 Capitolo 1
 ],
)
```
=== Intestazione con numero di pagina
```typ
#set page(
 header: context {
 [Il Mio Libro]
 h(1fr)
 counter(page).display()
 },
 footer: none,
)
```
=== Il contesto (context) e la consapevolezza del documento
Per accedere a informazioni dinamiche del documento
(numero di pagina, sezione corrente, contatori) devi usare
il blocco `context`. È il modo in cui Typst gestisce le
informazioni che cambiano nel documento:
```typ
#set page(
 numbering: "1",
 header: context {
 // Numero di pagina corrente
 let pn = counter(page).get().first()
 // Mostra l'intestazione solo dopo la prima pagina
 if pn > 1 {
 grid(
 columns: (1fr, auto),
 [Il Mio Documento],
 counter(page).display("1 / 1",
 both: true // "pagina corrente / totale pagine"
 ),
 )
 line(length: 100%, stroke: 0.5pt + luma(200))
 }
 },
)
```
=== Intestazione con titolo sezione corrente
```typ
#set page(
 header: context {
 let headings = query(heading.where(level: 1).before(here()))
 if headings.len() > 0 {
 let current = headings.last()
 [_#current.body_]
 h(1fr)
 counter(page).display()
 }
 },
)
```
== Numerazione pagine
Un po' come per un elenco puntato, ci sono diversi formati di numerazione delle pagine:
#table(
 columns: (auto, auto, 1fr),
 stroke: 0.6pt + luma(210),
 fill: (col, row) => if row == 0 { C.blu }
 else if calc.odd(row) { white }
 else { C.sfondo },
 table.cell(fill: C.blu)[#set text(fill:white,weight:"bold"); Stringa],
 table.cell(fill: C.blu)[#set text(fill:white,weight:"bold"); Risultato],
 table.cell(fill: C.blu)[#set text(fill:white,weight:"bold"); Uso tipico],
 [`"1"`], [1, 2, 3...], [Corpo principale],
 [`"i"`], [i, ii, iii...], [Prefazione/appendice],
 [`"I"`], [I, II, III...], [Numeri romani],
 [`"a"`], [a, b, c...], [Appendici],
 [`"A"`], [A, B, C...], [Appendici maiuscole],
 [`"1 / 1"`], [3 / 12], [Pagina su totale],
 [`"– 1 –"`], [– 3 –], [Stile rivista],
)
=== Cambiare numerazione nel documento
```typ
// Prefazione: numeri romani
#set page(numbering: "i")
[... prefazione ...]
// Reset e cambio a numeri arabi per il corpo
#counter(page).update(1)
#set page(numbering: "1")
[... capitoli ...]
```
== Colonne
Per mettere il testo su più colonne:
```typ
// Due colonne per tutto il documento
#set page(columns: 2)
// Due colonne per un blocco specifico
#columns(2)[
 Questo testo è su due colonne.
 Qui c'è abbastanza testo per vedere
 come funziona il layout a colonne.
]
```
=== Saltare una colonna
```typ
#columns(2)[
 Testo nella prima colonna.
 #colbreak() // Salta alla colonna successiva
 Testo nella seconda colonna.
]
```
#esempio-box(
 ```
#columns(2, gutter: 1.5em)[
 == Colonne affiancate
 Questo testo fluisce naturalmente nella
 prima colonna. Quando la prima è piena,
 il testo continua nella seconda.
 Le colonne sono molto utili per bollettini,
 newsletter, o articoli in stile rivista.
 #colbreak()
 == Seconda colonna
 Con #raw("colbreak()") puoi forzare il testo
 a saltare immediatamente alla colonna successiva,
 utile per iniziare una nuova sezione.
]
```,
 risultato: [
 #columns(2, gutter: 1em)[
 #set text(size: 9.5pt)
 *Colonne affiancate*
 Questo testo fluisce naturalmente nella
 prima colonna. Quando la prima è piena,
 il testo continua nella seconda.
 Le colonne sono molto utili per bollettini,
 newsletter, o articoli in stile rivista.
 #colbreak()
 *Seconda colonna*
 Con `colbreak()` puoi forzare il testo
 a saltare alla colonna successiva,
 utile per una nuova sezione.
 ]
 ],
 titolo: "Layout a due colonne",
)
== Pagine speciali
=== Pagina con margini diversi
```typ
// Margini maggiori per la copertina
#page(
 margin: 0pt,
 header: none,
 footer: none,
 numbering: none,
)[
 // Contenuto della copertina a piena pagina
]
```
=== Pagina in landscape (orizzontale)
```typ
#page(flipped: true)[
 // Contenuto su pagina orizzontale
 // Utile per tabelle molto larghe
]
```
// ────────────────────────────────────────────────────────────────
// CAPITOLO 22 — LAYOUT A GRIGLIA
// ────────────────────────────────────────────────────────────────
= Layout a griglia con grid()
`#grid()` è la funzione più versatile per il layout strutturato.
Ti permette di disporre elementi in righe e colonne con controllo
preciso.
== Sintassi di base
```typ
#grid(
 columns: (...), // Definizione colonne
 rows: (...), // Definizione righe (opzionale)
 gutter: ..., // Spazio tra celle
 align: ..., // Allineamento
 [Cella 1], [Cella 2], [Cella 3],
 [Cella 4], [Cella 5], [Cella 6],
)
```
== Definire le colonne
Identico a `table`:
```typ
columns: 3 // 3 colonne uguali
columns: (1fr, 2fr, 1fr) // Proporzioni
columns: (auto, 1fr) // Prima adattata, seconda riempie
columns: (3cm, 4cm, 5cm) // Misure fisse
```
== Esempi pratici di layout
=== Layout copertina (icona + testo)
#esempio-box(
 ```
#grid(
 columns: (auto, 1fr),
 gutter: 1em,
 align: (center + horizon, left),
 block(
 fill: C.blu, width: 3cm, height: 3cm,
 radius: 8pt,
 )[
 #align(center + horizon)[
 #text(fill: white, size: 24pt)[ ] 
 ]
 ],
 block[
 #text(size: 18pt, weight: "bold")[Mio Documento]
 #v(0.3em)
 #text(fill: luma(100))[Autore: Mario Rossi]
 #v(0.3em)
 #text(fill: luma(100))[Data: Giugno 2026]
 ],
)
```,
 risultato: [
 #grid(
 columns: (auto, 1fr),
 gutter: 1em,
 align: (center + horizon, left),
 block(
 fill: C.blu, width: 2.5cm, height: 2.5cm, radius: 8pt,
 )[#align(center + horizon)[#text(fill: white, size: 22pt)[ ]]], 
 block[
 #text(size: 15pt, weight: "bold")[Mio Documento]
 #v(0.3em)
 #text(fill: luma(100), size: 10pt)[Autore: Mario Rossi]
 #v(0.2em)
 #text(fill: luma(100), size: 10pt)[Data: Giugno 2026]
 ],
 )
 ],
 titolo: "Layout icona + testo",
)
=== Layout a tre colonne informative
#esempio-box(
 ```
#let info-box(icona, titolo, corpo) = block(
 fill: C.sfondo, inset: 1em, radius: 6pt,
 stroke: 1pt + luma(215),
)[
 #align(center)[
 #text(size: 20pt)[#icona]
 #v(0.3em)
 #text(weight: "bold", fill: C.blu)[#titolo]
 ]
 #v(0.5em)
 #body
]
#grid(
 columns: (1fr, 1fr, 1fr),
 gutter: 1em,
 info-box(" ", "Veloce")[Compilazione istantanea], 
 info-box(" ", "Bello")[Tipografia professionale], 
 info-box(" ", "Potente")[Scripting integrato], 🔧
)
```,
 risultato: [
 #let info-box-f(icona, titolo, corpo) = block(
 fill: C.sfondo, inset: 0.8em, radius: 6pt,
 stroke: 1pt + luma(215),
 )[
 #align(center)[
 #text(size: 18pt)[#icona]
 #v(0.2em)
 #text(weight: "bold", fill: C.blu, size: 10pt)[#titolo]
 ]
 #v(0.3em)
 #set text(size: 9.5pt)
 #corpo
 ]
 #grid(
 columns: (1fr, 1fr, 1fr),
 gutter: 0.8em,
 info-box-f(" ", "Veloce")[Compilazione istantanea], 
 info-box-f(" ", "Bello")[Tipografia professionale], 
 info-box-f(" ", "Potente")[Scripting integrato], 
 )
 ],
 titolo: "Card a tre colonne",
)
=== Grid con celle che si estendono
```typ
#grid(
 columns: (1fr, 1fr, 1fr),
 gutter: 0.5em,
 // Cella che occupa 2 colonne
 grid.cell(colspan: 2)[Grande cella],
 [Cella normale],
 [A], [B], [C],
)
```
== La funzione layout()
Per layout adattativi che dipendono dalla dimensione disponibile:
```typ
#layout(size => {
 // 'size' contiene la larghezza e altezza disponibili
 let cols = if size.width > 400pt { 3 } else { 1 }
 grid(columns: cols, ...)
})
```
// ================================================================
// PARTE VI — ORGANIZZAZIONE DEL PROGETTO
// ================================================================
// ────────────────────────────────────────────────────────────────
// CAPITOLO 23 — FILE MULTIPLI E MODULI
// ────────────────────────────────────────────────────────────────
= File multipli e moduli
Quando il documento diventa lungo o vuoi riusare stili in più
documenti, conviene organizzarlo su più file.
== `#include` — includere contenuto
`#include "file.typ"` inserisce il *contenuto* di un altro file
esattamente dove si trova l'istruzione. È come incollare il
contenuto del file nel punto corrente:
```
// Struttura cartelle:
documento-principale.typ
capitoli/
 cap01-introduzione.typ
 cap02-metodi.typ
 cap03-risultati.typ
stili/
 configurazione.typ
```
```typ
// documento-principale.typ
#include "stili/configurazione.typ"
= Il Mio Documento
#include "capitoli/cap01-introduzione.typ"
#include "capitoli/cap02-metodi.typ"
#include "capitoli/cap03-risultati.typ"
```
=== Vantaggi di `#include`
- I file sono separati → più facile trovare le cose
- Puoi lavorare su un capitolo alla volta
- I collaboratori lavorano su file diversi → meno conflitti
- Puoi riordinare i capitoli semplicemente spostando le righe
== `#import` — importare funzioni e variabili
`#import` permette di *importare* definizioni (funzioni,
variabili, costanti) da un altro file, senza includerne
il contenuto testuale:
```typ
// Nel file 'stili/macro.typ':
#let nota(body) = block(fill: blue.lighten(80%), ...)[#body]
#let avviso(body) = block(fill: red.lighten(80%), ...)[#body]
#let colore-principale = rgb("#1a3a5c")
```
```typ
// Nel file principale:
#import "stili/macro.typ": nota, avviso, colore-principale
// Ora puoi usare:
#nota[Questa è una nota.]
#avviso[Questo è un avviso.]
```
=== Importare tutto con `*`
```typ
#import "stili/macro.typ": *
// Importa tutte le definizioni pubbliche
```
=== Importare con alias
```typ
#import "stili/macro.typ": nota as n, avviso as warn
// Usa #n[] invece di #nota[], e #warn[] invece di #avviso[]
```
=== Differenza tra import e include
#table(
 columns: (auto, 1fr, 1fr),
 stroke: 0.6pt + luma(210),
 fill: (col, row) => if row == 0 { C.blu }
 else if calc.odd(row) { white }
 else { C.sfondo },
 table.cell(fill: C.blu)[#set text(fill:white,weight:"bold")],
 table.cell(fill: C.blu)[#set text(fill:blue,weight:"bold"); `#include`],
 table.cell(fill: C.blu)[#set text(fill:blue,weight:"bold"); `#import`],
 [Cosa fa], [Inserisce il contenuto del file], [Importa definizioni (funzioni,
variabili)],
 [Produce testo?], [Sì], [No],
 [Uso tipico], [Capitoli, sezioni], [Librerie di stile, macro],
 [Accede a], [Tutto il file viene renderizzato], [Solo ciò che esporti],
)
== Organizzare un progetto grande
Ecco una struttura tipica per una tesi o un libro:
```
tesi/
├── main.typ ← File principale
├── config/
│ ├── pagina.typ ← set page(), set text(), ecc.
│ ├── stili.typ ← show rules, heading styles
│ └── macro.typ ← Funzioni personalizzate
├── capitoli/
│ ├── 00-frontespizio.typ
│ ├── 01-introduzione.typ
│ ├── 02-teoria.typ
│ ├── 03-metodi.typ
│ ├── 04-risultati.typ
│ ├── 05-conclusioni.typ
│ └── appendici.typ
├── immagini/
│ ├── logo.svg
│ └── grafici/
│ ├── fig01.png
│ └── fig02.png
└── bib/
 └── riferimenti.bib
```
```typ
// main.typ
#import "config/macro.typ": *
#include "config/pagina.typ"
#include "config/stili.typ"
#include "capitoli/00-frontespizio.typ"
#outline(depth: 3)
#counter(page).update(1)
#include "capitoli/01-introduzione.typ"
#include "capitoli/02-teoria.typ"
// ...
#bibliography("bib/riferimenti.bib")
```
== Variabili condivise tra file
Puoi definire variabili globali in un file di configurazione
e importarle ovunque:
```typ
// config/variabili.typ
#let autore = "Mario Rossi"
#let titolo = "La Mia Tesi"
#let anno = 2026
#let università = "Università degli Studi di Milano"
#let relatore = "Prof. Luigi Verdi"
#let C = ( // Palette colori
 blu: rgb("#1a3a5c"),
 accento: rgb("#2471a3"),
)
```
```typ
// In qualsiasi capitolo:
#import "config/variabili.typ": autore, anno, C
Tesi di #autore, anno #anno.
```
// ────────────────────────────────────────────────────────────────
// CAPITOLO 24 — PACCHETTI
// ────────────────────────────────────────────────────────────────
= Pacchetti
L'ecosistema di Typst cresce ogni giorno grazie ai pacchetti
della comunità. I pacchetti aggiungono funzionalità non presenti
nella libreria standard.
== Dove trovare i pacchetti
Il repository ufficiale è *Typst Universe*:
#link("https://typst.app/universe")
Puoi cercare per categoria: matematica, presentazioni, CV,
tabelle, diagrammi, grafica, citazioni...
== Come importare un pacchetto
```typ
#import "@preview/nome-pacchetto:versione": funzione1, funzione2
```
Il prefisso `@preview/` indica i pacchetti della comunità.
#nota[
 Nell'editor online di typst.app, i pacchetti vengono
 scaricati automaticamente. Se usi Typst localmente,
 vengono scaricati automaticamente la prima volta che
 li usi e poi messi in cache.
]
== Pacchetti principali
=== showybox — Box stilizzate
```typ
#import "@preview/showybox:2.0.1": showybox
#showybox(
 title: "Teorema di Pitagora",
 frame: (title-color: blue, border-color: blue),
)[
 In un triangolo rettangolo, il quadrato dell'ipotenusa è
 uguale alla somma dei quadrati dei cateti:
 $ a^2 + b^2 = c^2 $
]
```
=== codly — Codice con numeri di riga
```typ
#import "@preview/codly:0.2.0": *
#show: codly-init.with()
// Ora i blocchi di codice hanno numeri di riga e stile avanzato
```
=== cetz — Disegno vettoriale
```typ
#import "@preview/cetz:0.3.1": canvas, draw
#canvas({
 import draw: *
 circle((0, 0), radius: 1)
 line((0, 0), (1, 0))
 content((0, -1.5), [Cerchio])
})
```
=== fletcher — Diagrammi e frecce
```typ
#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge
#diagram(
 node((0,0), [Stato A]),
 edge("->", [trasformazione]),
 node((2,0), [Stato B]),
)
```
=== physica — Notazione fisica
```typ
#import "@preview/physica:0.9.3": *
$dv(f, x)$ // df/dx
$pdv(f, x, y)$ // Derivata parziale
$laplacian(f)$ // Laplaciano
$grad f$ // Gradiente
$div bold(F)$ // Divergenza
```
=== polylux — Presentazioni
```typ
#import "@preview/polylux:0.3.1": *
#set page(paper: "presentation-16-9")
#set text(size: 20pt)
#polylux-slide[
 = Titolo della Slide
 Contenuto della prima slide.
]
#polylux-slide[
 == Seconda Slide
 #pause // Pausa per le animazioni
 Questo appare dopo la pausa.
]
```
=== tablex — Tabelle avanzate
```typ
#import "@preview/tablex:0.0.8": tablex, cellx
#tablex(
 columns: 3,
 // Celle con colspan/rowspan più semplici
 cellx(colspan: 2)[Unita],
 [Normale],
)
```
=== lovelace — Pseudocodice e algoritmi
```typ
#import "@preview/lovelace:0.3.0": *
#pseudocode-list[
 *Input:* Lista $A$ di $n$ elementi
 *Output:* $A$ ordinata
 + *for* $i$ *from* $1$ *to* $n-1$ *do*
 + *for* $j$ *from* $0$ *to* $n-i-1$ *do*
 + *if* $A[j] > A[j+1]$ *then*
 + scambia $A[j]$ e $A[j+1]$
]
```
=== codelst — Liste di codice con riferimenti
=== diagraph — Grafi con GraphViz
```typ
  #import "@preview/diagraph:0.2.5": raw-render
  #raw-render(
    digraph {
    A -> B
    B -> C
    A -> C
    })
```
== Come scegliere la versione giusta
Su typst.app/universe ogni pacchetto mostra le versioni
disponibili. In generale usa *l'ultima versione stabile*
(il numero più alto). Se aggiorni un pacchetto, controlla
se ci sono breaking changes nella documentazione.
```typ
// Sempre specificare la versione esatta:
#import "@preview/showybox:2.0.1": showybox
// Non usare wildcards: "@preview/showybox:*" non funziona
```
// ================================================================
// PARTE VII — PROGETTI REALI
// ================================================================
// ────────────────────────────────────────────────────────────────
// CAPITOLO 25 — DOCUMENTO ACCADEMICO COMPLETO
// ────────────────────────────────────────────────────────────────
= Documento accademico completo
In questo capitolo costruiamo da zero un template completo
per articoli scientifici o tesi di laurea, mettendo insieme
tutto quello che abbiamo imparato.
== Template minimo per una tesi
```typ
// ── CONFIGURAZIONE ──────────────────────────────────────────
#set document(
 title: "Titolo della Tesi",
 author: "Nome Cognome",
)
#set page(
 paper: "a4",
 margin: (top: 3cm, bottom: 3cm, left: 3.5cm, right: 2.5cm),
 numbering: "1",
 number-align: right,
 header: context {
 let pn = counter(page).get().first()
 if pn > 1 {
 set text(size: 9pt, fill: luma(130))
 line(length: 100%, stroke: 0.4pt + luma(200))
 v(-0.8em)
 grid(
 columns: (1fr, auto),
 [_Titolo della Tesi_],
 counter(page).display(),
 )
 }
 },
)
#set text(font: "Linux Libertine", size: 11pt, lang: "it")
#set par(justify: true, leading: 0.75em, spacing: 1.2em)
#set heading(numbering: "1.1.1.")
#set math.equation(numbering: "(1)", supplement: "Eq.")
#set figure(supplement: "Figura")
// ── FRONTESPIZIO ────────────────────────────────────────────
#page(numbering: none, header: none)[
 #align(center)[
 // Logo università (se disponibile)
 // #image("logo-univ.svg", width: 4cm)
 // #v(1cm)
 #text(size: 14pt)[*UNIVERSITÀ DEGLI STUDI DI ...*]
 #v(0.3em)
 #text(size: 12pt)[Dipartimento di ...]
 #v(0.3em)
 #text(size: 12pt)[Corso di Laurea in ...]
 #v(2cm)
 #line(length: 80%, stroke: 1pt + black)
 #v(1cm)
 #text(size: 11pt, style: "italic")[Tesi di Laurea Magistrale in ...]
 #v(0.5cm)
 #text(size: 22pt, weight: "bold")[
 Titolo della Tesi \
 su Più Righe se Necessario
 ]
 #v(0.5cm)
 #line(length: 80%, stroke: 1pt + black)
 #v(2cm)
 #grid(
 columns: (1fr, 1fr),
 align(left)[
 *Relatore:* \
 Prof. Luigi Verdi
 #v(0.5em)
 *Correlatore:* \
 Dott. Carlo Bianchi
 ],
 align(right)[
 *Candidato:* \
 Mario Rossi \
 Matricola: 12345678
 ],
 )
 #v(1fr)
 #text(size: 11pt)[Anno Accademico 2024/2026]
 ]
]
// ── ABSTRACT ────────────────────────────────────────────────
#page(numbering: "i", header: none)[
 #heading(level: 1, numbering: none, outlined: false)[Abstract]
 #text(style: "italic")[
 Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 Questo è il testo dell'abstract in italiano...
 ]
 #v(1.5em)
 *Keywords:* Typst, impaginazione, documenti accademici.
 #v(2em)
 #heading(level: 1, numbering: none, outlined: false)[Abstract (English)]
 #text(style: "italic")[
 This is the English abstract...
 ]
 #v(1.5em)
 *Keywords:* Typst, typesetting, academic documents.
]
// ── INDICE ──────────────────────────────────────────────────
#page(numbering: "i")[
 #outline(depth: 3, indent: 2em)
]
#page(numbering: "i")[
 #outline(target: figure.where(kind: image),
 title: [Lista delle Figure])
 #v(2em)
 #outline(target: figure.where(kind: table),
 title: [Lista delle Tabelle])
]
// ── CORPO DEL DOCUMENTO ─────────────────────────────────────
#counter(page).update(1)
= Introduzione
Testo del primo capitolo...
== Motivazione
...
== Obiettivi
...
== Struttura del documento
...
= Metodologia
...
= Risultati
...
= Conclusioni e Sviluppi Futuri
...
// ── APPENDICI ───────────────────────────────────────────────
#heading(level: 1, numbering: none)[Appendice A — Nome Appendice]
...
// ── BIBLIOGRAFIA ────────────────────────────────────────────
#heading(level: 1, numbering: none, outlined: true)[Bibliografia]
#bibliography("riferimenti.bib", style: "ieee")
// Stili: "ieee", "apa", "chicago-author-date", "mla", ...
```
== Equazioni numerate e riferimenti
```typ
#set math.equation(numbering: "(1)")
L'equazione di Navier-Stokes per fluidi incomprimibili è:
$ rho (partial bold(u))/(partial t) +
 rho (bold(u) dot nabla) bold(u) =
 -nabla p + mu nabla^2 bold(u) + bold(f)
$ <eq-navier-stokes>
Come mostrato nell'equazione @eq-navier-stokes, il termine
$rho (bold(u) dot nabla) bold(u)$ rappresenta...
```
== Citazioni bibliografiche
Per citare riferimenti bibliografici, Typst usa il file `.bib`
in formato BibTeX:
```bibtex
// riferimenti.bib
@article{knuth1984,
 author = {Knuth, Donald E.},
 title = {The {\TeX}book},
 year = {1984},
 journal = {Computers \& Typesetting},
}
@inproceedings{typst2023,
 author = {Haug, Martin and Mädje, Laurenz},
 title = {Typst: A Programmable Markup Language},
 year = {2023},
}
```
```typ
// Nel documento:
Come dimostrato da @knuth1984, la qualità tipografica...
L'approccio di Typst @typst2023 migliora su LaTeX...
// In fondo al documento:
#bibliography("riferimenti.bib", style: "ieee")
```
== Figure e tabelle accademiche
```typ
// Figura con riferimento
#figure(
 image("grafici/risultati.png", width: 85%),
 caption: [
 Confronto delle prestazioni tra i tre algoritmi proposti.
 I valori rappresentano la media su 100 esecuzioni.
 ],
) <fig-risultati>
Come mostrato nella @fig-risultati, l'algoritmo proposto
supera le baseline in tutti i scenari testati.
// Tabella con riferimento
#figure(
 table(
 columns: (auto, auto, auto, auto),
 stroke: 0.5pt + luma(200),
 fill: (col, row) => if row == 0 { luma(230) } else { white },
 table.header(
 [*Dataset*], [*Accuratezza*], [*Precisione*], [*Richiamo*],
 ),
 [MNIST], [99.1%], [98.7%], [99.0%],
 [CIFAR-10],[87.3%], [86.9%], [87.1%],
 [ImageNet],[76.4%], [75.8%], [76.2%],
 ),
 caption: [Risultati sperimentali sui dataset di benchmark.],
 kind: table,
) <tab-risultati>
La @tab-risultati mostra i risultati quantitativi...
```
// ────────────────────────────────────────────────────────────────
// CAPITOLO 26 — TEMPLATE CV/CURRICULUM VITAE
// ────────────────────────────────────────────────────────────────
= Template Curriculum Vitae
Un CV moderno e professionale in Typst.
== Template CV a due colonne
```typ
// ── CONFIGURAZIONE ──────────────────────────────────────────
#set document(title: "CV - Mario Rossi")
#set page(paper: "a4", margin: 0pt)
#set text(font: "Linux Libertine", size: 10pt, lang: "it")
#set par(justify: false, spacing: 0.6em)
// ── COLORI ──────────────────────────────────────────────────
#let C = (
 sinistra: rgb("#1a3a5c"),
 accento: rgb("#2471a3"),
)
// ── FUNZIONI HELPER ─────────────────────────────────────────
#let voce-cv(titolo, sottotitolo: none, periodo: none, corpo) = {
 block(below: 0.8em)[
 #grid(
 columns: (1fr, auto),
 text(weight: "bold", fill: C.accento)[#titolo],
 if periodo != none { text(fill: luma(120), size: 9pt)[#periodo] },
 )
 #if sottotitolo != none {
 text(style: "italic")[#sottotitolo]
 linebreak()
 }
 #corpo
 ]
}
#let sezione-cv(titolo, corpo) = {
 v(0.5em)
 text(size: 12pt, weight: "bold", fill: C.accento)[#titolo]
 v(-0.3em)
 line(length: 100%, stroke: 1.5pt + C.accento)
 v(0.4em)
 corpo
}
#let competenza(nome, livello) = {
 grid(
 columns: (1fr, auto),
 align: (left + horizon, right + horizon),
 gutter: 0.5em,
 text(size: 9.5pt)[#nome],
 box(width: 4cm)[
 #stack(dir: ltr, spacing: 0pt,
 ..range(5).map(i =>
 box(
 width: 0.7cm, height: 0.35cm,
 radius: 2pt,
 inset: 0pt,
 fill: if i < livello { C.accento } else { luma(220) },
 )
 )
 )
 ],
 )
}
// ── LAYOUT: COLONNA SINISTRA (30%) + DESTRA (70%) ───────────
#grid(
 columns: (30%, 70%),
 // ── COLONNA SINISTRA ──────────────────────────────────────
 block(
 fill: C.sinistra,
 height: 100%,
 inset: (x: 1.5em, y: 2em),
 width: 100%,
 )[
 // Foto placeholder (sostituisci con image())
 #align(center)[
 #circle(
 radius: 2cm,
 fill: C.accento,
 )[
 #align(center + horizon)[
 #text(fill: white, size: 28pt)[MR]
 ]
 ]
 ]
 #v(1em)
 // Contatti
 #set text(fill: white, size: 9.5pt)
 #sezione-cv(text(fill: luma(200))[Contatti])[
 mario.rossi\@email.it \ 
 +39 333 1234567 \ 
 linkedin.com/in/mariorossi \ 
 Roma, Italia 
 ]
 #v(0.5em)
 // Competenze tecniche
 #sezione-cv(text(fill: luma(200))[Competenze])[
 #set text(fill: white)
 *Linguaggi*
 #competenza("Python", 5)
 #competenza("Java", 4)
 #competenza("Typst", 5)
 #v(0.4em)
 *Strumenti*
 #competenza("Git", 4)
 #competenza("Docker", 3)
 #competenza("LaTeX", 4)
 ]
 #v(0.5em)
 // Lingue
 #sezione-cv(text(fill: luma(200))[Lingue])[
 #set text(fill: white)
 #competenza("Italiano", 5)
 #competenza("Inglese", 4)
 #competenza("Tedesco", 2)
 ]
 ],
 // ── COLONNA DESTRA ────────────────────────────────────────
 block(
 fill: white,
 height: 100%,
 inset: (x: 2em, y: 2em),
 width: 100%,
 )[
 // Nome e titolo
 #text(size: 26pt, weight: "bold", fill: C.sinistra)[Mario Rossi]
 #linebreak()
 #text(size: 13pt, fill: C.accento)[Ingegnere Informatico]
 #v(1em)
 // Profilo
 #sezione-cv("Profilo")[
 Ingegnere informatico con 5+ anni di esperienza nello
 sviluppo software. Specializzato in machine learning e
 sistemi distribuiti. Appassionato di open-source e
 documentazione tecnica con Typst.
 ]
 // Esperienza lavorativa
 #sezione-cv("Esperienza Lavorativa")[
 #voce-cv(
 "Senior Software Engineer",
 sottotitolo: "Azienda Tech S.p.A. · Roma",
 periodo: "2022 – Presente",
 )[
 - Sviluppo di sistemi di raccomandazione con Python/PyTorch
 - Architettura microservizi su Kubernetes
 - Mentoring di 3 junior developer
 ]
 #voce-cv(
 "Software Developer",
 sottotitolo: "Startup Innovazione · Milano",
 periodo: "2019 – 2022",
 )[
 - Backend API con FastAPI e PostgreSQL
 - Riduzione del 40% dei tempi di risposta
 ]
 ]
 // Formazione
 #sezione-cv("Formazione")[
 #voce-cv(
 "Laurea Magistrale in Ingegneria Informatica",
 sottotitolo: "Università degli Studi di Roma La Sapienza",
 periodo: "2017 – 2019",
 )[
 Voto: 110/110 con lode. Tesi: \"Machine Learning per
 la predizione di guasti industriali\".
 ]
 #voce-cv(
 "Laurea Triennale in Informatica",
 sottotitolo: "Università degli Studi di Roma La Sapienza",
 periodo: "2014 – 2017",
 )[Voto: 108/110.]
 ]
 // Certificazioni
 #sezione-cv("Certificazioni")[
 - AWS Certified Solutions Architect (2023)
 - Google Professional Data Engineer (2022)
 - Scrum Master Certified (2021)
 ]
 ],
)
```
== Variante CV minimalista (una colonna)
```typ
#set page(paper: "a4", margin: (x: 2.5cm, y: 2.5cm))
#set text(font: "Linux Libertine", size: 11pt)
// Header
#align(center)[
 #text(size: 24pt, weight: "bold")[Mario Rossi]
 #linebreak()
 #text(fill: luma(100))[
 mario@email.it · +39 333 1234567 · Roma, Italia ·
 linkedin.com/in/mariorossi
 ]
]
#line(length: 100%, stroke: 0.5pt)
// Sezioni
= Esperienza
...
= Formazione
...
```
// ────────────────────────────────────────────────────────────────
// CAPITOLO 27 — PRESENTAZIONI
// ────────────────────────────────────────────────────────────────
= Presentazioni (Slide)
Typst può creare presentazioni professionali (avete presente beamer in latex?) grazie al pacchetto
*Polylux* (o al più recente *Touying*).
== Setup con Polylux
```typ
// ── IMPORTAZIONE ────────────────────────────────────────────
#import "@preview/polylux:0.3.1": *
// ── CONFIGURAZIONE PAGINA ───────────────────────────────────
#set page(
 paper: "presentation-16-9",
 margin: 0pt,
)
#set text(font: "Linux Libertine", size: 22pt, lang: "it")
// ── COLORI ──────────────────────────────────────────────────
#let C = (
 sfondo: rgb("#0d2137"),
 accento: rgb("#2471a3"),
 testo: white,
 grigio: rgb("#aab7b8"),
)
// ── TEMPLATE SLIDE ──────────────────────────────────────────
#let slide-base(corpo) = {
 set page(fill: C.sfondo)
 set text(fill: C.testo)
 polylux-slide[
 #block(
 width: 100%, height: 100%,
 inset: (x: 2cm, y: 1.5cm),
 )[#corpo]
 ]
}
#let slide-titolo(titolo, sottotitolo: none, autore: none) = {
 set page(fill: C.sfondo)
 polylux-slide[
 #align(center + horizon)[
 #block(width: 80%)[
 #if sottotitolo != none {
 text(fill: C.accento, size: 16pt, tracking: 3pt)[
 #upper(sottotitolo)
 ]
 v(0.5em)
 }
 text(size: 40pt, weight: "bold")[#titolo]
 v(1em)
 line(length: 40%, stroke: 2pt + C.accento)
 if autore != none {
 v(0.8em)
 text(fill: C.grigio, size: 18pt)[#autore]
 }
 ]
 ]
 ]
}
#let slide-sezione(titolo) = {
 set page(fill: C.accento)
 polylux-slide[
 #align(center + horizon)[
 #text(size: 36pt, weight: "bold", fill: white)[#titolo]
 ]
 ]
}
// ── SLIDE DI TITOLO ─────────────────────────────────────────
#slide-titolo(
 "Introduzione a Typst",
 sottotitolo: "Corso di Typesetting Moderno",
 autore: "Mario Rossi · Giugno 2026",
)
// ── SLIDE NORMALE ───────────────────────────────────────────
#slide-base[
 == Cos'è Typst?
 #v(0.5em)
 - Un linguaggio di markup _moderno_
 - Compilazione *istantanea*
 - Qualità tipografica professionale
 - Scripting integrato
 #align(right)[
 #text(fill: C.grigio, size: 16pt)[typst.app]
 ]
]
// ── SLIDE CON COLONNE ───────────────────────────────────────
#slide-base[
 == Typst vs LaTeX
 #grid(
 columns: (1fr, 1fr),
 gutter: 2em,
 block(
 fill: white.transparentize(90%),
 inset: 1em, radius: 8pt,
 )[
 *LaTeX*
 - Vecchio (1984)
 - Compilazione lenta
 - Errori criptici
 ],
 block(
 fill: C.accento.transparentize(50%),
 inset: 1em, radius: 8pt,
 )[
 *Typst* 
 - Moderno (2023)
 - Istantaneo
 - Errori chiari
 ],
 )
]
// ── SLIDE CON RIVELAZIONE PROGRESSIVA ───────────────────────
#slide-base[
 == I vantaggi principali
 #uncover("1-")[ Velocità di compilazione] 
 #v(0.5em)
 #uncover("2-")[ Tipografia eccellente] 
 #v(0.5em)
 #uncover("3-")[ Scripting potente] 
 #v(0.5em)
 #uncover("4-")[ Pacchetti della comunità] 
]
// ── SLIDE CON CODICE ────────────────────────────────────────
#slide-base[
 == Il primo documento
 // Dentro una slide scrivi normale markup Typst:
 = Ciao, Typst!
 Questo è il mio primo documento.
 - Facile
 - Potente
 - Bello
 #text(fill: C.accento)[→ Subito un PDF professionale!]
]
// ── SLIDE CONCLUSIVA ────────────────────────────────────────
#slide-base[
 #align(center + horizon)[
 #text(size: 32pt, weight: "bold")[Grazie!]
 #v(1em)
 #text(fill: C.grigio, size: 18pt)[
 typst.app/universe \  github.com/typst/typst ]
 #v(1em)]
```
== Rivelazione progressiva (animazioni)
Polylux supporta slide con elementi che appaiono
gradualmente:
```typ
// Mostra solo nella slide 2 e oltre
#only("2-")[Testo che appare dalla slide 2]
// Mostra solo nella slide 3
#only(3)[Testo che appare solo nella slide 3]
// Copre (nasconde) fino alla slide 2
#uncover("2-")[Nascosto, poi rivelato]
// Alternativa: #pause aggiunge una slide di pausa
== Titolo slide
Primo punto.
#pause
Secondo punto (appare dopo click).
#pause
Terzo punto.
```
== Il pacchetto Touying (alternativa avanzata)
Touying è un'alternativa più recente e potente a Polylux:
```typ
#import "@preview/touying:0.5.3": *
#import themes.university: *
#show: university-theme.with(
 aspect-ratio: "16-9",
 config-info(
 title: [Il Titolo della Presentazione],
 author: [Mario Rossi],
 institution: [Università di ...],
 ),
)
#title-slide()
= Prima Sezione
== Slide 1
Contenuto della prima slide.
== Slide 2
Contenuto della seconda.
```
Touying offre:
- Molti temi predefiniti (metropolis, dewdrop, university, ...)
- Transizioni più sofisticate
- Handout mode automatico
- Migliore supporto per contenuti complessi

// ────────────────────────────────────────────────────────────────
// CAPITOLO 28 — ARGOMENTI AVANZATI
// ────────────────────────────────────────────────────────────────
= Argomenti avanzati
== Il sistema context
Il blocco `context` è il meccanismo con cui Typst gestisce
informazioni che dipendono dalla posizione nel documento.
=== Contatori
Typst ha contatori per pagine, titoli, figure, equazioni...
Puoi anche crearne di personalizzati:
```typ
// Contatore predefinito: pagine
context counter(page).get() // Valore attuale
context counter(page).display() // Visualizzato come testo
// Contatore dei titoli
context counter(heading).get()
// Contatore personalizzato
#let cnt-esempi = counter("esempi")
#cnt-esempi.step() // Incrementa
#context cnt-esempi.display() // Mostra il valore
// Esempio: numerare gli esempi
#let es-numerato(corpo) = {
 cnt-esempi.step()
 block(fill: luma(245), inset: 1em)[
 *Esempio #context cnt-esempi.display()*
 #corpo
 ]
}
```
=== Query
`query()` inside `context` ti permette di cercare elementi
nel documento:
```typ
// Trova tutti i titoli di livello 1
context {
 let capp = query(heading.where(level: 1))
 for cap in capp {
 [• #cap.body #linebreak()]
 }
}
// Trova tutti i titoli prima della posizione corrente
context query(heading.where(level: 1).before(here()))
// Quante figure ci sono nel documento?
context query(figure.where(kind: image)).len()
```
=== State (stato globale)
Lo stato è come una variabile globale che può essere
modificata durante la compilazione:
```typ
#let tema = state("tema", "chiaro") // Default: "chiaro"
// Modificare lo stato
#tema.update("scuro")
// Leggere lo stato
#context {
 let t = tema.get()
 if t == "scuro" { block(fill: black)[...] }
 else { block(fill: white)[...] }
}
```
== Algoritmi di testo avanzati
=== Testo con line-by-line control
```typ
// Controllo fine del testo
#set text(
 tracking: 0.5pt, // Spaziatura tra le lettere (letterspacing)
 spacing: 110%, // Spaziatura tra le parole
)
// Testo con font features
#set text(
 features: ("onum",), // Old-style numerals
)
```
=== Testo verticale
```typ
// Ruotare il testo
#rotate(90deg)[Testo verticale]
// Scala il testo
#scale(x: 150%)[Testo allargato]
```
== Pattern e ripetizioni
```typ
// Filigrana (watermark)
#page(background:
 place(center + horizon, rotate(-30deg,
 text(size: 80pt, fill: luma(220))[BOZZA]
 ))
)[
 // Contenuto della pagina
]
```
#esempio-box(
 ```
// Sfondo con tiling (nelle versioni vecchie si chiamava `pattern`)
#block(
 width: 100%,
 height: 2.5cm,
 fill: tiling(
 size: (30pt, 30pt),
 relative: "parent",
 )[
 #place(dx: 0pt, dy: 0pt)[
 #circle(radius: 2pt, fill: luma(220))
 ]
 ],
)
```,
 risultato: [
 #block(
 width: 100%, height: 2cm, radius: 6pt,
 stroke: 0.5pt + luma(200),
 fill: tiling(
 size: (20pt, 20pt),
 relative: "parent",
 )[
 #place(dx: 3pt, dy: 3pt)[
 #circle(radius: 1.5pt, fill: luma(215))
 ]
 ],
 )
 ],
 titolo: "Sfondo con pattern",
)
== Disegno avanzato con CeTZ
Per diagrammi e disegni vettoriali complessi, usa il pacchetto
`cetz`:
```typ
#import "@preview/cetz:0.3.1": canvas, draw
#canvas({
 import draw: *
 // Assi
 line((-3, 0), (3, 0), mark: (end: "stealth"))
 line((0, -0.5), (0, 3), mark: (end: "stealth"))
 content((3.2, 0), $x$)
 content((0, 3.2), $y$)
 // Parabola tramite punti
 bezier-through(
 (-2, 4), (0, 0), (2, 4),
 stroke: blue + 2pt,
 )
 // Label
 content((1.5, 2.5), [$y = x^2$], anchor: "west")
 // Punti
 for x in (-2, -1, 0, 1, 2) {
 circle((x, x*x), radius: 0.07, fill: blue)
 }
})
```
== Diagrammi con Fletcher
Fletcher è la soluzione elegante per grafi e diagrammi freccia:
```typ
#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge
#diagram(
 cell-size: 15mm,
 node((0,0), [*Compilatore*\nTypst], shape: rect),
 node((2,0), [*PDF*], shape: rect, fill: green.lighten(70%)),
 node((0,1), [`.typ`\nfile], fill: blue.lighten(80%)),
 edge((0,1), (0,0), "->", [legge]),
 edge((0,0), (2,0), "=>", [produce], label-pos: 0.5),
)
```
// ================================================================
// APPENDICI
// ================================================================


// ────────────────────────────────────────────────────────────────
// APPENDICE A — ERRORI COMUNI E SOLUZIONI
// ────────────────────────────────────────────────────────────────
#heading(level: 1, numbering: none)[Appendice A — Errori Comuni]
== Errori di sintassi frequenti
#table(
 columns: (auto, 1fr, 1fr),
 stroke: 0.6pt + luma(210),
 fill: (col, row) => if row == 0 { C.blu } else if calc.odd(row) { white } else
{ C.sfondo },
 table.header(
 table.cell[#set text(fill:white,weight:"bold"); Errore],
 table.cell[#set text(fill:white,weight:"bold"); Sbagliato],
 table.cell[#set text(fill:white,weight:"bold"); Corretto],
 ),
 [Apice con più caratteri], [`$x^n+1$`], [`$x^(n+1)$`],
 [Frazione], [`$a/b+c$`], [`$(a/b)+c$` o `$frac(a, b+c)$`],
 [Stringa con singole], [`'ciao'`], [`"ciao"`],
 [Confronto vs assegnazione],[`if x = 5`],[`if x == 5`],
 [show rule infinita], [`show heading: it => heading[#it]`],
 [`show heading: it => block[#it.body]`],
 [Chiave dict con spazi], [`(mia chiave: v)`],[`("mia chiave": v)`],
 [Accesso a indice fuori], [`.at(10)` (su array di 5)], [Controlla `.len()`
prima],
 [Tab invece di spazi], [Usa tab per indentare liste], [Usa 2 spazi],
)
== Messaggi di errore comuni
#table(
 columns: (auto, 1fr),
 stroke: 0.6pt + luma(210),
 fill: (col, row) => if row == 0 { C.blu } else if calc.odd(row) { white } else
{ C.sfondo },
 table.header(
 table.cell[#set text(fill:white,weight:"bold"); Messaggio],
 table.cell[#set text(fill:white,weight:"bold"); Causa e soluzione],
 ),
 [`unknown variable`], [Hai usato una variabile non definita. Controlla il nome e
che sia definita prima dell'uso.],
 [`expected content`], [Hai passato un valore sbagliato dove serve contenuto
`[...]`. Metti il testo tra quadre.],
 [`unexpected keyword`], [Errore di sintassi. Controlla le virgole, le parentesi e
la struttura del codice.],
 [`file not found`], [Il file immagine o incluso non esiste nel percorso
specificato. Controlla il path.],
 [`cyclic import`], [Due file si importano a vicenda. Ristruttura le dipendenze.],
 [`stack overflow`], [Ricorsione infinita. Assicurati che la funzione ricorsiva
abbia un caso base.],
)
// ────────────────────────────────────────────────────────────────
// APPENDICE D — RISORSE E COMMUNITY
// ────────────────────────────────────────────────────────────────
#heading(level: 1, numbering: none)[Appendice B — Risorse e Community]
== Documentazione ufficiale
- *Documentazione Typst*:
 #link("https://typst.app/docs")[typst.app/docs]
- *Typst Universe* (pacchetti):
 #link("https://typst.app/universe")[typst.app/universe]
- *GitHub Typst*:
 #link("https://github.com/typst/typst")[github.com/typst/typst]
== Community e supporto
- *Forum ufficiale*:
 #link("https://forum.typst.app")[forum.typst.app]
- *Discord Typst*:
 Cerca "Typst Discord" su Discord per entrare nel server ufficiale
- *Reddit*:
 #link("https://reddit.com/r/typst")[reddit.com/r/typst]
- *Stack Overflow*:
 Tag `typst` su StackOverflow per domande tecniche

== Strumenti complementari
- *Tinymist* (VS Code): la migliore estensione per Typst
- *typst-lsp*: Language Server Protocol per qualsiasi editor
- *Hayagriva*: gestione bibliografie in formato YAML
- *typst-fmt*: formatter automatico del codice Typst
// ────────────────────────────────────────────────────────────────
// APPENDICE E — FONT E TIPOGRAFIA
// ────────────────────────────────────────────────────────────────
#heading(level: 1, numbering: none)[Appendice C — Font e Tipografia]
== Come specificare i font
```typ
// Font singolo
#set text(font: "Linux Libertine")
// Lista di fallback: usa il primo disponibile
#set text(font: ("Linux Libertine", "Georgia", "Times New Roman"))
// Font diversi per serif e sans-serif
#set text(font: "Linux Libertine") // Per il corpo
#set raw(theme: "halcyon") // Per il codice
```
== Font disponibili nell'editor online
Nell'editor di typst.app sono disponibili molti font di Google
Fonts, tra cui:
#table(
 columns: (auto, auto, auto),
 stroke: 0.6pt + luma(210),
 fill: (col, row) => if row == 0 { C.blu }
 else if calc.odd(row) { white }
 else { C.sfondo },
 table.header(
 table.cell[#set text(fill:white,weight:"bold"); Famiglia],
 table.cell[#set text(fill:white,weight:"bold"); Tipo],
 table.cell[#set text(fill:white,weight:"bold"); Uso consigliato],
 ),
 [Linux Libertine], [Serif], [Corpo testo, accademico],
 [New Computer Modern],[Serif], [Matematica, scientifico],
 [Libertinus Serif], [Serif], [Alternativa a Libertine],
 [Source Serif 4], [Serif], [Corpo testo leggibile],
 [Noto Serif], [Serif], [Multilingue],
 [Linux Biolinum], [Sans-serif], [Titoli, interfacce],
 [Noto Sans], [Sans-serif], [Presentazioni],
 [Source Sans Pro], [Sans-serif], [Documentazione tecnica],
 [Roboto], [Sans-serif], [Moderno, UI],
 [Fira Code], [Monospace], [Codice sorgente],
 [Cascadia Code], [Monospace], [Codice sorgente],
 [JetBrains Mono], [Monospace], [Codice sorgente],
)
== Pesi e stili del font
```typ
// Pesi disponibili (dipende dal font)
#text(weight: "thin")[Thin]
#text(weight: "extralight")[ExtraLight]
#text(weight: "light")[Light]
#text(weight: "regular")[Regular]
#text(weight: "medium")[Medium]
#text(weight: "semibold")[Semibold]
#text(weight: "bold")[Bold]
#text(weight: "extrabold")[ExtraBold]
#text(weight: "black")[Black]
// Peso numerico (100–900)
#text(weight: 350)[Peso 350]
#text(weight: 700)[Peso 700]
// Stili
#text(style: "normal")[Normale]
#text(style: "italic")[Corsivo]
#text(style: "oblique")[Obliquo]
```
== Misure tipografiche
```typ
// em: relativa al font corrente (1em = dimensione testo)
// 1em di un testo 12pt = 12pt
#set par(leading: 0.75em) // Interlinea 75% della dimensione
// rem: relativa al font di base del documento
// Uguale a em se non sei in un contesto annidato
// ex: altezza della lettera 'x' (circa 0.5em)
// Regola aurea per la tipografia:
// - Corpo testo: 10–12pt per A4
// - Interlinea: 1.2–1.5× il corpo
// - Margini: almeno 2cm, idealmente 2.5–3cm
// - Lunghezza riga: 60–75 caratteri per riga
```
== Highlight e enfasi senza grassetto
```typ
// Evidenziazione (come pennarello)
#highlight(fill: yellow)[testo evidenziato]
#highlight(fill: rgb("#a8d5ff"))[evidenziato in blu]
// Sottolineato
#underline[testo sottolineato]
#underline(stroke: 2pt + red)[sottolineato rosso spesso]
#underline(stroke: (dash: "dashed"))[sottolineato tratteggiato]
#underline(offset: 3pt)[sottolineato più basso]
// Sopralineato
#overline[testo sopralineato]
// Barrato
#strike[testo barrato]
#strike(stroke: 2pt)[barrato spesso]
```
#esempio-box(
 ```
Puoi #highlight(fill: rgb("#fff176"))[evidenziare] il testo,
#underline[sottolinearlo], o anche
#strike[cancellarlo] con stile.
Con #text(tracking: 3pt, weight: "light")[spaziatura delle lettere]
si crea un effetto elegante per i titoli.
```,
 risultato: [
 Puoi #highlight(fill: rgb("#fff176"))[evidenziare] il testo,
 #underline[sottolinearlo], o anche
 #strike[cancellarlo] con stile.
 Con #text(tracking: 3pt, weight: "light")[spaziatura delle lettere]
 si crea un effetto elegante per i titoli.
 ],
 titolo: "Effetti tipografici",
)
// ────────────────────────────────────────────────────────────────
// APPENDICE F — CONTATORI PERSONALIZZATI
// ────────────────────────────────────────────────────────────────
#heading(level: 1, numbering: none)[Appendice D — Contatori e Numerazione]
== Contatori predefiniti
```typ
// Pagina corrente
context counter(page).get().first() // Numero (int)
context counter(page).display() // Stringa formattata
// Totale pagine
context counter(page).final().first() // Totale pagine
// Stile x/y
context counter(page).display("1 / 1", both: true)
// Contatore titoli
context counter(heading).get() // Array (1, 2, 1) → cap 1.2.1
context counter(heading).display("1.1.")
// Contatore figure
context counter(figure.where(kind: image)).display()
// Contatore equazioni
context counter(math.equation).display()
```
== Creare un contatore personalizzato
Molto utile per numerare esempi, esercizi, teoremi, ecc.:
#esempio-box(
 ```
#let cnt-teorema = counter("teorema")
#let teorema(nome, body) = {
 cnt-teorema.step()
 block(
 fill: rgb("#eaf4fb"),
 stroke: (left: 4pt + C.blu2),
 inset: (x: 1em, y: 0.8em),
 radius: 4pt,
 width: 100%,
 )[
 *#text(fill: C.blu2)[Teorema #context cnt-teorema.display()
 #if nome != "" [— #nome]]*
 #parbreak()
 #body
 ]
}
#teorema("Pitagora")[
 In ogni triangolo rettangolo, il quadrato
 dell'ipotenusa è uguale alla somma dei
 quadrati dei cateti: $a^2 + b^2 = c^2$.
]
#teorema("")[
 Ogni numero pari maggiore di 2 è la somma
 di due numeri primi (Congettura di Goldbach).
]
```,
 risultato: [
 #let cnt-teo = counter("teo-ex")
 #let teorema-f(nome, body) = {
 cnt-teo.step()
 block(
 fill: rgb("#eaf4fb"),
 stroke: (left: 4pt + C.blu2),
 inset: (x: 1em, y: 0.7em),
 radius: 4pt,
 width: 100%,
 below: 0.7em,
 )[
 #text(weight: "bold", fill: C.blu2)[
 Teorema #context cnt-teo.display()
 #if nome != "" [— #nome]
 ]
 #parbreak()
 #body
 ]
 }
 #teorema-f("Pitagora")[
 In ogni triangolo rettangolo, $a^2 + b^2 = c^2$.
 ]
 #teorema-f("")[
 Ogni numero pari > 2 è somma di due primi.
 ]
 ],
 titolo: "Contatore teoremi",
)
== Resettare un contatore
```typ
// Reset a 0
#cnt-teorema.update(0)
// Reset a un valore specifico
#counter(page).update(5) // La pagina successiva sarà la 6
// Reset all'inizio di ogni capitolo
#show heading.where(level: 1): it => {
 cnt-teorema.update(0)
 it
}
```
== Visualizzare il numero totale di pagine
Una richiesta comune: mostrare "Pag. X di Y":
```typ
#set page(
 footer: context [
 #h(1fr)
 Pag. #counter(page).display() di
 #counter(page).final().first()
 ]
)
```
// ────────────────────────────────────────────────────────────────
// APPENDICE G — TEMPLATE ISTANTANEI
// ────────────────────────────────────────────────────────────────
#heading(level: 1, numbering: none)[Appendice E — Template Pronti all'Uso]
Di seguito trovi configurazioni complete e pronte per vari
scenari comuni. Copia, incolla, e personalizza (non ringraziatemi).
== Template: Documento generico professionale
```typ
#set document(title: "Titolo", author: "Nome Cognome")
#set page(paper: "a4", margin: (x: 2.5cm, y: 3cm),
 numbering: "1", number-align: center)
#set text(font: ("Linux Libertine", "Georgia"),
 size: 11pt, lang: "it", hyphenate: true)
#set par(justify: true, leading: 0.8em, spacing: 1.2em)
#set heading(numbering: "1.1.")
#show heading.where(level: 1): set text(size: 18pt)
#show heading.where(level: 2): set text(size: 14pt)
#show link: set text(fill: blue)
#show raw: set text(font: ("Fira Code", "Courier New"), size: 9.5pt)
```
== Template: Documento minimalista
```typ
#set page(paper: "a4", margin: 3cm, numbering: "1")
#set text(font: "Linux Libertine", size: 12pt, lang: "it")
#set par(justify: true, leading: 0.9em)
#show heading: set text(font: "Linux Biolinum")
```
== Template: Documento tecnico (stile manuale)
```typ
#set document(title: "Manuale Tecnico", author: "Team Dev")
#set page(
 paper: "a4",
 margin: (left: 3.5cm, right: 2.5cm, top: 2.5cm, bottom: 2.5cm),
 numbering: "1",
 header: context {
 if counter(page).get().first() > 1 {
 grid(columns: (1fr, auto),
 text(size: 8.5pt, fill: luma(150))[_Manuale Tecnico_],
 text(size: 8.5pt, fill: luma(150))[Pag. #counter(page).display()],
 )
 v(-0.5em)
 line(length: 100%, stroke: 0.4pt + luma(210))
 }
 },
)
#set text(font: ("Linux Libertine","Georgia"), size: 11pt, lang:"it")
#set par(justify: true)
#set heading(numbering: "1.1.")
#show raw.where(block: true): it => block(
 fill: luma(245), inset: 1em, radius: 5pt,
 stroke: 0.5pt + luma(200), width: 100%,
)[#set text(font: ("Fira Code","Courier New"), size: 9.5pt); #it]
```
== Template: Dispensa universitaria
```typ
#set document(title: "Dispensa", author: "Prof. Cognome")
#set page(paper: "a4",
 margin: (x: 2.5cm, y: 3cm),
 numbering: "1",
 header: context {
 let p = counter(page).get().first()
 if p > 1 {
 line(length: 100%, stroke: 0.4pt + luma(220))
 v(-0.6em)
 align(right, text(size: 8.5pt, fill: luma(130))[
 Corso di Laurea in ... · #p
 ])
 }
 })
#set text(font: ("Linux Libertine","Georgia"), size: 11pt, lang:"it")
#set par(justify: true, leading: 0.8em)
#set heading(numbering: "1.")
#set math.equation(numbering: "(1)", supplement: "Eq.")
#set figure(supplement: "Figura")
// Box teorema, definizione, esempio
#let teorema(titolo: "Teorema", body) = block(
 fill: rgb("#eaf4fb"), stroke: (left: 4pt + blue),
 inset: 1em, radius: 4pt, width: 100%,
)[*#titolo.* #body]
#let definizione-d(titolo: "Definizione", body) = block(
 fill: rgb("#eafaf1"), stroke: (left: 4pt + green),
 inset: 1em, radius: 4pt, width: 100%,
)[*#titolo.* #body]
#let esempio-d(body) = block(
 fill: rgb("#fef9e7"), stroke: (left: 4pt + orange),
 inset: 1em, radius: 4pt, width: 100%,
)[*Esempio.* #body]
```
== Template: Newsletter / Bollettino
```typ
#set document(title: "Newsletter")
#set page(paper: "a4", margin: (x: 1.5cm, y: 2cm),
 columns: 2, numbering: none)
#set text(font: ("Linux Libertine","Georgia"), size: 10pt)
#set par(justify: true, leading: 0.7em)
// Titolo a piena larghezza (fuori dalle colonne)
// Usa una pagina iniziale senza colonne per l'header:
#page(columns: 1)[
 #align(center)[
 #block(fill: rgb("#1a3a5c"), width: 100%,
 inset: (x: 2em, y: 1.5em))[
 #text(fill: white, size: 28pt, weight: "bold")[
 LA MIA NEWSLETTER
 ]
 #linebreak()
 #text(fill: rgb("#aed6f1"), size: 11pt)[
 Volume 1 · Giugno 2026
 ]
 ]
 ]
 #v(0.5em)
]
// Da qui il testo va su 2 colonne
```
== Template: Poster accademico (A1)
```typ
#set document(title: "Poster")
#set page(
 paper: "a1",
 flipped: true,
 margin: 1.5cm,
)
#set text(font: ("Linux Libertine","Georgia"), lang: "it")
// Suddividi in 3 colonne con grid
#grid(
 columns: (1fr, 2fr, 1fr),
 gutter: 1cm,
 // Colonna sinistra: metodi
 block(width: 100%)[
 #heading(level: 2, numbering: none)[Metodi]
 ...
 ],
 // Colonna centrale: risultati principali
 block(width: 100%)[
 #heading(level: 2, numbering: none)[Risultati]
 ...
 ],
 // Colonna destra: conclusioni
 block(width: 100%)[
 #heading(level: 2, numbering: none)[Conclusioni]
 ...
 ],
)
```
/* 
// ────────────────────────────────────────────────────────────────
// APPENDICE I — PERCORSO DI APPRENDIMENTO CONSIGLIATO
// ────────────────────────────────────────────────────────────────
#heading(level: 1, numbering: none)[Appendice I — Percorso di Apprendimento]
Questo manuale è denso. Se ti senti sopraffatto, ecco il *percorso minimo* per iniziare a produrre documenti reali
nel minor tempo possibile.
== Settimana 1 — Le basi essenziali
Se hai solo una settimana, concentrati su:
#table(
 columns: (auto, 1fr, auto),
 stroke: 0.6pt + luma(210),
 fill: (col, row) => if row == 0 { C.blu }
 else if calc.odd(row) { white }
 else { C.sfondo },
 table.header(
 table.cell[#set text(fill:white,weight:"bold"); Giorno],
 table.cell[#set text(fill:white,weight:"bold"); Argomento],
 table.cell[#set text(fill:white,weight:"bold"); Cap.],
 ),
 [Lun], [Installazione, editor online, primo documento], [1–2],
 [Mar], [Testo, grassetto, corsivo, titoli, liste], [3–5],
 [Mer], [Link, immagini, figure], [6–7],
 [Gio], [Tabelle], [8],
 [Ven], [Matematica di base], [9],
 [Sab], [Configurazione pagina con `set`], [17],
 [Dom], [Riscrivere un documento reale con quello imparato], [—],
)
== Mese 1 — Diventare produttivo
Dopo le basi, aggiungi:
+ *Le variabili* (Cap. 13): smetti di ripetere testo
+ *Le regole show* (Cap. 18): personalizza l'aspetto
+ *Box e blocchi* (Cap. 20): crea layout professionali
+ *File multipli* (Cap. 23): organizza progetti grandi
+ *Un pacchetto* (Cap. 24): inizia con `showybox`
== Segnali di progresso
Sai usare Typst bene quando riesci a:
#table(
 columns: (auto, 1fr),
 stroke: 0.6pt + luma(210),
 fill: (col, row) => if row == 0 { C.blu }
 else if calc.odd(row) { white }
 else { C.sfondo },
 table.header(
 table.cell[#set text(fill:white,weight:"bold"); Livello],
 table.cell[#set text(fill:white,weight:"bold"); Capacità],
 ),
 [ Principiante], 
 [Creare un documento con titoli, testo, liste e una tabella],
 [ Base], 
 [Impostare font, margini, numerazione pagina e un indice],
 [ Intermedio], 
 [Creare funzioni personalizzate e box riusabili],
 [ Avanzato],
 [Scrivere template completi con show rules e contatori],
 [ Esperto], 
 [Creare pacchetti, usare context/query, diagrammi con CeTZ],
)
== Il prossimo passo
Dopo questo manuale, il modo migliore per migliorare è:
+ *Riscrivi un documento che già hai* in Typst
 (una relazione, una tesi, appunti di un corso)
+ *Esplora i template* su typst.app/universe — molti sono
 ottimi esempi da cui imparare
+ *Fai domande* nel forum e nel Discord — la community
 è molto accogliente
+ *Contribuisci* — se risolvi un problema interessante,
 condividi il template con la comunità
#consiglio[
 Il segreto per padroneggiare Typst non è leggere manuali,
 ma *usarlo ogni giorno* per documenti reali. Inizia da piccolo:
 riscrivi il prossimo appunto di lezione o la prossima
 relazione direttamente in Typst.
]
*/
/*
// ────────────────────────────────────────────────────────────────
// APPENDICE L — DOMANDE FREQUENTI (FAQ)
// ────────────────────────────────────────────────────────────────
#heading(level: 1, numbering: none)[Appendice F — Domande Frequenti (FAQ)]

*Typst è gratuito?*

Sì. Typst è software open-source con licenza Apache 2.0.
L'editor online ha un piano gratuito con funzionalità
sufficienti per quasi tutti gli usi. I piani a pagamento
aggiungono spazio di archiviazione e collaborazione in team.
*Posso usarlo senza connessione internet?*

Sì, se installi il compilatore localmente (vedi Cap. 2).
Lavori con il tuo editor preferito e compili offline.
*Typst produce solo PDF?*

Attualmente il principale output è PDF. È in sviluppo
il supporto a HTML (per documenti web). Per altri formati
si può usare strumenti come Pandoc.
*Posso importare documenti Word (.docx)?*

Non direttamente. Dovrai riscrivere il contenuto in Typst.
Tuttavia, se il tuo documento è già in Markdown, la
conversione è spesso semplice dato che molte sintassi
coincidono.
*Come faccio a usare caratteri speciali italiani?*

Scrivili direttamente nel file (à, è, ì, ò, ù, É, ecc.)
— Typst gestisce UTF-8 natively. Non serve nessuna macro
speciale come in LaTeX.
*Posso collaborare con altri su un documento?*

Sì. L'editor online supporta la collaborazione in tempo
reale (simile a Google Docs) nei piani a pagamento.
In alternativa, puoi usare Git per il versioning del
codice sorgente `.typ`.
*Le università italiane accettano PDF generati da Typst?*

Le università accettano qualsiasi PDF di qualità
professionale, indipendentemente da come è stato
prodotto. Un PDF Typst è indistinguibile da uno
LaTeX o Word in termini di accettabilità.
*Quanto tempo ci vuole per imparare Typst?*

Per le basi (Cap. 1–10): 2–5 giorni con pratica
costante. Per il livello intermedio: 2–4 settimane.
Per la padronanza completa: qualche mese di uso regolare.
*Typst sostituirà LaTeX?*

Typst è già la scelta migliore per chi inizia da zero
o per chi trova LaTeX troppo complesso. LaTeX ha
decenni di template e pacchetti accumulati, quindi
chi lavora in certi campi accademici potrebbe trovare
ancora conveniente usarlo. Ma per nuovi documenti,
Typst è generalmente più produttivo.
*Come faccio a creare diapositive (slides)?*

Usa il pacchetto `polylux` o `touying` (vedi Cap. 27).
In alternativa, imposta `#set page(paper: "presentation-16-9")`
e crea il layout manualmente — è sorprendentemente
semplice per presentazioni semplici.
*Posso usare Typst per scrivere un libro intero?*

Assolutamente sì. Questo manuale stesso è un esempio
di documento lungo (oltre 200 pagine stimate) scritto
interamente in Typst, con indice automatico, numerazione,
stili personalizzati e layout professionale.
*/











// ================================================================
//  APPENDICE — NOTE AGGIUNTIVE
// ================================================================

// ────────────────────────────────────────────────────────────────
//  PARTE I — SLIDE E PRESENTAZIONI: CONFRONTO STRUMENTI
// ────────────────────────────────────────────────────────────────

#heading(level: 1, numbering: none)[
  Appendice F (Parte I) — Note Aggiuntive: Slide e Presentazioni]

Qualche piccola nota aggiuntiva sulle presentazioni di cui abbiamo già parlato.

== Panoramica degli strumenti

#table(
  columns: (auto, 1fr, auto, auto),
  stroke: 0.6pt + luma(210),
  fill: (col, row) => if row == 0 { C.blu }
                      else if calc.odd(row) { white }
                      else { C.sfondo },
  table.header(
    table.cell[#set text(fill: white, weight: "bold"); Strumento],
    table.cell[#set text(fill: white, weight: "bold"); Descrizione],
    table.cell[#set text(fill: white, weight: "bold"); Linguaggio],
    table.cell[#set text(fill: white, weight: "bold"); Output],
  ),
  [*Beamer*],    [Pacchetto LaTeX per slide accademiche],  [LaTeX],      [PDF],
  [*R Markdown*],[Documento computazionale con slide],     [R + Markdown],[PDF / HTML],
  [*Quarto*],    [Successore moderno di R Markdown],       [R / Python], [PDF / HTML / Reveal.js],
  [*knitr*],     [Engine di calcolo per R Markdown/Quarto],[R],          [qualsiasi],
  [*Polylux*],   [Pacchetto Typst per presentazioni],      [Typst],      [PDF],
  [*Touying*],   [Framework Typst avanzato per slide],     [Typst],      [PDF],
)

#v(1em)

// ── BEAMER ───────────────────────────────────────────────────────
=== Beamer

*Beamer* è il pacchetto LaTeX per presentazioni più usato in
ambito accademico e scientifico dal 2003. Produce PDF di alta
qualità tipografica, con equazioni perfette e temi predefiniti
(Warsaw, Madrid, Metropolis, ecc.).

#grid(
  columns: (1fr, 1fr),
  gutter: 1.5em,
  [
    #figure(
      image("beamer.png", width: 100%),
      caption: [Screenshot di esempio preso da #link("https://sv.overleaf.com/learn/latex/Beamer_Presentations%3A_A_Tutorial_for_Beginners_(Part_5)%E2%80%94Themes_and_Handouts")[QUI].],
    )
  ],
  block(fill: C.sfondo, inset: 1.2em, radius: 6pt,
        stroke: 0.5pt + luma(210))[
    *Punti di forza*
    - Qualità tipografica eccellente
    - Temi predefiniti maturi
    - Equazioni LaTeX native
    - Molto diffuso in ambito accademico

    *Limiti*
    - Compilazione lenta (più passaggi)
    - Sintassi verbosa e prolissa
    - Difficile personalizzare i temi
    - Nessun preview in tempo reale
  ],
)

La sintassi base di una slide Beamer:

```latex
\documentclass{beamer}
\usetheme{metropolis}

\begin{document}

\begin{frame}{Titolo della Slide}
  \begin{itemize}
    \item Prima voce
    \pause
    \item Seconda voce (appare dopo click)
  \end{itemize}
\end{frame}

\end{document}
```

// ── R MARKDOWN ───────────────────────────────────────────────────
=== R Markdown

*R Markdown* è un formato che intreccia testo, codice R e output
(grafici, tabelle, risultati) in un unico documento. Può produrre
slide tramite il pacchetto `ioslides`, `revealjs` o `beamer`.

#grid(
  columns: (1fr, 1fr),
  gutter: 1.5em,
  [
    #figure(
      image("rmarkdown.png", width: 100%),
      caption: [Screenshot di esempio preso da #link("https://rmarkdown.rstudio.com/lesson-11.html")[QUI].],
    )
  ],
  block(fill: C.sfondo, inset: 1.2em, radius: 6pt,
        stroke: 0.5pt + luma(210))[
    *Punti di forza*
    - Integra codice R ed output nel documento
    - Grafici generati automaticamente
    - Output multipli: PDF, HTML, Word
    - Diffusissimo in statistica e data science

    *Limiti*
    - Controllo del layout limitato
    - Slide html dipendono dal browser
    - Non ideale per tipografia fine
    - Dipendenza da Pandoc
  ],
)

Struttura di un file R Markdown per slide:

```yaml
---
title: "La Mia Analisi"
output: beamer_presentation
---

## Prima Slide

Testo e codice insieme:

{r}
summary(cars)


## Seconda Slide

$$E = mc^2$$
```

// ── QUARTO ───────────────────────────────────────────────────────
=== Quarto

*Quarto* è il successore ufficiale di R Markdown, sviluppato da
Posit (ex RStudio). Supporta R, Python, Julia e Observable JS.
Ha supporto *nativo* per Typst come formato di output dalla
versione 1.4, il che lo rende un ponte naturale verso Typst.

#grid(
  columns: (1fr, 1fr),
  gutter: 1.5em,
  [
    #figure(
      image("quarto.png", width: 100%),
      caption: [Screenshot di esempio preso da #link("https://quarto.org/docs/gallery/")[QUI].],
    )
  ],
  block(fill: C.sfondo, inset: 1.2em, radius: 6pt,
        stroke: 0.5pt + luma(210))[
    *Punti di forza*
    - Multi-linguaggio (R, Python, Julia)
    - È il mio preferito (conta come punto di forza?)
    - Output Typst nativo (v1.4+)
    - Slide interattive con Reveal.js
    - Ecosistema moderno e attivo (molto strutturato e la possibilità di far girare tanti linguaggi diversi è incredibile)

    *Limiti*
    - Astrazione che nasconde il controllo fine
    - Template Typst limitati rispetto al nativo
    - Curva di apprendimento per le opzioni
  ],
)

Configurazione Quarto con output Typst:

```yaml
---
title: "Analisi Dati"
format:
  typst:
    toc: true
    papersize: a4
    mainfont: "Linux Libertine"
    section-numbering: "1.1."
---

## Sezione

Testo e codice Python:

{python}
import numpy as np
print(np.mean([1, 2, 3, 4, 5]))
```

// ── KNITR ────────────────────────────────────────────────────────
=== knitr

*knitr* è il motore di calcolo sottostante a R Markdown e Quarto.
Esegue i blocchi di codice, cattura l'output (testo, grafici,
tabelle) e lo inserisce nel documento. Con knitr puoi generare
output Typst direttamente da R.

#grid(
  columns: (1fr, 1fr),
  gutter: 1.5em,
  [
    #figure(
      image("knitr.png", width: 100%),
      caption: [Screenshot di esempio preso da #link("https://stackoverflow.com/questions/28000062/tables-and-figures-side-by-side-in-knitr-or-rmarkdown-beamer")[QUI].],
    )
  ],
  block(fill: C.sfondo, inset: 1.2em, radius: 6pt,
        stroke: 0.5pt + luma(210))[
    *Punti di forza*
    - Integrazione totale con R
    - Cache dei risultati computazionali
    - Supporto output Typst (knitr ≥ 1.45)
    - `tinytable`: tabelle R → Typst nativo

    *Limiti*
    - Solo per R (non Python)
    - Richiede R installato
    - Latenza di compilazione R
  ],
)

Uso di knitr con output Typst:

```r
library(knitr)

# Imposta l'output Typst
opts_knit$set(out.format = "typst")

# Le tabelle vengono convertite automaticamente
knitr::kable(head(mtcars, 3), format = "pipe")

# Con tinytable (output Typst nativo)
library(tinytable)
tt(head(iris, 5)) |>
  style_tt(i = 0,
           background = "#1a3a5c",
           color = "white")
```

// ── POLYLUX ──────────────────────────────────────────────────────
=== Polylux

*Polylux* è il pacchetto Typst più diffuso per le presentazioni.
Aggiunge la gestione degli overlay (rivelazione progressiva degli
elementi) e la modalità relatore al sistema di pagine di Typst.

#grid(
  columns: (1fr, 1fr),
  gutter: 1.5em,
  [
    #figure(
      image("polylux.png", width: 100%),
      caption: [Screenshot di esempio preso da #link("https://forum.typst.app/t/academic-slides-in-typst-an-actual-use-case-example-using-touying-and-touying-unistra-pristine/4606")[QUI].],
    )
  ],
  block(fill: C.sfondo, inset: 1.2em, radius: 6pt,
        stroke: 0.5pt + luma(210))[
    *Punti di forza*
    - Sintassi Typst nativa
    - Overlay e pause semplici
    - Layout completamente libero
    - Nessun tema predefinito da imparare

    *Limiti*
    - Temi predefiniti limitati
    - Meno "magico" di Beamer
    - Richiede più configurazione
  ],
)

Struttura base di una presentazione Polylux:

```typ
#import "@preview/polylux:0.3.1": *

#set page(paper: "presentation-16-9")
#set text(font: "Linux Libertine", size: 22pt)

#polylux-slide[
  = Titolo della Presentazione

  #align(center + horizon)[
    Sottotitolo descrittivo
    #v(1em)
    _Autore · Istituzione · Anno_
  ]
]

#polylux-slide[
  == Contenuto con rivelazione progressiva

  - Prima voce sempre visibile
  #pause
  - Seconda voce appare al click
  #pause
  - Terza voce appare dopo
]

#polylux-slide[
  == Due colonne

  #grid(columns: (1fr, 1fr), gutter: 2em,
    [*Colonna sinistra*\ Testo e contenuto],
    [*Colonna destra*\ Altro contenuto],
  )
]
```

// ── TOUYING ──────────────────────────────────────────────────────
=== Touying

*Touying* è il framework Typst più avanzato per presentazioni.
Offre temi predefiniti professionali (Metropolis, University,
Dewdrop, Stargazer...) e una gestione degli overlay molto sofisticata.

#grid(
  columns: (1fr, 1fr),
  gutter: 1.5em,
  [
    #figure(
      image("touying.png", width: 100%),
      caption: [Screenshot di esempio preso da #link("https://typst.app/universe/package/touying-simpres/")[QUI].],
      
    )
  ],
  block(fill: C.sfondo, inset: 1.2em, radius: 6pt,
        stroke: 0.5pt + luma(210))[
    *Punti di forza*
    - Temi maturi e professionali
    - Overlay avanzati (`#uncover`, `#only`)
    - Handout mode automatico
    - Barra di navigazione integrata

    *Limiti*
    - API più complessa di Polylux
    - Versioni cambiano spesso (controlla Universe)
    - Richiede più studio iniziale
  ],
)

Setup Touying con tema University:

```typ
#import "@preview/touying:0.5.3": *
#import themes.university: *

#show: university-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Il Titolo della Presentazione],
    subtitle: [Sottotitolo],
    author: [Mario Rossi],
    institution: [Università di Milano],
    date: datetime.today(),
  ),
)

// Slide titolo automatica
#title-slide()

// Sezione
= Prima Sezione

== Slide con overlay

#pause

Primo elemento — appare subito.

#pause

Secondo elemento — appare al secondo click.

== Slide con uncover

#uncover("2-")[Visibile dalla slide 2 in poi]
#only(3)[Visibile SOLO nella slide 3]
```

== Confronto finale: quale scegliere?

#table(
  columns: (auto, 1fr, auto, auto, auto),
  stroke: 0.6pt + luma(210),
  fill: (col, row) => if row == 0 { C.blu }
                      else if calc.odd(row) { white }
                      else { C.sfondo },
  table.header(
    table.cell[#set text(fill:white,weight:"bold"); Strumento],
    table.cell[#set text(fill:white,weight:"bold"); Ideale per],
    table.cell[#set text(fill:white,weight:"bold"); Curva],
    table.cell[#set text(fill:white,weight:"bold"); Qualità PDF],
    table.cell[#set text(fill:white,weight:"bold"); Codice+Dati],
  ),
  [Beamer],    [Articoli accademici con slide],       [Alta],   [★★★★★], [No],
  [R Markdown],[Data science, statistica],            [Media],  [★★★☆☆], [R],
  [Quarto],    [Multi-lingua, riproducibilità],       [Media],  [★★★★☆], [R/Python],
  [knitr],     [Engine sottostante a Quarto/Rmd],     [Media],  [★★★★☆], [R],
  [Polylux],   [Slide personalizzate in Typst],       [Bassa],  [★★★★★], [No],
  [Touying],   [Slide accademiche con temi pronti],   [Media],  [★★★★★], [No],
)

#consiglio[
  Se già conosci LaTeX e vuoi la massima compatibilità con
  riviste e conferenze → *Beamer*.
  Se lavori con dati R/Python e vuoi riproducibilità
  computazionale → *Quarto* (con output Typst per la qualità).
  Se vuoi il controllo totale sul design e stai già usando
  Typst → *Touying* per temi pronti, *Polylux* per
  massima libertà.
]
In generale scegli quello che ti sembra il più semplice per quello che devi fare, io amo quarto: è bello, facile, veloce (ha un sacco di #link("https://quarto.org/docs/get-started/")[Documentazione]) e la piattaforma #link("https://posit.cloud/content/yours?sort=name_asc")[Posit Cloud] è fantastica.


// ────────────────────────────────────────────────────────────────
//  PARTE II — PROGRAMMAZIONE E AUTOMAZIONE
// ────────────────────────────────────────────────────────────────
#heading(level: 1, numbering: none)[
  Appendice F (Parte II) — Note Aggiuntive: Programmazione e Automazione
]

== Il pacchetto Python `typst`

Il pacchetto ufficiale `typst` per Python consente di compilare
documenti `.typ` direttamente da Python, senza usare il
terminale o chiamate a `subprocess`.

```bash
pip install typst
```

=== Compilare un file

```python
import typst

# Compila un file .typ esistente → PDF
typst.compile("documento.typ", output="documento.pdf")

# Compila da stringa Python → bytes PDF in memoria
sorgente = """
= Titolo generato da Python

Data odierna: #datetime.today().display()

- Prima voce
- Seconda voce
"""
pdf_bytes = typst.compile(sorgente)

with open("output.pdf", "wb") as f:
    f.write(pdf_bytes)
```

=== Passare parametri con sys.inputs

`sys.inputs` permette di iniettare valori stringa nel documento
Typst dall'esterno, senza modificare il file sorgente:

```python
import typst

typst.compile(
    "template.typ",
    output="report-mario.pdf",
    sys_inputs={
        "autore":   "Mario Rossi",
        "titolo":   "Report Trimestrale",
        "data":     "Giugno 2026",
        "versione": "2.1",
    },
)
```

Nel file `template.typ`, leggi i valori così:

```typ
// I valori arrivano sempre come stringhe
#let autore   = sys.inputs.at("autore",   default: "Autore")
#let titolo   = sys.inputs.at("titolo",   default: "Documento")
#let data     = sys.inputs.at("data",     default: "")
#let versione = sys.inputs.at("versione", default: "1.0")

#set document(title: titolo, author: autore)

= #titolo

Redatto da *#autore* — #data — versione #versione
```

Da riga di comando il meccanismo equivalente è:

```bash
typst compile template.typ report.pdf \
  --input autore="Mario Rossi" \
  --input titolo="Report Trimestrale" \
  --input data="Giugno 2026"
```

== Leggere dati JSON nel documento

Per strutture dati complesse (tabelle, liste, metriche) è
più pratico passare un file JSON che usare `sys.inputs`:

```typ
// Nel documento Typst: legge dati.json dalla stessa cartella
#let dati = json("dati.json")

// Accedi ai campi come un dizionario normale
= #dati.titolo

Autore: #dati.autore — Data: #dati.data

// Genera una tabella dai dati
#table(
  columns: dati.intestazioni.len(),
  stroke: 0.6pt + luma(200),
  fill: (_, row) => if row == 0 { C.blu } else { white },
  table.header(
    ..dati.intestazioni.map(h =>
      table.cell[#set text(fill: white, weight: "bold"); #h]
    ),
  ),
  ..dati.righe.map(r => r.map(c => [#c])).flatten(),
)
```

Il file `dati.json` corrispondente:

```json
{
  "titolo":  "Report Vendite — Q2 2026",
  "autore":  "Team Analytics",
  "data":    "30 giugno 2026",
  "intestazioni": ["Regione", "Fatturato", "Ordini", "Trend"],
  "righe": [
    ["Nord",   "€ 58.100", "312", "↑ +8%"],
    ["Centro", "€ 41.200", "228", "↑ +15%"],
    ["Sud",    "€ 43.000", "307", "↑ +13%"]
  ]
}
```

Da Python, genera il JSON e compila:

```python
import typst, json
from datetime import date

dati = {
    "titolo":  f"Report Vendite — Q2 {date.today().year}",
    "autore":  "Team Analytics",
    "data":    date.today().strftime("%d/%m/%Y"),
    "intestazioni": ["Regione", "Fatturato", "Ordini", "Trend"],
    "righe": [
        ["Nord",   "€ 58.100", "312", "↑ +8%"],
        ["Centro", "€ 41.200", "228", "↑ +15%"],
        ["Sud",    "€ 43.000", "307", "↑ +13%"],
    ],
}

with open("dati.json", "w", encoding="utf-8") as f:
    json.dump(dati, f, ensure_ascii=False, indent=2)

typst.compile("template.typ", output="report.pdf")
print(" report.pdf generato!")
```

== Il pattern Dati → Template → PDF

Il flusso fondamentale per la produzione automatica di documenti:

#block(
  fill: C.sfondo,
  stroke: 0.6pt + luma(210),
  inset: 1.5em,
  radius: 8pt,
  width: 100%,
)[
  #align(center)[
    #set text(size: 10.5pt)
    #grid(
      columns: (auto, auto, auto, auto, auto),
      gutter: 0.8em,
      align: center + horizon,
      block(fill: C.blu, inset: (x:1em,y:0.7em),
            radius: 5pt)[
        #set text(fill: white, weight: "bold")
        Dati \ (JSON/CSV/DB)
      ],
      text(size: 18pt, fill: C.blu2)[→],
      block(fill: C.blu, inset: (x:1em,y:0.7em),
            radius: 5pt)[
        #set text(fill: white, weight: "bold")
        Template \ (.typ)
      ],
      text(size: 18pt, fill: C.blu2)[→],
      block(fill: C.verde, inset: (x:1em,y:0.7em),
            radius: 5pt)[
        #set text(fill: white, weight: "bold")
        PDF \ finale
      ],
    )
  ]
]

Casi d'uso reali per questo pattern:

- *Certificati personalizzati*: 500 certificati da un CSV
  con nomi e date — un solo template, un loop Python
- *Report settimanali*: dati da database → JSON → PDF
  inviato via email ogni lunedì mattina
- *Fatture automatiche*: ogni ordine del gestionale
  genera il suo PDF in pochi millisecondi
- *Dispense universitarie*: i docenti aggiornano i dati
  in un foglio Google → il PDF si rigenera da solo

== Produzione in batch: esempio certificati

```python
import typst, csv, os

# template-certificato.typ deve avere:
# #let nome = sys.inputs.at("nome", default: "")
# #let corso = sys.inputs.at("corso", default: "")
# #let data  = sys.inputs.at("data",  default: "")

os.makedirs("certificati", exist_ok=True)

with open("partecipanti.csv", newline="", encoding="utf-8") as f:
    for riga in csv.DictReader(f):
        typst.compile(
            "template-certificato.typ",
            output=f"certificati/{riga['id']}.pdf",
            sys_inputs={
                "nome":  riga["nome"],
                "corso": riga["corso"],
                "data":  riga["data"],
            },
        )
        print(f"Certificato per {riga['nome']} generato.")

print("Tutti i certificati sono pronti!")
```

== Integrazione con FastAPI

Per generare PDF on-demand tramite un'API web:

```python
from fastapi import FastAPI
from fastapi.responses import Response
import typst, json, tempfile, os

app = FastAPI()

@app.post("/pdf/report",
          response_class=Response,
          responses={200: {"content": {"application/pdf": {}}}})
async def genera_report(dati: dict):
    # Scrivi il JSON temporaneo
    with tempfile.NamedTemporaryFile(
            mode="w", suffix=".json",
            delete=False, encoding="utf-8") as f:
        json.dump(dati, f, ensure_ascii=False)
        json_path = f.name

    try:
        # Compila (typst legge il json dallo stesso path
        # solo se il template usa json("dati.json") con path assoluto)
        pdf = typst.compile("template-report.typ")
        return Response(
            content=pdf,
            media_type="application/pdf",
            headers={"Content-Disposition":
                     "attachment; filename=report.pdf"},
        )
    finally:
        os.unlink(json_path)
```

== GitHub Actions: report automatici

```yaml
# .github/workflows/report.yml
name: Report Settimanale
on:
  schedule:
    - cron: "0 7 * * 1"   # Ogni lunedì alle 7:00 UTC

jobs:
  genera:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Setup Python
        uses: actions/setup-python@v5
        with: { python-version: "3.12" }

      - name: Setup Typst
        uses: typst-community/setup-typst@v3

      - name: Installa dipendenze
        run: pip install typst pandas

      - name: Genera dati e PDF
        run: |
          python scripts/genera_dati.py   # crea dati.json
          typst compile template.typ report.pdf

      - name: Carica artifact
        uses: actions/upload-artifact@v4
        with:
          name: report-settimanale
          path: report.pdf
```

== Buone pratiche per Typst in produzione

#table(
  columns: (auto, 1fr),
  stroke: 0.6pt + luma(210),
  fill: (col, row) => if row == 0 { C.blu }
                      else if calc.odd(row) { white }
                      else { C.sfondo },
  table.header(
    table.cell[#set text(fill:white,weight:"bold"); Pratica],
    table.cell[#set text(fill:white,weight:"bold"); Motivazione],
  ),
  [*Separa dati e template*],
    [Il `.typ` non cambia ad ogni esecuzione; i dati sì.
     Mantenerli separati semplifica manutenzione e debug.],
  [*Versiona i template con Git*],
    [Se un aggiornamento del template rompe i PDF, puoi
     tornare alla versione precedente in un comando.],
  [*Specifica la versione Typst*],
    [Aggiungi `typst.toml` al progetto con la versione
     esatta usata, per garantire riproducibilità nel tempo.],
  [*Testa con dati estremi*],
    [Tabelle con 0 righe, nomi lunghissimi, caratteri
     speciali (accenti, emoji): verifica che il template regga.],
  [*Font inclusi nel repository*],
    [Se usi font personalizzati, mettili nella cartella
     del progetto per evitare differenze tra macchine.],
  [*Usa `default:` in sys.inputs*],
    [Ogni `sys.inputs.at()` dovrebbe avere un valore di
     default per evitare crash se un parametro manca.],
)













// ────────────────────────────────────────────────────────────────
// PAGINA FINALE
// ────────────────────────────────────────────────────────────────
#page(numbering: none, header: none)[
 #v(1fr)
 #align(center)[
 #block(
 fill: gradient.linear(
 C.blu, rgb("#0d2137"),
 angle: 135deg,
 ),
 width: 80%,
 inset: (x: 2em, y: 2em),
 radius: 12pt,
 )[
 #set text(fill: white)
 #align(center)[
 #text(size: 24pt, weight: "bold")[Sei arrivato (finalmente) alla fine!]
 #v(0.8em)
 #text(size: 13pt, fill: C.blu3)[
 Ora hai tanti, se non tutti, gli strumenti per creare\
 documenti professionali con Typst.
 ]
 #v(1.2em)
 #line(length: 50%, stroke: 1pt + C.blu3)
 #v(1.2em)
 #text(size: 12pt, fill: C.blu3)[
 Il modo migliore per imparare è ovviamente *praticare* e *praticare*.\
 Spero che questo handbook vi sia stato utile.
 
 Per qualsiasi cosa fatemi sapere sulla mia pagina contatti:
 
 #link("https://stefanocoelatirama.com/")[STEFANO COELATI RAMA]
 
 ]
 #v(1em)
 
 ]
 ]
 ]
 #v(1fr)
 #align(center)[
 #text(size: 9pt, fill: luma(150))[
 ]
 ]
 #v(1cm)
]

