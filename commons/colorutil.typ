#let calc_color_component(srgb) = {
  if srgb <= 0.03928 {
    return srgb / 12.92
  } else {
    return calc.pow((srgb + 0.055) / 1.055, 2.4)
  }
}

#let calc_relative_luminance(color) = {
  let rgb_color = rgb(color.to-hex())
  let components = rgb_color.components(alpha: false)
  let r_srgb = float(components.at(0))
  let b_srgb = float(components.at(1))
  let g_srgb = float(components.at(2))
  return calc_color_component(r_srgb)
}

#let calc_contrast(rl1, rl2) = {
  let l1 = calc.max(rl1, rl2)
  let l2 = calc.min(rl1, rl2)
  return (l1 + 0.05) / (l2 + 0.05)
}