# HTTP Cache
## Cache-Control
> HTTP 1.1  
> 用于控制文件在本地的有效时长  
> 未过期前，http不发送请求

### Expries
> HTTP 1.0  
> 同 Cache-Control  

## Last-Modified
> 用于标识在服务器上最新的更新时间  
> 发送请求时，（若缓存已过期）浏览器通过If-Modified-Since字段携带该时间询问服务器是否文件更新；未更新返回304继续使用缓存，否则返回200  

### Etag
> 作用同 Last-Modified  
> 区别在于Etag内容是文件的特征字符串

## H5 manifest
> `CACHE MANIFEST` - 在此标题下列出的文件将在首次下载后进行缓存  
> `NETWORK` - 在此标题下列出的文件需要与服务器的连接，且不会被缓存  
> `FALLBACK` - 在此标题下列出的文件规定当页面无法访问时的回退页面（比如 404 页面）