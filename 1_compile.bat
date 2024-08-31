@echo off

echo.
echo ===========================================================================
echo Graphics V2
echo ===========================================================================
php -f convert_spr.php ./graphics/Tiles1.png
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
..\scripts\rt11dsk.exe d neon.dsk .\release\bolde3.sav >NUL
..\scripts\rt11dsk.exe a neon.dsk .\release\bolde3.sav >NUL

echo.