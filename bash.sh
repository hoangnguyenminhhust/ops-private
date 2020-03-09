#!/usr/bin/env bash
set -e
# curl -o project.json http://nsd-api.elove.mobi
export ENV_NAME=$(jq -r '.name' project.json)
bash deployment.sh
if [[$ENV_NAME =~ 'api-gateway']] then
    bash service.sh
fi
for row in $(jq -c '.key[]' project.json); do
    KEY=$(echo "${row}" | jq -r '.KEY')
    VALUE=$(echo "${row}" | jq -r '.VALUE')
    TYPE=$(echo "${row}" | jq -r '.TYPE')
    if [[ $TYPE == "Custom" ]]; then
        echo -e '\t\t\t\t\t\t- name: '$KEY>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\tvalueFrom: '>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\t\tconfigMapKeyRef: '>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\t\t\tname: '$ENV_NAME>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\t\t\tkey: '$KEY>> deployment.yaml.tmpl
        elif [[ $TYPE == "Secret" ]]; then
        echo -e '\t\t\t\t\t\t- name: '$KEY>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\tvalueFrom: '>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\t\tsecretKeyRef: '>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\t\t\tname: '$ENV_NAME>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\t\t\tkey: '$KEY>> deployment.yaml.tmpl
        elif [[ $TYPE == "Configmap" ]]; then
        echo -e '\t\t\t\t\t\t- name: '$KEY>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\tvalueFrom: '>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\t\tconfigMapKeyRef:'>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\t\t\tname: '$ENV_NAME>> deployment.yaml.tmpl
        echo -e '\t\t\t\t\t\t\t\t\tkey: '$KEY>> deployment.yaml.tmpl
    fi
done
sed -i $'s/\t/  /g' *.yaml.tmpl