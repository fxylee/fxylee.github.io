# webpack2 打包css文件
1. 必须配置两个`loader`：`style-loader`、`css-loader`
2. `style-loader`配置在`css-loader`之前，顺序不可乱，但调用顺序反之
3. `style-loader`用于将`css-loader`加载的样式表以`<style>`标签嵌入`html`
4. `css-loader`用于加载编译javascript文件中通过`require()`、`import`以及css文件中的通过`@import`、`url()`引入的css文件

## Tips
1. loader的加载顺序是从右往左，从下往上