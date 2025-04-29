@echo

echo Delete saved folder
rmdir /S /Q Saved

echo Deleting binaries folder
rmdir /S /Q Binaries

echo Deleting intermediate folder
rmdir /S /Q Intermediate

echo Deleting editor folders
rmdir /S /Q .idea
rmdir /S /Q .vs

echo Deleting platforms folder
rmdir /S /Q Platforms

echo Deleting derived data cache
rmdir /S /Q DerivedDataCache

echo Deleting solution
del /F /Q *.vsconfig
del /F /Q *.sln
del /F /Q *.DotSettings.user

echo Cleanup complete

:: Parse members of the properties folder
for /F "tokens=1* delims==" %%A in (Cleaning.properties) do (
   if "%%A"=="UnrealEnginePath" set UnrealEnginePath=%%B
   if "%%A"=="ProjectName" set ProjectName=%%B
   if "%%A"=="WaitOnEnd" set WaitOnEnd=%%B
)

echo Found Unreal Install at: %UnrealEnginePath%
echo Found Project Name: %ProjectName%

"%UnrealEnginePath%\Engine\Binaries\DotNET\UnrealBuildTool\UnrealBuildTool.exe" -ProjectFiles -Game "%~pd0..\%ProjectName%.uproject"

if "%WaitOnEnd%"=="true" (
   PAUSE
)