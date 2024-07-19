#!/bin/bash

# Initialize and update submodules
git submodule update --init --recursive

# Loop through each submodule
git submodule foreach '
    # Fetch the default branch from the remote
    branch=$(git remote show origin | sed -n "/HEAD branch/s/.*: //p")

    # Checkout the default branch
    git checkout $branch

    # Pull the latest changes
    git pull origin $branch
'

# Add and commit the changes to the main repository
git add .
git commit -m "Updated submodules to track the latest versions"
git push

