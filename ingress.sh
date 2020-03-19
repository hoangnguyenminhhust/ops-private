#!/bin/bash
set -e

NAME_PROJECT=$1
HOST_NAME=$2

echo -e '---'>> ingress.yaml
echo -e 'apiVersion: extensions/v1beta1'>> ingress.yaml
echo -e 'kind: Ingress'>> ingress.yaml
echo -e 'metadata:'>> ingress.yaml
echo -e '\tname: '$NAME_PROJECT>> ingress.yaml
echo -e '\tannotations: '>> ingress.yaml
echo -e '\t\tkubernetes.io/ingress.class: nginx'>> ingress.yaml
echo -e '\t\tnginx.ingress.kubernetes.io/proxy-body-size: "20M" '>> ingress.yaml
echo -e 'spec:'>> ingress.yaml
echo -e '\trules:'>> ingress.yaml
echo -e '\t- host: ' $HOST_NAME>> ingress.yaml
echo -e '\t\thttp:'>> ingress.yaml
echo -e '\t\t\tpaths:'>> ingress.yaml
echo -e '\t\t\t- path:'>> ingress.yaml
echo -e '\t\t\t\tbackend: '>> ingress.yaml
echo -e '\t\t\t\t\tserviceName: '$NAME_PROJECT>> ingress.yaml
echo -e '\t\t\t\t\tservicePort: 3000'>> ingress.yaml

