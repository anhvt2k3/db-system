#!/bin/bash

# Define the target directory
target_dir="./db-assemble"

# Check if the target directory exists
if [ ! -d "$target_dir" ]; then
    echo "Error: Directory '$target_dir' does not exist."
    exit 1
fi

# Find all files starting with a number
all_files=$(find "$target_dir" -type f -print)

# Sort files based on the first number
sorted_files=$(echo "$all_files" | sort -n -k 1)

echo $all_files

# Define the output file
output_file="merged_files.sql"

# Open the output file for writing
touch "$output_file"

# Merge files in the sorted order
for file in $sorted_files; do
    cat "$file" >> "$output_file"
done

echo "Merged files successfully. Output file: $output_file"
