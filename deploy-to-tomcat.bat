@echo off
echo Deploying HIT DevOps Project to Tomcat...

REM Set your Tomcat path here (adjust as needed)
set TOMCAT_PATH=C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps
set APP_FOLDER=eliran-nimrod-saar-nikita-ido
set TARGET_PATH=%TOMCAT_PATH%\%APP_FOLDER%

echo Tomcat Path: %TOMCAT_PATH%
echo App Folder: %APP_FOLDER%
echo Target Path: %TARGET_PATH%

REM Check if Tomcat path exists
if not exist "%TOMCAT_PATH%" (
    echo ERROR: Tomcat path not found!
    echo Please update the TOMCAT_PATH variable in this script
    echo Current path: %TOMCAT_PATH%
    pause
    exit /b 1
)

REM Create target directory if it doesn't exist
if not exist "%TARGET_PATH%" (
    echo Creating directory: %TARGET_PATH%
    mkdir "%TARGET_PATH%"
)

REM Copy files to Tomcat
echo Copying files to Tomcat...
xcopy /E /Y /I "%CD%\*" "%TARGET_PATH%"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo Deployment successful!
    echo.
    echo Your application should be available at:
    echo http://localhost:8080/%APP_FOLDER%/
    echo.
    echo Make sure Tomcat is running before accessing the URL.
) else (
    echo.
    echo Deployment failed! Error code: %ERRORLEVEL%
)

pause
