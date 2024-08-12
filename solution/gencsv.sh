#!/bin/bash

# Check if exactly two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <start_index> <end_index>"
    exit 1
fi

# Assign command-line arguments to variables
START_INDEX=$1
END_INDEX=$2

# Validate if arguments are integers
if ! [[ "$START_INDEX" =~ ^[0-9]+$ ]] || ! [[ "$END_INDEX" =~ ^[0-9]+$ ]]; then
    echo "Both arguments must be integers."
    exit 1
fi

# Validate if start_index is less than or equal to end_index
if [ "$START_INDEX" -gt "$END_INDEX" ]; then
    echo "Start index must be less than or equal to end index."
    exit 1
fi

# Define the filename
FILENAME="inputFile"

# Create or clear the file
: > "$FILENAME"

# Generate entries
for (( i=START_INDEX; i<=END_INDEX; i++ )); do
    RANDOM_NUMBER=$((RANDOM % 100))  # Generate a random number between 0 and 99
    echo "$i, $RANDOM_NUMBER" >> "$FILENAME"
done

echo "File '$FILENAME' has been created with the specified content."
