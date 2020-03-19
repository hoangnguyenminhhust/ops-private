#!/usr/bin/env bash
set -e

# URL=$1

# curl -o project.json $URL

export NAME_PROJECT=$(jq -r '.name_project' project.json)
export INGRESS=$(jq -r '.ingress' project.json)
export SERVICE=$(jq -r '.service' project.json)
export REPLICAS=$(jq -r '.replicas' project.json)


if [[ "$SERVICE"  == "true" ]]; then
    ./service.sh $NAME_PROJECT
    echo "Build service"
fi

if [[ "$INGRESS"  == "true" ]]; then
    ./ingress.sh
    echo "Build ingress"
fi

    ./deployment.sh $NAME_PROJECT $REPLICAS
    echo "Build deployment"
for row in $(jq -c '.key[]' project.json); do
    KEY=$(echo "${row}" | jq -r '.key')
    VALUE=$(echo "${row}" | jq -r '.value')
    TYPE=$(echo "${row}" | jq -r '.type')
    K8S_NAME_KEY=$(echo "${row}" | jq -r '.k8s_name_key')
    if [[ $TYPE == "Custom" ]]; then
        ./custom.sh $KEY $VALUE

    elif [[ $TYPE == "Secret" ]]; then
        ./secret.sh $KEY $K8S_NAME_KEY

    elif [[ $TYPE == "Configmap" ]]; then
        ./secret.sh $KEY $K8S_NAME_KEY

    fi
done
sed -i $'s/\t/  /g' *.yaml
