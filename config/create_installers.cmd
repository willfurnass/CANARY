echo ...
echo *** Create INSTALLER executables ***
echo ...
cd %WORKSPACE%\trunk\packages\install
"%INNOSETUP%\iscc.exe" /dMyBuildNumber=%BUILD_NUMBER% /dMySubversionRevision=%SVN_REVISION% /dWorkspace=%WORKSPACE% setup-update.iss
"%INNOSETUP%\iscc.exe" /dMyBuildNumber=%BUILD_NUMBER% /dMySubversionRevision=%SVN_REVISION% /dWorkspace=%WORKSPACE% setup-source.iss
