# Cursor 首个项目实验

> 第一次使用请优先阅读根目录 `使用手册.md`。本文件是实验流程的补充说明。

## 实验目标

验证以下链路是否能够稳定运行：

```text
参考图 → Page Schema → Component Registry + Design Token → 代码 → 截图验证
```

## 1. 安装

### PowerShell 一键安装

在**你的前端项目根目录**打开 PowerShell：

```powershell
cd "D:\Projects\my-project"
& "D:\Tools\UI-Design-Skill\安装脚本\安装到Cursor.ps1"
```

macOS/Linux 可以执行：

```bash
cd /path/to/my-project
bash /path/to/UI-Design-Skill/安装脚本/安装到Cursor.sh
```


只安装 Cursor 所需内容：

```text
.cursor/
├── rules/
│   └── ui-design.mdc
└── skills/
    └── ui-design/
```

不要安装 `.agents/skills/ui-design/` 或 `.claude/skills/ui-design/`。

## 2. 项目初始化

建议在项目根目录建立：

```text
ui-design/
├── design-token.yaml
├── component-registry.yaml
└── page-schema/
```

可以先使用 `核心规范/模板/` 中的模板。第一次实验也可以让 AI 根据现有代码生成它们。

## 3. 初始化 Prompt

```text
请使用 UI Design Skill。
先扫描当前项目的 UI 相关代码、组件、CSS 变量、主题配置和页面。
请建立或完善项目级 ui-design/design-token.yaml 与
ui-design/component-registry.yaml。

要求：
1. 优先提取项目真实存在的 Token。
2. 优先登记项目已经存在的组件。
3. 不要为了满足模板而虚构不存在的组件。
4. 不要修改业务代码。
5. 完成后告诉我 Token 和组件注册表分别来自哪些项目文件。
```

## 4. 新页面 Prompt

```text
请使用 UI Design Skill，根据我提供的参考图实现这个页面。

第一阶段：只分析，不写业务代码。
1. 分析 Layout / Main / Section / Grid / Card / Table 等结构。
2. 在 ui-design/page-schema/ 中生成对应的页面 Schema。
3. 读取 ui-design/design-token.yaml。
4. 读取 ui-design/component-registry.yaml。
5. 将参考图中的视觉结构映射到已有组件。
6. 如果缺少组件，先列出候选新增组件及原因，不要随意创造。

第二阶段：实现代码。

第三阶段：使用当前项目可用的预览/截图方式检查结果。
如果视觉结果与参考图存在明显差异，优先修正结构、组件、Token、尺寸和间距，再处理局部 CSS。
```

## 5. 验证重点

实验时重点观察：

- AI 是否真的先生成 Page Schema。
- 是否优先使用已有组件。
- 是否使用项目 Token，而不是自行写大量颜色值。
- 新页面与已有页面的视觉语言是否一致。
- 截图后是否能根据偏差进行第二轮修正。
- 当参考图与项目 Design System 冲突时，是否遵循项目优先原则。

## 6. 成功标准

第一次实验不要求 100% 像素级还原。首先验证流程是否稳定：

> **结构先于代码、项目系统先于临时样式、组件复用先于新建、截图验证先于结束。**
