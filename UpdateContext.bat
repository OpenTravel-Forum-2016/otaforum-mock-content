@echo off
REM
REM Script that updates a context folder by generating OTM mock responses
REM for all OTM projects defined in the folder structure.
REM

cd %~dp0
java -jar .config/update-context-app.jar %*