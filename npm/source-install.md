# 源码安装／删除
## 源码删除npm
```bash
# 进入npm安装目录
sudo make uninstall
```

## 源码安装npm
```bash
# 进入源码目录
# make方式（封装的node方式）
make install

# node方式
# gf参数用于全局安装，否则会安装在当前目录
sudo node cli.js install -g -f npm

# 如果源码目录没有cli.js
sudo node ./bin/npm-cli.js install -g -f npm
```

```javascript
// @file cli.js
#!/usr/bin/env node
require('./bin/npm-cli.js')
```

## 源码下载
1. git

```bash
# Git递归下载方式
git clone --recursive git://github.com/isaacs/npm.git 
cd npm
sudo make install
```
2. node压缩包 —— 版本较低，不推荐

```bash
tar -xzvf node-v6.11.1-darwin-x64.tar.gz
# .tz2压缩方式
# tar -jzvf node-v6.11.1-darwin-x64.tar.bz2
cd node-v6.11.1-darwin-x64
# 安装
sudo make install
```

3. curl方式

```bash
# 尝试不成功，报错`EACCES`，很多个`errno: -13`
# 可能是文件夹权限问题，未处理
sudo curl -L https://www.npmjs.com/install.sh | sh
```

## Tips
> make的原理是执行一个叫Makefile文件里的指令  
> make的基本用处是自动根据makefile里的指令来编译源文件  
> 它还可以用来做比如安装软件，卸载软件等事情，但前提是作者在makefile里写了。

## 参考链接
1. [Git 进阶：Submodule - Havee's Space](https://havee.me/linux/2012-06/the-git-advanced-submodule.html)
2. [make install - make uninstall - make clean 命令介绍 - manon](http://www.blogdaren.com/post-1405.html)
3. [npm删除后重新安装 - 吉吉蟹](http://www.cnblogs.com/xiezhe/p/4575746.html)