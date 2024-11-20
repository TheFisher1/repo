#!/bin/bash
set -e
echo "$GITHUB_TOKEN" | docker login ghcr.io -u $GITHUB_ACTOR --password-stdin
docker push "ghcr.io/$DOCKER_USERNAME/micronaut-app:1.0-${GIT_COMMIT::8}" 
docker push "ghcr.io/$DOCKER_USERNAME/micronaut-app:latest" &
wait
