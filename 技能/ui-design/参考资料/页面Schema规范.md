# Page Schema 规范

Page Schema 描述页面的结构和组件关系，不描述所有最终 CSS。

推荐结构：

```text
Page
└── Layout
    ├── Header
    ├── Sidebar
    └── Main
        ├── PageHeader
        ├── Section
        │   └── Grid / Flex / Card
        └── Section
            └── Table / Form / List
```

Schema 应能回答：

- 页面有哪些区域？
- 区域之间如何嵌套？
- 每个区域使用哪个组件？
- 哪些地方需要新增组件？
- 哪些结构与参考图对应？
- 页面是视口锁定还是内容驱动？固定区域、剩余区域和纵/横向滚动分别由谁负责？

当页面采用视口锁定布局，或布局/内容有明显溢出边界时，在 `layout.sizing` 记录根尺寸策略、固定区域、剩余内容区以及垂直/水平滚动的所属区域。此字段可选；简单的自然文档流页面无需填写。它描述页面布局责任，不规定 CSS 实现。
