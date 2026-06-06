#!/bin/bash

# Simple script to save progress by committing all updates and pushing to GitHub

# Set default commit message if none provided
MESSAGE="$1"
if [ -z "$MESSAGE" ]; then
    echo "No commit message provided. Enter a short description of the changes (or press Enter for default 'Update: $(date +'%Y-%m-%d %H:%M:%S')'):"
    read -r input_msg
    if [ -z "$input_msg" ]; then
        MESSAGE="Update: $(date +'%Y-%m-%d %H:%M:%S')"
    else
        MESSAGE="$input_msg"
    fi
fi

# Add all changes
echo "Adding changes to git..."
git add -A

# Commit changes
echo "Committing changes with message: '$MESSAGE'..."
git commit -m "$MESSAGE"

# Push to GitHub
echo "Pushing changes to GitHub repository..."
echo "Note: If prompted, enter your GitHub Username and Personal Access Token (PAT)."
git push origin main

if [ $? -eq 0 ]; then
    echo "Successfully committed and pushed to GitHub!"
else
    echo "Push failed. Please ensure you have configured your GitHub authentication (Username & Personal Access Token / PAT)."
    echo "To generate a Personal Access Token: GitHub Settings -> Developer settings -> Personal access tokens -> Tokens (classic) -> Generate new token."
fi
