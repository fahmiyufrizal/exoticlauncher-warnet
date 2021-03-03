@echo off 

:fahmiyufrizal
if exist lswebbroker.exe (
    goto execute
) else (
    goto exowrong
)

:execute
start _configlauncher.exe
taskkill /f /im EasyAntiCheat.exe /im lostsaga.exe|find ":" > nul
%SystemRoot%\System32\reg.exe delete HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\EasyAntiCheat /f
%SystemRoot%\System32\reg.exe delete HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\EasyAntiCheat /f
%SystemRoot%\System32\reg.exe delete HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\EasyAntiCheatSys /f
%SystemRoot%\System32\reg.exe delete HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EasyAntiCheat /f
%SystemRoot%\System32\reg.exe delete HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EasyAntiCheatSys /f
%SystemRoot%\System32\reg.exe add HKCR\LostSagaEx /t REG_EXPAND_SZ /v Path /d "%~dp0\" /f
%SystemRoot%\System32\reg.exe add HKCR\LostSagaEx /t REG_SZ /v "URL Protocol" /f
%SystemRoot%\System32\reg.exe add HKCR\LostSagaEx\Shell\open\command /t REG_SZ /d "%~dp0lswebbroker.exe %%1" /f
cd _configlauncher
findstr /m "launch.exotic=url" setlauncher.ini
if %errorlevel%==0 (
    goto url ) else ( goto schdirect )

:schdirect
findstr /m "launch.exotic=direct" setlauncher.ini
if %errorlevel%==0 (
    goto direct ) else ( goto missconfig )

:url
echo [InternetShortcut] >"exotic.url"
echo URL=http://exoticls.com/login.aspx >>"exotic.url"
start exotic.url
ping 127.0.0.1 -n 2 > nul
del exotic.url
exit

:direct
start http://exoticls.com/login.aspx
exit

:exowrong
start exowrong.vbs
exit

:dontchange
start dontchange.vbs
exit

:missconfig
cd ..
start missconfig.vbs
exit
