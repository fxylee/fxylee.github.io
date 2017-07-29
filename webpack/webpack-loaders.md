# loaders

## 使用方式（三种）
### webpack.config方式
webpack加载器是指使用第三方Node模块对需要打包的文件预处理，例如通过babel对`.js`文件预先转码然后再打包。

```javascript
const config = {
	module: {
		rules: [{
			// 必须；指定转译的文件类型的正则格式
			test: /\.css$/,
			
			// 指定该加载器不编译的文件或目录
			exclude: [''],
			
			// 必须；指定使用的加载器，多个写为数组
			use: [{
				// 加载器一
				loader: 'style-loader'
			}, {
				// 加载器二
				// 加载器名称
				loader: 'css-loader',
				
				// 加载器自身配置信息
				options: {
					modules: true
				}
			}, {
				test: /\.js$/,
				use: [{
					loader: 'babel-loader',
					options: {
						presets: ['es2015']
					}
				}]
			}]
		}]
	}
}
```

### `require()`行内方式
### webpack-cli方式