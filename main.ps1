# ==========================================
# テスト
# ==========================================
# ==========================================
# 本体のメニュー画面 (main.ps1)
# ==========================================

# 文字化け防止（必要に応じて）
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

do {
    Clear-Host
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "         PowerShell ツール メニュー       " -ForegroundColor Yellow
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host " 1. 機能 A を実行する"
    Write-Host " 2. 機能 B を実行する（モジュール利用例）"
    Write-Host " 3. 設定ファイルの確認"
    Write-Host " Q. 終了する"
    Write-Host "----------------------------------------"
    
    $selection = Read-Host "番号を入力してください (1-3, Q)"

    switch ($selection) {
        '1' {
            Write-Host "`n[機能A] を実行中..." -ForegroundColor Green
            # ここに機能Aの処理を記述（または別スクリプトを呼び出し）
            Start-Sleep -Seconds 1
        }
        '2' {
            Write-Host "`n[機能B] を実行中..." -ForegroundColor Green
            # 複数モジュール構成の場合、同一フォルダ内のモジュールを読み込んで実行可能
            # 例: Import-Module "$PSScriptRoot\modules\toolA.psm1"
            Start-Sleep -Seconds 1
        }
        '3' {
            Write-Host "`n[設定ファイル] を読み込みます..." -ForegroundColor Green
            # 同一フォルダ内の設定ファイル（config.json等）を読み込む例
            $ConfigPath = "$PSScriptRoot\config.json"
            if (Test-Path $ConfigPath) {
                Get-Content $ConfigPath | Write-Host
            } else {
                Write-Host "config.json が見つかりませんでした。" -ForegroundColor Yellow
            }
            Read-Host "`n[Enterキーを押すとメニューに戻ります]"
        }
        'Q' {
            Write-Host "`n終了します。" -ForegroundColor Cyan
            break
        }
        default {
            Write-Host "`n無効な選択です。もう一度選んでください。" -ForegroundColor Red
            Start-Sleep -Seconds 1
        }
    }
} while ($selection -ne 'Q')