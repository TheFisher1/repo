#!/bin/bash
set -e
echo "$docker_username | $docker_password"
echo "$docker_password" | docker login ghcr.io --username "$GITHUB_TOKEN" --password-stdin
docker push "ghcr.io/$docker_username/micronaut-app:1.0-${GIT_COMMIT::8}" 
docker push "ghcr.io/$docker_username/micronaut-app:latest" &
wait
