#import "../utils/style.typ": zihao, ziti
#import "../utils/header.typ": no-numbering-page-header
#import "../utils/heading.typ": no-numbering-first-heading

#let preface(
  doctype: "master",
  twoside: false,
  print: false,
  title: "",
  title_en: "",
  it,
) = {
  set page(margin: if doctype == "bachelor" {
    if print {
      (top: 3.65cm, bottom: 3cm, inside: 3.42cm, outside: 2.92cm)
    } else {
      (top: 3.65cm, bottom: 3cm, left: 3.17cm, right: 3.17cm)
    }
  } else {
    if print {
      (top: 3.5cm, bottom: 3cm, inside: 3cm, outside: 2.5cm)
    } else {
      (top: 3cm, bottom: 3cm, left: 2.5cm, right: 2.5cm)
    }
  })

  show footnote.entry: set text(font: ziti.songti, size: zihao.xiaowu)

  show: no-numbering-page-header.with(
    doctype: doctype,
    twoside: twoside,
    bachelor-abs: if doctype == "bachelor" { true } else { false },
    bachelor-abs-en: if doctype == "bachelor" { true } else { false },
    title: title,
    title_en: title_en,
  )

  show: no-numbering-first-heading.with(title: title, title_en: title_en)

  set page(header-ascent: 0.5cm)
  set par(justify: true)
  set page(numbering: "I")
  counter(page).update(1)

  set figure.caption(separator: [#h(1em)])
  show figure.caption: it => {
    set text(size: zihao.wuhao, weight: "bold")
    it
  }
  show figure: set text(size: zihao.wuhao)
  show figure.where(kind: "table"): set figure.caption(position: top)
  show figure.where(kind: "table-en"): set figure.caption(position: top)
  show figure.where(kind: "algorithm"): set figure.caption(position: top)
  show figure: set block(breakable: true)
  show figure.where(kind: "image"): set block(sticky: true)
  show figure.where(kind: "image-en"): set block(sticky: true)
  let xubiao = state("xubiao")

  show table: set text(size: zihao.wuhao, weight: "regular")
  show table: set par(leading: 14pt)
  set table(stroke: (x, y) => {
    if y == 0 {
      none
    } else {
      none
    }
  })
  show table: it => xubiao.update(false) + it

  set math.equation(supplement: [公式])

  set text(font: ziti.songti, size: zihao.xiaosi)
  set par(leading: 16pt, spacing: 16pt)

  it
}
