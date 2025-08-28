# 🔄 Fix Azure-Generated Workflows for Monorepo Structure
# This script automatically fixes the dotnet publish commands in Azure-generated workflows
# 
# Why this approach:
# ✅ Preserves Azure's automatic authentication setup (service principals, secrets)
# ✅ Fixes monorepo project path issues for correct builds
# ✅ Workshop-friendly - no manual GitHub secrets configuration needed
# ✅ Safe - creates backups before making changes

param(
    [string]$WorkflowsPath = ".\.github\workflows",
    [switch]$WhatIf = $false
)

Write-Host "🔍 Scanning for Azure-generated workflow files..." -ForegroundColor Yellow
Write-Host "💡 This preserves Azure's automatic authentication while fixing monorepo issues." -ForegroundColor Cyan

# Get all Azure-generated workflow files
$workflowFiles = Get-ChildItem -Path $WorkflowsPath -Filter "main_fabrikam-*-development-*.yml" -ErrorAction SilentlyContinue

if ($workflowFiles.Count -eq 0) {
    Write-Host "❌ No Azure-generated workflow files found." -ForegroundColor Red
    Write-Host "Expected pattern: main_fabrikam-*-development-*.yml" -ForegroundColor Gray
    exit 1
}

Write-Host "✅ Found $($workflowFiles.Count) workflow file(s) to fix:" -ForegroundColor Green
$workflowFiles | ForEach-Object { Write-Host "  - $($_.Name)" -ForegroundColor Cyan }

foreach ($file in $workflowFiles) {
    Write-Host "`n🔧 Processing: $($file.Name)" -ForegroundColor Blue
    
    $content = Get-Content $file.FullName -Raw
    $changes = @()
    
    # Determine project based on filename
    if ($file.Name -like "*api*") {
        $projectPath = "FabrikamApi/src/FabrikamApi.csproj"
        $serviceName = "API"
    }
    elseif ($file.Name -like "*mcp*") {
        $projectPath = "FabrikamMcp/src/FabrikamMcp.csproj"
        $serviceName = "MCP"
    }
    else {
        Write-Host "  ⚠️ Cannot determine project type from filename. Skipping." -ForegroundColor Yellow
        continue
    }
    
    # Fix the dotnet publish command
    $pattern = 'run:\s*dotnet publish -c Release -o \$\{\{env\.DOTNET_ROOT\}\}/myapp'
    $replacement = "run: dotnet publish $projectPath -c Release -o `${{env.DOTNET_ROOT}}/myapp"
    
    if ($content -match $pattern) {
        $content = $content -replace $pattern, $replacement
        $changes += "Fixed dotnet publish command for $serviceName service"
    }
    
    # Additional fix: Ensure we're building the solution first
    $buildPattern = 'run:\s*dotnet build --configuration Release'
    $buildReplacement = 'run: dotnet build Fabrikam.sln --configuration Release'
    
    if ($content -match $buildPattern -and $content -notmatch 'Fabrikam\.sln') {
        $content = $content -replace $buildPattern, $buildReplacement
        $changes += "Fixed dotnet build command to use solution file"
    }
    
    if ($changes.Count -gt 0) {
        if ($WhatIf) {
            Write-Host "  📋 Would make the following changes:" -ForegroundColor Yellow
            $changes | ForEach-Object { Write-Host "    - $_" -ForegroundColor Gray }
        }
        else {
            # Create backup
            $backupPath = "$($file.FullName).backup"
            Copy-Item $file.FullName $backupPath
            Write-Host "  💾 Created backup: $($file.Name).backup" -ForegroundColor Gray
            
            # Write updated content
            Set-Content $file.FullName $content -NoNewline
            Write-Host "  ✅ Applied changes:" -ForegroundColor Green
            $changes | ForEach-Object { Write-Host "    - $_" -ForegroundColor Gray }
        }
    }
    else {
        Write-Host "  ✅ No changes needed - workflow already correctly configured." -ForegroundColor Green
    }
}

if ($WhatIf) {
    Write-Host "`n📋 Dry run completed. Use without -WhatIf to apply changes." -ForegroundColor Yellow
}
else {
    Write-Host "`n🎉 Workflow fix completed!" -ForegroundColor Green
    Write-Host "✅ Azure's automatic authentication is preserved." -ForegroundColor Green
    Write-Host "✅ Monorepo project paths are now correctly configured." -ForegroundColor Green
    Write-Host "💡 Test your workflows by pushing a change to the main branch." -ForegroundColor Cyan
}
