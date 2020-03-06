#!/bin/bash
echo '- name: $KEY'>> config.yaml
echo '\t valueFrom:'>> config.yaml
echo '\t\t configMapKeyRef:'>> config.yaml
echo '\t\t\t name: $ENV_NAME'>> config.yaml
echo '\t\t\t key: $KEY'>> config.yaml
expand -t 1 config.yaml


