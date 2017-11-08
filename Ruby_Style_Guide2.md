# Ruby Style Guide 2

## 异常处理
[异常类结构图](http://naotu.baidu.com/file/1bb0bdbf2e5d7d6593b9a57ec2fb50e5?token=c2602b71835fb17a)
```ruby
begin
  # 显式抛出异常
  raise [ExceptionType] ['error message'] [condition]
rescue # 捕获标准异常
  $! # 表示异常信息
  $@ # 表示异常位置
  retry # 从begin处再次执行；容易造成无限循环
  
else # begin代码块没有异常时执行

ensure # 无论是否有异常，都会进入ensure代码块
end
```

 1. 倾向使用`raise`抛出异常，而不是`fail`；且`raise`指定异常类型时，使用异常类，而不是异常实例
 2. `raise`不显式指定明确的`RuntimeError`(它是`raise`默认抛出的异常类型，且`rescue`默认捕获`StandardError`及其子类)
 3. 不要在`ensure`语句显式使用`return`更不要将`begin... rescue... end`当做条件语句使用（`ensure`早于方法返回之前执行，`ensure`中显式的`return`语句会截断方法正常的`begin`代码块中的返回逻辑）
 4. 隐式使用`begin ... rescue ... ensure ... end`，且不能抑制异常（`rescue`必须有代码块实体）
```ruby
  def foo
    # ... main code
    rescue Exception => e
     # ...
  end
```
5. `rescue`可使用多条，且子类异常应该在前面，父类在下层，否则，具体的子类异常将不会被捕获；更不要直接捕获顶级异常类`Exception`，否则会使解释器调用`exit`并导致锁死进程，必须使用`kill -9`结束进程<sup>[Link](https://stackoverflow.com/questions/10048173/why-is-it-bad-style-to-rescue-exception-e-in-ruby)</sup>
6. 应该在`ensure`释放资源，但尽量使用自清理功能的资源处理方法
```ruby
File.open('../filename.md', 'w') do |f|
  # ...
end
```

## Date && Time
1. 避免使用`DateTime`，而使用`TIme`（1970 ～ 2038）
2. 使用`Time.now`而不是`Time.new`获取当前时间

## 集合
1. 优先使用字面量语法`[]`|| `{}`以及`%`字面量语法
2. 使用`arr.first`和`arr.last`代替`arr[0]`和`arrr[-1]`
3. Hash语法保持一直
```ruby
{ :a => 1, :b => 2 } # ruby1.9
{ a: 1, b: 2 } # 优先使用
{ 'a' => 1, :b => 2 } # 包含字符串和符号的时候，只能使用ruby1.9格式
```
4. 优先使用Hash自身的遍历方法：
```ruby
hash = {}
hash.key?
hash.value?
hash.each_key
hash.each_value

hash.fetch(:key) # 获取key的value，当key不存在时报错
hash.fetch(:key, true) # 获取key，相当于hash[:key] || true，但避免了key的value为false的情况
```

## 正则
```ruby
# 简单正则操作
str = 'hello world'

str['world'] # => 'world'，str == 'hello world'
str['world'] = 'ruby' # => 'world'; str == 'hello ruby'
str[/r(ub)y/, 1] # => ub， str == 'hello ruby'
str[/r(ub)y/, 1] = 'bu' # => 'bu'; str == 'hello rbuy'

# 复杂正则表达式使用x修饰符
# 忽略空白、可注释
regexp = /
  start         # some text
  \s            # white space char
  (group)       # first group
  (?:alt1|alt2) # some alternation
  end
/x
```

1. 避免使用`$1`, `$2`之类的Perl风格捕获变量，而使用`Regexp.last_match(n)`；且当不需要操作捕获组时，使用非捕获组操作符`()`
2. 推荐使用命名捕获组的方式获取捕获组内容，避免使用数组索引；`/(?<match_name>world)/ =~ str` => `match_name == world`
3. `^`与`$`分别匹配一行字符串的开始与结尾，而不是字符串，例如`"hello \nworld"`为两行字符串（注意此处只有双引号时`\n`才生效）；而`\A`和`\z`则代表字符串的开始与结尾

## 元编程之魔术方法
1. 避免无谓的元编程，且不能使核心类混乱（相当于JS禁止扩展`Array.prototype`）
2. 避免使用`method_missing?`，因为它使得调试时不能跟踪调用栈
	- 被捕获的方法具有良好显而易见的前缀，例如：`find_by_<prop>`
	- 推荐委托到确定的、非魔术方法或`define_method`方法
	- 语句后调用`super`方法
	- 确保同时定义了`responds_to_missing`
3. 避免使用`send`方法，使用`public_send`代替；因为`send`方法可以调用`private`的方法，而且很容易被覆写；`send`别名：`__send__`

## 再谈`%`字面量

1. 字符串`%()` (完整写法：`%Q()`)和`%q`字面量
> 优先使用常规字符串书写格式，避免使用`%()`；除非
> - 只有一行字符串，且同时具有`' '`和`" "`或插值
> - 只有一行字符串，且需要转义多个字符
> - `%Q()`遵循双引号规则；`q()`遵循单引号规则
```ruby
%(<tr><td class="name">#{name}</td>)
quote = %q(<p class='quote'>"What did you say?"</p>)
```
2. 正则表达式自面量`%r{}`
> 只有当正则表达式中存在至少一个`/`时使用
```ruby
%r{^/(.*)$}
%r{^/blog/2011/(.*)$}
```
3. 系统命令字面量`%x()`
```ruby
date = `date` # ok
echo = %x(echo `date`) # 只有命令中有反引号时才使用
```
4. 不推荐使用`Symbol`字面量`%s()`；而使用`:"symbol name"`的双引号形式声明含有空白的符号变量
5. 数组字面量`%w[]`\ `%i[]`\ `%W[]`\ `%I[]`；单词数组成员用`%w[]`；符号数组成员用`%i[]`
6. 注意`%`后面的括号类型
- 字符串、符号、命令的字面量使用`()`
- 正则使用`{}`
- 数组使用`[]`

## 其他
1. 不显式调用`to_s`将对象转为字符串，ruby会隐式处理
2. 字符串拼接优先使用插值形式，而不是`+`
3. 拼接大段字符串优先使用`String#<<`，避免使用`String#+`=> `html += 'abc'`
```ruby
html = ''
html << '<p>Hello world</p>'
```
4. 长文本赋值时，优先使用heredocs文本格式
5. 1.9+的ruby取消了字符类型数据，所以禁止使用`?x`字面量形式，`x`为单个字符
