#!/bin/bash

# Create the download directory if it doesn't exist
mkdir -p ./download
base_url="https://ds5q9oxwqwsfj.cloudfront.net/"

# Read from all_paths.csv line by line
while IFS= read -r line; do
    # Extract the filename from the URL
    filename=$(basename "$line")
    url="$base_url$line"
    output="./download/$line"
    
    # Use curl to download the file
    echo "Downloading from $url"
    curl --retry 1000 --retry-all-errors --retry-delay 1 "$url" --create-dirs -o $output
    echo "Downloaded into $output"
    
done < "all_index_paths.csv"

echo "Script completed. Exiting after first download for debugging."

