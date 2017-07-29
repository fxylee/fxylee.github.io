# Vue.js

## new Vue()
	let app = new Vue({
		el: 'app', // 绑定根组件（自定义组件、dom元素组件），根组件是Vue开始的地方，根组件之外的内容不被Vue渲染
		data: {}, // 绑定数据
		computed: {}, // 声明计算属性，计算属性是静态的（除非关联的变量发生改变）
		methods: {},
		watch: {},
	});

## 指令
1. v-bind:prop="var" 绑定dom属性至变量，设置prop的值为var的值
2. v-if='expression' 移除/插入控制，绑定dom显示状态至变量（语句）
3. v-else
4. v-else-if='expression'
5. v-show="expression" 显示控制
3. v-on:event='handleMethod' 事件绑定，绑定事件处理函数
4. v-for='(item, index) in items' 绑定数组成员至dom，重复生成dom
5. v-for='(item, index) of items'
5. v-modle="var" 用于输入域，绑定输入域内容至var变量
6. v-once="var" 

## component
> **所有的 Vue.js 组件其实都是被扩展的 Vue 实例**  
> 绑定到组件`根节点`的属性将被附加到模板的`根元素`上  
> 模板`根元素`有且应该只有一个，Vue也只会渲染第一个`根元素`模板，没有`根元素`Vue将会报错  

	// 注册一个组件
	Vue.component('app', { // 参数1：组件名称，也是组件的“根节点”
		template: '<p> {{ name }}</p>', // 组件模板字符串
		props: ['name'], // 传入组件的变量名列表,
		data: function(){},
	});

--

	<app v-bind:name="value"></app>
	
## \<template>\</template>
> 不能用做`组件`的`根节点`  
> 用语包裹一段模板语句块，类似于`if`的`{}`  
> template节点中的语句块共享template绑定的属性  

	<template v-if="active">
		<h1>hello</h1>
		<h2>vue<h2>
	</template>
	<template v-else>
		<h3>hello</h3>
		<h4>word</h4>
	</template>
