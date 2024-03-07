#!/usr/bin/env bash

while IFS=: read -r folder file; do
    # trim whitespaces
    folder=$(echo "$folder" | xargs)
    file=$(echo "$file" | xargs)

    # for ~ expansion
    file=$(eval echo "$file")

    # create if not exists
    mkdir -p "$folder"

    if [ -f "$file" ]; then
        cp "$file" "$folder"
        echo "Copied '$file' to '$folder'"
    else # it is a directory
        cp -r "$file" "$folder"
        echo "Copied dir '$file' to '$folder'"
    fi
done < folder_files_map.txt