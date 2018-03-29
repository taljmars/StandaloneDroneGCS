@echo off 
echo Deploy Standalone


call deployConsole.bat

call deployServer.bat
::cd ServerCore
::call install.bat
::cd ..


set RUNFILE="run.bat"

echo "Creating single run file"
echo @echo off > %RUNFILE%
echo cd ServerCore >> %RUNFILE%
echo echo Loading Server >> %RUNFILE%
echo start /b cmd /c run.bat ^>^> Server.log >> %RUNFILE%
echo timeout /t 20 /nobreak >> %RUNFILE%
echo echo Loading Console >> %RUNFILE%
echo cd ../DroneConsole >> %RUNFILE%
echo call run.bat >> %RUNFILE%
echo cd .. >> %RUNFILE%
echo echo "Done"  >> %RUNFILE%

set RUNFILE="run-auto-tester.bat"

echo "Creating single run-test file"
echo @echo off > %RUNFILE%
echo cd ServerCore >> %RUNFILE%
echo echo Loading Server >> %RUNFILE%
echo start /b cmd /c run.bat >> %RUNFILE%
echo timeout /t 30 /nobreak >> %RUNFILE%
echo echo Loading Console >> %RUNFILE%
echo cd ../DroneConsole >> %RUNFILE%
echo call run-tester.bat >> %RUNFILE%
echo cd .. >> %RUNFILE%
echo echo "Done"  >> %RUNFILE%

:: Setting uninstall script
set UNINSTFILE="uninstall.bat"

echo "Creating uninstall file"
echo @echo off > %UNINSTFILE%
echo cd ServerCore >> %UNINSTFILE%
echo call uninstall.bat >> %UNINSTFILE%
echo set INST_DIR=%%cd%% >> %UNINSTFILE%
echo cd .. >> %UNINSTFILE%
echo start /b "" cmd /c rmdir %%INST_DIR%% /q /s ^&^exit /b >> %UNINSTFILE%%
echo echo "Done"  >> %UNINSTFILE%


echo "Clean Directory - *.zip"
del *.zip
echo "Clean Directory - deploy*"
del deploy*
echo "Clean Directory - install*"
start /b "" cmd /c del install* /q /s &exit /b

echo "Done"
