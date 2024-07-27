$psexecUrl = "https://download.sysinternals.com/files/PSTools.zip"
$zipPath = ".\PSTools.zip"
$extractPath = ".\PSTools"

Invoke-WebRequest -Uri $psexecUrl -OutFile $zipPath

if (-not (Test-Path $extractPath)) {
    New-Item -ItemType Directory -Path $extractPath | Out-Null
}

Expand-Archive -Path $zipPath -DestinationPath $extractPath -Force

$psexecPath = Join-Path $extractPath "PsExec.exe"

Start-Process -FilePath $psexecPath -ArgumentList "/?" -NoNewWindow -Wait

Remove-Item -Path $zipPath -Force
Remove-Item -Path $extractPath -Recurse -Force
