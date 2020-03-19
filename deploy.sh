#!/usr/bin/env bash
set -e
ROOT=$(dirname $(realpath $0))

if [[ ! "$2" =~ ^(develop|production)$ ]]; then
    echo "Second parameter must be 'develop' or 'production' or 'staging'"
    exit
fi
# 
K8SCLUSTER=$1
K8SNS=$2
CWD=$3
PROJPATH=$4
# Get project information
NPM_VERSION=$(cat $CWD/package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g' \
  | tr -d '[[:space:]]')
NS_PROJECT=$(cat $CWD/package.json \
  | grep name \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g' \
  | tr -d '[[:space:]]')
# IMAGE=067796362593.dkr.ecr.ap-southeast-1.amazonaws.com/${NS_PROJECT}:${NPM_VERSION}
IMAGE=$(${ROOT}/get-container-image-name.sh $NS_PROJECT $NPM_VERSION $CWD)
${ROOT}/get-container-image-name.sh $NS_PROJECT $NPM_VERSION $CWD

# APPLY deployments
if [[ $K8SNS == 'production' ]]; then
  aws eks --region ap-southeast-1 update-kubeconfig --name $K8SCLUSTER
      cat "./deployment.yaml" \
      | awk "{gsub(/{IMAGE}/,\"$IMAGE\")}1" \
      | kubectl apply -f -

elif [[ $K8SNS == 'develop' ]]; then
  kubectl config use-context do-sgp1-ns-dev-k8s-1-14
    cat "./deployment.yaml" \
    | awk "{gsub(/{IMAGE}/,\"$IMAGE\")}1" \
    | kubectl apply -f -

elif [[ $K8SNS == 'staging' ]]; then
  kubectl config use-context do-sgp1-ns-k8s-staging
    cat "./deployment.yaml" \
    | awk "{gsub(/{IMAGE}/,\"$IMAGE\")}1" \
    | kubectl apply -f -
fi

echo "Delete yaml file"
rm -f ./*.yaml
