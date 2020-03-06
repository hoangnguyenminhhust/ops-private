#!/usr/bin/env bash
set -e
export PROJPATH=$(pwd)
echo $PROJPATH
for row in $(jq -c '.key' version.json); do
  KEY=$(echo "${row}" | jq -r '.KEY')
  VALUE=$(echo "${row}" | jq -r '.VALUE')
  TYPE=$(echo "${row}" | jq -r '.TYPE')
  echo $KEY $VALUE $TYPE
    if [[ $TYPE == "Custom" ]]; then
        echo "Custom"
        # for file in $PROJPATH/*; do
        #     if [[ -f $file ]]; then
        #     cat "$file" \
        #     | awk "{gsub(/{IMAGE}/,\"$IMAGE\")}1" \
        #     | awk "{gsub(/{NODEENV}/,\"$K8SNS\")}1" \
        #     | awk "{gsub(/{NS_PROJECT}/,\"$NS_PROJECT\")}1" 
        #     fi
        # done
    elif [[ $TYPE == "Secret" ]]; then
        echo "Secret"
        # for file in $PROJPATH/*; do
        #     if [[ -f $file ]]; then
        #     cat "$file" \
        #     | awk "{gsub(/{IMAGE}/,\"$IMAGE\")}1" \
        #     | awk "{gsub(/{NODEENV}/,\"$K8SNS\")}1" \
        #     | awk "{gsub(/{NS_PROJECT}/,\"$NS_PROJECT\")}1" 
        #     fi
        # done
    elif [[ $TYPE == "Configmap" ]]; then
        echo "Configmap"
        # for file in $PROJPATH/*; do
        #     if [[ -f $file ]]; then
        #     cat "$file" \
        #     | awk "{gsub(/{IMAGE}/,\"$IMAGE\")}1" \
        #     | awk "{gsub(/{NODEENV}/,\"$K8SNS\")}1" \
        #     | awk "{gsub(/{NS_PROJECT}/,\"$NS_PROJECT\")}1" 
        #     fi
        # done
    fi
done
