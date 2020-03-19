#!/bin/bash
set -e

NAME_PROJECT=$1

echo -e '---'> service.yaml
echo -e 'apiVersion: apps/v1'>>  service.yaml
echo -e 'kind: Service'>> service.yaml
echo -e 'metadata:'>> service.yaml
echo -e '\tname: '$NAME_PROJECT>> service.yaml
echo -e 'spec:'>> service.yaml
echo -e '\tselector:'>> service.yaml
echo -e '\t\tapp:' $NAME_PROJECT>> service.yaml
echo -e '\tports:'>> service.yaml
echo -e '\t\t- port: 3000'>> service.yaml
echo -e '\t\t\ttargetPort: 3000'>> service.yaml

