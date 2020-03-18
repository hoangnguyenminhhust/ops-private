#!/usr/bin/env bash
set -e
set -u

IMAGE_NAME=$1
NPM_VERSION=$2
BRANCH_OR_HEAD=$(cd $3 && echo $(git rev-parse --abbrev-ref HEAD))

if [[ ${CI_COMMIT_TAG} ]]; then
    if [[ "${NPM_VERSION}" != "${CI_COMMIT_TAG}" ]]; then
        echo "ERROR: git tag ${CI_COMMIT_TAG} does not match package.json version ${NPM_VERSION}"
        exit 1
    fi
    IMAGE_VERSION=${NPM_VERSION}
    STABLE="true"
else
    IMAGE_VERSION=$(cd $3 && git rev-parse HEAD)
    STABLE="false"
fi

echo "067796362593.dkr.ecr.ap-southeast-1.amazonaws.com/${IMAGE_NAME}:${IMAGE_VERSION}"