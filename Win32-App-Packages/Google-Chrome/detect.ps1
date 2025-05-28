#Detects if Google Chrome is installed

$chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"
if(Test-Path $chromePath){
    Write-Host "Google Chrome is installed"
    exit 0
}
else {
    exit 1
}