#import "fonts.typ": *

#let authorization-page(
  title: "吉林大学本科毕业论文（设计）版权使用授权书",
  content: "本毕业论文（设计）作者同意学校保留并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。本人授权吉林大学可以将本毕业论文（设计）的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本毕业论文（设计）。",
  confidential: false,
  author-signature-img: none,
  mentor-signature-img: none,
  signature-height: 2.5em,
  date: auto,
) = {
  let final-date = if date == auto { datetime.today() } else { date }
  let display-date = final-date.display("[year]年[month]月[day]日")

  page[
    #set text(font: ("Times New Roman", "FangSong"), size: 12pt, lang: "zh", region: "cn")
    #set par(leading: 1.5em, first-line-indent: 2em)

    #v(3cm)

    // 标题
    #align(center)[
      #text(size: 18pt, font: fonts.fang)[#title]
    ]

    #v(1cm)

    // 正文
    #text(size: 14pt, font: fonts.fang)[#content]

    #v(0.25cm)

    // 保密选项
    #align(left)[
      #set par(first-line-indent: 0em)
      #text(size: 14pt, font: fonts.fang)[
        #h(8em)#text(weight: "bold")[保密]□, 在#box(width: 2em, stroke: (bottom: 0.5pt))[]年解密后适用本授权书。
      ]
    ]

    #align(left)[
      #set par(first-line-indent: 0em)
      #text(size: 14pt, font: fonts.fang)[
        本论文属于
      ]
    ]

    #align(left)[
      #text(size: 14pt, font: fonts.fang)[
        #h(6em)#text(weight: "bold")[不保密]#text(font: ("Segoe UI Symbol", "Times New Roman"))[☑]。
      ]
    ]

    #align(left)[
      #set par(first-line-indent: 0em)
      #text(size: 14pt, font: fonts.fang)[
        （请在以上方框内打"√"）
      ]
    ]

    #v(1.5cm)

    // 签名区域
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 0.5em,

      // 左列：作者签名
      [
        #set par(first-line-indent: 0em)
        #grid(
          columns: (auto, auto, auto),
          align: horizon,
          text(size: 14pt, font: fonts.fang)[作者签名：],
          if author-signature-img != none { image(author-signature-img, height: signature-height) } else { h(6em) },
          h(0em),
        )
        #v(1cm)
        #text(size: 14pt, font: fonts.fang)[日期：#display-date]
      ],

      // 右列：指导教师签名
      [
        #set par(first-line-indent: 0em)
        #grid(
          columns: (auto, auto, auto),
          align: horizon,
          text(size: 14pt, font: fonts.fang)[指导教师签名：],
          if mentor-signature-img != none { image(mentor-signature-img, height: signature-height) } else { h(6em) },
          h(0em),
        )
        #v(1cm)
        #text(size: 14pt, font: fonts.fang)[日期：#display-date]
      ]
    )
  ]
}
