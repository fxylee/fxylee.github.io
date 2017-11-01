## Mixin
```ruby

module ExampleModule
  # 导入自身，使得module的实例方法可以通过<module name>调用: ExampleModule.foo
  extend self

  # 实例方法
  def foo
  end

  # self.included用于定义模块方法（类似于类方法）
  # 参数c指代导入该module的Class
  def self.included(c)
    # 模块方法
    def c.bar
    end
  end
end

class ExampleClass
  # 将module中的实例方法作为Class的实例方法导入
  # 将module中的模块方法作为Class的类方法导入
  include ExampleModule

  # 将module中的实例方法作为Class的类方法导入
  # module中的模块方法对Class本身和其实例不可见
  extend ExampleModule
end
```

> `include`: 把模块注入目标类或者模块作为实例方法
> `extend`: 把模块注入目标类或者模块作为类方法（Singleton Method）
> `prepend`: 同样把模块注入目标类或者模块作为实例方法，和include的区别是把模块的方法放在了目标类或者模块方法调用链的前边，对比 B 和 C 的继承链。
> 
> `require` 多引入外部rb源文件或者外部库（可以省略文件的后缀‘.rb’），require加载外部文件只会加载一次（多次引入会忽略），而load会加载多次
> `load` 多为加载资源配置文件，因为load可以多次加载（每次都重新加载）（配置文件如***.yml等文件），与require相比，除了会加载多次外，加载时需要添加文件的后缀

## `self`
*与JS一样，依据执行上下文确定*
> `self`在实例方法中指代当前实例
> `self`在类方法中指代当前类
