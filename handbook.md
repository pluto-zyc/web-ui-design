# UI-Design-Skill v0.6.0 手册

本手册说明如何把技能接入真实项目，以及如何持续维护。升级技能、升级资产结构、实现页面是三件独立的事，任何一件都不会自动触发另外两件。

## 1. 分层与版本

通用技能负责工作流。项目资产负责该项目的主题、组件和页面。前端包清单负责组件库版本。

| 版本 | 维护位置 | 含义 |
|---|---|---|
| Skill 发布版本 | `skills/ui-design/VERSION` | 通用规则版本，例如 `0.6.0` |
| UI 资产结构 | `ui-design/manifest.yaml` | 项目资产结构版本，例如 `1` |
| 组件库 | 前端 `package.json` | 依赖版本，例如 Element Plus |

推荐的项目布局：

```text
project/
├── .agents/skills/ui-design/       # Codex
├── .cursor/rules/ui-design.mdc     # Cursor entry
├── .cursor/skills/ui-design/       # Cursor
├── ui-design/
│   ├── manifest.yaml
│   ├── design-token.yaml
│   ├── component-registry.yaml
│   ├── page-schema/
│   └── references/
└── front_end/                      # Example frontend directory
```

`ui-design/` 可以按项目的真实目录来放。代理应先定位前端根目录，再从共享的项目根目录读取 UI 资产。

WorkBuddy Desktop 在应用的「技能」页面管理已导入的技能，不会在项目内新增安装目录。

## 2. 安装或更新技能

PowerShell 的工作目录必须是项目根目录。使用本仓库中的安装脚本：

```powershell
cd "D:\Projects\my-project"
& "D:\Tools\UI-Design-Skill\scripts\install-cursor.ps1"
& "D:\Tools\UI-Design-Skill\scripts\install-codex.ps1"
```

脚本只复制所选平台的技能和规则文件。它们不会创建或修改项目的 `ui-design/` 资产，也不会修改应用代码。

WorkBuddy Desktop 请将 `skills/ui-design/` 打包为 ZIP，从 **专家 · 技能 · 连接器** → **技能** → **添加技能** → **上传技能** 导入。参见 [`platforms/WorkBuddy/install.md`](platforms/WorkBuddy/install.md)。导入由 WorkBuddy 管理，不使用 Codex 或 Cursor 的安装脚本。

更新后请确认：

```powershell
Get-Content .agents\skills\ui-design\VERSION
Get-Content .cursor\skills\ui-design\VERSION
Get-Content ui-design\manifest.yaml
```

两处技能版本必须一致。Cursor 与 Codex 的入口必须指向同一技能发布版本。项目资产版本单独维护。

对于已有项目，安装脚本不会修改 manifest。确认两处新安装的 `VERSION` 都是预期发布版本后，只更新 `ui-design/manifest.yaml` 中的 `skill.version`。其余项目资产保持不变。如果结构格式也变了，再按迁移说明更新 `uiAssetSchemaVersion`。

## 3. 接入或升级已有项目

先让代理检查当前状态：

```text
使用本项目中的 UI Design Skill。先检查技能版本、ui-design/manifest.yaml、已有的 Design Tokens、Component Registry、Page Schemas、前端依赖，以及实际源码。不要重新初始化已有资产，也不要改写已有应用页面。报告当前项目模式、组件库、主题边界、资产结构版本，以及需要的兼容迁移。只执行已授权且必要的增量资产迁移。
```

规则：

- 如果 manifest 或长期资产已经存在，读取并保留。只补充缺失的信息。
- 如果资产文件没有版本字段，按迁移说明中的兼容旧格式读取。不要仅为了补版本而重写文件。
- 如果新版本只增加了工作流规则，更新技能即可。已有页面不需要重建。
- 如果资产结构确实变了，先说明影响，保留未知字段和用户编写的内容，再执行可重复的迁移。
- 修改全局主题、删除资产字段，或批量改写页面前，必须先得到明确同意。

## 4. 项目模式与主题

在 `ui-design/manifest.yaml` 中记录实际的项目模式：

- `admin`：管理后台是默认视觉语言。
- `visualization`：大屏、地图或监控可视化是默认视觉语言。
- `hybrid`：管理端与可视化并存。两套组件和主题分别登记。

不要只根据项目名称推断模式。应查看路由、页面、UI 库和现有样式。证据不足时，询问项目负责人。

混合项目底层可以共用 Element Plus 的行为，但列表、表单、菜单和浮层使用各自 profile 的封装与主题根。浮层组件可能会传送到 `body`。通过公开接口连接主题，例如组件 class 或挂载目标。

## 5. 补齐缺失的项目 UI 资产

仅当 manifest 或某个资产文件确实缺失时才初始化。扫描真实项目：

