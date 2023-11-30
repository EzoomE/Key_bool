@echo off

setlocal enableDelayedExpansion

Rem #################################
Rem ## Begin of user-editable part ##
Rem #################################

set "POOL=etc.ntminer.vip:26666"
set "POOL2=stratum+ssl://etc.ntminer.vip:25555"
set "WALLET=0xE0DF5702833dBe9FE7838D0290a7650931519d17"		

set "WORKER=lolMinerWorker"

set "EXTRAPARAMETERS=--apiport 8020"

Rem #################################
Rem ##  End of user-editable part  ##
Rem #################################

cd /d %~dp0

set MyVariable=%CD%\lolMiner.exe

:WindowsVer
echo "Running lolMiner from %MyVariable%"
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "10.0" goto W10
goto OtherW

:W10
"%MyVariable%" --algo ETCHASH  --pool !POOL! --user !WALLET! --pool !POOL2! --user !WALLET! --worker !WORKER! --watchdog exit !EXTRAPARAMETERS!
if %ERRORLEVEL% == 42 (
	timeout 10
	goto W10
)
goto END

:OtherW
"%MyVariable%" --algo ETCHASH  --pool !POOL! --user !WALLET! --pool !POOL2! --user !WALLET! --worker !WORKER! --watchdog exit !EXTRAPARAMETERS! --nocolor
if %ERRORLEVEL% == 42 (
	timeout 10
	goto OtherW
)

:END
pause
