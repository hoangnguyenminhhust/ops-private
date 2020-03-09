#!/bin/bash
echo -e 'apiVersion: apps/v1'>> service.yaml.tmpl
echo -e 'kind: Service'>>service.yaml.tmpl
echo -e 'metadata:'>>service.yaml.tmpl
echo -e '\tname: '$ENV_NAME>>service.yaml.tmpl
echo -e 'spec:'>>service.yaml.tmpl
echo -e '\tselector:'>>service.yaml.tmpl
echo -e '\t\tapp:' $ENV_NAME>>service.yaml.tmpl
echo -e '\tports:'>>service.yaml.tmpl
echo -e '\t\t- port: 3000'>>service.yaml.tmpl
echo -e '\t\t\ttargetPort: 3000'>>service.yaml.tmpl

