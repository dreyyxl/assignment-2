#!/bin/bash

passed=0
failed=0

run_test() {
    test_name="$1"
    expected_status="$2"
    shift 2

    echo "Testing: $test_name"

    docker compose run --rm diagnostic "$@"
    actual_status=$?

    if [ "$actual_status" -eq "$expected_status" ]; then
        echo "PASS: $test_name"
        passed=$((passed + 1))
    else
        echo "FAIL: $test_name"
        echo "Expected exit code: $expected_status"
        echo "Actual exit code: $actual_status"
        failed=$((failed + 1))
    fi

    echo "-----------------------------"
}

# Test 1: Help
run_test "help" 0 help

# Test 2: System information
run_test "system" 0 system

# Test 3: Disk usage
run_test "disk" 0 disk

# Test 4: Invalid command
run_test "invalid command" 2 invalid

# Test 5: Network command without hostname
run_test "network missing hostname" 2 network

# Final summary
echo "Tests passed: $passed"
echo "Tests failed: $failed"

if [ "$failed" -eq 0 ]; then
    echo "All tests passed!"
    exit 0
else
    echo "Some tests failed!"
    exit 1
fi

