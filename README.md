# UI-Design-Skill v0.6.0

> 将项目既有组件库、UI 资产和项目类型纳入参考图页面开发流程，持续维护一致的页面与组件系统。

## 工作流程

```text
读取 Skill / UI 资产版本
        ↓
扫描前端项目、组件库、图标库与主题
        ↓
读取项目 profile、Design Token、Component Registry
        ↓
参考图分析 → Page Schema
        ↓
映射组件库 / 项目包装组件 / 图标
        ↓
实现 → 浏览器视觉验证 → 修正
```

## v0.6.0

- 未指定项目字体时推荐 Alibaba PuHuiTi 3.0，并规定跨页面、Element Plus 控件及弹层的统一字体映射。
- 新增字体资源交付、授权留存、图标字体保护与字体加载验证规范。

## v0.5.0

- 检测并优先使用项目已安装的组件库及符合当前 Profile 的项目包装组件，避免重复手写常规控件。
- 增加视口根布局适配规则：先明确根容器尺寸、固定区域、剩余内容区及滚动责任，再实现页面。
- 视觉验证覆盖窄/矮视口、文档级意外溢出和表格内部横向滚动。
- 以持续项目开发与增量维护为默认工作方式，升级 Skill 不会触发资产或代码重写。
- 项目 manifest 记录 Skill release、UI 资产格式版本、项目模式与默认主题。
- 支持 `admin`、`visualization`、`hybrid` profile，并隔离后台和可视化主题。
- 为 Element Plus 等共享库明确主题变量、局部作用域与弹层隔离边界。
- 补充 BaseTable 等共享组件的复用边界、Element Plus 主题变量和弹层隔离规则。
- 补充图标源素材、图标库、SVG 与截图裁切的选择策略。
- 提供 Cursor 与 Codex 平台安装和升级指引。

## 项目长期资产

```text
ui-design/
├── manifest.yaml
├── design-token.yaml
├── component-registry.yaml
└── page-schema/
```

`manifest.yaml` 记录 Skill 与资产格式版本。其它资产由项目持有。安装 Skill 只更新平台入口文件，不覆盖项目级 `ui-design/` 内容。

## 接入与升级

按 `使用手册.md` 安装。已有项目升级时，检查当前资产并按需迁移；只更新 Skill 规则时不必重新生成页面。

详细策略见 `技能/ui-design/SKILL.md` 和 `技能/ui-design/参考资料/`。Cursor 接入指引见 `文档/Cursor项目接入与迭代.md`。
