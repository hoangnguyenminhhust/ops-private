#!/usr/bin/env bash
set -e
export PROJPATH=$(pwd)
echo $PROJPATH
export ENV_NAME=$(jq -r '.name' version.json)
echo $ENV_NAME
for row in $(jq -c '.key[]' version.json); do
  KEY=$(echo "${row}" | jq -r '.KEY')
  VALUE=$(echo "${row}" | jq -r '.VALUE')
  TYPE=$(echo "${row}" | jq -r '.TYPE')
  echo $KEY $VALUE $TYPE
    if [[ $TYPE == "Custom" ]]; then

        echo '- name: $KEY'>> config.yaml
        echo '\t valueFrom:'>> config.yaml
        echo '\t\t configMapKeyRef:'>> config.yaml
        echo '\t\t\t name: $ENV_NAME'>> config.yaml
        echo '\t\t\t key: $KEY'>> config.yaml
        expand -t 1 config.yaml
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
sed -i $'s/\t/ /g' *.yaml.tmpl