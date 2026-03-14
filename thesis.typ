#import "./suda-typst-template/lib.typ": *

#let (
  doctype,
  date,
  twoside,
  anonymous,
  info,
  doc,
  preface,
  mainmatter,
  appendix,
  cover,
  cover-en,
  declare,
  abstract,
  abstract-en,
  outline,
  image-outline,
  table-outline,
  algorithm-outline,
  nomenclature,
  bib,
  acknowledgement,
  achievement,
  summary-en,
) = documentclass(
  doctype: "master",      // 文档类型: "master" | "doctor" | "bachelor"
  date: datetime.today(), // 日期
  twoside: true,          // 双面模式
  print: false,           // 打印模式, 设置为 true 时，根据奇偶页调整页边距
  anonymous: false,       // 盲审模式
  info: (
    student_id: "xxxxxxxx",
    name: "张三",
    name_en: "",
    degree: "工学硕士",
    supervisor: "导儿",
    supervisor_en: "",
    title: "摸鱼学计算模型研究",
    title_en: "Research on Fish Touching Computation Model",
    school: "摸鱼学院",
    school_en: "",
    major: "摸鱼学专业",
    study_subject: "摸鱼学",
    submit_date: "YYYY 年 MM 月"
  ),
)

#show: doc

#cover()

/*
#cover-en()

#declare(
  confidentialty-level: "internal", // 保密级别: "public" | "internal" | "secret" | "confidential"
  confidentialty-year: 2,           // 保密年份数，请根据保密级别的要求填写
  date: datetime.today(),
  
  // 请根据签名图片的大小，自行调整图片的高度和位置
  original-statement-sign: place(dx: 13cm, dy: -1.3cm, image("figures/student-sign.png", height: 2em)), 
  authorization-author-sign: place(dx: 5cm, dy: -1.3cm, image("figures/student-sign.png", height: 2em)),
  supervisor-sign: place(dx: 4cm, dy: -1.2cm, image("figures/supervisor-sign.png", height: 2em)),
) // 不需要显示日期和签名，可直接注释
*/

#show: preface

#abstract(keywords: (
  "草鱼",
  "鲤鱼",
  "河豚鱼"
))[
  #include "chapters/00-abstract_zh.typ"
]

#abstract-en(keywords: (
  "dissertation",
  "dissertation format", 
  "standardization", 
  "template"
))[
  #include "chapters/00-abstract_en.typ"
]

#outline()

#image-outline() // 插图目录，按需设置

#table-outline() // 表格目录，按需设置

#algorithm-outline() // 算法目录，按需设置

// 符号对照表，按需设置
#nomenclature(
  width: 50%,
  columns: (1fr, 1.5fr),
)[
  / $epsilon$: 介电常数
  / $mu$: 磁导率
]


#show: mainmatter
// #show: mainmatter.with(enable-avoid-orphan-headings: true) // 避免孤行标题，此为实验性功能，会对页面顶部距离造成影响
#show: word-count-cjk // 正文字数统计

#include "chapters/normal.typ"

#include "chapters/math_ref.typ"

#include "chapters/table_algo.typ"

#include "chapters/conclusion.typ"

// 参考文献
#bib(
  bibfunc: bibliography.with("ref.bib"),
  full: false,  // full: false 表示只显示已引用的文献，不显示未引用的文献；true 表示显示所有文献
) 

// 附录
#show: appendix
#include "chapters/appendix.typ"

// 致谢
#acknowledgement[
  致谢主要感谢导师和对论文工作有直接贡献和帮助的人士和单位。致谢言语应谦虚诚恳，实事求是。
]

// 学术论文和科研成果目录
#achievement(
  papers: (
    "Chen H, Chan C T. Acoustic cloaking in three dimensions using acoustic metamaterials[J]. Applied Physics Letters, 2007, 91:183518.",
    "Chen H, Wu B I, Zhang B, et al. Electromagnetic Wave Interactions with a Metamaterial Cloak[J]. Physical Review Letters, 2007, 99(6):63903.",
  ),
  patents: ("第一发明人, 永动机[P], 专利申请号202510149890.0.",),
)
