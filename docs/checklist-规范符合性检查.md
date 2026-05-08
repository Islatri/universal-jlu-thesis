# 通信工程学院本科毕业论文（设计）模板 — 规范符合性检查清单

> 依据文档：[通信工程学院本科毕业论文（设计）撰写模板及装订要求](通信工程学院本科毕业论文（设计）撰写模板及装订要求.md)
> 检查日期：2026-05-08
> 模板版本：当前 `main` 分支

---

## 一、毕业论文（设计）内容

### 1. 封面

| # | 检查项 | 合规 | 代码位置与说明 |
|---|--------|------|---------------|
| 1.1 | 中英文题目在封面中间居中排列 | ✅ | [cover.typ:185-198](../core/cover.typ#L185-L198) — `grid(columns: (auto, 310pt), ...)` 中英文题目垂直排列，居中 |
| 1.2 | 学生姓名、班级（阿拉伯数字）、学号（阿拉伯数字） | ✅ | [cover.typ:206-210](../core/cover.typ#L206-L210) — `multi-field-line` 包含学生姓名、班级、学号三个字段 |
| 1.3 | 学院与专业写全称 | ✅ | [cover.typ:211-212](../core/cover.typ#L211-L212) — `info-line([学&emsp;院], school)` 和 `info-line([专&emsp;业], major)` |
| 1.4 | 指导教师姓名后附职称 | ✅ | [cover.typ:214-217](../core/cover.typ#L214-L217) — `multi-field-line` 包含指导教师和职称 |
| 1.5 | 校外指导教师（姓名、职称、单位） | ❌ | [cover.typ](../core/cover.typ) — **缺少校外指导教师字段**，当前只有一位指导教师+职称，无"单位"字段，无校外导师选项 |
| 1.6 | 封面字体应用楷书 | ❌ | [cover.typ:10](../core/cover.typ#L10) — 规范要求"用楷书书写"，但代码中全部使用 `fonts.song`（宋体），如 `font-family: fonts.song`、`font: fonts.song` |

### 2. 目录

| # | 检查项 | 合规 | 代码位置与说明 |
|---|--------|------|---------------|
| 2.1 | 目录列出"章"、"节"二级标题即可 | ❌ | [toc.typ:68-71](../core/toc.typ#L68-L71) — `outline(title: none, indent: auto)` **未限制显示级别为2**，会显示所有级别（1.1.1, 1.1.1.1 等） |
| 2.2 | 目录单列页码，与正文页码分开 | ✅ | [toc.typ:45](../core/toc.typ#L45) — 使用 `counter(page).display("I")` 罗马数字页码，正文用阿拉伯数字 `"1"` |

### 3. 论文摘要

| # | 检查项 | 合规 | 代码位置与说明 |
|---|--------|------|---------------|
| 3.1 | 中外两种文字，外文摘要在中文摘要下面 | ✅ | [template.typ:203-206](../core/template.typ#L203-L206) — 先 `chinese-abstract()` 后 `english-abstract()` |
| 3.2 | 摘要 300-500 字 | — | 内容层面，由用户控制 |

### 4. 论文正文

| # | 检查项 | 合规 | 代码位置与说明 |
|---|--------|------|---------------|
| 4.1 | 包含绪论、论文主体、结论、参考文献 | ✅ | 模板支持这些结构 |

---

## 二、毕业论文（设计）书写格式及装订

### 2.1 字数要求

| # | 检查项 | 合规 | 代码位置与说明 |
|---|--------|------|---------------|
| 5.1 | 不少于2万字 | — | 内容层面，由用户控制 |

### 2.2 页边距与装订

| # | 检查项 | 合规 | 代码位置与说明 |
|---|--------|------|---------------|
| 6.1 | 正文页边距：上 2.5cm | ✅ | [template.typ:214](../core/template.typ#L214) — `top: 25mm` = 2.5cm |
| 6.2 | 正文页边距：下 2.5cm | ❌ | [template.typ:214](../core/template.typ#L214) — `bottom: 38mm` = **3.8cm**，规范要求 2.5cm |
| 6.3 | 正文页边距：左 1.8cm + 装订线 1cm = 2.8cm | ✅ | [template.typ:214](../core/template.typ#L214) — `left: 28mm` = 2.8cm |
| 6.4 | 正文页边距：右 1.8cm | ✅ | [template.typ:214](../core/template.typ#L214) — `right: 18mm` = 1.8cm |
| 6.5 | 摘要页边距统一为上2.5/下2.5/左2.8/右1.8 | ❌ | [abstract.typ:6](../core/abstract.typ#L6) — `margin: (top: 20mm, bottom: 20mm, left: 30mm, right: 30mm)` 全部不符合规范 |
| 6.6 | 目录页边距统一为上2.5/下2.5/左2.8/右1.8 | ❌ | [toc.typ:38](../core/toc.typ#L38) — `margin: (top: 20mm, bottom: 20mm, left: 30mm, right: 30mm)` 全部不符合规范 |
| 6.7 | 参考文献页边距统一为上2.5/下2.5/左2.8/右1.8 | ❌ | [bibliography.typ:7](../core/bibliography.typ#L7) — `margin: (top: 20mm, bottom: 20mm, left: 30mm, right: 30mm)` 不符合规范 |

### 2.3 装订顺序

规范要求顺序：

> 封皮 → 承诺书 → 中文摘要 → 英文摘要 → 目录 → 正文 → 参考文献 → 附录 → 致谢 → 指导教师评语 → 评阅人评语 → 答辩意见

| # | 检查项 | 合规 | 代码位置与说明 |
|---|--------|------|---------------|
| 7.1 | 整体装订顺序正确 | ❌ | [template.typ:177-266](../core/template.typ#L177-L266) — 存在多处顺序和内容问题 |
| 7.2 | 多了"版权使用授权书" | ❌ | [template.typ:194-200](../core/template.typ#L194-L200) — 规范装订顺序中**没有**版权使用授权书 |
| 7.3 | 多了"在学期间发表的学术论文与研究成果" | ❌ | [template.typ:250-254](../core/template.typ#L250-L254) — 规范装订顺序中**没有**此项 |
| 7.4 | 致谢在参考文献之前 | ❌ | [template.typ:257-261 vs 264](../core/template.typ#L257-L266) — 规范要求：参考文献 → 附录 → **致谢**，当前是：**致谢** → 参考文献 |
| 7.5 | 缺少"指导教师评语" | ❌ | 模板中完全没有此部分 |
| 7.6 | 缺少"评阅人评语" | ❌ | 模板中完全没有此部分 |
| 7.7 | 缺少"答辩意见" | ❌ | 模板中完全没有此部分 |

### 2.4 封面书写要求

| # | 检查项 | 合规 | 代码位置与说明 |
|---|--------|------|---------------|
| 8.1 | 封面各栏目用楷书书写 | ❌ | [cover.typ](../core/cover.typ) — 全部使用宋体(`fonts.song`)，规范要求楷书。但有条件的学生可以打印输出 |

### 2.5 页面设置—文档网格

| # | 检查项 | 合规 | 代码位置与说明 |
|---|--------|------|---------------|
| 9.1 | 行每页设44，跨度15.6磅 | ❌ | 这是 Word 特有的文档网格设置，Typst 无直接对应。当前通过 `leading: 1.5em` 和边距间接控制，未精确匹配 44 行/页 |

### 2.6 首行缩进

| # | 检查项 | 合规 | 代码位置与说明 |
|---|--------|------|---------------|
| 10.1 | 摘要、正文、致谢等段落首行缩进2字符 | ✅ | [template.typ:65](../core/template.typ#L65) — `first-line-indent: 2em`；[abstract.typ:32](../core/abstract.typ#L32) — `first-line-indent: 2em` |

### 2.7 标点符号

| # | 检查项 | 合规 | 代码位置与说明 |
|---|--------|------|---------------|
| 11.1 | 除了"ABSTRACT"外，全角符号 | — | 内容层面，由用户控制 |

### 2.8 目录不含摘要

| # | 检查项 | 合规 | 代码位置与说明 |
|---|--------|------|---------------|
| 12.1 | 目录中不要含"摘要"和"ABSTRACT" | ✅ | 摘要未使用 heading，`outline()` 只收集 heading，所以不会出现在目录中 |

### 2.9 图表字体

| # | 检查项 | 合规 | 代码位置与说明 |
|---|--------|------|---------------|
| 13.1 | 图表一律使用宋体5号字（10.5pt） | ❌ | [template.typ](../core/template.typ) — 模板中**未对图表内容设置专门的字体和字号**，图表会继承正文的小4号(12pt)设置 |

---

## 三、各部分格式细节

### 中文摘要格式

规范要求：

> **摘  要**（小3号黑体，居中，加粗）
> （空1行）
> 正文（中文用小4号宋体，英文和数字用Times New Roman，1.5倍行距）
> （空2行）
> **关键词**（黑体）  ×××  ×××  ×××   ×××（小4号宋体，用空格隔开，不用符号）

| # | 检查项 | 规范要求 | 合规 | 代码位置与说明 |
|---|--------|---------|------|---------------|
| 14.1 | 标题字号 | 小3号(15pt) | ❌ | [abstract.typ:62](../core/abstract.typ#L62) — 使用 **16pt**（三号），非 15pt（小3号） |
| 14.2 | 标题字体 | 黑体，加粗，居中 | ✅ | [abstract.typ:22](../core/abstract.typ#L22) — `font: fonts.hei`, `weight: "bold"`, `align(center)` |
| 14.3 | 标题后空1行 | 空1行 | ✅ | [abstract.typ:29](../core/abstract.typ#L29) — `v(1em)` |
| 14.4 | 正文中文字体 | 小4号宋体 | ✅ | [abstract.typ:34](../core/abstract.typ#L34) — `text(size: 12pt, font: fonts.song)`，12pt = 小4号 |
| 14.5 | 正文英文字体 | Times New Roman | ❌ | [abstract.typ:34](../core/abstract.typ#L34) — `font: fonts.song` 仅设置宋体，**英文数字也会使用宋体的英文字形而非 Times New Roman** |
| 14.6 | 正文行距 | 1.5倍行距 | ✅ | [abstract.typ:17](../core/abstract.typ#L17) — `set par(leading: 1.5em)` |
| 14.7 | 正文后空2行 | 空2行 | ✅ | [abstract.typ:40](../core/abstract.typ#L40) — `v(2em)` |
| 14.8 | 关键词标签字体 | 黑体 | ❌ | [abstract.typ:45](../core/abstract.typ#L45) — `font: fonts.song` 使用**宋体**，规范要求黑体 |
| 14.9 | 关键词分隔符 | 用空格隔开，不用符号 | ❌ | [abstract.typ:50](../core/abstract.typ#L50) — `keywords.join("；")` 使用**全角分号**分隔 |

### 英文摘要格式

规范要求：

> **ABSTRACT**（小3号Times New Roman，居中，加粗）
> （空1行）
> 正文（小4号Times New Roman，1.5倍行距）
> （空2行）
> **Keywords**（小4号Times New Roman，加粗）  ×××  ×××  ×××   ×××（小4号Times New Roman）

| # | 检查项 | 规范要求 | 合规 | 代码位置与说明 |
|---|--------|---------|------|---------------|
| 15.1 | 标题文字 | `ABSTRACT`（全大写） | ❌ | [abstract.typ:79](../core/abstract.typ#L79) — 写的是 `"Abstract"`（首字母大写），规范要求 **ABSTRACT** |
| 15.2 | 标题字号 | 小3号(15pt) | ❌ | [abstract.typ:24](../core/abstract.typ#L24) — 使用 **16pt**（三号），非 15pt（小3号） |
| 15.3 | 标题字体 | Times New Roman，加粗，居中 | ✅ | [abstract.typ:24](../core/abstract.typ#L24) — 未指定中文字体所以用默认 Times New Roman |
| 15.4 | 正文字体 | 小4号 Times New Roman，1.5倍行距 | ✅ | [abstract.typ:36](../core/abstract.typ#L36) — `text(size: 12pt)` 继承全局 Times New Roman |
| 15.5 | Keywords 标签 | 小4号 Times New Roman，加粗 | ✅ | [abstract.typ:47](../core/abstract.typ#L47) — `weight: "bold"` |
| 15.6 | 关键词分隔符 | 用空格隔开，不用符号 | ❌ | [abstract.typ:52](../core/abstract.typ#L52) — `keywords.join("; ")` 使用**英文分号+空格**分隔 |

### 目录格式

规范要求：

> **目  录**（3号黑体，居中，加粗）
> （空1行）
> 引言（或绪论）（或作为正文第1章，4号宋体，行距18磅）…1
> 第1章…………………………………………………………………Y
> 1.1……………………………………………………………………Y
> ………………………………………（略）

| # | 检查项 | 规范要求 | 合规 | 代码位置与说明 |
|---|--------|---------|------|---------------|
| 16.1 | 标题"目  录" | 3号(16pt)黑体，居中，加粗 | ✅ | [toc.typ:57-59](../core/toc.typ#L57-L59) — `text(size: 16pt, weight: "bold", font: fonts.hei)` |
| 16.2 | 标题后空1行 | 空1行 | ✅ | [toc.typ:54](../core/toc.typ#L54) — `v(2em)` |
| 16.3 | 目录条目字体 | 4号(14pt)宋体 | ✅ | [toc.typ:10](../core/toc.typ#L10) — `text(size: 14pt, font: fonts.song)` |
| 16.4 | 目录条目行距 | 行距18磅 | ✅ | [toc.typ:65](../core/toc.typ#L65) — `set par(leading: 18pt)` |
| 16.5 | 显示级别 | 仅章、节二级（"显示级别为2"） | ❌ | [toc.typ:68-71](../core/toc.typ#L68-L71) — `outline(title: none, indent: auto)` **未限制 `depth: 2`**，会显示子小节 |

### 正文标题格式

规范要求：

> **第1章**（一级标题，小3号黑体，加粗，居中，段前0.5行，段后0.5行）
> **1.1 ××××××**（二级标题，4号黑体，加粗）
> **1.1.1 ××××**（三级标题，小4号黑体，不加粗）

| # | 检查项 | 规范要求 | 合规 | 代码位置与说明 |
|---|--------|---------|------|---------------|
| 17.1 | 一级标题字号 | 小3号(15pt) | ❌ | [template.typ:117](../core/template.typ#L117) — 使用 **16pt**（三号），非 15pt（小3号） |
| 17.2 | 一级标题字体 | **黑体**，加粗，居中 | ❌ | [template.typ:117](../core/template.typ#L117) — `font: fonts.main + fonts.song` 使用**宋体**，规范要求黑体 |
| 17.3 | 一级标题段前段后 | 段前0.5行，段后0.5行 | ⚠️ | [template.typ:114](../core/template.typ#L114) — `v(21pt)` ≈ 段前0.5行；[template.typ:124](../core/template.typ#L124) — `v(11pt)` ≈ 段后0.25行，**段后偏小** |
| 17.4 | 二级标题字号 | 4号(14pt) | ✅ | [template.typ:131](../core/template.typ#L131) — `text(size: 14pt)` |
| 17.5 | 二级标题字体 | **黑体**，加粗 | ❌ | [template.typ:131](../core/template.typ#L131) — `font: fonts.main + fonts.song` 使用**宋体**，规范要求黑体 |
| 17.6 | 三级标题字号 | 小4号(12pt) | ✅ | [template.typ:142](../core/template.typ#L142) — `text(size: 12pt)` |
| 17.7 | 三级标题字体 | **黑体**，**不加粗** | ❌ | [template.typ:142](../core/template.typ#L142) — `font: fonts.main + fonts.song` 使用**宋体**，规范要求黑体；且当前未显式取消加粗（`weight: "regular"`） |
| 17.8 | 正文正文字体 | 小4号(12pt)宋体 | ✅ | [template.typ:146](../core/template.typ#L146) — `set text(size: 12pt)` |
| 17.9 | 每个章节另起页 | 每个章节应另起页 | ❌ | [template.typ:112-124](../core/template.typ#L112-L124) — 一级标题前仅 `v(21pt, weak: true)`，**没有 `pagebreak()`** 强制换页 |

### 结论格式

规范要求：

> **结  论**（小3号黑体，居中）
> （空1行）
> 正文（小4号宋体，1.5倍行距）

| # | 检查项 | 规范要求 | 合规 | 代码位置与说明 |
|---|--------|---------|------|---------------|
| 18.1 | 标题"结  论" | 小3号(15pt)黑体，居中 | ❌ | [template.typ:244](../core/template.typ#L244) — 使用 `heading(level: 1, numbering: none)` 渲染，继承了16pt**宋体** |
| 18.2 | 标题文字 | 中间有空格 | ❌ | [template.typ:244](../core/template.typ#L244) — `[结论]` 无空格，规范为 `[结  论]` |
| 18.3 | 标题后空1行 | 空1行 | ⚠️ | heading 后使用 `v(11pt)`，非明确1行 |

### 致谢格式

规范要求：

> **致  谢**（小3号黑体，居中）
> （空1行）
> 正文（小4号宋体，1.5倍行距）

| # | 检查项 | 规范要求 | 合规 | 代码位置与说明 |
|---|--------|---------|------|---------------|
| 19.1 | 标题"致  谢" | 小3号(15pt)黑体，居中 | ❌ | [template.typ:259](../core/template.typ#L259) — 使用 `heading(level: 1, numbering: none)` 渲染，继承了16pt**宋体** |
| 19.2 | 标题文字 | 中间有空格 | ❌ | [template.typ:259](../core/template.typ#L259) — `[致谢]` 无空格，规范为 `[致  谢]` |
| 19.3 | 标题后空1行 | 空1行 | ⚠️ | heading 后使用 `v(11pt)`，非明确1行 |

### 参考文献格式

规范要求：

> **参 考 文 献**（小3号黑体，居中）
> （空1行）
> [1] ×××××××（小4号宋体，行距18磅）

| # | 检查项 | 规范要求 | 合规 | 代码位置与说明 |
|---|--------|---------|------|---------------|
| 20.1 | 标题字号 | 小3号(15pt)黑体，居中 | ✅ | [bibliography.typ:20-22](../core/bibliography.typ#L20-L22) — `text(size: 15pt, weight: "bold", font: fonts.hei)` |
| 20.2 | 标题文字 | 中间有空格 | ❌ | [bibliography.typ:21](../core/bibliography.typ#L21) — 文字为 `参考文献` 无空格，规范为 `参 考 文 献` |
| 20.3 | 条目字体 | 小4号(12pt)宋体 | ✅ | [bibliography.typ:27](../core/bibliography.typ#L27) — `text(size: 12pt, font: ("Times New Roman",) + fonts.song)` |
| 20.4 | 条目行距 | 行距18磅 | ❌ | [bibliography.typ:28](../core/bibliography.typ#L28) — `set par(leading: 6pt)` **远小于** 18 磅 |

---

## 汇总统计

| 类别 | 通过 ✅ | 不通过 ❌ | 警告 ⚠️ |
|------|---------|----------|---------|
| 封面 | 4 | 2 | 0 |
| 目录（内容） | 1 | 1 | 0 |
| 摘要（结构） | 2 | 0 | 0 |
| 页边距 | 3 | 4 | 0 |
| 装订顺序 | 0 | 7 | 0 |
| 页面网格 | 0 | 1 | 0 |
| 首行缩进 | 1 | 0 | 0 |
| 图表字体 | 0 | 1 | 0 |
| 中文摘要格式 | 4 | 4 | 0 |
| 英文摘要格式 | 3 | 3 | 0 |
| 目录格式 | 4 | 1 | 0 |
| 正文标题 | 2 | 5 | 2 |
| 结论格式 | 0 | 2 | 1 |
| 致谢格式 | 0 | 2 | 1 |
| 参考文献格式 | 2 | 2 | 0 |
| **总计** | **26** | **35** | **4** |

---

## 关键问题摘要（按严重程度排序）

### P0 — 必须修复

1. **所有标题字体错误** — 规范要求一/二/三级标题全部使用**黑体(Hei)**，当前代码全部使用**宋体(Song)**。
   - [template.typ:117](../core/template.typ#L117)（一级标题）
   - [template.typ:131](../core/template.typ#L131)（二级标题）
   - [template.typ:142](../core/template.typ#L142)（三级标题）
   - [headings.typ:9](../core/headings.typ#L9)（另一套heading定义，同样用宋体）

2. **装订顺序不符** — 多出"版权授权书"和"学术成果"，缺少"三评语"，致谢与参考文献顺序颠倒。
   - [template.typ:177-266](../core/template.typ#L177-L266)

3. **页边距不一致** — 摘要/目录/参考文献使用 `2cm/3cm`，正文使用另一套值，需统一为：上2.5cm / 下2.5cm / 左2.8cm / 右1.8cm。
   - [abstract.typ:6](../core/abstract.typ#L6)
   - [toc.typ:38](../core/toc.typ#L38)
   - [bibliography.typ:7](../core/bibliography.typ#L7)

4. **英文摘要标题** — 应为全大写 `ABSTRACT`，代码为 `Abstract`。
   - [abstract.typ:79](../core/abstract.typ#L79)

### P1 — 应该修复

5. **一级标题字号** — 规范小3号(15pt)，代码用三号(16pt)。
   - [template.typ:117](../core/template.typ#L117)

6. **目录未限制2级** — 会显示所有子标题级别（1.1.1, 1.1.1.1）。
   - [toc.typ:68-71](../core/toc.typ#L68-L71)

7. **关键词分隔符** — 规范要求空格分隔，代码用分号（中文全角`；`，英文`;`）。
   - [abstract.typ:50](../core/abstract.typ#L50)
   - [abstract.typ:52](../core/abstract.typ#L52)

8. **参考文献行距** — 规范18磅，代码6pt。
   - [bibliography.typ:28](../core/bibliography.typ#L28)

9. **章节未另起页** — 规范要求每章另起页。
   - [template.typ:114](../core/template.typ#L114)

10. **图表字体未设置** — 规范要求图表用宋体5号(10.5pt)，当前未专门设置。

### P2 — 建议修复

11. **封面字体** — 规范要求楷书，当前用宋体。
    - [cover.typ](../core/cover.typ)

12. **缺少校外指导教师字段** — [cover.typ](../core/cover.typ)

13. **中文摘要英文字体** — 显式设置宋体导致英文也用宋体而非 Times New Roman。
    - [abstract.typ:34](../core/abstract.typ#L34)

14. **关键词标签字体** — 规范要求黑体，代码用宋体。
    - [abstract.typ:45](../core/abstract.typ#L45)

15. **标题文字间距** — "结  论"、"致  谢"、"参 考 文 献" 规范要求中间有空格。
    - [template.typ:244](../core/template.typ#L244)
    - [template.typ:259](../core/template.typ#L259)
    - [bibliography.typ:21](../core/bibliography.typ#L21)

16. **三级标题不加粗** — 规范明确三级标题不加粗，当前未显式设置。
    - [template.typ:142](../core/template.typ#L142)

17. **文档网格** — Word 44行/页设置在 Typst 中需通过行距近似。

18. **摘要标题字号** — 规范小3号(15pt)，代码三号(16pt)。
    - [abstract.typ:22](../core/abstract.typ#L22)
