// Simple Typst slide deck template
// Compile with: typst compile presentation-jul-3.typ presentation-jul-3.pdf
// Replace the cake-themed content below with your own.

// --- Theme ---------------------------------------------------------------
#let theme = (
  bg: rgb("#ffffff"),
  text: rgb("#1f2937"),
  heading: rgb("#000000"),
  muted: rgb("#6b7280"),
  panel: rgb("#f3f4f6"),
  border: rgb("#d1d5db"),
)

#set page(
  width: 16cm,
  height: 9cm,
  margin: (x: 32pt, y: 22pt),
  fill: theme.bg,
  footer: context align(right)[
    #text(size: 8pt, fill: theme.muted)[#counter(page).display()]
  ],
)
#set text(font: "New Computer Modern", size: 14pt, fill: theme.text)
#set par(leading: 0.5em)
#set list(indent: 1em, body-indent: 0.45em)
#set heading(numbering: none)
#show heading: set text(font: "New Computer Modern")
// Use alphanumeric labels for citations (e.g. [Rai25])
#set cite(style: "alphanumeric")
// Make inline citations blue and clickable
#show ref: it => {
  text(fill: rgb("#2563eb"))[#it]
}

// --- Reusable slide helpers ---------------------------------------------
// Use content blocks for titles/subtitles so you can include emphasis or code.
#let title-slide(title, subtitle: none, author: none, date: none) = {
  pagebreak(weak: true)
  block(width: 100%, height: 100%, breakable: false)[
    #align(center)[
      #v(28pt)
      #text(size: 30pt, weight: "bold", fill: theme.heading)[#title]

      #if subtitle != none [
        #v(6pt)
        #text(size: 15pt, fill: theme.muted)[#subtitle]
      ]

      #v(26pt)
      #if author != none [
        #text(size: 12pt, fill: theme.text)[#author]
      ]
      #if date != none [
        #v(3pt)
        #text(size: 11pt, fill: theme.muted)[#date]
      ]
    ]
  ]
}

#let slide(title: none, subtitle: none, body) = {
  pagebreak(weak: true)
  block(width: 100%, breakable: true)[
    #if title != none [
      #text(size: 22pt, weight: "bold", fill: theme.heading)[#title]
    ]
    #if subtitle != none [
      #v(3pt)
      #text(size: 11pt, fill: theme.muted)[#subtitle]
    ]
    #if title != none or subtitle != none [
      #v(9pt)
    ]
    #body
  ]
}

#let two-col(left, right) = grid(
  columns: (1fr, 1fr),
  gutter: 18pt,
  left, right,
)

#let callout(label: [Note], body) = block(
  width: 100%,
  fill: theme.panel,
  stroke: 1pt + theme.border,
  radius: 7pt,
  inset: 9pt,
  breakable: false,
)[
  #text(weight: "bold", fill: theme.heading)[#label]
  #v(3pt)
  #body
]

#let tag(body) = box(
  fill: theme.heading,
  radius: 5pt,
  inset: (x: 8pt, y: 3pt),
)[#text(size: 10pt, fill: white, weight: "bold")[#body]]

// --- Content slides ------------------------------------------------------
#title-slide(
  [Horus Project Updates],
  subtitle: [Injection Attacks in LLMs],
  author: [Ana Clara Zoppi Serpa],
  date: [July 3],
)

#slide(title: [Past Presentation Recap])[
  - Read @guardieiro2025instaboost
  - Cluster setup, model downloads, exploratory experiments inspired by @herring2026cna @nousresearch2026neuralsteering
]

#slide(title: [Present])[
  - Read paper @rai2025practicalreviewmechanisticinterpretability (helpful!)
  - Found mech-interp collection on GitHub @rai2025awesomemechinterp, similar to the previous `awesome-*` series (`awesome-jailbreak-papers`, `awesome-llm-papers` etc.)
  - `nnsight` tutorials @nnsight2025tutorials
  - Research Questions exercise
  - Found `marimo` @marimo2023
]

#slide(title: [References])[
  #bibliography("references.bib", style: "chicago-author-date", title: none)
]
