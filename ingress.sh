#!/bin/bash
set -e

NAME_PROJECT=$1
HOST_NAME=$2

echo -e '---'>> deployment.yaml.tmpl
echo -e 'apiVersion: extensions/v1beta1'>> deployment.yaml.tmpl
echo -e 'kind: Ingress'>> deployment.yaml.tmpl
echo -e 'metadata:'>> deployment.yaml.tmpl
echo -e '\tname: '$NAME_PROJECT>> deployment.yaml.tmpl
echo -e '\tannotations: '>> deployment.yaml.tmpl
echo -e '\t\tkubernetes.io/ingress.class: nginx'>> deployment.yaml.tmpl
echo -e '\t\tnginx.ingress.kubernetes.io/proxy-body-size: "20M" '>> deployment.yaml.tmpl
echo -e 'spec:'>> deployment.yaml.tmpl
echo -e '\trules:'>> deployment.yaml.tmpl
echo -e '\t- host: ' $HOST_NAME>> deployment.yaml.tmpl
echo -e '\t\thttp:'>> deployment.yaml.tmpl
echo -e '\t\t\tpaths:'>> deployment.yaml.tmpl
echo -e '\t\t\t- path:'>> deployment.yaml.tmpl
echo -e '\t\t\t\tbackend: '>> deployment.yaml.tmpl
echo -e '\t\t\t\t\tserviceName: '$NAME_PROJECT>> deployment.yaml.tmpl
echo -e '\t\t\t\t\tservicePort: 3000'>> deployment.yaml.tmpl

