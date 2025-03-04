#!/bin/bash
# Description: Create every possible l337speak variation of a given word from a list.
# Each word should be on its own line.
# Useage: l33tify.sh <input_file> <output_file>
# Author: SH

leetify() {
  local word="$1"
  local length=${#word}
  local variations=()
  local -A leet_map=(
    # Edit the character map as needed
    [a]='@' [A]='@' [e]='3' [E]='3' [i]='1' [I]='1' [o]='0' [O]='0' [l]='1' [L]='1' [s]='$' [S]='$' [t]='7' [T]='7'
  )

  leetify_recursion() {
    local current="$1"
    local index="$2"

    if (( index == length )); then
      variations+=("$current")
      return
    fi

    local char="${word:index:1}"
    leetify_recursion "$current$char" $((index + 1))

    if [[ -n "${leet_map[$char]}" ]]; then
      leetify_recursion "$current${leet_map[$char]}" $((index + 1))
    fi
  }

  leetify_recursion "" 0

  echo "${variations[@]}"
}

if [ $# -ne 2 ]; then
  echo "Usage: $0 <input_file> <output_file>"
  exit 1
fi

input_file="$1"
output_file="$2"

while IFS= read -r word; do
  if [ -n "$word" ]; then
    variations=$(leetify "$word")
    for var in $variations; do
      echo "$var" >> "$output
    done
  fi
done < "$input_file"

echo "Ding, fries are done."
echo "Ding, fries are done."
