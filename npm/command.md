# NPM (Node Package Manager)
> `NodeJS`包管理和分发器。  
> `node package`：基于`NodeJS`环境的的模块

## 常用命令
```bash
npm help <command>

# 查看<pkg>的安装路径
npm root -g

# 安装模块，install 可简写为 i/add，通过@x.y.z指定版本，省略则为最新版本
npm install <package-name>@x.y.z
# 全局安装
npm i <pkg> -g
# 安装并写入包配置文件package.json的dependencies字段，建立与当前包运行环境的依赖关系。简写：-S
npm i --save <pkg>
# 安装并写入配置文件的devDependencies字段，建立只与开发环境的依赖，参数--save-dev可简写为-D
npm i --save-dev <pkg>
# 强制安装，无论是否已经安装，-f
npm i <pkg> --force

# 简写：un/rm/remove
npm uninstall <pkg>
npm un <pkg> -g
npm un --save <pkg>
npm un --save-dev <pkg>

# 更新模块至最新版本
npm update <pkg>

# 列出当前安装的<pkg>及其版本，ls别名：list/ll/la
npm ls [-g]
# 列出node环境版本
npm version
# 查看npm自身版本
npm -v
# 查看仓库<pkg>已发布的版本（远程服务器）
npm view <pkg>[@<version>]
# 查看远端可用的最新版本
npm view <pkg> version
# 列出远端所有可用的版本
npm view <pkg> versions

# 清除本地node_modules缓存
npm cache clean
npm cache ls

#
npm config list [-g]
# 设置npm的配置key项的值为value
npm config set <key> <value>
npm config get <key>
```

## npm当前包版本管理
```bash
# major.minjor.patch-release

# 增加（升级）修订号
npm version patch
# 升级修订版本号，并将与发布版本号归0
npm version prepatch

# 升级次要版本号
npm version minor
# 升级次要版本号，并将修订版本号、预发布版本号归0
npm version preminor

# 升级主要版本号
npm version major
# 升级主要版本号，并将次要版本号、修订版本号、预发布版本号归0
npm version premajor
```

## npm package发布
```bash
# 在npm registry服务器注册用户
npm adduser
# 输入username/ password/ email

# 每个package都应该具备自己的package.json文件
npm publish
```