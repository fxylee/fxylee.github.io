# webpack.config
```javascript
// @file webpack.config.js
const webpack = require('webpack');
const config = {
	context: '',
	entry: {},
	output: {},
	modules:{},
	plugins: {}
};

module.exports = config;
```
## entry => 打包的入口文件指定
```javascript
const config = {
	// 字符串值会自动转为 entry: { main: './src/main.js'}
	entry: './src/main.js', // {String}
	
	// 数组也会自动转为 entry: {main: ['./src/main.js']}
	entry: ['./src/main.js'], // {Array}
	
	// 推荐方式：将多个文件打包为一个文件
	entry: { // {Object}
		// main是默认的打包导出文件名，用于output.filename字段调用
		// 字符串值会自动转为 entry.main = ['./src/main.js']
		main: './src/main.js',
		
		// 多文件打包为一个入口文件
		app: [
			'./src/main.js',
			'./src/app..js'
		],
	}
};
```
## output => 打包后输出配置
```javascript
const config = {
	output: {
		// 必须；打包文件的文件名模板，[name]为entry对象的字段名
		// 相对output.path的相对路径
		filename: '[name].bundle.js',
		
		// 必须；打包后的文件输出目录路径，为绝对路径
		path: __dirname + '/'
	}
};
```

## module => 加载器



## Node module
Node模块的原理是：
> 将每个单独的`.js`文件代码封装到一个`javascript`函数里，形成封闭的作用域  
> 而Node模块的“预定义变量”（`require`、`module`）只是该函数的参数  
> 在Node加载该模块时（执行函数）自动传入这几个参数

```javascript
// IIFE
function (exports, require, module, __filename, __dirname) {
	/**
	 * require 是个函数对象
	 * require函数是依据 require.main.Module.paths数组中的路径查找模块
	 * module是对require.main.Module的引用
	 * exports是对require.main.Module.exports的引用
	 * 模块导出的是module.exports对象，所以不可将exports直接赋值
	 * 
	 * require.main.Module.paths = module.path;
	 */
	const http = require('http');
	
	// 当前Node模块的js文件路径
	__filename;
	
	// 当前Node模块所在的文件夹路径
	__dirname;
	
	module.exports = {
		http: http
	};
	
	/**
	 * return module.exports;
	**/
}
```
