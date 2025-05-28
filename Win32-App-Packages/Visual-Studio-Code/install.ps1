#Installs Visual Studio Code

$installerUrl = "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user"
$installerPath = "$env:TEMP\VSCodeUserSetup.exe"
$logFile = "$env:TEMP\vscode_install.log"

#Download the installer
try {
    Invoke-WebRequest $installerUrl -OutFile $installerPath -UseBasicParsing
}
catch {
    Write-Error "VS Code did not download properly. Error Code: $_"
    exit 1
}

#Run the installer
$process = Start-Process -FilePath $installerPath -ArgumentList "/verysilent /mergetasks=!runcode /log=`"$logFile`"" -Wait -PassThru
if($process.ExitCode -ne 0){
    Write-Error "VS Code did not install properly. Exit Code: $_"
    exit 1
}