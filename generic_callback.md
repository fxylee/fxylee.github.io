# generic callback
> 泛回调
> 过程对象 => `Proc`类
> 将代码块`block`封装为可复用的`Proc`实例

*可理解为将`block`存储在变量中，达到代码块复用的目的：`Proc`对象是可多次复用的`block`；区别在于`block`通过`yield`调用，而`Proc`代码块对象通过`call`方法调用，并且可定义和传入参数*

> `Proc` objects are blocks of code that have been bound to a set of local variables. Once bound, the code may be called in different contexts and still access those variables.

## 实例`Proc`
```ruby
# 显式实例化
# 通过Proc类实例
# Proc类实例化的代码块显式的return语句会使定义时的上下文return；通常情况下会报错
block = Proc.new { |arg| puts "hello #{arg}" }
foo block

# 通过lambda表达式实例
# lambda形参实参必须配对；相当于箭头函数，保持定义时的上下文，只有参数可以覆盖该上下文的同名变量
block = lambda { |arg| puts "hello #{arg}" }
block = -> (arg) { puts "hello #{arg}" }

# 隐式实例化
# 在方法调用时，ruby解释器会自动将代码块block隐式转换为Proc实例
foo { |arg| puts "hello #{arg}" }

# Proc实例调用
# 1. 通过yield
def foo
  yield('yield')
end

# 2. 通过&指定的变量调用；必须放在所有参数后面；&符号将代码块转为了Proc实例
def foo(&b)
  # &b 指代原始代码块；b指代Proc实例
  b.call if block_given?
end

# 先转为原始block，再隐式转为Proc实例
foo &block

foo { |arg| puts "hello #{arg}" }
```

> `block` 必须在方法调用时，挂载在方法后面，不能独立存在
> 通过yield或`Proc`实例的`call`方法调用  
> `p`是`Proc`的实例，`&p`只是`block`
> 
> **保存定义时的执行上下文，相当于“箭头函数”** 

### 参考连接
1. [Ruby语言中的泛回调及其在C++语言中的模拟实现](http://blog.csdn.net/zwvista/article/details/1841902)
2. [ruby 方法调用中的`＊`和`&`](http://www.jianshu.com/p/ce2ce74545d8)
3. [ruby 中的Proc](http://www.jianshu.com/p/4ad4517ed6a8)
4. [ruby中的Proc类的理解](http://blog.csdn.net/u010196648/article/details/19192403)