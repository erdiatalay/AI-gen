# PowerShell script to fix ng-aqua to ng-aquax throughout all documentation
$targetDir = "d:\Projects\AI\Antigravity\docs\ng-aqua"
$files = Get-ChildItem -Path $targetDir -Recurse -File -Include *.md

$count = 0
foreach ($file in $files) {
    $content = Get-Content -Path $file.FullName -Raw
    
    # Replace ng-aqua with ng-aquax (but not when it's already ng-aquax)
    if ($content -match 'ng-aqua[^x]' -or $content -match 'ng-aqua$' -or $content -match 'ng-aqua\)' -or $content -match 'ng-aqua/') {
        # Replace package names
        $newContent = $content -replace '@allianz/ng-aqua/', '@allianz/ng-aquax/'
        
        # Replace URLs
        $newContent = $newContent -replace 'allianz\.github\.io/ng-aqua', 'allianz.github.io/ng-aquax'
        $newContent = $newContent -replace 'github\.com/allianz/ng-aqua', 'github.com/allianz/ng-aquax'
        
        # Replace text references
        $newContent = $newContent -replace 'ng-aqua component', 'ng-aquax component'
        $newContent = $newContent -replace 'ng-aqua Angular', 'ng-aquax Angular'
        $newContent = $newContent -replace 'ng-aqua library', 'ng-aquax library'
        $newContent = $newContent -replace 'ng-aqua v', 'ng-aquax v'
        $newContent = $newContent -replace 'ng-aqua \(', 'ng-aquax ('
        $newContent = $newContent -replace 'ng-aqua provides', 'ng-aquax provides'
        $newContent = $newContent -replace 'for ng-aqua', 'for ng-aquax'
        $newContent = $newContent -replace 'Allianz ng-aqua', 'Allianz ng-aquax'
        $newContent = $newContent -replace 'the ng-aqua', 'the ng-aquax'
        $newContent = $newContent -replace ' ng-aqua$', ' ng-aquax'
        
        # Replace in code examples and titles
        $newContent = $newContent -replace 'Part of the ng-aqua', 'Part of the ng-aquax'
        
        # Fix directory references (keep folder name as ng-aqua)
        $newContent = $newContent -replace 'docs/ng-aquax', 'docs/ng-aqua'
        $newContent = $newContent -replace 'AI\\Antigravity\\docs\\ng-aquax', 'AI\Antigravity\docs\ng-aqua'
        
        Set-Content -Path $file.FullName -Value $newContent -NoNewline
        $count++
        Write-Host "Fixed: $($file.Name)"
    }
}

Write-Host "`nCompleted! Fixed $count files."
