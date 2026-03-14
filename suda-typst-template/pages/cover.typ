#import "../utils/style.typ": zihao, ziti
#import "../utils/distr.typ": distr
#import "../utils/datetime-display.typ": datetime-display

#let cover-page(
  date: datetime.today(),
  doctype: "master",
  twoside: false,
  anonymous: false,
  info: (:),
) = {
  v(-1cm)
  // 学校代码
  align(
    left,
    text(font: ziti.heiti, size: zihao.xiaosi, weight: "bold")[#h(25em)学校代码：10285],
  )

  // 学号
  align(
    left,
    text(font: ziti.heiti, size: zihao.xiaosi, weight: "bold")[#h(25em)学#h(2em)号：#info.student_id],
  )
  
  // 苏州大学 草书
  align(
    center,
    image(
      "../assets/suda-name.png",
      width: 8cm,
    ),
  )
  
  v(-0.5cm)

  // SOOCHOW UNIVERSITY
  align(
    center,
    text(font: ziti.songti, size: zihao.xiaoer)[SOOCHOW UNIVERSITY],
  )

  v(-1cm)

  let cover-title = if doctype == "doctor" {
    "博士学位论文"
  } else {
    "硕士学位论文"
  }

  // X士学位论文
  align(
    center,
    text(font: ziti.songti, size: zihao.chuhao)[#cover-title],
  )
  
  v(-1cm)

  // （专业学位）
  align(
    center,
    text(font: ziti.songti, size: zihao.erhao)[（专业学位）],
  )

  // SUDA logo
  align(
    center,
    image(
      "../assets/suda-logo.png",
      width: 4.5cm,
    ),
  )

  v(0.5cm)

  // 大标题区域 (中文2行 + 英文2行，共4条横线)
  align(center, block(width: 65%)[
    #set text(font: ziti.heiti, weight: "bold")
    #grid(
      columns: (1fr),
      rows: (1em, 2em), 
      stroke: (bottom: 0.5pt),
      inset: (bottom: 4pt),
      align: center + bottom,
      [#text(size: zihao.sanhao, info.title)],
      [],
    )
    
    #v(-1em) // <--- 在这里调整中文和英文部分的间距，修改括号内的数值即可

    #let en-row-height = 2em
    #block(width: 100%, height: en-row-height * 2)[
      #place(top)[
        #grid(
          columns: (1fr),
          rows: (en-row-height, en-row-height),
          stroke: (bottom: 0.5pt),
          [], []
        )
      ]
      #place(top)[
        #set text(size: zihao.sihao)
        #set par(leading: en-row-height - zihao.sihao)
        #block(
          width: 100%,
          inset: (top: en-row-height - zihao.sihao - 6pt),  // 这里的 6pt 决定了文字与横线之间的距离
          info.title_en
        )
      ]
    ]
  ])

  v(0.1cm)

  let info-key(zh) = distr(width: 6em, zh) // 设置基本信息的字段key对齐格式

  // 设置基本信息的字段value对齐格式
  let info-value(zh) = (
    box(
      width: 12em,                         // 固定下划线的宽度
      stroke: (bottom: 0.5pt),             // 仅设置底边框，即为下划线
      inset: (bottom: 5pt),                // 文字与横线的垂直间距
      align(center, text(zh, font: ziti.heiti, size: zihao.sihao)) // 文字在横线上居中
    )
  )

  set text(font: ziti.heiti, size: zihao.sihao, weight: "regular")
  table(
    stroke: none,
    align: (right, left),
    columns: (30%, 50%),
    inset: (right: 0em),   // cell 内边距
    column-gutter: (1em),  // 列间距
    row-gutter: 0em,     // 行间距

    [#info-key("研究生姓名")],
    [#if anonymous {} else {
      info-value(info.name)
    }],

    [#info-key("指导教师姓名")],
    [#if anonymous {} else {
      info-value(info.supervisor)
    }],

    [#info-key("专业方向")],
    [#if anonymous {} else {
      info-value(info.major)
    }],

    [#info-key("研究方向")],
    [#if anonymous {} else {
      info-value(info.study_subject)
    }],

    [#info-key("所在院部")],     [#info-value(info.school)],
    [#info-key("论文提交日期")], [#info-value(info.submit_date)],
  )

  linebreak()

  // align(
  //   center,
  //   text(font: ziti.songti, size: zihao.sihao, weight: "bold")[#datetime-display(date)],
  // )

  pagebreak(
    weak: true,
    to: if twoside {
      "odd"
    },
  )
}
