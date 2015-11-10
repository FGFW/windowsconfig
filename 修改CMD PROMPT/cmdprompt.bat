@echo off
::通过环境变量永久修改CMD PROMPT.bat
::依山居 2:09 2015/10/31

::等效命令prompt " o(￣▽￣)o $d$t <(￣︶￣)> $_$p$g"
::但是prompt 命令仅对当前CMD会话有效。关掉重新打开就没有了。
::通过添加一个环境变量项为PROMPT，可以持久有效。

:: Rapid Environment Editor 环境变量管理器radpidee 支持命令行
:: http://www.bathome.net/thread-37881-1-1.html


RapidEE -S -M PROMPT  " o(￣▽￣)o $d$t <(￣︶￣)> $_$p$g"


::我的cmd prompt默认就变成像下面这样了。
::ANSI 字符的颜表情应该都是可以的。


:: o(￣▽￣)o 2015/11/10 周二18:23:17.37 <(￣︶￣)>
:: c:\>