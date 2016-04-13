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

IF "%STASH_NEEDED%"=="0" GOTO push_changes
echo Restoring stashed changes
git stash pop

:push_changes
git add -A .
git commit -m "Updated mock content."
git push origin

echo Delivery to GitHub complete.