#!/usr/bin/env bash
set -e
# curl -o project.json http://nsd-api.elove.mobi
export ENV_NAME=$(jq -r '.name' project.json)
bash deployment.sh
for row in $(jq -c '.key[]' project.json); do
   KEY=$(echo "${row}" | jq -r '.KEY')
   VALUE=$(echo "${row}" | jq -r '.VALUE')
   TYPE=$(echo "${row}" | jq -r '.TYPE')
    if [[ $TYPE == "Custom" ]]; then
        echo -e '\t\t\t\t\t\t\t- name: '$KEY>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\t\t valueFrom: '>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\t\t\t configMapKeyRef: '>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\t\t\t\t name: '$ENV_NAME>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\t\t\t\t key: '$KEY>> deployment.yaml.tmpl
    elif [[ $TYPE == "Secret" ]]; then
        echo -e '\t\t\t\t\t\t\t- name: '$KEY>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\t\t valueFrom: '>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\t\t\t secretKeyRef: '>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\t\t\t\t name: '$ENV_NAME>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\t\t\t\t key: '$KEY>> deployment.yaml.tmpl
    elif [[ $TYPE == "Configmap" ]]; then
        echo -e '\t\t\t\t\t\t\t- name: '$KEY>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\t\t valueFrom: '>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\t\t\t configMapKeyRef:'>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\t\t\t\t name: '$ENV_NAME>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\t\t\t\t key: '$KEY>> deployment.yaml.tmpl
    fi
done
sed -i $'s/\t/  /g' *.yaml.tmpl