# Rename folders from English to Chinese
$base = 'D:\BaiduSyncdisk\我的资料\Qclaw-Wiki\content'

Write-Host "=== Current structure ==="
Get-ChildItem $base -Recurse -Directory | ForEach-Object { Write-Host $_.FullName }

# Rename operations (deepest first to avoid path conflicts)
# Level 3: deepest folders first
# topics/medical/policy/national -> topics/medical/policy/国家
# topics/medical/policy/regional -> topics/medical/policy/区域

Write-Host "`n=== Renaming operations ==="

# Check if paths exist before renaming
$renames = @(
    # Level 3
    @("$base\topics\medical\policy\national", "$base\topics\medical\policy\国家"),
    @("$base\topics\medical\policy\regional", "$base\topics\medical\policy\区域"),
    # Level 2
    @("$base\topics\medical\tetanus", "$base\topics\medical\破伤风"),
    @("$base\topics\medical\policy", "$base\topics\medical\政策"),
    @("$base\topics\work", "$base\topics\工作"),
    @("$base\tools\concepts", "$base\tools\概念"),
    @("$base\tools\entities", "$base\tools\实体"),
    @("$base\tools\synthesis", "$base\tools\综合"),
    # Level 1
    @("$base\topics\medical", "$base\topics\医学"),
    @("$base\topics", "$base\主题"),
    @("$base\tools", "$base\工具体系")
)

foreach ($pair in $renames) {
    $old = $pair[0]
    $new = $pair[1]
    if (Test-Path $old) {
        Write-Host "Renaming: $old -> $new"
        Rename-Item -Path $old -NewName $new
    } else {
        Write-Host "SKIP (not found): $old"
    }
}

Write-Host "`n=== New structure ==="
Get-ChildItem $base -Recurse -Directory | ForEach-Object { Write-Host $_.FullName }
