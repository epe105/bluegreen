#!/bin/bash

echo "###############################################################################"
echo "#  MAKE SURE YOU ARE LOGGED IN:                                               #"
echo "#  $ oc login https://192.168.42.136:8443                                     #"
echo "###############################################################################"

oc delete project cicd
oc delete project app-dev
oc delete project app-qa
oc delete project app-prod
