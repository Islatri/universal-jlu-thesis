#import "fonts.typ": *

#let bibliography-page(bib) = {
  pagebreak()

  set page(
    margin: (top: 20mm, bottom: 20mm, left: 30mm, right: 30mm),
    header: context [
      #set text(size: 9pt, font: fonts.song)
      #align(center)[参考文献]
      #line(length: 100%)
    ],
    header-ascent: 7mm,
    footer-descent: 18pt,
  )

  v(2em)

  align(center)[
    #text(size: 15pt, weight: "bold", font: fonts.hei)[
      参考文献
    ]
  ]

  v(1em)

  set text(size: 12pt, font: ("Times New Roman",) + fonts.song)
  set par(leading: 6pt)

  show cite: it => { it }

  // 后处理 et-al：
  // 英文作者名末尾是拉丁字母（姓名首字母缩写如 "R"、"Y M"），
  // 中文作者名末尾是汉字。
  // 用正则匹配 "拉丁字母 + 逗号 + 空格 + 等"，替换整体为 "字母 + 逗号 + 空格 + et al."
  // 注意：Typst show regex 替换的是整个匹配串，所以要把字母也带进去
  show regex("[A-Za-z],\s*等"): it => {
    // it.text 形如 "R, 等" 或 "R,等"
    // 取第一个字符（字母）+ ", et al."
    it.text.first() + ", et al"
  }

  bib
}