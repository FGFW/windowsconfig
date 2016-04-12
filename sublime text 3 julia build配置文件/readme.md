2016年4月12日 12:34:51 codegay

*** 
##### sublime text 3 的julia build 配置文件:
```
{
	"shell_cmd": "C:\\Users\\%username%\\AppData\\Local\\Julia-0.4.3\\bin\\julia.exe \"$file\""
}
```

###### 如何把julia.exe加入到path 环境变量中的话,可以把路径省略掉:

```
{
	"shell_cmd": "julia \"$file\""
}
```

