#!/bin/bash

# Delete bluegreen app in DEV
oc project app-dev
oc delete service bluegreen
oc delete deploymentconfigs bluegreen
oc delete route bluegreen
oc delete imagestreams bluegreen
oc delete bc bluegreen -n app-dev
