$psexecUrl = "https://download.sysinternals.com/files/PSTools.zip"
$zipPath = ".\PSTools.zip"
$extractPath = ".\PSTools"

Invoke-WebRequest -Uri $psexecUrl -OutFile $zipPath

if (-not (Test-Path $extractPath)) {
    New-Item -ItemType Directory -Path $extractPath | Out-Null
}

Expand-Archive -Path $zipPath -DestinationPath $extractPath -Force

# Clean up
Remove-Item -Path $zipPath -Force
