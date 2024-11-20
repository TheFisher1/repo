#!/bin/bash
set -e

# Convert username to lowercase
# LOWERCASE_USER=$(echo "$" | tr '[:upper:]' '[:lower:]')

# Login to GHCR with PAT
echo "$PAT" | docker login ghcr.io -u $docker_username --password-stdin

# Show available images (for debugging)
docker images

# Push to GHCR using lowercase username
docker push "ghcr.io/${docker_username}/micronaut-app:1.0-${GIT_COMMIT::8}" 
docker push "ghcr.io/${docker_username}/micronaut-app:latest" &
wait
