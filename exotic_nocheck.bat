@echo off 
:fahmiyufrizal
if exist lswebbroker.exe (
    goto execute
) else (
    goto exowrong
)

:execute
%SystemRoot%\System32\reg.exe add HKCR\LostSagaEx /t REG_EXPAND_SZ /v Path /d "%~dp0\" /f
%SystemRoot%\System32\reg.exe add HKCR\LostSagaEx /t REG_SZ /v "URL Protocol" /f
%SystemRoot%\System32\reg.exe add HKCR\LostSagaEx\Shell\open\command /t REG_SZ /d "%~dp0lswebbroker.exe %%1" /f
echo [InternetShortcut] >"exotic.url"
echo URL=http://exoticls.com/login.aspx >>"exotic.url"
start exotic.url
ping 127.0.0.1 -n 2 > nul
del exotic.url
exit

:exowrong
echo Mohon taruh file exoticls_fahmiyufrizal.exe didalam folder
echo LostSagaEx bersama dengan file lswebbroker.exe!
echo .
echo Please place exoticls_fahmiyufrizal.exe inside the
echo LostSagaEx folder with lswebbroker.exe!
echo.
pause
exit