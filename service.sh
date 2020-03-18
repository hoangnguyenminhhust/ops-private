#!/bin/bash
set -e

NAME_PROJECT=$1

echo -e '---'>> deployment.yaml.tmpl
echo -e 'apiVersion: apps/v1'>> deployment.yaml.tmpl
echo -e 'kind: Service'>>deployment.yaml.tmpl
echo -e 'metadata:'>>deployment.yaml.tmpl
echo -e '\tname: '$NAME_PROJECT>>deployment.yaml.tmpl
echo -e 'spec:'>>deployment.yaml.tmpl
echo -e '\tselector:'>>deployment.yaml.tmpl
echo -e '\t\tapp:' $NAME_PROJECT>>deployment.yaml.tmpl
echo -e '\tports:'>>deployment.yaml.tmpl
echo -e '\t\t- port: 3000'>>deployment.yaml.tmpl
echo -e '\t\t\ttargetPort: 3000'>>deployment.yaml.tmpl

