Write-Host "=== Ada CI Verification ===" -ForegroundColor Cyan

$FailFast = $true

function Run-Step {
    param(
        [string]$Name,
        [string]$Dir
    )
    
    Write-Host "=== $Name ===" -ForegroundColor Yellow
    Write-Host "Directory: $Dir" -ForegroundColor Gray
    
    # Preparation
    Write-Host "Updating dependencies..." -ForegroundColor White
    alr  --non-interactive --chdir=$Dir update
    
    Write-Host "Building with validation..." -ForegroundColor White
    alr --chdir=$Dir build --validation
    
    # Actual check
    if ($Name -like "*Prove*") {
        Write-Host "Running GNATprove..." -ForegroundColor White
        alr --chdir=$Dir gnatprove
    } else {
        Write-Host "Running tests..." -ForegroundColor White
        alr --chdir=$Dir run
    }
    
    $status = $LASTEXITCODE
    if ($status -eq 0) {
        Write-Host "SUCCESS: $Name" -ForegroundColor Green
    } else {
        Write-Host "FAILED: $Name (Exit-Code: $status)" -ForegroundColor Red
        if ($FailFast) {
            Write-Host "Fail-Fast: Stopping on first error." -ForegroundColor Red
            exit $status
        }
    }
    Write-Host "--------------------------------------------------" -ForegroundColor DarkGray
}

# GNATprove Checks
Run-Step "Prove Log Off"     "prove_log_off"
Run-Step "Prove No Tasking"  "prove_no_tasking"
Run-Step "Prove Tasking"     "prove_tasking"

# Unit Tests
Run-Step "Test Log Off"      "test_log_off"
Run-Step "Test No Tasking"   "test_no_tasking"
Run-Step "Test Tasking"      "test_tasking"

Write-Host "All steps completed." -ForegroundColor Green
