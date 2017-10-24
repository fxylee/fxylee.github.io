# Babel
> `JavaScript`编译/转译器（平台）  
> 将高版本的`js`代码转码为环境兼容的低版本`js`代码

## babel 组成
1. babel-core
2. babel-cli
3. babel-node
4. babel-register
5. babel-preset-*
6. babel-polyfill
7. babelify
8. babel-doctor

> babel6之前，babel package包含所有东西，只需安装一次   

## 开始之前：`.babelrc`
> `babel`配置文件。  
> 用于指定转码规则以及对应所需的插件（需要安装）  
> 通过`.babelrc`可以设定不同的转码规则  
> 如果没有`.babelrc`文件，则每次转码前需通过参数指定转码规则  

```javascript
// .babelrc文件为JSON格式
{
	// babel6新增
	// 指定转码规则
	"presets": [
		"es2015",
		"react",
		"stage-2",
		"env": [
			"target": {
			},
			"include": [], // 白名单：一定会转换
			"exclude": [], // 黑名单：一定不会转换
			"modules": false // 指定es6 module转码为何种模块，默认commonjs，false表示不转码
		]
	],
	"plugins": [], // 可以指定单独功能的转码规则，例如指定只转码es6的单个函数
}
```
*`rc`结尾的文件是类`linux`系统中程序运行时会自动加载的文件，通常用于配制文件。e.g.: `bashrc`*

## `babel`预设转码规则插件
以下规则会被写入`.babelrc`的`presets`选项。

```cli
# ES2015转码规则
npm install --save-dev babel-preset-es2015

# babel 转码环境变量预设插件
npm install --save-dev babel-preset-env

# react转码规则
npm install --save-dev babel-preset-react

# ES7不同阶段语法提案的转码规则（共有4个阶段），选装一个
npm install --save-dev babel-preset-stage-0
npm install --save-dev babel-preset-stage-1
npm install --save-dev babel-preset-stage-2
npm install --save-dev babel-preset-stage-3
```

## Run babel in cli: babel-cli
### 安装
```bash
# 本地安装会导致不能在bash中直接运行`babel`命令，除非通过`npm script`运行
# 因为`npm`会将./node_modules/.bin目录的命令临时加入npm打开的shell的环境变量中
npm install --save-dev babel-cli

# 全局安装会导致项目对环境的依赖
npm install -g babel-cli
```

### 命令：`babel target`  
```bash
# 常用参赛

# 转码example.js并将转码后的内容输入在cli
babel example.js

# 转码文件并输出到compiled.js
# -out-file 可简写为 -o
babel example.js --out-file compiled.js

# 转码src目录的文件到lib目录
# --out-dir 可简写为 -d
babel src --out-dir lib

# 转码并生成source map文件
# --source-maps 可简写为 -s
babel src -d lib --source-maps

# 命令行指定转码规则，无需.babelrc文件
# 运行前必须先安装es2015对应的转码规则
babel example.js --presets es2015

# 实时转码src目录到lib
# --watch 可简写为 -w
babel src --watch -d lib 
```

## Links
1. [中文网](http://babeljs.cn/)
2. [babel-preset-env: a preset that configures Babel for you](http://2ality.com/2017/02/babel-preset-env.html)
