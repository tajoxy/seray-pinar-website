$ErrorActionPreference = "Stop"

$RepoUrl = "https://github.com/tajoxy/seray-pinar-website.git"
$SourceDir = Join-Path $PSScriptRoot "seray-pinar-website-final"
$WorkDir = Join-Path $PSScriptRoot "seray-pinar-github-ready"

Write-Host "Seray Pinar website - GitHub preparation" -ForegroundColor Cyan
Write-Host "Repository: $RepoUrl"

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw "Git bulunamadi. Once Git for Windows kurulu olmali."
}

if (-not (Test-Path $SourceDir)) {
    throw "Site klasoru bulunamadi: $SourceDir"
}

if (Test-Path $WorkDir) {
    Write-Host "Eski hazirlik klasoru siliniyor: $WorkDir" -ForegroundColor Yellow
    Remove-Item $WorkDir -Recurse -Force
}

Write-Host "GitHub reposu klonlaniyor..." -ForegroundColor Cyan
git clone --branch main --single-branch $RepoUrl $WorkDir
if ($LASTEXITCODE -ne 0) { throw "git clone basarisiz." }

Write-Host "Repo dosyalari yeni final site ile degistiriliyor..." -ForegroundColor Cyan
Get-ChildItem $WorkDir -Force | Where-Object { $_.Name -ne ".git" } | Remove-Item -Recurse -Force
Copy-Item (Join-Path $SourceDir "*") $WorkDir -Recurse -Force

Push-Location $WorkDir
try {
    git add -A
    Write-Host ""
    Write-Host "===== GITHUB'A GIDECEK DEGISIKLIKLER =====" -ForegroundColor Green
    git status --short
    Write-Host ""
    git diff --cached --stat
    Write-Host ""
    Write-Host "Hazir. HENUZ GitHub'a push yapilmadi." -ForegroundColor Yellow
    Write-Host "Dosyalari kontrol ettikten sonra su iki komutu calistir:" -ForegroundColor Cyan
    Write-Host 'git commit -m "Update Warsaw performances and add legal/privacy/cookie consent"' -ForegroundColor White
    Write-Host "git push origin main" -ForegroundColor White
    Write-Host ""
    Write-Host "Cloudflare Pages GitHub'a bagli oldugu icin push'tan sonra otomatik deploy olacak." -ForegroundColor Green
} finally {
    Pop-Location
}
