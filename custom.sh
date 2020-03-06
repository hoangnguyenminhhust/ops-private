
#!/bin/bash
echo -e '\t\t\t\t\t\t\t- name:'$KEY>> deployment.yaml.tmpl
echo -e '\t\t\t\t\t\t\t\t valueFrom:'>> deployment.yaml.tmpl
echo -e '\t\t\t\t\t\t\t\t\t configMapKeyRef:'>> deployment.yaml.tmpl
echo -e '\t\t\t\t\t\t\t\t\t\t name:'$ENV_NAME>> deployment.yaml.tmpl
echo -e '\t\t\t\t\t\t\t\t\t\t key:'$KEY>> deployment.yaml.tmpl


