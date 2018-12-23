#!/bin/bash

# Delete bluegreen app in DEV
oc project app-dev
oc delete service bluegreen
oc delete deploymentconfigs bluegreen
oc delete route bluegreen
oc delete imagestreams bluegreen
oc delete bc bluegreen -n app-dev

oc project app-qa
oc delete service bluegreen
oc delete deploymentconfigs bluegreen
oc delete route bluegreen
oc delete imagestreams bluegreen
#oc delete bc bluegreen -n app-qa

oc project app-prod
oc delete service bluegreen
oc delete deploymentconfigs bluegreen
oc delete route bluegreen
oc delete imagestreams bluegreen
oc delete route bluegreen-prod-route
oc expose service bluegreen-original --name=bluegreen-prod-route
#oc delete bc bluegreen -n app-prod
