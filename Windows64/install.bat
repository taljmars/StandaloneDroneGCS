@echo off 
echo Deploy Standalone


::call deployConsole.bat

::call deployServer.bat
::cd DroneServer
::call install.bat
cd:: ..


set RUNFILE="run.bat"

echo "Creating single run file"
echo @echo off > %RUNFILE%
echo cd DroneServer >> %RUNFILE%
echo echo Loading Server #1 >> %RUNFILE%
echo start /b cmd /c run.bat >> %RUNFILE%
echo echo Loading Server #2 >> %RUNFILE%
echo timeout /t 7 /nobreak >> %RUNFILE%
echo cd ../DroneConsole >> %RUNFILE%
echo call run.bat >> %RUNFILE%
echo cd .. >> %RUNFILE%
echo echo "Done"  >> %RUNFILE%

:: Setting uninstall script
set UNINSTFILE="uninstall.bat"

echo "Creating uninstall file"
echo @echo off > %UNINSTFILE%
echo cd DroneServer >> %UNINSTFILE%
echo call uninstall.bat >> %UNINSTFILE%
echo set INST_DIR=%%cd%% >> %UNINSTFILE%
echo cd .. >> %UNINSTFILE%
echo start /b "" cmd /c rmdir %%INST_DIR%% /q /s ^&^exit /b >> %UNINSTFILE%%
echo echo "Done"  >> %UNINSTFILE%

echo "Done"
