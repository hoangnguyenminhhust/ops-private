#!/usr/bin/env bash
set -e

KEY=$1
K8S_NAME_KEY=$2

echo -e '\t\t\t\t\t\t- name: '$KEY>> deployment.yaml.tmpl
echo -e '\t\t\t\t\t\t\tvalueFrom: '>> deployment.yaml.tmpl
echo -e '\t\t\t\t\t\t\t\tconfigMapKeyRef:'>> deployment.yaml.tmpl
echo -e '\t\t\t\t\t\t\t\t\tname: '$K8S_NAME_KEY>> deployment.yaml.tmpl
echo -e '\t\t\t\t\t\t\t\t\tkey: '$KEY>> deployment.yaml.tmpl