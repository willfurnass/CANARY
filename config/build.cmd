@echo off
echo ...
echo *** Prep and cleanup workspace ***
echo ...
mkdir %WORKSPACE%\build
del /Q /S %WORKSPACE%\build\canary.exe
del /Q /S %WORKSPACE%\build\canarytesting.exe
del /Q /S %WORKSPACE%\trunk\packages\matlab\build\canary.exe
del /Q /S %WORKSPACE%\trunk\packages\matlab\build\canarytesting.exe
echo ...
echo *** Compile CANARY executables ***
echo ...
cd %WORKSPACE%\trunk\packages\matlab\src
C:\cygwin\bin\sed.exe -e s/\#GlobalRev\#/%VERSION_NUM%-win32/ canary.m > canary2.m
copy canary2.m canary.m
cd %WORKSPACE%\trunk\packages\matlab\build
mcc.exe -F canary.prj
mcc.exe -F canarytesting.prj
copy canary.exe %WORKSPACE%\build\canary.exe
copy canarytesting.exe %WORKSPACE%\build\canarytesting.exe
cd %WORKSPACE%\trunk\packages\matlab\src
copy canary.m canary2.m
del canary.m
