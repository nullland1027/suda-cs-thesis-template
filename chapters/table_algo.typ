#import "../suda-typst-template/lib.typ": *


= 图表、算法格式

== 插图

本模板使用 `imagex` 函数对图片环境进行封装，在实现子图，双语图题等复杂功能的同时，仍保留较高的自定义程度，将通过下面的示例进行说明。图片的引用须以 `img` 开头。

=== 多个图形

简单插入多个图形的例子如@img:SRR 所示。这两个水平并列放置的子图共用一个图形计数器，没有各自的子图题。

#imagex(
  image("../figures/suda-school.jpeg"),
  image("../figures/suda-school.jpeg"),
  columns: (1fr, 1fr),
  caption: [不同情景下上海市乘用车的温室气体排放量],
  caption-en: [Greenhouse gas emissions from passenger cars in Shanghai under different scenarios],
  label-name: "SRR",
)

如果多个图形相互独立，并不共用一个图形计数器，那么用 `grid` 或者
`columns` 就可以，如@img:parallel1 与@img:parallel2。

#grid(
  align: bottom,
  grid.cell(imagex(
    image("../figures/suda-school.jpeg"),
    caption: [温室气体排放量随时间变化的情况],
    label-name: "parallel1",
  )),
  grid.cell(imagex(
    image("../figures/suda-school.jpeg"),
    caption: [2050 年的温室气体排放量],
    label-name: "parallel2",
  )),
  columns: (1fr, 1fr),
)

如果要为共用一个计数器的多个子图添加子图题，使用 `subimagex`，如@img:subfigures:test1 和@img:subfigures:test2。

#imagex(
  subimagex(
    image("../figures/suda-school.jpeg"),
    caption: [温室气体排放量随时间变化的情况],
    label-name: "test1",
  ),
  subimagex(
    image("../figures/suda-school.jpeg"),
    caption: [2050 年的温室气体排放量],
    label-name: "test2",
  ),
  columns: (1fr, 1fr),
  caption: [不同情景下上海市乘用车的温室气体排放量],
  label-name: "subfigures",
)

如果需要双语图题，可以自由在 `imagex` 和 `subimagex` 添加 `caption-en` 参数。

#imagex(
  subimagex(
    image("../figures/suda-school.jpeg"),
    caption: [温室气体排放量随时间变化的情况],
    caption-en: [Greenhouse gas emissions over time],
    label-name: "test1",
  ),
  subimagex(
    image("../figures/suda-school.jpeg"),
    caption: [2050 年的温室气体排放量],
    // caption-en: [Greenhouse gas emissions in 2050],
    label-name: "test2",
  ),
  columns: (1fr, 1fr),
  caption: [不同情景下上海市乘用车的温室气体排放量],
  caption-en: [Greenhouse gas emissions from passenger cars in Shanghai under different scenarios],
  label-name: "subbifigures",
)

== 表格

本模板使用 `tablex` 函数对表格进行封装，实现了自动续表和表格脚注功能，表格的引用须以 `tbl` 开头。

=== 基本表格

编排表格应简单明了，表达一致，明晰易懂，表文呼应、内容一致。表题置于表上，研究生学位论文可以用中、英文两种文字居中排写，中文在上，也可以只用中文。

表格的编排建议采用国际通行的三线表#footnote[三线表，以其形式简洁、功能分明、阅读方便而在科技论文中被推荐使用。三线表通常只有 3 条线，即顶线、底线和栏目线，没有竖线。]，如@tbl:standard-table 所示。

#tablex(
  [Gnat],
  [per gram],
  [13.65],
  [],
  [each],
  [0.01],
  [Gnu],
  [stuffed],
  [92.50],
  [Emu],
  [stuffed],
  [33.33],
  [Armadillo],
  [frozen],
  [8.99],
  header: (table.cell(colspan: 2)[Item], [], table.hline(end: 2, stroke: 0.25pt), [Animal], [Desciption], [Price(\$)]),
  columns: 3,
  caption: [一个颇为标准的三线表],
  label-name: "standard-table",
)

