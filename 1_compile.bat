@echo off

echo.
echo ===========================================================================
echo Graphics V2
echo ===========================================================================
php -f convert_spr.php ./graphics/Tiles1.png
if %ERRORLEVEL% NEQ 0 ( exit /b )
php -f convert_font.php
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Compiling V2
echo ===========================================================================
php -f ../scripts/preprocess.php cpu.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\scripts\macro11 -ysl 32 -yus -m ..\scripts\sysmac.sml -l _cpu.lst _cpu.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )

echo.
echo ===========================================================================
echo Linking V2
echo ===========================================================================
php -f ../scripts/lst2bin.php _cpu.lst ./release/bolde3.sav sav 77777
if %ERRORLEVEL% NEQ 0 ( exit /b )

del _cpu.mac
del _cpu.lst

..\scripts\rt11dsk d .\release\bolde3.dsk bolde3.sav >NUL
..\scripts\rt11dsk a .\release\bolde3.dsk .\release\bolde3.sav >NUL

2_run_neonbtl.bat
echo.