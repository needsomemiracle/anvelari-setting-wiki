$source = "$HOME\Documents\Obsidian Vault\Articles\Published"
$destination = "$PSScriptRoot\content"

# Проверяем наличие исходной папки
if (-not (Test-Path $source)) {
    throw "Не найдена исходная папка: $source"
}

# Удаляем старые опубликованные материалы, сохраняя index.md
Get-ChildItem $destination -Force |
    Where-Object { $_.Name -ne "index.md" } |
    Remove-Item -Recurse -Force

# Копируем опубликованные материалы
Copy-Item "$source\*" $destination -Recurse -Force

Write-Host "Синхронизация завершена."