#let natural_image(..args) = style(styles => {
  let (width, height) = measure(image(..args), styles)
  image(..args, width: width, height: height)
})

#let get_spacing_zero_if_first_on_page(default_spacing, heading_spacing, content_page_margin_full_top, enable: true) = {
  if not enable {
    return (default_spacing, false)
  }

  let heading_is_first_el_on_page = heading_location.position().y <= content_page_margin_full_top

  if heading_is_first_el_on_page {
    return (0mm, true)
  } else {
    return (default_spacing, false)
  }
}

// Cambiar esta linea
#let check_font_exists(font_name) = {
  let measured = measure[
    #text(font: font_name, fallback: false) [
      Test Text
    ]
  ]
  if measured.width == 0pt [
    #rect(stroke: (paint: red), radius: 1mm, inset: 1.5mm, width: 100%)[
      #set text(fallback: true)
      #set heading(numbering: none)
      #show link: it => underline(text(blue)[#it])
      Por favor instalar la fuente requerida "#font_name".
    ]
  ]
}