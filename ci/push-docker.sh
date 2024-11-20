#!/bin/bash
set -e

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push "$DOCKER_USERNAME/micronaut-app:1.0-${GIT_COMMIT::8}" 
docker push "$DOCKER_USERNAME/micronaut-app:latest" &
wait
