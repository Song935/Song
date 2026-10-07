# VS Code 설정 적용: 확장 설치 + settings.json 복사 (기존 파일은 settings.json.bak으로 백업)
$ErrorActionPreference = "Stop"
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$userDir = Join-Path $env:APPDATA "Code\User"

if (-not (Get-Command code -ErrorAction SilentlyContinue)) {
    Write-Error "code 명령을 찾을 수 없습니다. VS Code를 설치하고 PATH에 추가하세요."
}

Get-Content (Join-Path $here "extensions.txt") | Where-Object { $_.Trim() } | ForEach-Object {
    Write-Host "확장 설치: $_"
    code --install-extension $_ --force | Out-Null
}

New-Item -ItemType Directory -Force $userDir | Out-Null
$dest = Join-Path $userDir "settings.json"
if (Test-Path $dest) { Copy-Item $dest "$dest.bak" -Force; Write-Host "기존 설정 백업: $dest.bak" }
Copy-Item (Join-Path $here "settings.json") $dest -Force
Write-Host "완료. VS Code를 다시 켜면 반영됩니다."
