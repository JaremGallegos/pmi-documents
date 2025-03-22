#let overwrite_dict(new, base) = {
  for key in base.keys() {
    if key in new {
      base.insert(key, new.at(key))
    }
  }
  return base
}