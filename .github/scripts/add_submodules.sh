#!/bin/bash

# Read submodule URLs from the manually edited all_repos.txt
while IFS= read -r url; do
    # Extract organization/repo name from the URL
    repo_name=$(echo $url | awk -F'/' '{print $(NF-1) "/" $NF}')
    # Add the submodule
    git submodule add $url "submodules/$repo_name"
done < all_repos.txt

# Initialize and update submodules
git submodule init
git submodule update