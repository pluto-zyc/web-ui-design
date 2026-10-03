# UI Design Skill

## 目标

让 AI 在已有前端项目中，根据参考图或页面需求，先建立页面结构，再复用项目 UI 系统生成页面，并通过截图/预览进行验证。

## 强制工作流

### 1. 读取项目 UI 上下文

如果项目存在：

- `ui-design/design-token.yaml`
- `ui-design/component-registry.yaml`
- `ui-design/page-schema/`

必须优先读取它们。

如果项目尚未建立 UI Manifest，应先检查真实项目代码中的主题、CSS 变量、组件、页面模式，再建立最小可用 Manifest。

### 2. 分析参考图

不要看到截图就直接写代码。先分析：

`Page → Layout → Main → Section → Component`

识别 Header、Sidebar、PageHeader、Grid、Card、Table、Form 等结构。

### 3. 生成 Page Schema

新页面应先产生页面级结构描述。Page Schema 是页面实现的中间表示，不等同于最终 HTML/JSX。

### 4. 映射组件

读取 Component Registry，并优先复用已有组件。只有不存在合适组件时，才提出新增组件。

### 5. 映射 Design Token

颜色、字体、间距、圆角、阴影、断点等优先使用项目 Token。禁止为了一个页面临时创造第二套设计体系。

### 6. 生成代码

Page Schema + Component Registry + Design Token 确认后再实现代码。

### 7. 截图验证

使用当前项目可用的预览、浏览器或截图能力检查：结构、比例、间距、颜色、字体、圆角、组件选择、信息密度和整体视觉一致性。

### 8. 修正

发现偏差时，优先检查：

1. Page Schema
2. 组件选择
3. Design Token
4. Layout 尺寸与间距
5. 局部 CSS

## 项目优先原则

项目已有 UI 系统优先于 Skill 默认规则。参考图用于表达目标视觉，不意味着可以破坏项目已有 Design System。

## 资产边界

Skill 是通用能力；Design Token、Component Registry 属于项目级长期资产；Page Schema 属于页面级资产。

## 详细规则

需要时读取 `参考资料/` 中的对应文档，不要求每次加载全部内容。
