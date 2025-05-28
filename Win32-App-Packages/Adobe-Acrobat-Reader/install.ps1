#Installs Adobe Acrobat Reader

$installerUrl = "https://get.adobe.com/reader/enterprise/download/win/en_us/AcroRdrDC2100120145_en_US.msi"
$installerPath = "$env:TEMP\AcroRdrDC.msi"
$logFile = "$env:TEMP\adobe_reader_install.log"

#Download the installer

try {
    Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath -UseBasicParsing
}
catch {
    Write-Error "Failed to download Adobe Acrobat Reader. Error: $_"
    exit 1
}

#Run the installer
$process = Start-Process msiexec.exe -ArgumentList  "/i `"$installerPath`" /qn /L*v `"$logFile`"" -Wait -PassThru
if($process.ExitCode -ne 0){
    Write-Error "Adobe Acrobat Reader installation failed. Exit code: $($process.ExitCode)"
    exit 1
}

Write-Host "Adobe Acrobat Reader installed sucessfully."