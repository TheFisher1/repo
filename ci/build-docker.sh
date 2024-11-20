#!/bin/bash
set -e
LOWERCASE_USER=$(echo "$docker_username" | tr '[:upper:]' '[:lower:]')

[[ -z "${GIT_COMMIT}" ]] && Tag='local' || Tag="${GIT_COMMIT::8}" 
REPO="ghcr.io/${LOWERCASE_USER}/"
echo "${REPO}"
docker build -t "${REPO}micronaut-app:latest" -t "${REPO}micronaut-app:1.0-$Tag" app/
