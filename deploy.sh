#!/bin/bash

# Check if version and commit hash arguments are provided
if [ $# -ne 2 ]; then
  echo "Usage: $0 <version> <commit-hash>"
  exit 1
fi

# Get version and commit hash from command-line arguments
version="$1"
commit_hash="$2"

image_name="your-docker-image"

# Create a tag for the commit
tag="$version"

# Tag the commit
git tag "$tag" "$commit_hash"

# Push the tag to GitHub
git push origin "$tag"

# Build the Docker image
docker build -t "$image_name:$tag" .

## Tag the Docker image

#docker tag "$image_name:$tag" "$image_name:latest"


echo "Deployment completed successfully."
