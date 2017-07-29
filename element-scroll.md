# `element`的`scroll`相关

## `element.scrollLeft`／ `element.scrollTop`
> 返回/设置`element`的水平/垂直滚动距离  
> 设置为负值，将会被设置为0  
> 设置为大于可滚动距离的值，将会被设置为最大值  
> `element.scrollTop(max) + element.clientHeight === element.scrollHeight`

## `element.scrollWidth`/ `element.scrollHeight`
> 获取`element`的内容高度，包括不可见内容高度（e.g. overflow: hidden)  
> 四舍五入取整  
> 包括`element`的`padding`，也不包括`element`的`border`，更不包括`margin`  

## `element` = `window`：`window`相关`scroll`

### `window.scrollX`/ `window.scrollY`
> 获取文档水平/ 垂直方向滚动距离  
> 只能用户代理设置；自己设置`window.scrollY`将会使`scrollY`被当作`window`对象的常规属性（用户定义属性）  
> `window.pageXOffset`和`window.pageYOffset`是它们的别名  
> IE9以下浏览器不支持和它们的别名  

```javascript
// 低版本IE浏览器
var root = document.documentElement || document.body;
var scrollY = root.scrollTop;
```
**Firefox通过`html`来设置文档的滚动，chrome通过`body`来设置文档的滚动。**  
**在低版本Firefox和IE浏览器，文档若声明`DTD`，`document`支持`documentElement`，否则不支持，需通过`document.body`代替**

### `window.pageXOffset`/ `window.pageYOffset`
> `scrollX`和`scrollY`的别名  
> 用户代理分别设置`scrollY`和它的别名`pageYOffset`，互不影响  
