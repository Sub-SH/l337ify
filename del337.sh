#!/bin/bash
# Description: Remove l337 characters from a wordlist
# Each word should be on its own line.
# Useage: l33tify.sh
# Author: SH

read -p "Enter the input file path: " input_file
read -p "Enter the output file path: " output_file

> "$output_file"

# Modify character map as needed
deleet() {
    local str="$1"
    str="${str//4/A}"
    str="${str//@/A}"
    str="${str//3/E}"
    str="${str//6/G}"
    str="${str//1/I}"
    str="${str//!/I}"
    str="${str//0/O}"
    str="${str//5/S}"
    str="${str//$/S}"
    str="${str//7/T}"
    str="${str//2/Z}"
    str="${str//8/B}"
    echo "$str"
}

while IFS= read -r line; do
    if [[ $line =~ :([^a-zA-Z]*)([a-zA-Z].*[a-zA-Z]) ]]; then
        extracted="${BASH_REMATCH[2]}"
        cleaned=$(deleet "$extracted")
        echo "$cleaned" >> "$output_file"
    fi
done < "$input_file"

echo "Ding, fries are done." 
echo "Results saved to $output_file."
