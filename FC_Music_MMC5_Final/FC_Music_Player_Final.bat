@echo off

set INPUT_PARAM=%1
set FILE_NAME=%~n0
    
IF DEFINED INPUT_PARAM (
    rem echo %~n1
    set FILE_NAME=%~n1
    
) else (
    rem echo %~n0
)

set INPUT_FILE="%~dp0%FILE_NAME%.asm"
set CLEAN_FILE="%~dp0%FILE_NAME%.fns"
set NESASM3="%~dp0tools\nesasm_Gui_3_2_x86.exe"

set OUT_FILE_NAME=%~dp0
set OUT_FILE_NAME=%OUT_FILE_NAME:~0,-1%

for %%I in (%OUT_FILE_NAME%) do (
    set OUT_FILE_NAME=%%~nI.nes
)

cd /d %~dp0

call %NESASM3% %INPUT_FILE%
set result=%errorlevel%

IF EXIST %CLEAN_FILE% ( del %CLEAN_FILE% )

IF 0 NEQ %result% (
    pause
) else (
    IF NOT EXIST "%~dp0..\roms" (
        MKDIR "%~dp0..\roms"
    )
    
    copy "%FILE_NAME%.nes" "%~dp0..\roms\%OUT_FILE_NAME%" /y
    IF EXIST "%~dp0%OUT_FILE_NAME%" (
        DEL "%~dp0%OUT_FILE_NAME%"
    )
    
    rename "%FILE_NAME%.nes" "%OUT_FILE_NAME%"
)

goto:eof