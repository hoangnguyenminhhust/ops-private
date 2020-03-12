#!/usr/bin/env bash
set -e
# curl -o project.json http://nsd-api.elove.mobi
export PROJECT_NAME=$(jq -r '.name_project' project.json)
    bash deployment.sh
if [[ $PROJECT_NAME =~ 'api-gateway' ]]; then
    bash service.sh

for row in $(jq -c '.key[]' project.json); do
    KEY=$(echo "${row}" | jq -r '.key')
    VALUE=$(echo "${row}" | jq -r '.value')
    TYPE=$(echo "${row}" | jq -r '.type')
    K8S_NAME_KEY=$(echo "${row}" | jq -r '.k8s_name_key')
    if [[ $TYPE == "Custom" ]]; then
        echo -e '\t\t\t\t\t\t- name: '$KEY>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\tvalue: '$VALUE>> deployment.yaml.tmpl
        elif [[ $TYPE == "Secret" ]]; then
        echo -e '\t\t\t\t\t\t- name: '$KEY>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\tvalueFrom: '>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\t\tsecretKeyRef: '>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\t\t\tname: '$K8S_NAME_KEY>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\t\t\tkey: '$KEY>> deployment.yaml.tmpl
        elif [[ $TYPE == "Configmap" ]]; then
        echo -e '\t\t\t\t\t\t- name: '$KEY>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\tvalueFrom: '>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\t\tconfigMapKeyRef:'>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\t\t\tname: '$K8S_NAME_KEY>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\t\t\tkey: '$KEY>> deployment.yaml.tmpl
    fi
done
sed -i $'s/\t/  /g' *.yaml.tmpl