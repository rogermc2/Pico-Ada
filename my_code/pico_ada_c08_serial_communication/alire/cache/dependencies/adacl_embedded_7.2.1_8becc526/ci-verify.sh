#!/bin/bash
set -o pipefail

echo "=== Ada CI Verification ==="

FAIL_FAST=true

run_step() {
    local name="$1"
    local dir="$2"
    
    echo "=== $name ==="
    echo "Directory: $dir"
    
    echo "Updating dependencies..."
    alr --non-interactive --chdir="$dir" update
    
    echo "Building with validation..."
    alr --chdir="$dir" build --validation
    
    if [[ $name == *Prove* ]]; then
        echo "Running GNATprove..."
        alr --chdir="$dir" gnatprove
    else
        echo "Running tests..."
        alr --chdir="$dir" run
    fi
    
    local status=$?
    if [ $status -eq 0 ]; then
        echo "SUCCESS: $name"
    else
        echo "FAILED: $name (Exit-Code: $status)"
        if [ "$FAIL_FAST" = true ]; then
            echo "Fail-Fast: Stopping on first error."
            exit $status
        fi
    fi
    echo "--------------------------------------------------"
}

# GNATprove
run_step "Prove Log Off"     "prove_log_off"
run_step "Prove No Tasking"  "prove_no_tasking"
run_step "Prove Tasking"     "prove_tasking"

# Tests
run_step "Test Log Off"      "test_log_off"
run_step "Test No Tasking"   "test_no_tasking"
run_step "Test Tasking"      "test_tasking"

echo "All steps completed."
