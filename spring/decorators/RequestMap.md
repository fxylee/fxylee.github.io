# RequestMapping

控制器、方法级装饰器


## 参数

### `value`：通过请求路径限定请求的路由

```java
@RequestMapping("/requestPath")

@RequestMapping(value = "/requestPath")

// 将多个请求路径映射到同一个方法
@RequestMapping(value = {
  "",
  "/requestPath",
  "/requestPath2"
})

// 动态URI —— 参数变量
@RequestMapping(value = "/{id}")
@RequestMapping(value = "/{id:[a-z]+}")
```

### `params`：通过请求参数...
```java
@RequestMapping(params = {
  "name=value",
})
```

### `method`：通过请求的方法类型...
```java
@RequestMapping(method = RequestMethod.GET)
@RequestMapping(method = RequestMethod.POST)
```

### `produces`：指定response的响应类型
```java
@RequestMapping(produces = {
  "application/json"
})
```

### `consumes`：通过请求的文档类型...
```java
@RequestMapping(consumes = {
  "application/json",
  "application/xml"
})
```
### `header`：通过请求头...
```java
@RequestMapping(header = {
  "content-type=text/plain",
  "content-type=text/html"
})
```

## 组合注解
- `@GetMapping`
- `@PostMapping`
- `@DeleteMapping`
- `@PutMapping`
- `@PatchMapping`

## 其他

### `@RequestParam`：获取查询参数（query string）
```java
@RequestMapping("/")
String methodName (@RequestParam("id") int modelId) {
  // do something...
}

@RequestMapping("/")
String methodName (@RequestParam(value = "id", required = false) int modelId) {
  // do something...
}

// 请求参数名与映射到方法的参数名相同时
@RequestMapping("/")
String methodName (@RequestParam int id) {
  // do something...
}
```

### `@PathVariable`：获取路径变量（动态片段/静态片段）
```java
@RequestMapping("/{id}")
String methodName (@PathVariable int id) {
  // do something...
}

@RequestMapping("/{id}/profile/{name:[a-z]+}")
String methodName (
  @PathVariable int id,
  @PathVariable("name") String name
) {
  // do something...
}
```

### 控制器类的`default`方法
```java
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

@RestController
@RequestMapping("/")
public class IndexController {
  // 方法名随意，默认方法主要是因为@RequestMapping没有限定请求路径
  @RequestMapping()
  ResponseEntity< String > default () {
    return new ResponseEntity< String >(HttpStatus.FORBIDDEN);
  }
}
```