1. 技术栈与前端根目录。
2. 已安装的组件库、图标库和主题入口。
3. CSS、SCSS、CSS Modules、Tailwind、全局变量和 Design Tokens。
4. 已复用的布局、页面模式和组件。
5. 管理端与可视化 profile，以及两者的主题边界。

只登记可以核实的真实组件和 token。未知字段标为 `unknown`。计划中的组件与已实现的组件分开标注。初始化 UI 资产本身不要求修改应用代码。

## 6. 优先使用组件库和共享封装

选择控件前，先读 Component Registry 和源码：

1. 当前 profile 已有的项目封装。
2. 已安装的组件库控件，并使用项目的主题默认值。
3. 可组合的项目基础件。
4. 该模式在多个页面中稳定，或用户明确要求时，再新增共享封装。
5. 仅属于该页面的结构，做页面内实现。

项目使用 Element Plus 时，常见表单、输入框、选择器与树选择、按钮、表格、分页、菜单、对话框和反馈优先复用。Element Plus 支持全局或局部 CSS 变量，以及 SCSS 主题变量。混合项目中要限制这些变量的作用范围。不要让单个页面的样式全局覆盖所有 `.el-*` 组件。

`BaseTable` 这类共享表格应定义主题、列配置、选择、分页、加载、空状态和插槽。默认页面复用这套视觉处理。Page Schema 仍然列出具体字段、列、操作和数据状态。表格组件负责呈现和交互。页面或数据层负责 API。

只有在需要稳定默认值、业务约束、主题隔离，或跨页面复用时才创建封装。API 保持可组合。不要为单个页面做一个过度通用的组件。

### 参考稿与项目一致性的默认关系

共享组件按项目已登记的主题渲染。参考稿决定整体布局、信息和内容关系。如果参考稿中的列表与 `BaseTable` 外观不同，仍保持 `BaseTable` 的处理。只有当用户明确要求当前页面按参考稿高保真还原，或要求修改全局或局部列表主题时，才使用具名变体或页面主题。

## 7. 选择图标

先查找设计源文件或项目图标库。其次从图标库中选一个接近的图标。需要缩放或跟随主题色的简单图标，绘制 SVG。仅当没有源素材、外形必须精确、且图标较小并固定尺寸使用时，才从原型截图裁切 PNG。可复用图标要记录语义名称、来源和路径。不要把裁切截图当作默认图标体系。

## 8. 新页面工作流

把需求和参考稿交给代理，并先要求做页面分析：

```text
使用 UI Design Skill。分析参考稿并实现页面。
先阅读项目 manifest、Design Tokens、Component Registry、相关 Page Schemas，以及组件库和图标规则。保留这些已有资产。
根据项目 profile，分析 Layout、Main、Section、Grid、Form 和 Table。判断页面是 viewport-locked 还是 content-driven。如果是 viewport-locked，定义根尺寸、固定区域和剩余内容区，并写明哪个区域负责纵向滚动、哪个区域负责横向滚动。检查 Grid 和 Flex 子项的最小尺寸，避免它们意外撑开文档。把重要尺寸和滚动归属记入 ui-design/page-schema/ 下的 layout.sizing。然后映射可复用组件、主题和图标。
默认保持已登记的共享组件主题。如果参考稿中的局部样式与之冲突，记录冲突并遵循项目主题。只有我明确要求高保真还原时，才创建受约束的变体。
结构确认后再实现页面。优先使用项目封装和组件库。不要重做已登记组件的视觉处理，也不要把数据请求放进通用 UI 组件。
实现后在浏览器中预览页面。截图并修正布局、组件、主题状态、浮层、图标和响应式表现。视口布局至少检查桌面、目标窄宽和矮视口。确认顶栏保持固定、内容区滚动、宽表格在自身内部横向滚动，文档不会意外溢出。
```

如果用户要求先做结构评审，只生成 schema，等确认后再写代码。

## 9. 视觉检查

检查页面结构、profile、共享组件用法、表格和表单状态、图标来源、主题变量、对话框与下拉浮层、响应式布局，以及真实数据状态。按用户选择的 `system-first` 或明确的 `reference-match` 目标核对。截图出现问题时，先修正结构和组件映射，再调整 token 和局部样式。

## 10. 项目资产的职责

| 文件 | 职责 |
|---|---|
| `manifest.yaml` | Skill 发布版本、资产结构、项目模式，以及主题 / 组件库边界 |
| `design-token.yaml` | 项目及各 profile 的长期视觉变量：颜色、字体、间距、圆角等 |
| `component-registry.yaml` | 真实组件、状态、用途、变体、约定和主题范围 |
| `page-schema/*.yaml` | 单个页面的结构、列与字段、交互、组件映射、图标，以及页面级例外 |
| 前端源码 | 实际的组件实现、页面代码，以及后端数据接入 |

通用技能规则不能覆盖项目的实际实现。登记表中的路径必须能在代码中核对。
