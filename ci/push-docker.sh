#!/bin/bash
set -e

echo "$GITHUB_TOKEN" | docker login ghcr.io -u $GITHUB_USER --password-stdin
docker images

docker push "ghcr.io/${docker_username}/micronaut-app:1.0-${GIT_COMMIT::8}" 
docker push "ghcr.io/${docker_username}/micronaut-app:latest" &
wait
