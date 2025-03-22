#import "properties.typ": pmi_heading_line_thin_stroke, pmi_header_line_height

#let pmi_body_line_height = pmi_header_line_height / 2
#let pmi_heading_with_lines(
  heading_margin_before: 0mm,
  heading_line_spacing: 0mm,
  text-size: 14.3pt,
  text-weight: "bold",
  text-prefix: "",
  text-suffix: "",
  counter-suffix: "",
  it
) = {
  set text(
    font: "Roboto"
    fallback: false,
    weight: text-weight,
    size: text-size
  )
  block(
    breakable: false,
    inset: 0pt,
    outset: 0pt,
    fill: none
  )[
    #stack(
      v(heading_margin_before),
      line(
        length: 100%,
        stroke: pmi_heading_line_thin_stroke
      ),
      v(heading_line_spacing),
      block({
        text-prefix
        if it.outline and it.numbering != none {
          counter(heading).display(it.numbering)
          counter-suffix
          h(2pt)
        }
        it.body
        text-suffix
      }),
      v(heading_line_spacing),
      line(
        length: 100%,
        stroke: pmi_heading_line_thin_stroke
      ),
      v(10pt)
    )
  ]
}

#let pmi_section_lines(
  above: 1.8em,
  below: 1.2em,
  ruled: true,
  body
) = {
  block(
    width: 100%,
    inset: 0mm,
    outset: 0mm,
    above: above,
    below: below,
    {
      set block(spacing: 0.2em)
      if ruled {
        line(length: 100%, stroke: pmi_body_line_height)
      }
      body
      if ruled {
        line(length: 100%, stroke: pmi_body_line_height)
      }
    }
  )
}

#let pmi_section(title) = {
  pmi_section_lines(text(title, font: "Roboto", weight: "bold", size: 11pt))
}

#let pmi_subsection(title) = {
  pmi_section_lines(above: 1.4em, below: 1em, text(title, font: "Roboto", weight: "regular", size: 11pt))
}

#let pmi_subsection_unruled(title) = {
  pmi_section_lines(above: 1.4em, below: 1em, ruled: false, text(title, font: "Roboto", weight: "regular", size: 11pt))
}