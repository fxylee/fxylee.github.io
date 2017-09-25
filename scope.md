# Scope

一种特殊的类方法

```ruby
  class Test < ActiveRecord::Base
    scope :state_pub, where(state: 'public')
    scope :state_draft where(state: 'draft')
  end
```


## Tips 

```ruby
  
```

1. `break` => ``
2. `next` => `continue`
3. 不需要前缀
```Ruby
class Test
  # getter方法名无需使用get前缀
  def method
    # 
  end
  
  # setter方法名无需使用set前缀，使用=号后缀，调用时，无需=
  def method=(args)
    #
  end
end
```
4. 数组字面量
```ruby
arr = ['a', 'b', 'c']
# 以空格分隔字符
# 以空格分隔字符
arr = %w['a b c'] # 推荐
arr = %w('a b c')
```
