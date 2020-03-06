#!/bin/bash
echo -r "apiVersion: apps/v1" >>config.yaml
echo -r "\t metadata:"  >>config.yaml
echo -r "\t\t namespace:" default >>config.yaml