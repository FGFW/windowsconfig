goto code
==================================================
������ע����,����˰�

ϵͳ�����Զ�����6��Ϊ���� http://www.bathome.net/thread-38000-1-1.html

��ɽ�� 8:56 2015/11/10 

ʹ��datex ����߼������� http://batch-cn.qiniudn.com/tool/DateX.exe
HAT�������� Windows 2008����ƻ�ִ��bat�ű�ʧ�ܷ���0x1 http://blog.chinaunix.net/uid-17176286-id-5156940.html

˫�����л��Զ���������
===================================================
:code
@echo off
title ȫ�Զ���ʱ�޸�����Ϊ��6��1

::�ƻ�������
set tn=whosyourdaddy


::�ƻ�����ʱ��
set st=01:01:01
set tr=%0
set mo=1
::�л���ǰĿ¼Ϊ�ű�����·��
cd /d %~dp0

::�ű�Ŀ¼����Ҫ��datex.exe
if not exist %~dp0\datex.exe msg %username% ��Ҫdatex���ܸɻ�&goto :eof
if not exist ver.txt echo -->%~dp0\ver.txt
if "%1"=="task" goto :task


::�жϼƻ��Ƿ��Ѿ����
chcp 437
schtasks /query|find "%tn%"||goto crtask
goto :eof

:crtask
::��������
schtasks /create /ru "system" /sc weekly /mo %mo% /d sun /st %st% /tn "%tn%" /tr "%0 task"
goto :eof

:task
set /p ver=<%~dp0\ver.txt
::ÿ����0��Ŀ�ʼʱ�����ڼ�1�����6
if %ver%==-- (datex -f yyyy/mm/dd -o -1|date
	echo ++>%~dp0\ver.txt
	net stop W32Time
	sc config W32Time start= disabled

)
::�ٴ�����ʱ�����ڼ�1���ָ���������
if %ver%==++ (datex -f yyyy/mm/dd -o 1|date
	echo -->%~dp0\ver.txt
	sc config W32Time start= auto
	net start W32Time
)
::����HAT�Ľ̵�,����ƻ�Ҫʹ��exit /b 0�˳�������״̬����ʾΪ������ɡ�
exit /b 0


