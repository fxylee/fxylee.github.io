# Ruby Attribute (property & method)

## code

```ruby
class Foo
  # 属性修饰符
  attr_reader :other
  attr_writer :other
  attr_accessor :other
  
  # constructor
  def initialize(color)
    # Private Object property
    @color = color

    @other = nil
  end

  # getter method
  def color
    @color
  end

  # setter method
  def color=(value)
    @color = value
  end
end

f = Foo.new('red')

f.color	# => red

f.color = 'yellow'
f.color # => yellow
```

## method_missing

```ruby
kernel.method_missing
Object.method_missing
Class=>method_missing
```
