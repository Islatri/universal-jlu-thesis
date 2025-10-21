#import "fonts.typ": *

// 参考文献设置
#let bibliography-page(bib-file) = {
  // 参考文献另起页码
  pagebreak()
  
  // 设置参考文献页面的页面格式
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
  
  // 空2行（通过v函数实现）
  v(2em)
  
  // 参考文献标题：小3号黑体，居中
  align(center)[
    #text(size: 15pt, weight: "bold", font: fonts.hei)[
      参#h(1em)考#h(1em)文#h(1em)献
    ]
  ]
  
  v(1em)
  
  // 设置参考文献内容格式
  show bibliography: it => {
    // 小4号宋体，行距18磅
    set text(size: 12pt, font: fonts.song)
    set par(leading: 6pt) // 18磅行距
    
    // 自定义参考文献编号格式
    show cite: it => {
      it
    }
    
    it
  }
  
  // 插入参考文献
  bibliography(
    locate(bib-file), // 使用 locate 函数在用户工作目录中查找文件
    title: none,
    style: "gb-7714-2015-numeric"
  )
}

// 返回一个可传递给主模板的 block，用户在自己的文档上下文中调用
// 示例用法（用户侧）:
// #import "@preview/universal-jlu-thesis:0.1.7": jlu-bachelor, bibliography_with
// #show: jlu-bachelor.with(bibliography: bibliography_with("refs.bib"))
#let bibliography_with(bib-file, style: "gb-7714-2015-numeric") = {
  // 返回一个 block（延迟执行），当该 block 在主文档/模板中被执行时，会插入参考文献。
  { bibliography-page(bib-file) }
}