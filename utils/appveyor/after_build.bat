git describe --tags --always HEAD > _git_tag.tmp
set /p AppVersion=<_git_tag.tmp
del _git_tag.tmp

set QtRoot=%QTDIR%
set Source=%APPVEYOR_BUILD_FOLDER%
set Name=qxtglobalshortcut-%AppVersion%
set Destination=%APPVEYOR_BUILD_FOLDER%\%Name%
set InstallPrefix=%APPVEYOR_BUILD_FOLDER%\install

if [%VC_VARS_ARCH%] == [] (set LibPrefix=lib) else (set LibPrefix=)
set Executable=%Destination%\bin\%LibPrefix%qxtglobalshortcut.dll

xcopy /F /S /E /I "%InstallPrefix%" "%Destination%" || goto :error

xcopy /F "%Source%\AUTHORS" "%Destination%" || goto :error
xcopy /F "%Source%\COPYING" "%Destination%" || goto :error
xcopy /F "%Source%\README.md" "%Destination%" || goto :error

xcopy /F /S /E /I "%Source%\example" "%Destination%\example" || goto :error
xcopy /F /S /E /I "%Source%\example-qt4" "%Destination%\example-qt4" || goto :error

%QTDIR%\bin\windeployqt --release --no-translations --no-system-d3d-compiler --no-angle --no-opengl-sw --no-plugins "%Executable%" || goto :error

7z a "%Name%.zip" -r "%Destination%" || goto :error

:error
exit /b %errorlevel%
