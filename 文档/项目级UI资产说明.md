# 项目级 UI 资产说明

## 哪些内容是通用的？

`技能/ui-design/` 是通用能力，一次安装，多项目复用。

## 哪些内容属于具体项目？

```text
ui-design/
├── manifest.yaml
├── design-token.yaml
├── component-registry.yaml
└── page-schema/
```

这些内容应随项目维护。`manifest.yaml` 记录 Skill 版本、UI 资产格式版本、项目类型、默认主题和组件库信息。

## 是否每个项目都要手工创建？

不需要。首次接入时可让 AI 从现有代码、组件、主题、CSS 变量和原型中整理。之后按需增量维护，Skill 升级不自动重新生成这些资产。

## Page Schema 是否每页都需要？

如果需要结构化生成和持续维护，建议每个重要页面都有自己的 Schema。它是页面级资产，不是项目级 Design Token。

## 一个新项目的初始化顺序

```text
现有项目代码 / 组件库 / 设计稿
       ↓
读取 manifest、确定项目 profile 与资产版本
       ↓
缺失时初始化 Design Token / Component Registry
       ↓
新页面 → Page Schema → 组件库 / 注册包装组件映射
       ↓
代码
       ↓
截图验证
```
