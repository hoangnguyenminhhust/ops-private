#!/bin/bash
printf  "apiVersion: apps/v1" >>config.yaml
printf  "\t metadata:"  >>config.yaml
printf  "\t\t namespace:" default >>config.yaml