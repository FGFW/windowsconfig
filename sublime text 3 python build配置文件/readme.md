
##### codegay 		2016年4月12日 12:14:41

[文本github地址](https://github.com/FGFW/windowsconfig/tree/master/sublime%20text%203%20python%20build%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6 "文本github地址")

```
{
    "shell_cmd": "Python \"$file\"",
    "file_regex": "^[ ]*File \"(...*?)\", line ([0-9]*)",
    "selector": "source.python",
    "encoding": "cp936"
}
```

#### sublime text 3的配置文件与sublime text 2语法略不同，所以不通用。

``` 
    "shell_cmd": "Python \"$file\"",
```
#### 用引号把$file包起来是为了防止文件名或者路径中有空格.

```
    "encoding": "cp936"
```
#### "encoding": "cp936" 可以解决中文输出显示的问题，但是print Unicode字符可能有问题。

