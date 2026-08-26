# ==========================================
# テスト
# ==========================================

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.MessageBox]::Show(
    "Hello World!",                  # 表示するメッセージ
    "PowerShell 通知",               # ウィンドウのタイトル
    [System.Windows.Forms.MessageBoxButtons]::OK, # ボタンの種類（OKボタンのみ）
    [System.Windows.Forms.MessageBoxIcon]::Information # アイコン（情報アイコン）
)

# コンソール側にもメッセージを出力する場合
Write-Host "ポップアップを表示しました。" -ForegroundColor Green