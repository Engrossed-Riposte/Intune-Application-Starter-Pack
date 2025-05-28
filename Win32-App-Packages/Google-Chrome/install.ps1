$installerUrl = "https://dl.google.com/chrome/install/375.122/chrome_installer.msi"
$installerPath = "$env:TEMP\chrome_installer.msi"
$logFile = "$env:TEMP\chrome_install.log"

#Download the installer

try{
    Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath -UseBasicParsing
}
catch{
    Write-Error "Failed to download Google Chrome installer. Error $_"
    exit 1
}

# Run the installer
$process = Start-Process msiexec.exe -ArgumentList "/i `"$installerPath`" /qn /L*v `"$logFile`"" -Wait -PassThru
if ($process.ExitCode -ne 0) {
Write-Error "Google Chrome installation failed. Exit code: $($process.ExitCode)"
exit 1
}

Write-Host "Google Chrome installed successfully"

