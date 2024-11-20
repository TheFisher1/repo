#!/bin/bash
set -e

# Login to Docker Hub (non-interactive mode)
echo "$docker_password" | docker login --username "$docker_username" --password-stdin

# Push both tags
docker push "$DOCKER_USERNAME/micronaut-app:1.0-${GIT_COMMIT::8}" 
docker push "$DOCKER_USERNAME/micronaut-app:latest" &
wait
