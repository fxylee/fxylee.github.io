# enum

```ruby
class Article << ApplicationRecord
  # 枚举状态；enum的字段在数据库类型为integer
  enum state: {draft: 0, published: 1, deleted: -1}
end

# 查询Article所有可枚举状态（注意字段名为复数）
Article.states
# => {'draft'=> 0, 'published'=> 1, 'deleted'=> -1}

# 查询该状态的的记录集合
# 隐式创建的scope方法
Article.draft
Article.published

# 实例化一个空的Article
article = Article.new

# 查询是否为该状态
article.draft?
article.published?
article.deleted?

# 设置article的state值（注意，只有调用了article.save，才会保存到数据库，赋值只是改变对象值）
# 赋值时，rails自动验证传入的状态是否在可枚举状态中，否，则报错
article.state = 'draft'
article.state = :published

# 作用同上，但调用后会自动保存到数据库
article.published!
article.deleted!
```


**枚举状态字段应该被添加为数据表索引**


```ruby
# 如果不显式的声明状态对应的数字值，rails默认从0开始输出状态
enum status: ['draft', 'published', 'deleted']
enum status: [:draft, :published, :deleted]
enum status: %w[draft published deleted]
# {'draft'=> 0, 'published'=> 1, 'deleted'=> 2}
```

## Links
1. [ActiveRecord Enum实战总结](http://www.bigbing.net/2017/03/07/practice-activerecord-enum/)
