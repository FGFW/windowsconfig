goto code
==================================================
这里是注释区,随便浪吧

系统日期自动从周6改为周日 http://www.bathome.net/thread-38000-1-1.html

依山居 8:56 2015/11/10 

使用datex 命令工具计算日期 http://batch-cn.qiniudn.com/tool/DateX.exe
HAT大神文章 Windows 2008任务计划执行bat脚本失败返回0x1 http://blog.chinaunix.net/uid-17176286-id-5156940.html

双击运行会自动建立任务
===================================================
:code
@echo off
title 全自动定时修改日期为周6周1

::计划任务名
set tn=whosyourdaddy


::计划运行时间
set st=01:01:01
set tr=%0
set mo=1
::切换当前目录为脚本所在路径
cd /d %~dp0

::脚本目录下需要有datex.exe
if not exist %~dp0\datex.exe msg %username% 需要datex才能干活&goto :eof
if not exist ver.txt echo -->%~dp0\ver.txt
if "%1"=="task" goto :task


::判断计划是否已经添加
chcp 437
schtasks /query|find "%tn%"||goto crtask
goto :eof

:crtask
::建立任务
schtasks /create /ru "system" /sc weekly /mo %mo% /d sun /st %st% /tn "%tn%" /tr "%0 task"
goto :eof

:task
set /p ver=<%~dp0\ver.txt
::每周日0点的开始时候，日期减1变成周6
if %ver%==-- (datex -f yyyy/mm/dd -o -1|date
	echo ++>%~dp0\ver.txt
	net stop W32Time
	sc config W32Time start= disabled

)
::再次运行时，日期加1，恢复正常日期
if %ver%==++ (datex -f yyyy/mm/dd -o 1|date
	echo -->%~dp0\ver.txt
	sc config W32Time start= auto
	net start W32Time
)
::听从HAT的教导,任务计划要使用exit /b 0退出，任务状态才显示为操作完成。
exit /b 0


