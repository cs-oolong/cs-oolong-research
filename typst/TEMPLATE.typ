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
  block(width: 100%, height: 100%, breakable: false)[
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

#slide(title: [Agenda], subtitle: [Basic list syntax])[
  - Why cake makes a friendly example
  - Ingredients as structured content
  - Layout patterns you can reuse
  - Replace this content with your real talk

  #v(6pt)
  #callout(label: [Editing tip])[
    Each `#slide(...)[...]` block becomes one PDF page.
  ]
]

#slide(title: [Two-column slide], subtitle: [Use `grid` for side-by-side layouts])[
  #two-col(
    [
      #text(weight: "bold")[Ingredients]
      - Flour
      - Sugar
      - Butter
      - Eggs
      - Cocoa powder
    ],
    [
      #text(weight: "bold")[Process]
      1. Mix dry ingredients.
      2. Add wet ingredients.
      3. Bake until set.
      4. Cool before frosting.
    ],
  )
]

#slide(title: [Emphasis and inline code])[
  Typst supports _emphasis_, *strong text*, `inline code`, and links like
  #link("https://typst.app/docs/")[Typst docs].

  #v(8pt)
  #callout(label: [Cake principle])[
    Keep one key idea per slide, then use bullets or a short visual to support it.
  ]

  #v(8pt)
  #tag[template] #h(6pt) #tag[syntax] #h(6pt) #tag[cake]
]

#slide(title: [Simple table])[
  #table(
    columns: (1fr, 1fr, 1fr),
    inset: 6pt,
    stroke: 0.7pt + theme.border,
    fill: (_, y) => if y == 0 { theme.panel },
    [Layer], [Flavor], [Role],
    [Base], [Vanilla sponge], [Structure],
    [Middle], [Berry jam], [Contrast],
    [Top], [Buttercream], [Finish],
  )
]

#slide(title: [Quote or closing slide])[
  #align(center)[
    #v(22pt)
    #text(size: 21pt, weight: "bold", fill: theme.heading)[
      “A good template is like a good cake: simple layers, easy to customize.”
    ]
    #v(10pt)
    #text(size: 12pt, fill: theme.muted)[Replace this with your takeaway.]
  ]
]
