# Symbol 对象

## HASH

```Ruby
  # 相当于Object.assign()；合并hash对象
  target_hsh.merge!(copy_hash)

  target_hsh.reverse_merge!(copy_hash)
```

## Tips

### 换行符
> unix		=> 	\n	换行符
> windows	=> 	\r\n	回车+换行符
> mac		=> 	\r	回车符
> 
> windows to unix/mac，行尾显示为^M（非^ + M，命令行下ctrl/v + ctrl/m）

```bash
# linux下删除windows下文件的换行符
cat a.txt | tr -d "^M" > b.txt

# windows下通过可命令可使git保持为linux的换行符
git config --global core.autocrlf true
```
