#!/bin/bash

# This script attempts to process a list of files, but contains a subtle bug.

files=("/tmp/file1.txt" "/tmp/file2.txt" "/tmp/file3.txt")

for file in "${files[@]}"; do
  # The bug is here:  If a filename contains spaces, it will be treated as multiple arguments.
  # This will result in an error if the command processing each file doesn't expect multiple arguments.
  process_file "$file"
done

process_file() {
  echo "Processing: $1"
  # Example processing:  This would fail if $1 contains multiple words
  grep "pattern" "$1" > /dev/null 2>&1 || echo "Pattern not found in $1"
}

#In this specific example, the script fails if one or more filenames contain spaces