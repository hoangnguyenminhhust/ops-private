#!/bin/bash
echo -e 'apiVersion: apps/v1'>> config.yaml
echo -e '\t metadata:'>> config.yaml
echo -e '\t\t namespace: default'>> config.yaml