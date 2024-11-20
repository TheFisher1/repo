#!/bin/bash
set -e
echo "$DOCKER_PASSWORD" | docker login ghcr.io --username "$DOCKER_USERNAME" --password-stdin
docker push "ghcr.io/$DOCKER_USERNAME/micronaut-app:1.0-${GIT_COMMIT::8}" 
docker push "ghcr.io/$DOCKER_USERNAME/micronaut-app:latest" &
wait
