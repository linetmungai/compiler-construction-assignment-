#!/usr/bin/env bash
# Build all three LEX programs.
set -euo pipefail

programs=(wordcount replace_abc recognize_verbs)

for program in "${programs[@]}"; do
    echo "[*] Building ${program} ..."
    flex -o "${program}.yy.c" "${program}.l"
    gcc -Wall -o "${program}" "${program}.yy.c"
    echo "    OK -> ./${program}"
done

echo "All programs built successfully."
