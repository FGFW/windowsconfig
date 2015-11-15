##--##
"""
自动修改系统日期跳过周日
题目来源 http://www.bathome.net/thread-38000-1-1.html
~~玩玩中文变量名
本文件首行必须是状态标志不能删除,状态为--表示执行任务计划调用本程序时日期减1
依山居 15:53 2015/11/15

"""
import os
import sys
import datetime

#任务计划名称
任务名="whosyourdaddy"
开始时间="01:01:01"
程序路径=sys.argv[0]+" "+"task"
#任务计划运行频率/sc weekly /mo 选项为weekly /mo 为1表示每周运行
频率=1

def 我是开关():
    with open(sys.argv[0],"r+",encoding="utf-8") as f:
        f.seek(2)
        标识位=f.read(2)
        if 标识位=="--":
            f.close()
            return False
        if 标识位=="++":
            f.close()
            return True
        
def 修改开关(标识位):
    with open(sys.argv[0],"r+",encoding="utf-8") as f:
        if 标识位=="--":
            f.seek(2)
            f.write("--")
            f.close()
        if 标识位=="++":
            f.seek(2)
            f.write("++")
            f.close()    

状态=我是开关()

def 创建任务():
    命令串="schtasks /create /ru \"system\" /F /sc weekly /mo "+频率+" "+"/d"+" "+"sun"+" "+开始时间+" "+"/tn"+" "+程序路径
    os.system(命令串)
    print("已经执行创建任务计划!")
    
def 修改日期():
    if 状态:
        today=datetime.datetime.now()+datetime.timedelta(1)
        修改开关("--")
        print(today)
    else:
        today=datetime.datetime.now()-datetime.timedelta(1)
        
        修改开关("++")
        print(today)
        
修改日期()
if len(sys.argv)>1 and sys.argv[1]=="task":
    pass
    sys.exit(0)


try:
    input("回车创建任务")
except SyntaxError:
    pass
创建任务()

#pause=os.system("pause")
