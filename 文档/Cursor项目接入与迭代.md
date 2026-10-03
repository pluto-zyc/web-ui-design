# Cursor 项目接入与迭代

本说明覆盖 Cursor 项目级安装、新项目资产初始化、页面迭代和 Skill 升级。

## 安装 / 更新

在项目根目录执行：

```powershell
& "D:\Tools\UI-Design-Skill\安装脚本\安装到Cursor.ps1"
```

检查 `.cursor/rules/ui-design.mdc`、`.cursor/skills/ui-design/SKILL.md` 和 `.cursor/skills/ui-design/VERSION`。Skill 升级只更新这些 Cursor 入口文件，不触碰项目 `ui-design/` 资产和业务页面。

## 项目检查

要求 Cursor AI 先读取 `ui-design/manifest.yaml`（若存在），检查前端依赖、组件库、主题入口、图标库、组件注册表、Design Token 和现有 Page Schema。只补缺失资产；不要从头覆盖已有数据。

项目需记录 `admin`、`visualization` 或 `hybrid` 模式。对于后台与可视化并存的项目，分别登记组件主题和适用范围。

## 新页面

```text
请使用 UI Design Skill。先读取当前项目 UI 资产和实际组件源码，再分析参考图并生成/更新 Page Schema。按项目 profile 将页面结构映射到已登记包装组件和组件库。共享组件默认保持项目主题，页面 Schema 记录数据、列、交互和图标来源。Schema 确认后再实现，最后预览检查组件、主题隔离、弹层和图标。
```

## 持续维护

只有跨页面稳定复用的模式才进入 Component Registry。统一组件主题时更新项目组件或 Token，不要求每个参考页面重新定义列表、表单或菜单样式。明确要求参考图视觉保真时，创建范围受限的命名变体。

升级 Skill 时先核对版本和资产格式。只有格式变化才迁移项目资产；仅新增规则时沿用现有 Schema 和代码。
