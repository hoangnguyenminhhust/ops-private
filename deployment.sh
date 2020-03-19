#!/bin/bash
set -e

NAME_PROJECT=$1
REPLICAS=$2

echo -e '---'> deployment.yaml
echo -e 'apiVersion: apps/v1'>> deployment.yaml
echo -e 'kind: Deployment'>> deployment.yaml
echo -e 'metadata:'>> deployment.yaml
echo -e '\tname: '$NAME_PROJECT>> deployment.yaml
echo -e 'spec:'>> deployment.yaml
echo -e '\treplicas: '$REPLICAS>> deployment.yaml
echo -e '\tselector:'>> deployment.yaml
echo -e '\t\tmatchLabels:'>> deployment.yaml
echo -e '\t\t\tapp: '$NAME_PROJECT>> deployment.yaml
echo -e '\ttemplate:'>> deployment.yaml
echo -e '\t\tmetadata:'>> deployment.yaml
echo -e '\t\t\tlabels:'>> deployment.yaml
echo -e '\t\t\t\tapp: '$NAME_PROJECT>> deployment.yaml
echo -e '\t\tspec:'>> deployment.yaml
echo -e '\t\t\tcontainers:'>> deployment.yaml
echo -e '\t\t\t\t- name: '$NAME_PROJECT>> deployment.yaml
echo -e '\t\t\t\t\timage: {IMAGE}'>> deployment.yaml
echo -e '\t\t\t\t\tresources:'>> deployment.yaml
echo -e '\t\t\t\t\t\trequests:'>> deployment.yaml
echo -e '\t\t\t\t\t\t\tcpu: 10m'>> deployment.yaml
echo -e '\t\t\t\t\tports:'>> deployment.yaml
echo -e '\t\t\t\t\t\t- containerPort: 3000'>> deployment.yaml
echo -e '\t\t\t\t\tenv:'>> deployment.yaml