=== 复杂表格

我们经常会在表格下方标注数据来源，或者对表格里面的条目进行解释。可以用 `table-note` 在表格中添加表注，如@tbl:footnote-table 所示。

#tablex(
  [],
  [4.22],
  [120.0140#table-note("the second note.")],
  [],
  [333.15],
  [0.0411],
  [],
  [444.99],
  [0.1387],
  [],
  [168.6123],
  [10.86],
  [],
  [255.37],
  [0.0353],
  [],
  [376.14],
  [0.1058],
  [],
  [6.761],
  [0.007],
  [],
  [235.37],
  [0.0267],
  [],
  [348.66],
  [0.1010],
  align: horizon,
  breakable: false,
  header: (
    table.cell(rowspan: 2)[total],
    table.cell(colspan: 2)[20#table-note("the first note.")],
    table.cell(rowspan: 2)[],
    table.cell(colspan: 2)[40],
    table.cell(rowspan: 2)[],
    table.cell(colspan: 2)[60],
    table.hline(end: 3, stroke: 0.25pt),
    table.hline(start: 4, end: 6, stroke: 0.25pt),
    table.hline(start: 7, end: 9, stroke: 0.25pt),
    [www],
    [k],
    [www],
    [k],
    [www],
    [k],
  ),
  columns: 9,
  caption: [一个带有脚注的表格的例子],
  caption-en: [A Table with footnotes],
  label-name: "footnote-table",
)

如某个表需要转页接排，`tablex` 自动实现了续表功能。接排时表题省略，表头应重复书写，并在右上方写“续表 xx”，如@tbl:long-table 所示。（注意：当表格跨页时，脚注不能添加在表头中，会导致重复标注，此时应传入参数 `breakable: false`，取消续表功能。）

#tablex(
  ..for i in range(15) {
    ([250], [88], [5900], [1.65])
  },
  header: (
    [感应频率 #linebreak() (kHz)],
    [感应发生器功率 #linebreak() (%×80kW)],
    [工件移动速度 #linebreak() (mm/min)],
    [感应圈与零件间隙 #linebreak() (mm)],
  ),
  columns: (25%, 25%, 25%, 25%),
  caption: [高频感应加热的基本参数],
  caption-en: [XXXXXXX],
  label-name: "long-table",
)

== 算法环境

本模板使用 `algox` 函数对算法环境进行封装，其中使用的算法包为 `lovelace`，需要自定义 `pseudocode-list` 的格式时可自行查询 `lovelace` 的文档。算法的应用须以 `algo` 开头。算法与表格一样也实现了跨页自动添加“须算法”的功能。

我们可以通过@algo:fibonacci 来计算斐波那契数列第 $n$ 项。

#let tmp = math.italic("tmp")
#algox(
  label-name: "fibonacci",
  caption: [斐波那契数列计算],
  pseudocode-list(line-gap: 1em, indentation: 2em)[
    - #h(-1.5em) *input:* integer $n$
    - #h(-1.5em) *output:* Fibonacci number $F(n)$
    + *if* $n = 0$ *then return* $0$
    + *if* $n = 1$ *then return* $1$
    + $a <- 0$
    + $b <- 1$
    + *for* $i$ *from* $2$ *to* $n$ *do*
      + $tmp <- a + b$
      + $a <- b$
      + $b <- tmp$
    + *end*
    + *return* $b$
  ],
)

== 代码环境

我们可以在论文中插入算法，但是不建议插入大段的代码。如果确实需要插入代码，推荐使用 `codly` 包插入代码。

#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#show: codly-init.with()
#codly(languages: codly-languages)

```python
def fibonacci(n: int) -> int:
    # 输入：整数 n
    # 输出：Fibonacci 数列的第 n 项

    if n == 0:
        return 0
    if n == 1:
        return 1

    a = 0
    b = 1
    for i in range(2, n + 1):
        tmp = a + b
        a = b
        b = tmp
    return b
```