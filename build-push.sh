#!/usr/bin/env bash
set -e

ROOT=$(dirname $(realpath $0))
NPM_VERSION=$(cat $1/package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g' \
  | tr -d '[[:space:]]')
NS_PROJECT=$(cat $1/package.json \
  | grep name \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g' \
  | tr -d '[[:space:]]')
ENV_UI=$2
IMAGE=$(${ROOT}/get-container-image-name.sh $NS_PROJECT $NPM_VERSION $1)
${ROOT}/get-container-image-name.sh $NS_PROJECT $NPM_VERSION $1
# IMAGE=067796362593.dkr.ecr.ap-southeast-1.amazonaws.com/${NS_PROJECT}:${NPM_VERSION}
eval $(aws ecr get-login --region ap-southeast-1 --no-include-email | sed 's|https://||')
docker build -t $IMAGE --build-arg env_ui=$ENV_UI $1 
aws ecr create-repository --repository-name $NS_PROJECT || true
docker push $IMAGE