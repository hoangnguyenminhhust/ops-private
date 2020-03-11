#!/bin/bash
echo -e 'apiVersion: apps/v1'>> deployment.yaml.tmpl
echo -e 'kind: Deployment'>>deployment.yaml.tmpl
echo -e 'metadata:'>>deployment.yaml.tmpl
echo -e '\tname: '$PROJECT_NAME>>deployment.yaml.tmpl
echo -e 'spec:'>>deployment.yaml.tmpl
echo -e '\treplicas: 1'>>deployment.yaml.tmpl
echo -e '\tselector:'>>deployment.yaml.tmpl
echo -e '\t\tmatchLabels:'>>deployment.yaml.tmpl
echo -e '\t\t\tapp: '$PROJECT_NAME>>deployment.yaml.tmpl
echo -e '\ttemplate:'>>deployment.yaml.tmpl
echo -e '\t\tmetadata:'>>deployment.yaml.tmpl
echo -e '\t\t\tlabels:'>>deployment.yaml.tmpl
echo -e '\t\t\t\tapp: '$PROJECT_NAME>>deployment.yaml.tmpl
echo -e '\t\tspec:'>>deployment.yaml.tmpl
echo -e '\t\t\tcontainers:'>>deployment.yaml.tmpl
echo -e '\t\t\t\t- name: '$PROJECT_NAME>>deployment.yaml.tmpl
echo -e '\t\t\t\t\timage: {IMAGE}'>>deployment.yaml.tmpl
echo -e '\t\t\t\t\tresources:'>>deployment.yaml.tmpl
echo -e '\r\r\t\t\t\trequests:'>>deployment.yaml.tmpl
echo -e '\t\t\t\t\t\t\tcpu: 10m'>>deployment.yaml.tmpl
echo -e '\t\t\t\t\tports:'>>deployment.yaml.tmpl
echo -e '\t\t\t\t\t\t- containerPort: 3000'>>deployment.yaml.tmpl
echo -e '\t\t\t\t\tenv:'>>deployment.yaml.tmpl




