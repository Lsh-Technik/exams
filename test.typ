#let print = false
#let background = if print { white } else { rgb("#212224") }
#let foreground = if print { black } else { rgb("#B6B3B4") }
#let input-intended = color.mix((foreground, 7.5%), (background, 92.5%))

#let test(
  subject: none,
  qualification: none,
  section: none,
  pass-requirements: none,
  questions: (),
  notes: true,
  body,
) = {
  set page(
    fill: background,
    margin: 2cm,
    header: [
      #raw(datetime.today().display())
      #h(1fr)
      Technikteam LSH Marquartstein
      #h(1fr)
      `tests v0.1.0`
    ],
  )
  set text(size: 14pt, fill: foreground)
  set table(stroke: color.mix((foreground, 30%), (background, 70%)))
  set rect(
    stroke: foreground,
    fill: input-intended,
  )
  show heading: text.with(11pt)


  // title
  align(
    center,
    text(
      20pt,
      weight: "light",
      (subject, qualification, section)
        .filter(part => part != none)
        .join([ --- ]),
    ),
  )

  // reference for the inputs
  let checkbox = rect(width: 1em, height: 1em, radius: 0.45em)
  let number-entry = rect(width: 4em, height: 1em)

  box[
    #box(move(dy: 0.2em, checkbox)) $-->$ Ja/Nein Frage, Ankreuzen falls richtig \
    #box(move(dy: 0.2em, number-entry)) $-->$ Anzahl oder Nummer nötig
  ]

  // the actual table
  set table(
    stroke: 0.05em + luma(30%),
    inset: 8pt,
  )

  let columns = (1fr, auto)
  let column-titles = ([Frage],)
  if notes {
    columns.push(12em)
    column-titles.push[Richtig?]
    column-titles.push[Notizen]
  } else {
    column-titles.push[Antwort]
  }

  column-titles = column-titles.map(it => align(center, strong(it)))
  table(
    columns: columns,
    ..column-titles,
    ..questions
      .map(body => {
        let show-input = not (
          body.func() == heading
          or (body.has("children") and body.children.any(entry => entry.func() == heading)))
        let row = (
          align(left, body),
          align(horizon + center, if show-input {
            if body.has("text") and lower(body.text).contains(regex("nummer|anzahl")) {
              number-entry
            } else {
              checkbox
            }
          } else {
            none
          }),
        )
        
        if notes { row.push(none) }
        row
      })
      .flatten(),
    [Fehler ingesamt nach Bewertung], number-entry,
  )

  [Anforderungen zum Bestehen: #pass-requirements]

  body
}

// vim: ft=rust ts=2 sw=2 et
