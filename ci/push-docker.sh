#!/bin/bash
set -e

# Login to Docker Hub (non-interactive mode)
echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin

# Push both tags
docker push "$DOCKER_USERNAME/micronaut-app:1.0-${GIT_COMMIT::8}" 
docker push "$DOCKER_USERNAME/micronaut-app:latest" &
wait
