# Ruby On Rails # Routes
对于URI的path `/articles/1`，一级目录会被映射为`controller`，通过`Http method`确定请求的动作（行为），其他被映射为`query string`，除非该控制器对应的路由指定了其他资源，且控制器具备对应的method。

URI:  统一资源标识符 `Uniform Resource Identifier`
URI: 通用资源标识符`Universal Resource Identifier` （一种新型的不依赖资源存放地点的资源标识方法）
URL: 统一资源定位符 `Uniform Resource Locator`
URN: 统一资源名称 `Name`
URC: 统一资源引用符 `Uniform Resource Citation`

路由：URL到`controller#action`的映射

- 资源路由（REST）
- 非资源路由

## 资源路由

### 复数资源
```ruby
  resources :articles
```
> 对应`ArticlesController`的`%i[index show create new update destroy edit]`7个方法
> 可以通过`controller: 'news'`选项指定控制器，也可用在非资源路由

### 单数资源
```ruby
  resource :article
```
> 对应`ArticlesConstroller`的`%i[show create new update destroy edit]`6个方法

### 嵌套资源
```ruby
  resources :articles do
    resources :comments
  end
```
> 对应`ArticlesController`和`CommentsController`分别7种资源
> `:comments`对应`path`为`/articles/1/comments`、`/articles/1/comments/1`...7种
> 通常嵌套资源需要在`model`中通过`has_many`、`belongs_to`等声明资源从属关系（关联）

### 命名空间
```ruby
  namespace :admin do
    resources :articles
  end
```
> 对应`admin`目录`ArticlesController`7个方法/资源
> 对应`path`为`/admin/articles`、`/admin/articles/1`、`/admin/articles/1/edit`等7种

### 资源类型（自定义资源/路由）
#### 集合资源：通常返回集合类资源
```ruby
  resources :articles do
    # 只有1个集合资源时，可简写为 get 'search', on: :collection
    collection do
      get 'search'
    end
  end
```
> 对应`ArticlesController`的`search`方法/资源，并被声明为`get`请求
> 对应`path`为`/articles/search`，辅助路径方法为`search_articles_path`

#### 成员资源
```ruby
  resources :articles do
    # 简写: get 'preview', on: :member
    member do
      get 'preview'
    end
  end
```
> 对应`ArticlesController`的`preview`方法/资源，并被声明为`get`请求
> 对应`path`为`/articles/1/preview`，辅助方法为`preview_article_path`

#### 自定义`new`资源行为
```ruby
  resources :articles do
    get 'preview', on: :new
  end
```
> 对应`preview_new_article_path`和`/articles/new/preview`

### 资源/路由映射

### 路由复用 => `concern`
```ruby
  # 声明'复用规则'
  concern :common do
    # 指定一种资源，并限定只允许get请求到单个资源的index和show方法
    resources :comments, only: [:index, :show]
    
    # 指定另一种资源，并限定不能访问4种资源方法
    resources :attachments, except: [:create, :new, :update, :destroy]
  end
  
  # 将:common作为:articles的嵌套资源
  resources :articles, concerns: :common
  # 将:common作为:admin的资源
  namespace :admin do
    concerns: :common
  end
```

## 非资源路由
### 根请求
```ruby
  root to: 'articles#index'

  namespace :admin do
    root 'admin#index'
  end
```
> 指定根请求（根域名）路由处理程序
> 也可用在`namespace`和`scope`中
> `root`请求只处理`get`请求

```ruby
  # 声明一条get请求的非资源路由规则，并指定参数state的默认值为 'publish'
  get '/news/:id/with_user/:user_id', to: 'articles#show', defaults: { state: 'publish' }, as: 'moment', constraints: { id: /[a-z]\d/}
  
  # URL Path: /news/1/with_user/2?state=draft&token=dG9rZW4
  # 被解析为：{ controller: 'articles', action: 'show', id: '1', user_id: '2', state: 'publish', token='dG9rZW4' }
```
> `news` 在路由规则未指定`controller`时，`news`被映射为对应的控制器
> `:id` 非一级path目录和静态片段均被映射为**动态片段 （dynamic segment）**
> `with_user` **静态片段（static segment）**
> `:user_id` 动态片段
> `to: 'articles#show'`
> `defaults: { state: 'publish' }` 指定请求参数的默认值
> `?state=draft&token=dG9rZW4` 查询字符串（`query string`），被映射为请求参数，Rails 不允许query string参数覆盖路由默认值，例`state`
> `as: 'moment'` 为当前路由命名。自动生成`moment_path`和`moment_url`，可以用Symbol指定值，例如：`as: :moment`
> `constraints: { id: /[a-z]\d/ }` **片段约束**；动态片段限定；不匹配限定*regex*的URI不被识别为有效路由；*regex*不能使用`^`操作符；可简写为：`id: /[a-z]\d/`

### 片段约束
```ruby
  get 'news/:id', to: 'articles#show', constraints: { id: /[a-z]\d/ }
```
> 请求参数限定
非资源请求的路径、参数约束

### 请求约束
```ruby
  get 'news/:id', to: 'articles#show', constraints: { subdomain: 'admin' }
```
> 限定二级域名为`admin`
请求主体（域名/主机）约束；
