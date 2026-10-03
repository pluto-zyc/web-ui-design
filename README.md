# UI-Design-Skill v0.3.0

> 让 AI 按照项目既有 UI 系统，从参考图稳定地产生一致的前端页面。

## 核心流程

```text
参考图 / 页面需求
      ↓
AI 分析页面结构
      ↓
生成 Page Schema
      ↓
读取项目 Design Token
      ↓
读取 Component Registry
      ↓
优先复用已有组件
      ↓
生成代码
      ↓
截图 / 预览验证
      ↓
修正结构、组件、Token 与视觉偏差
```

## v0.3 的关键变化

v0.2 主要是一套行为规范；v0.3 增加了**项目级 UI Manifest** 的概念。

一个具体项目第一次接入后，可以在项目内维护：

```text
ui-design/
├── design-token.yaml
├── component-registry.yaml
└── page-schema/
    ├── dashboard.yaml
    └── ...
```

其中：

- `design-token.yaml`：项目长期复用的颜色、间距、圆角、字体、阴影等。
- `component-registry.yaml`：项目已有组件及其使用约束。
- `page-schema/*.yaml`：每个页面的结构中间表示，由参考图/需求分析得到。

**不要为每个新页面重新创建 Design Token 和 Component Registry。** 新页面主要产生自己的 Page Schema，并复用已有项目 UI 系统。


## 第一次使用

如果你是第一次从 GitHub 下载本项目，**先打开根目录的 `使用手册.md`**。

它会从安装开始，带你完整走通：

```text
安装到 Cursor
    ↓
分析已有项目 UI
    ↓
建立 Design Token + Component Registry
    ↓
提供第一张参考图
    ↓
生成 Page Schema
    ↓
验收 Schema
    ↓
生成代码
    ↓
截图验证
    ↓
修正并完成第一个页面
```

第一次走通以后，再查看 `文档/` 下的其他说明即可。

## Cursor 实验

最简单的实验方式：

1. 打开一个真实前端项目。
2. 将本仓库的 `技能/ui-design/` 安装到 `.cursor/skills/ui-design/`。
3. 将 `核心规范/` 复制到项目中的 `ui-design/模板/` 或作为项目规范参考。
4. 在 Cursor 中给 AI 一张参考图。
5. 明确要求先分析并生成 Page Schema，再编码。
6. 让 AI 截图检查并修正。

详细步骤见 `文档/Cursor首个项目实验.md`。

## 当前定位

v0.3 仍然是**AI Agent 的规范与中间层**，不是自动视觉回归引擎，也不是编译器。它通过结构化文件和明确流程提高不同 Agent、不同页面之间的一致性。
