# Ruby On Rails # generate
```ruby
  # 生成Articles Controller类、测试、样式、JS、helps文件
  # 初始化index/show两个方法
  # 并添加get 'articles#index'和get 'articles#show'两个路由
  bin/rails generate controller Articles index show
```

## Arel
> A Ruby Gem
> Arel是对“关系代数语言”的封装；通过Arel封装的DSL接口语言生成关系代数语言的AST对象树，通过`to_sql`接口转换为SQL语句
> SQL语言自身即是对关系数学模型”的数学符号的实现
> Arel自身并没有实现惰性加载，只是提供了更简单书写SQL语句的方式

*ActiveRecord又将Arel封装到自己的基类，又通过惰性加载的方式访问数据库*

## Lazy Loading => 惰性加载/懒加载

## Eager Loading => 预加载/贪懒加载

## Explicit Loading => 显式加载/主动加载

## 参考连接
1. [Entity Framework加载相关实体——Lazy Loading](http://www.cnblogs.com/Allen-Li/archive/2012/03/15/2398063.html)
2. [Entity Framework加载相关实体——Explicit Loading](http://www.cnblogs.com/Allen-Li/archive/2012/03/21/2410053.html)
3. [EF学习和使用（五）Lazy Loading and Eager Loading](http://blog.csdn.net/u010028869/article/details/48531863)
4. [主题：Active Record如何实现lazy load的？](http://www.iteye.com/topic/51505)