@echo off
REM
REM Script that delivers changes to the remote GitHub repository
REM

cd %~dp0
git diff-index HEAD --quiet
set STASH_NEEDED=%errorlevel%

IF "%STASH_NEEDED%"=="0" GOTO skip_stash
echo Stashing local changes
git stash

:skip_stash
echo Pulling changes from GitHub
git checkout master
git pull origin

IF "%STASH_NEEDED%"=="0" GOTO done
echo Restoring stashed changes
git stash pop

:done
echo Rebase complete.