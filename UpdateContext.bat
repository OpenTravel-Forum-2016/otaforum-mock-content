@echo off
REM
REM Script that updates a context folder by generating OTM mock responses
REM for all OTM projects defined in the folder structure.
REM

cd %~dp0
SET CONTEXT=%1

IF "%CONTEXT%"=="" GOTO show_usage

IF "%M2_HOME%"=="" GOTO no_maven

echo Updating Context: %CONTEXT%
"%M2_HOME%\bin\mvn" -DcontextFolder=%CONTEXT%
GOTO done

:show_usage
echo Usage:  UpdateContext ^<context-folder^>
echo.
GOTO done

:no_maven
echo Please set the M2_HOME variable to the Maven 3.2 installation directory.
echo.

:done