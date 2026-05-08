#import "fonts.typ": *

#let commitment-page(
  title: "吉林大学学士学位论文（设计）承诺书",
  content: "本人郑重承诺：所呈交的学士学位毕业论文（设计），是本人在指导教师的指导下，独立进行实验、设计、调研等工作基础上取得的成果。除文中已经注明引用的内容外，本论文（设计）不包含任何其他个人或集体已经发表或撰写的作品成果。对本人实验或设计中做出重要贡献的个人或集体，均已在文中以明确的方式注明。本人完全意识到本承诺书的法律结果由本人承担。",
  signature: "学士学位论文（设计）作者签名：",
  signature-img: none,
  signature-height: 2.5em,
  date: datetime.today(),
) = {
  page[
    #set text(font: ("Times New Roman", "FangSong"), size: 12pt, lang: "zh", region: "cn")
    #set par(leading: 1.5em, first-line-indent: 2em)

    #v(3cm)

    #align(center)[
      #text(size: 18pt, weight: "bold", font: fonts.fang)[#title]
    ]

    #v(1.5cm)

    #text(size: 14pt, font: fonts.fang)[#content]

    #v(6cm)

    // 签名
    #align(right)[
      #set par(first-line-indent: 0em)
      #grid(
        columns: (auto, auto, auto),
        align: horizon,
        text(size: 14pt, font: fonts.fang)[#signature],
        if signature-img != none { image(signature-img, height: signature-height) } else { h(6em) },
        h(4em),
      )
    ]

    #v(0.5cm)

    #align(right)[
      #text(size: 14pt, font: fonts.fang)[#date.display("[year]年[month]月[day]日")]#h(4em)
    ]
  ]
}
