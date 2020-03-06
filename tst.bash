export ENV_NAME=$(jq -r '.name' version.json)
echo $ENV_NAME