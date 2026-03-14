# 苏州大学计算机毕业论文 Typst 模板

这是一个用于撰写苏州大学（主要针对计算机科学与技术学院等相关专业）毕业论文的 Typst 模板。Typst 是一种现代的、基于 Rust 的排版系统，相比于传统的 LaTeX，它有着极其迅速的编译速度、更清晰报错以及更加平易近人的语法。

> **⚠️ 注意与特别说明**
> 本项目是修改自 **上海交通大学** 的开源模板 [`tzhTaylor/modern-sjtu-thesis`](https://github.com/tzhTaylor/modern-sjtu-thesis)。由于是在原有基础上进行适配和魔改，在 `suda-typst-template` 目录下可能还会有没有完全修改干净的历史遗留痕迹（例如可能在注释、变量名或部分不易察觉的地方残留了 `sjtu` 等字样）。敬请各位同学在使用时留意，这些残留一般不会影响最终 PDF 的渲染效果，若有发现也可直接忽略或提 PR 辅助清理。

---

## 🚀 使用指南

### 1. 安装 VS Code 及 Typst 插件（推荐）

为了获得最好的写作体验（包括实时预览、自定补全、语法高亮和错误提示），**强烈推荐使用 VS Code 在本地进行编辑**。

在使用本模板之前，请先在 VS Code 中安装必备的 Typst 插件：

**插件下载及安装步骤：**
1. 打开 VS Code。
2. 点击左侧活动栏的 **“扩展 (Extensions)”** 图标，或使用快捷键 `Ctrl+Shift+X` (Windows/Linux) / `Cmd+Shift+X` (macOS)。
3. 在搜索框中输入 **`Tinymist`**。
4. 找到 **Tinymist Typst**（作者通常为 myriad-dreamin），点击 **安装 (Install)**。
   *(此插件集成了语法高亮、错误检查和非常流畅的 PDF 预览功能，是目前最推荐的 Typst 插件)*

### 2. 获取并使用模板

1. 使用 Git 克隆本仓库到本地，或者直接点击页面上的 `Download ZIP` 下载并解压。
   ```bash
   git clone https://github.com/你的用户名/suda-cs-thesis-template.git
   ```
2. 在 VS Code 中打开克隆或解压后的整个目录（即 `suda-cs-thesis-template` 文件夹）。
3. 在文件资源管理器中找到并打开论文的主入口文件 **`thesis.typ`**。
4. 按下快捷键 `Ctrl + K` 然后按 `V` (Windows) / `Cmd + K` 然后按 `V` (macOS)，或者点击编辑器右上角的 **“Typst Preview” (或类似放大镜/分屏文档)** 按钮。
5. 此时侧边栏会弹出实时渲染的 PDF 预览。当你修改并保存 `.typ` 文件时，PDF 会在毫秒级时间内自动更新！

---

## 📂 目录结构说明

- `chapters/`：用来存放论文正文章节（如绪论、相关工作、核心方法、实验结果等）的单独 `.typ` 文件，保持主文件整洁。
- `figures/`：用来存放所有论文中所插入的图片（如架构图、实验散点图等）。
- `suda-typst-template/`：**核心模板文件夹**，定义了字体、封面、摘要、目录、各级标题等底层排版样式（修改自上交大模板），一般情况下不需要改动。如果有高级定制需求可在此修改。
- `ref.bib`：参考文献数据库，存放 BibTeX 格式的参考文献引用条目。
- `thesis.typ`：论文的**主文件入口**，包含了作者信息配置、盲审/打印模式切换以及各个章节的引入。

---

## 🙏 致谢 (Acknowledgements)

- **特别鸣谢**：本项目基于上海交通大学开源的 Typst 学位论文模板 **[`tzhTaylor/modern-sjtu-thesis`](https://github.com/tzhTaylor/modern-sjtu-thesis)** 进行修改与二次开发。感谢原作者出色的宏包设计、模块划分及排版细节，这使得适配苏大格式成为可能。没有前人的开源奉献，就没有本模板的诞生，特此致以最诚挚的谢意！
- 同时也感谢 [Typst](https://typst.app/) 官方团队以及 Typst 中文社区为现代文档排版带来的革命性体验。
