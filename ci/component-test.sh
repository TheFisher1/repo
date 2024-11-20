#! /bin/bash
LOWERCASE_USER=$(echo "$GITHUB_USER" | tr '[:upper:]' '[:lower:]')

[[ -z "${GITHUB_USER}" ]] && DockerRepo='' || DockerRepo="${LOWERCASE_USER}/"
docker compose -f component-test/docker-compose.yml --project-directory . -p ci up --build --exit-code-from test