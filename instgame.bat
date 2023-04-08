echo off
rem 	Parameters are
rem 		%1:	drive on which to install the program
rem 		%2:	drive from which installation is taking place

rem	Check to see that there is enough space for the installation.
space %1: 2600kb
if errorlevel 1 goto NoSpace

rem	Create the drivers subdirectory and copy the drivers.
godir %1:\sierra\hero
if errorlevel 1 goto CantCreate

rem	Copy over the necessary files.
echo Copying drivers...
copy %2:*.drv >nul
copy %2:exists.com >nul
copy %2:__hdhero.bat ..\hero.bat >nul
copy %2:__insth.bat >nul

rem	Copy all the resources over.
__insth %1 %2

:NoSpace
echo "There is not enough space on %1 to install Hero's Quest I!"
echo "Approximately 2.6 megabytes of disk space are required."
pause
goto Exit

:CantCreate
echo "Unable to create directory %1."
pause
goto Exit

:Exit
