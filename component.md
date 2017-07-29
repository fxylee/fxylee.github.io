# component
> 一个`vue`组件就是一个`vue类`的实例。  

## 创建一个全局组件
```javascript
Vue.component('component-name', {
	template: '<div><p>{{ foo }}</p><p>{{ message }}</p></div>',
	data: function(){
		return {
			foo: 'foo from data option',
		};
	},
	props: [
		'message',
	],
	computed: {
	},
	methods: {
	},
	watch: {
	}
});
```

### option.data
组件的`data`属性被规定为**必须是一个函数**，且必须返回一个新建的`object`，不能返回已定义的对象（**的引用**）。

1. 为什么不能直接赋值为一个`object`？  
因为如果`data`属性是一个对象或者已定义对象的引用，那该组件生成的所有实例将共享该`data`对象，因为在`javascript`中`Object`类型是引用共享传递。

### option.props
定义了该组件接受外部数据的接口（属性名），通常来自父组件。

两种数据结构：1. 字符串数组；2. 字面量对象（可以指定数据验证规则）

```html
<!-- app为父组件，child为子组件（component-name） -->
<app>
<!-- 通过v-bind绑定属性的方式传入外部变量数据；
将app的name属性传递给child，child通过message的接受数据 -->
	<child v-bind:name="message"></child>
</app>
```
> `props`相当于HTML语言中元素的属性。组件相当于自定义了一个html元素。

```html
<!-- 通过“元素属性”的方式传入常量数据，且数据只会是字符串 -->
<child message="Hi ,i'm from outer."></child>
```