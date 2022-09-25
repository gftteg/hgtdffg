@echo off
setlocal enabledelayedexpansion

::调用随机名
call :name aka1 ABCDEFGHIJKLMNOPQRSTUVWXYZqwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklz
call :name aka2 ABCDEFGHIJKLMNOPQRSTUVWXYZqwertyuiopasdfghjklzxcvbnm12345678901234567890
call :name aka3 ABCDE*FGHIJKL*MNOPQRS*TUVWXYZqwe*rtyuio*pasd*fghjklz*xcvbnm12*345*67*890
call :idname aka4 qwertyuiopasdfghjklzxcvbnm 1234567890qwertyuiopasdfghjklzxcvbnm1234567890
call :idname aka5 qwertyuiopasdfghjklzxcvbnm 1234567890qwertyuiopasdfghjklzxcvbnm1234567890
call :idname aka6 qwertyuiopasdfghjklzxcvbnm 1234567890qwertyuiopasdfghjklzxcvbnm1234567890
call :idname aka7 qwertyuiopasdfghjklzxcvbnm 1234567890qwertyuiopasdfghjklzxcvbnm1234567890
call :idname aka8 qwertyuiopasdfghjklzxcvbnm 1234567890qwertyuiopasdfghjklzxcvbnm1234567890

::写入
call :UUID
(
echo 1搭建的账号：
echo 账号：%aka4%
echo 1uuid：%UUID%
echo 1反代：
echo.
echo 2搭建的账号：
echo 账号：%aka5%
echo 2uuid：%UUID%
echo 2反代：
echo.
)>>申请账号模板.txt

::获取随机名
:name
set name=
set /a t=%random%%%9+9

set Str=%~2
for /l %%L in (1 1 !t!) do (
    set /a n = !random!%%72
    for %%n in (!n!) do set name=!name!!Str:~%%n,1!
)
set %~1=%name%
goto :eof 

:idname
set idname=
set /a idt=%random%%%2+4

set idStr=%~2
for /l %%L in (1 1 !idt!) do (
    set /a idn = !random!%%26
    for %%n in (!idn!) do set idname=!idname!!idStr:~%%n,1!
)
set idStr2=%~3
for /l %%L in (1 1 !idt!) do (
    set /a idn2 = !random!%%46
    for %%n in (!idn2!) do set idname=!idname!!idStr2:~%%n,1!
)
set %~1=%idname%
goto :eof 
::获取随机UUID
:UUID
call :ss 8 id1
call :ss 4 id2
call :ss 4 id3
call :ss 4 id4
call :ss 12 id5

set UUID=%id1%-%id2%-%id3%-%id4%-%id5%

:ss
set n=0
set id=
:h
set ter=0123456789abcdef
set /a ran=!random!%%16
set a=!ter:~%ran%,1!
set /a n+=1
set id=%id%%a%
set %~2=%id%
if %n% lss %~1 goto h
cls
goto :eof 