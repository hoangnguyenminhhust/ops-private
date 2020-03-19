#!/usr/bin/env bash
set -e

KEY=$1
VALUE=$2

echo -e '\t\t\t\t\t\t- name: '$KEY>> deployment.yaml.tmpl
echo -e "\t\t\t\t\t\t\tvalue: '$VALUE'">> deployment.yaml.tmpl