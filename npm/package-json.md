# package.json
> NodeJS package配置文件  
> 严格遵循JSON语法

```javascript
{ // @file: package.json
	"name": "",
	"version": "",
	"description": "",
	"keywords": [],
	"author": "",
	"Homepage": "", // 不带http(s)的URL
	"license": "",
	"repository": {
		"type": "",
		"url": ""
	},
	"bugs": {
		"url": "",
		"email": ""
	},
	"preferGlobal": {boolean},
	// man文档？
	"main": [],
	// 指定浏览器环境可使用的版本
	"browser": {
	},
	// 指定浏览器版本使用的css文件
	"style": [
	],
	// 指定package运行环境
	"engines": {
		"node": ">=0.10.3 <0.12",
		"npm": "^1.0.20"
	},
	// 定义可在可在命令行脚本中调用的环境变量，同时可调用的还有npm config list中的字段
	// NodeJS调用方式：process_env.npm_package_config_port
	"config": {
		"port": "8080"
	}
	// 指明该package模块的入口文件；NodeJS的require('package')会加载该文件
	"main": "index.js",
	"scripts": {
		"test": "",
		"build": "",
		"start": ""
	},
	// 定义一个命令，并指明该命令对应的文件；bin中的命令可在scripts中直接调用
	// 指定的文件会在./node_modules/.bin目录下建立符号链接，生成可调用的命令
	"bin": {
	},
	// 定义项目运行时的依赖包列表
	"dependencies": {
	},
	// 定义项目开发环境的依赖包列表
	"devDependencies": {
	},
	// 定义插件的依赖包列表
	"peerDependencies": {
	},
}
```

## NodeJS package版本号说明
**[语义化版本控制](http://semver.org/lang/zh-CN/)**  
格式：major.minjor.patch[-pre-release][+build]

1. 主版本号（major）：大变动，不向下兼容
2. 次版本号(minjor)：新增功能，向下兼容
3. 补丁版本号(patch)：向下兼容性bug修复
4. 先行版本号(pre-release）：预发布版本号

> Alpha(α)：内测版  
> Beta(β)：公测版  
> Gamma(λ)：相对成熟的测试版（相当于发行的正式版）  
> RC(Release Candidate)：即将发布的候选版本，RC后面一般会带上数字，表示取舍关系  
> Stable：稳定版
>
5. 编译版本信息（Build Metadata）：

### npm中的版本约束语法
```bash
# 限定为固定版本 4.2.0
version

[> | >= | < | <= | =]version

# 限定主版本号和次版本号 ~4.2.0 === 4.2.x
~version

# 只限定主版本号 ^4.2.0 === 4.x.x
^version

# 不小于3.2版本，不大于3.3版本；x可用*代替
3.2.x

version1 - version 2

# 并列的一组版本
version1 || version2

# 主版本号为0，表示初始开发的不稳定版本，大于0的版本必须具备稳定版本的api
0.y.z
```

## 参考链接
1. [package.json文件 - 阮一峰](http://javascript.ruanyifeng.com/nodejs/packagejson.html)
2. [package.json - 欢乐木匠艾瑞克翻译 ](http://www.mujiang.info/translation/npmjs/files/package.json.html)
3. [语义化版本（SemVer）的范围 - raid - u396](http://www.u396.com/semver-range.html)