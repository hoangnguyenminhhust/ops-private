#!/usr/bin/env bash
set -e
export PROJPATH=$(pwd)
echo $PROJPATH
export ENV_NAME=$(jq -r '.name' version.json)
echo $ENV_NAME
bash deployment.sh
for row in $(jq -c '.key[]' version.json); do
  export KEY=$(echo "${row}" | jq -r '.KEY')
  export VALUE=$(echo "${row}" | jq -r '.VALUE')
  export TYPE=$(echo "${row}" | jq -r '.TYPE')
    if [[ $TYPE == "Custom" ]]; then
        bash custom.sh
    elif [[ $TYPE == "Secret" ]]; then
        bash secret.sh
    elif [[ $TYPE == "Configmap" ]]; then
        bash configmap.sh
    fi
done
sed -i $'s/\t/ /g' *.yaml.tmpl