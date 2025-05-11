@echo off
REM Copy pcileech_enigma_x1_top.bin to project root directory

REM Get current script directory
cd /d %~dp0
set PROJECT_ROOT=%CD%

echo Copying pcileech_enigma_x1_top.bin to project root directory...

REM Check if source file exists
if not exist "pcileech_enigma_x1\pcileech_enigma_x1.runs\impl_1\pcileech_enigma_x1_top.bin" (
    echo ERROR: pcileech_enigma_x1_top.bin not found in implementation directory!
    echo Path checked: pcileech_enigma_x1\pcileech_enigma_x1.runs\impl_1\
    echo Please make sure the file has been generated.
    goto end
)

REM Try to copy file to project root directory
copy "pcileech_enigma_x1\pcileech_enigma_x1.runs\impl_1\pcileech_enigma_x1_top.bin" "%PROJECT_ROOT%\" /Y
if errorlevel 1 (
    echo ERROR: Failed to copy file to project root directory.
    echo This might be due to permission issues. Try running as administrator.
) else (
    echo SUCCESS: File copied to project root directory %PROJECT_ROOT%
)

:end
echo.
echo Press any key to exit...
pause > nul
