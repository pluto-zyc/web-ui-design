# 项目 UI 资产生命周期

## 首次接入

检查 `ui-design/manifest.yaml` 和现有 UI 文件。只有资产缺失时才从项目代码、主题和组件中初始化；现有资产为长期项目记录，应先读并增量维护。

项目清单至少记录：Skill 版本、UI 资产格式版本、项目模式和默认主题。组件库名称与版本从实际前端 package manifest 中读取。

## 日常页面开发

新参考图 → 读取 manifest / Token / Registry / 相关 Schema → 分析页面 → Page Schema → 组件与主题映射 → 代码 → 视觉验证。

每个页面创建自己的 Page Schema。共享 Design Token、Component Registry 和全局组件不应为每个页面重新生成。

## Skill 升级

安装升级只替换 Cursor / Codex 等平台的 Skill 与 Rule 文件，不触碰项目 UI 资产或页面代码。新版先识别已装版本和资产格式：规则更新只更新行为；资产结构升级才执行兼容迁移。

迁移应保留用户字段和代码实现，优先采用幂等、向后兼容的新增字段。批量改主题、删除字段或重写页面必须有明确授权。

## 资产演进

重复出现且稳定的项目模式可以进入 Component Registry；形成稳定视觉语言时更新 Design Token。页面偶有一次性细节时，将其留在页面配置或局部实现中。
