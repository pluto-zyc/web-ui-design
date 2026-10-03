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
