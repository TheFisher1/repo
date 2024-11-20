#!/bin/bash
set -e

# Convert username to lowercase
LOWERCASE_USER=$(echo "$GITHUB_USER" | tr '[:upper:]' '[:lower:]')

if [[ -z "${LOWERCASE_USER}" ]]; then
  echo "GITHUB_USER is not set"
  exit 1
fi

# Login to GHCR with PAT
echo "$PAT" | docker login ghcr.io -u $LOWERCASE_USER --password-stdin

# Show available images (for debugging)
docker images

docker push "ghcr.io/${docker_username}/micronaut-app:1.0-${GIT_COMMIT::8}" 
docker push "ghcr.io/${docker_username}/micronaut-app:latest" &
wait
