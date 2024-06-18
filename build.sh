#!/bin/bash

set -e

TAG=$1
GITHUB_TOKEN=$2

if [ "${TAG}" == "" ]; then
  echo "TAG is required. Try TAG=your-tag $0"
  exit 1
fi

docker buildx build --platform linux/arm64,linux/amd64 --build-arg GITHUB_TOKEN="${GITHUB_TOKEN}" --push -t ghcr.io/risingwavelabs/risingwave-metabase:"${TAG}" .
