# CSS Methodologies
> There are only two hard problems in Computer Science: cache invalidation and naming things — *Phil Karlton*

*CSS 方法论：旨在以CSS Style Guide（书写规范）的方式组织代码，以提高样式的可重用性、模块化、结构化、可维护性*

> 随着项目复杂度的上升，对通用组件扩展性的要求就越高，使用通用组件的限制也就越高
> 通用组件越通用，不同模块之间的冲突也就越高，尤其是使用“元素选择器”时 
> 很多模块/组件通常依赖其他组件，例如父子模块，也即依赖上下文

- 避免使用`!important`
- 避免深层嵌套（超过3级）
- 避免`#id`选择器加"`tag`或`class`”限定
- 避免`class`选择器加`tag`选择器限定
- 减少直接使用`tag`选择器
- 减少直接使用`#id`选择器

*命名只能使用字母、数字、`-`、`_`；`#id`选择器不能使用`-`*

## 流行方法论

### [BEM](http://getbem.com/introduction/)
1. `Block` 页面中独立的模块/组件，不依赖任何其他页面元素
2. `Element` 元素/成员/节点，依赖于`block`而存在
3. `Modifier` 标识符/状态符；依赖`block`或`element`而存在；通常用于声明特别的样式或JS行为

*只使用`class`选择器命名*
- `.block`
- `.block__element`
- `.block--modifier`
- `.block__element--modifier`

*`-`在BEM中被用于断词*

*前缀命名空间修饰符*
- `b-` 普通块
- `h-` 用于把一些元素粘合在一起
- `l-` 网格布局（layout grids）
- `g-` 全局样式

*尺寸/大小修饰符*
- `normal` 普通
- `xs` 特小 `X-Small`
- `sm` 小的`small`
- `md` `middle`
- `lg` `large`
- `xl` 特大 `X-Large`

### [OOCSS]()
### [SMACSS]()
### [SUITCSS]()
### [ATOMIC]()

## Links
1. [BEM Introduction](http://getbem.com/introduction/)