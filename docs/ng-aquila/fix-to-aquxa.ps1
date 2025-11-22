# PowerShell script to fix ng-aquax to ng-aquxa (correct spelling)
$targetDir = "d:\Projects\AI\Antigravity\docs\ng-aqua"
$files = Get-ChildItem -Path $targetDir -Recurse -File -Include *.md

$count = 0
foreach ($file in $files) {
    $content = Get-Content -Path $file.FullName -Raw
    
    # Replace ng-aquax with ng-aquxa (fix the letter order)
    if ($content -match 'ng-aquax') {
        # Replace package names
        $newContent = $content -replace '@allianz/ng-aquax/', '@allianz/ng-aquxa/'
        $newContent = $newContent -replace '@allianz/ng-aquax', '@allianz/ng-aquxa'
        
        # Replace URLs
        $newContent = $newContent -replace 'allianz\.github\.io/ng-aquax', 'allianz.github.io/ng-aquxa'
        $newContent = $newContent -replace 'github\.com/allianz/ng-aquax', 'github.com/allianz/ng-aquxa'
        
        # Replace text references
        $newContent = $newContent -replace 'ng-aquax', 'ng-aquxa'
        
        Set-Content -Path $file.FullName -Value $newContent -NoNewline
        $count++
        Write-Host "Fixed: $($file.Name)"
    }
}

Write-Host "`nCompleted! Fixed $count files (ng-aquax -> ng-aquxa)."
