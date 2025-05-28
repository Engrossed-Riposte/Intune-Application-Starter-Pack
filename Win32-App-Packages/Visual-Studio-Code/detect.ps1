#Detects if VS Code is installed

$vscodePath = "C:\$env:LOCALAPPDATA\Programs\Microsoft VS Code\Code.exe\"
if (Test-Path $vscodePath){
    Write-Host "VS Code is installed"
    exit 0
}
else {
    exit 1
}