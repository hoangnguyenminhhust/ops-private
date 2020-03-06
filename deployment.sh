#!/bin/bash
echo -e 'apiVersion: apps/v1'>> deployment.yaml.tmpl
echo -e 'kind: Deployment'>>deployment.yaml.tmpl
echo -e 'metadata:'>>deployment.yaml.tmpl
echo -e '\t name: {NS_PROJECT}'>>deployment.yaml.tmpl
echo -e 'spec:'>>deployment.yaml.tmpl
echo -e '\t replicas: 1'>>deployment.yaml.tmpl
echo -e '\t selector:'>>deployment.yaml.tmpl
echo -e '\t\t matchLabels:'>>deployment.yaml.tmpl
echo -e '\t\t\t app: {NS_PROJECT}'>>deployment.yaml.tmpl
echo -e '\t template:'>>deployment.yaml.tmpl
echo -e '\t\t metadata:'>>deployment.yaml.tmpl
echo -e '\t\t\t labels:'>>deployment.yaml.tmpl
echo -e '\t\t\t\t app: {NS_PROJECT}'>>deployment.yaml.tmpl
echo -e '\t\t spec:'>>deployment.yaml.tmpl
echo -e '\t\t\t containers:'>>deployment.yaml.tmpl
echo -e '\t\t\t\t - name: {NS_PROJECT}'>>deployment.yaml.tmpl
echo -e '\t\t\t\t\t image: {IMAGE}'>>deployment.yaml.tmpl
echo -e '\t\t\t\t\t resources:'>>deployment.yaml.tmpl
echo -e '\r\r\t\t\t\t requests:'>>deployment.yaml.tmpl
echo -e '\t\t\t\t\t\t\t cpu: 10m'>>deployment.yaml.tmpl
echo -e '\t\t\t\t\t ports:'>>deployment.yaml.tmpl
echo -e '\t\t\t\t\t  - containerPort: 3000'>>deployment.yaml.tmpl
echo -e '\t\t\t\t\t env:'>>deployment.yaml.tmpl




