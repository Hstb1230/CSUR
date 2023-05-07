@REM This batch use to release road texture before creating

@echo off
cls

set GAME_DIR=%LOCALAPPDATA%\Colossal Order\Cities_Skylines
echo GAME_DIR=%GAME_DIR%

if not exist "%GAME_DIR%\RoadImporter" (
    echo
    echo init directory
    echo
    mkdir "%GAME_DIR%\RoadImporter\import\"
    mkdir "%GAME_DIR%\Addons\CSUR-Archive-Assets"
    mkdir "%GAME_DIR%\Addons\Mods\RoadImporter"
    cp .\bin\RoadImporter.dll "%GAME_DIR%\Addons\Mods\RoadImporter"
)

echo
echo clear old textures
echo
del "%GAME_DIR%\RoadImporter\imports.txt"
del /Q "%GAME_DIR%\RoadImporter\import\*"
del /Q "%GAME_DIR%\Addons\Import\*"
echo
echo move created road to archive
echo
move "%GAME_DIR%\Addons\Assets\CSUR*" "%GAME_DIR%\Addons\CSUR-Archive-Assets"

echo
echo add imports.txt
echo
move .\output\imports.txt "%GAME_DIR%\RoadImporter\"
echo
echo add textures
echo
move .\output\* "%GAME_DIR%\RoadImporter\import\"

@echo on
type "%GAME_DIR%\RoadImporter\imports.txt"