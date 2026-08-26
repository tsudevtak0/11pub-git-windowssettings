# ==========================================
# 起動用ラッパースクリプト (launcher.ps1)
# ==========================================

# 1. GitHubのRaw URLを指定
$ScriptUrl = "https://raw.githubusercontent.com/tsudevtak0/101pub-git-windowssettings/main/main.ps1"

try {
    
    Write-Host "GitHubから最新スクリプトを取得中..." -ForegroundColor Cyan

    # TLS 1.2以上を強制
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12


    # 最新コードの取得
    $ScriptContent = (Invoke-WebRequest -Uri $ScriptUrl -UseBasicParsing).Content

    # ▼ ここに BOM を強制削除する処理を入れる
    $ScriptContent = $ScriptContent.Trim([char]0xFEFF).Trim()

    # 取得したスクリプトを現在のセッション上で動的に実行
    Invoke-Command -ScriptBlock { 
        param($code) 
        $ExecutionContext.InvokeCommand.InvokeScript($code) 
    } -ArgumentList $ScriptContent
}
catch {
    Write-Error "スクリプトの取得・実行に失敗しました。インターネット接続を確認してください。"
    Write-Error $_.Exception.Message
    Pause
}