# Directives

## v-if="expression"
通过判断表达式`expression`的真假控制当前元素是否插入／移除

## v-bind:attribute="expression"
将元素的`attribute`属性值设为`expression`的计算结果。

```html
<a v-bind:href="url">hello word.</a>
```
1. 简写： `:attribute="expression"`

## v-on:event="method"
给当前元素绑定`event`事件，并指定事件处理句柄为`method`方法。

```html
<a href="#" v-on:click="dialog">hello word.</a>
```
1. `method`方法被定义在`vue`实例等`methods`属性中。

```js
new Vue({
	methods: {
		dialog: function(){
			// doSomething
		},
	}
});
```
2. 简写：`@event="method`"
3. 修饰符

> .prevent  
> .submit

## v-show="expression"
通过判断表达式`expression`的计算结果，控制元素的`display`属性是否为`none`

## v-model="expression"
用于表单控件。将控件的`value`属性与`expression`绑定。
> `v-modle`是双向绑定