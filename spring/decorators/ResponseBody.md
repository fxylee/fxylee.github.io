# `@ResponseBody`
方法级注解，表示该方法发返回结果直接写入HTTP Response 的`body`中（表示不再继续执行视图处理器），直接向客户端返回输出流

方法返回结果会通过`HttpMessageConverter`对象通过一定的系统配置转换为指定格式

> response 由响应头（header）、响应体(body)、状态吗（Status）组成


## `@RequestBody`
方法级注解，用于将请求参数封装格式化为`Bean`对象。

封装时使用`HttpMessageConverter`对象通过一定的配置进行解析参数

```java
String index (@RequestBody User currentUser) {
  // do something...
}
```

## `@ResponseStatus`
通常用于修饰一个自建的异常类或异常方法，然后调用，用于抛出异常

```java
@ResponseStatus(value = HttpStatus.FORBIDDEN, reason = "权限不足，禁止访问")
@RequestMapping("/")
String index () {
  // ...
}
```

## 其他

> `HttpMessageConverter`会根据请求的`Content-Type`来选择不同的规则（配置）封装请求对象；根据`@RequestMapping`的`produces`参数构造响应体（`ResponseBody`）

-

> `@ResponseBody`通常和`@Controller`注解配合使用，用于向客户端返回`json`或`xml`格式  
> `@RestController`是`@ResponseBody`和`@Controller`的组合，但在Spring 4.0后可用

### `ResponseEntity`
用于构造一个完整的`Response`，包括响应头、响应体，状态码

> 响应头通常通过`HttpHeader`类构造

```java
// ResponseEntity通过两个内嵌的构造器(BodyBuilder、HeaderBuilder)提供一些便利的静态方法
// 返回的是ResponseEntity对象实例，因此可以链式调用ResponseEntity的方法

// BodyBuilder
ResponseEntity.ok("");
ResponseEntity.accepted();
ResponseEntity.badRequest();
ResponseEntity.created();

// HeaderBuilder
ResponseEntity.noContent();
ResponseEntity.notFound();
```




