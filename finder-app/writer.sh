#!/bin/bash

# Check if both arguments are provided
if [ $# -lt 2 ]; then
    echo "Fehler: Bitte geben Sie sowohl einen Dateipfad als auch einen Textstring an."
    echo "Verwendung: $0 <writefile> <writestr>"
    exit 1
fi

writefile="$1"
writestr="$2"

# Extract the directory path from the full file path
writedir=$(dirname "$writefile")

# Create the directory path if it doesn't exist
mkdir -p "$writedir"
if [ $? -ne 0 ]; then
    echo "Fehler: Verzeichnis '$writedir' konnte nicht erstellt werden."
    exit 1
fi

# Write the string to the file (overwrite if exists)
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Fehler: Datei '$writefile' konnte nicht erstellt oder beschrieben werden."
    exit 1
fi

exit 0
