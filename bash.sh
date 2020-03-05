#!/usr/bin/env bash
set -e
for row in $(jq -c '.[]' version.json); do
  KEY=$(echo "${row}" | jq -r '.KEY')
  VALUE=$(echo "${row}" | jq -r '.VALUE')
  TYPE=$(echo "${row}" | jq -r '.TYPE')
  echo $KEY $VALUE $TYPE
  if [[ $TYPE == "Custom" ]]; then
    echo "type Custom"
  if [[ $TYPE == "Secret" ]]; then
    echo "type Secret"
  if [[ $TYPE == "Configmap" ]]; then
    echo "type Configmap"
fi
done

