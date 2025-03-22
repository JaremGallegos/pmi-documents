#import "../format.typ": format_date

#let pmi_make_title(
  inner_page_margin_top,
  title_rule,
  accent_color,
  on_accent_color,
  text_color,
  colorback,
  logo_element,
  logo_height,
  info,
  dict
) = {
  let text_on_accent_color = if colorback {
    on_accent_color
  } else {
    text_color
  }

  let text_inset = if colorback {
    (left: 3mm)
  } else {
    ()
  }

  let stroke_color = if colorback {
    black
  } else {
    text_color
  }

  let stroke = (paint: stroke_color, thickness: title_rule / 2)
  v(-inner_page_margin_top + 0.2mm)

  box(
    fill: if colorback {accent_color},
    width: 100%,
    outset: 0pt,
    {
      set par(spacing: 4pt)
      v(logo_height) / 2
      grid(
        columns: (1fr, auto),
        box(inset: (y: 3mm), {
          
        })
      )
    }
  )
}