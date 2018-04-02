# `accepts_nested_attributes_for`

允许当前模型通过在其字段`Hash`中通过附加关联模型的字段`Hash`的嵌套方式来更新、创建关联模型。
```ruby
current_model_hash = {
  field: '',
  relation_model_name_attributes: {  field: '' }, # has_one
  relation_model_names_attributes: [{ fields: '' }, {}] # has_many
}
```
> 会为当前模型创建一个可写被关联模型的属性。`model_name_attrubutes=(attributes)`

关联对象默认只可读？

```ruby
# apparatus为单数，此种写法需要在 config/initializers/inflections.rb 中配置
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.irregular 'apparatus', 'apparatuses'
# end
class Apparatus > ActiveRecord::Base
  # has_many 对应复数形式的 model；has_one 对应单数，e.g.: has_one :feature
  has_many :features, dependent: :destroy

  # 注意：单复数同 has_many has_one
  accepts_nested_attributes_for :features，allow_destroy: true
end

class Feature > ActiveRecord::Base
  belongs_to :apparatus
end

# 使用
apparatus_params = {
  brand : '品牌',
  # 注意：此处features对应has_many，必须复数形式；如果为has_one，此处为feature.attributes: { :name => '功能点 1' }
  features.attributes: [{
                          name : '功能点 1'
                        }]
}

Apparatus.create!(apparatus_params)
```


## 参数
1. `:allow_destory`
是否允许删除
通过关联模型哈希属性中的附加属性`_destory`标识来删除关联模式实例，且只有`1`、`'1'`、`true`、`'true'`表示真值

```ruby
accepts_nested_attributes_for :features, allow_destroy: true

# Hash e.g.
features.attrubutes: [{
  name: '功能点',
  # ruby中，除了false和nil之外，都为ture，哪怕 0
  _destory: '1'
}]
```

2. `:reject_if`
指定过滤条件。
值为一个返回值为布尔值的`proc`或者方法符号`Symbol`
如果`proc`返回`false`，则不为当前`Hash`字段创建记录（非只不给该属性字段写值）

```ruby
# 过滤掉name属性为空的记录
accepts_nested_attributes_for :features, reject_if: proc { attributes['name'].blank? }
# all_blank?为内建方法，表示所有字段为空
accepts_nested_attrubutes_for :features, reject_if: :all_blank?
# blank?为指定的过滤方法的 Symbol名字
accepts_nested_attrubutes_for :features, reject_if: :blank?
```

3. `:limit`
指定当前模型可嵌套的关联模型的属性`Hash`的最大数量
值可为数字或者返回数字的`proc`或者方法
超过数量会引发异常、报错
仅适用于一对多关联
> 允许您指定可以使用嵌套属性处理的关联记录的最大数量

4. `:update_only`
用于指定一对一关联，当关联对象记录已经存在时如果处理。
 - 如果为`true`，则无论是否已存在，都是用嵌套属性的`Hash`更新现有记录
 - 如果为`false`，如果`Hash`中存在`id`属性，则更新；否则创建新记录，并替换掉原记录（**删除原记录？**），**默认**
