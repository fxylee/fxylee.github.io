# 元编程

*Ruby中的`class`、`module`均是对象；`Article`类相当于ES5中的构造函数；本身即对象*
*`class`、`module`声明变量以大写开头命名表示通过一个**常量**引用对象*
*Ruby中以大写开头就是常量；常量可以被重新赋值，但会产生警告；ES6中的`const`不能被重新赋值*

*ES是基于原型继承的面向对象；Ruby是基于类继承的面相对象*

```ruby
class Article
end

ins = Article.new || {} || [] # 对象

# 直接扩展/定义对象方法；隐式创建了单件类/单态类/Singleton_class
def ins.bar
  puts self # => #<Article:0x000000010c1100>
end

ins.bar
```

## 魔术方法/动态方法

#### `class << self`
打开自身/一个对象
```ruby
class Article
 class << self # 打开self对象 #<Class:Article>
   # 添加/扩展方法
   def foo
     puts self # => Article
   end
 end
end
Article.foo

obj = []
class << obj # 打开一个数组对象
  def size
    puts 'hello world'
    puts super
  end
end
```

#### ClassName.class_eval
扩展`Article`类的实例方法
`class_eval`被定义在`Module`类中
```ruby
# 打开Article类，扩展Article类的实例方法
Article.class_eval do
  p self # => Article
  # 此种写法不可取
  def self.baz
    p self # => Article
  end
  
  def bar
    p self # => #<Article:0x00000001985020>
  end
end

Article.baz
Article.new.bar
```



#### object_name.instance_eval
扩展`Article`对象的方法：`Article`为基类`Object`的实例对象
`instance_eval`被定义在基类`Object`中（实际上，`Object`继承于`BasicObject`）
```ruby
# 此处相当于打开Article对象，扩展Article类的静态方法
Article.instance_eval do
  p self # => Article
  # 此种写法不可取
  def self.baz
    p self # => Article
  end
  
  def bar
    p self # => Article
  end
end

Article.baz == Article.bar
```

#### `Object.const_set`
创建常量对象，参数一为字符串，且首字母必须大写
```ruby
# 生成Foo类
Object.const_set('Foo', Class.new)
# 生成Foo模块
Object.const_set('Foo', Module.new)
```

#### `defined_method`
动态定义实例方法；参数一为方法名，后跟`block`方法体
```ruby
class Article
  define_method :bar do
    puts self # => #<Article:0x000000009f5128>
  end
end

Article.new.bar
```

#### `respond_to? :method_name`
用于判断对象是否具备某个方法
```ruby
obj = Article.new || [] || {}

obj.respond_to? :bar
```


### Links
1. [Understanding Ruby Singleton Classes](https://www.devalot.com/articles/2008/09/ruby-singleton)
2. [Metaprogramming Ruby: class_eval and instance_eval](https://www.jimmycuadra.com/posts/metaprogramming-ruby-class-eval-and-instance-eval/)