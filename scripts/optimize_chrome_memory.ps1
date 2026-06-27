# Chrome 内存深度优化脚本
# 可一键运行，关闭 Chrome → 清理缓存 → 以优化参数重启

$ChromeExe = "C:\Program Files\Google\Chrome\Application\chrome.exe"
$MemoryLimitMB = 4096
$MaxRendererProcesses = 10
$InactiveTimeoutMin = 15
$CacheSizeLimitMB = 500

Write-Host "╔══════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║    Chrome 内存深度优化工具 v1.0      ║" -ForegroundColor Cyan
Write-Host "╚══════════════════════════════════════╝" -ForegroundColor Cyan

Write-Host "[1/4] 关闭 Chrome 进程..." -NoNewline
Get-Process -Name "chrome" -ErrorAction SilentlyContinue | Stop-Process -Force
Start-Sleep -Seconds 2
$retry = 3
while ($retry -gt 0 -and (Get-Process -Name "chrome" -ErrorAction SilentlyContinue)) {
    Start-Sleep -Seconds 1
    Get-Process -Name "chrome" -ErrorAction SilentlyContinue | Stop-Process -Force
    $retry--
}
Write-Host " ✔" -ForegroundColor Green

Write-Host "[2/4] 清理缓存..." -NoNewline
$cachePaths = @(
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Code Cache",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Media Cache",
    "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\GPUCache"
)
foreach ($p in $cachePaths) {
    if (Test-Path $p) { Remove-Item "$p\*" -Recurse -Force -ErrorAction SilentlyContinue }
}
Write-Host " ✔" -ForegroundColor Green

Write-Host "[3/4] 写入内存节省器配置..." -NoNewline
$prefsPath = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Preferences"
try {
    $prefs = Get-Content $prefsPath -Raw -ErrorAction Stop | ConvertFrom-Json
    if (-not $prefs.performance_tuning) {
        $prefs | Add-Member -NotePropertyName "performance_tuning" -NotePropertyValue @{} -Force
    }
    $perf = $prefs.performance_tuning
    $perf.high_efficiency_mode = @{ enabled = $true; type = 0; mode = 0; inactive_time = $InactiveTimeoutMin; exception_sites = @() }
    $perf.memory_saver = @{ enabled = $true; mode = 0 }
    $perf.battery_saver = @{ enabled = $true; mode = 0 }
    $perf.tab_discarding = @{ enabled = $true; discard_interval_minutes = 30 }
    $prefs | ConvertTo-Json -Depth 20 -Compress | Set-Content $prefsPath -Encoding UTF8
    Write-Host " ✔" -ForegroundColor Green
} catch {
    Write-Host " ✘" -ForegroundColor Yellow
}

Write-Host "[4/4] 启动 Chrome（优化模式）..." -NoNewline
$args = @(
    "--memory-pressure-off",
    "--disable-background-networking",
    "--disable-features=TranslateUI,ChromeWhatsNewUI,InterestFeedContentSuggestions,CalculateNativeWinOcclusion",
    "--disable-component-update",
    "--disable-default-apps",
    "--disable-preconnect",
    "--disable-sync",
    "--renderer-process-limit=$MaxRendererProcesses",
    "--max_old_space_size=$MemoryLimitMB"
)
Start-Process -FilePath $ChromeExe -ArgumentList $args
Write-Host " ✔" -ForegroundColor Green

$afterProcs = Get-Process -Name "chrome" -ErrorAction SilentlyContinue
$afterMem = ($afterProcs | Measure-Object WorkingSet64 -Sum).Sum
Write-Host "`n══════════════════════════════════════════" -ForegroundColor Cyan
Write-Host " 优化完成！进程: $($afterProcs.Count) | 内存: $([math]::Round($afterMem/1MB,1)) MB" -ForegroundColor Green
Write-Host "══════════════════════════════════════════" -ForegroundColor Cyan
