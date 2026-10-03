# 项目级 UI 资产说明

## 哪些内容是通用的？

`技能/ui-design/` 是通用能力，一次安装，多项目复用。

## 哪些内容属于具体项目？

```text
ui-design/
├── design-token.yaml
├── component-registry.yaml
└── page-schema/
```

这些内容应随项目维护。

## 是否每个项目都要手工创建？

不需要。第一次接入项目时，可以让 AI 从现有代码、组件、主题、CSS 变量和原型中整理出来。之后随着项目演进再维护。

## Page Schema 是否每页都需要？

如果需要结构化生成和持续维护，建议每个重要页面都有自己的 Schema。它是页面级资产，不是项目级 Design Token。

## 一个新项目的初始化顺序

```text
现有项目代码 / 设计稿
       ↓
初始化 Design Token
       ↓
初始化 Component Registry
       ↓
新页面 → Page Schema
       ↓
代码
       ↓
截图验证
```
