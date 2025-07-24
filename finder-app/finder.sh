#!/bin/bash

# Check if both parameters are provided
if [ $# -lt 2 ]; then
    echo "Fehler: Bitte geben Sie sowohl ein Verzeichnis als auch einen Suchstring an."
    echo "Verwendung: $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir="$1"
searchstr="$2"

# Check if filesdir is a directory
if [ ! -d "$filesdir" ]; then
    echo "Fehler: '$filesdir' ist kein gültiges Verzeichnis."
    exit 1
fi

# Count the number of files in the directory and subdirectories
filecount=$(find "$filesdir" -type f | wc -l)

# Count the number of lines matching searchstr in those files
matchcount=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# Output the result
echo "The number of files are $filecount and the number of matching lines are $matchcount"

exit 0
