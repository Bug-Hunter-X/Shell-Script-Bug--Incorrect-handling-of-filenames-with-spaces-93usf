#!/bin/bash

# This script demonstrates the corrected version.

files=("/tmp/file1.txt" "/tmp/file2.txt" "/tmp/file3.txt" "/tmp/file with spaces.txt")

for file in "${files[@]}"; do
  # The correction: Use "${file}" to treat the entire filename as a single argument,
  # even if it contains spaces.
  process_file "${file}"
done

process_file() {
  echo "Processing: $1"
  # Example processing: This now correctly handles filenames with spaces
  grep "pattern" "$1" > /dev/null 2>&1 || echo "Pattern not found in $1"
}

# The corrected script now handles filenames with spaces correctly.