# PowerShell script to fix ng-aqua/ng-aquax to ng-aquila (correct spelling)
$targetDir = "d:\Projects\AI\Antigravity\docs\ng-aqua"
$files = Get-ChildItem -Path $targetDir -Recurse -File -Include *.md

$count = 0
foreach ($file in $files) {
    $content = Get-Content -Path $file.FullName -Raw
    
    # Replace ng-aquax and ng-aqua with ng-aquila
    # We check for aquax first to avoid partial matches if we just checked aqua
    
    $newContent = $content
    
    # Fix package names
    $newContent = $newContent -replace '@allianz/ng-aquax', '@allianz/ng-aquila'
    $newContent = $newContent -replace '@allianz/ng-aqua', '@allianz/ng-aquila'
    
    # Fix URLs
    $newContent = $newContent -replace 'allianz\.github\.io/ng-aquax', 'allianz.github.io/ng-aquila'
    $newContent = $newContent -replace 'allianz\.github\.io/ng-aqua', 'allianz.github.io/ng-aquila'
    $newContent = $newContent -replace 'github\.com/allianz/ng-aquax', 'github.com/allianz/ng-aquila'
    $newContent = $newContent -replace 'github\.com/allianz/ng-aqua', 'github.com/allianz/ng-aquila'
    
    # Fix general text references (case insensitive replacement for text, but careful not to break other things)
    # We'll do specific replacements to be safe
    $newContent = $newContent -replace 'ng-aquax', 'ng-aquila'
    $newContent = $newContent -replace 'ng-aqua', 'ng-aquila'
    
    # Fix the title in index if it was messed up
    $newContent = $newContent -replace '# ng-aquax', '# ng-aquila'
    $newContent = $newContent -replace '# ng-aqua', '# ng-aquila'

    if ($content -ne $newContent) {
        Set-Content -Path $file.FullName -Value $newContent -NoNewline
        $count++
        Write-Host "Fixed: $($file.Name)"
    }
}

Write-Host "`nCompleted! Fixed $count files to use ng-aquila."
