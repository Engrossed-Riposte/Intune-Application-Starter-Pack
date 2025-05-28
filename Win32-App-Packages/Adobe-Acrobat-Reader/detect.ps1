#Detects if Adobe Acrobat is installed

$readerPath = & 'C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe'
if (Test-Path $readerPath){
    Write-Host "Adobe Acrobat Reader is installed"
    exit 0
}
else {
    exit 1
}