#!/usr/bin/env bash
set -e
for row in $(jq -c '.[]' version.json); do
  KEY=$(echo "${row}" | jq -r '.KEY')
  VALUE=$(echo "${row}" | jq -r '.VALUE')
  TYPE=$(echo "${row}" | jq -r '.TYPE')
  echo $KEY $VALUE $TYPE
  for file in $PROJPATH/*; do
    cat "$file" \
    | awk "{gsub(/{IMAGE}/,\"$IMAGE\")}1" \
    | awk "{gsub(/{NODEENV}/,\"$production\")}1" \
    | awk "{gsub(/{NS_PROJECT}/,\"$PROJ\")}1" \
    | echo $PROJPATH
  done
done



#!/usr/bin/env bash
# set -e

# IMAGE_REPO=067796362593.dkr.ecr.ap-southeast-1.amazonaws.com
# kubectl config use-context do-sgp1-ns-k8s-staging
# for row in $(jq -c '.[]' version.json); do
#   PROJ=$(echo "${row}" | jq -r '.app')
#   TAG=$(echo "${row}" | jq -r '.tag')
#   IMAGE="$IMAGE_REPO/$PROJ:$TAG"
#   PROJPATH=$(find -type d -name "*$PROJ*")
#   echo $PROJPATH
#   for file in $PROJPATH/*; do
#     cat "$file" \
#     | awk "{gsub(/{IMAGE}/,\"$IMAGE\")}1" \
#     | awk "{gsub(/{NODEENV}/,\"$production\")}1" \
#     | awk "{gsub(/{NS_PROJECT}/,\"$PROJ\")}1" \
#     | kubectl apply -f -
#   done
# done