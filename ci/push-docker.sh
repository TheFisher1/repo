#!/bin/bash
set -e
echo "$GITHUB_TOKEN" | docker login ghcr.io -u $GITHUB_ACTOR --password-stdin
docker push "ghcr.io/$GITHUB_ACTOR/micronaut-app:1.0-${GIT_COMMIT::8}" 
docker push "ghcr.io/$GITHUB_ACTOR/micronaut-app:latest" &
wait
