#!/bin/bash

echo "###############################################################################"
echo "#  MAKE SURE YOU ARE LOGGED IN:                                               #"
echo "#  $ oc login https://192.168.42.136:8443                                     #"
echo "###############################################################################"

#repository_path=https://github.com/epe105/bluegreen#ocp33-pipeline-me

oc new-project app-dev --display-name="Application Development Environment"
oc new-app --name=bluegreen https://github.com/epe105/bluegreen-wings
oc expose service bluegreen
oc new-app jenkins-ephemeral -n app-dev
#oc create -f php-bluegreen-app-pipeline-bc-new.yml
oc new-project app-qa --display-name="Application QA Environment"
oc new-project app-prod --display-name="Application Production Environment"

# Give this project an edit role on other related projects
oc policy add-role-to-user edit system:serviceaccount:app-dev:jenkins -n app-dev
oc policy add-role-to-user edit system:serviceaccount:app-dev:jenkins -n app-qa
oc policy add-role-to-user edit system:serviceaccount:app-dev:jenkins -n app-prod

# Give the other related projects the role to pull images from pipeline-app
oc policy add-role-to-group system:image-puller system:serviceaccounts:app-qa -n app-dev
oc policy add-role-to-group system:image-puller system:serviceaccounts:app-prod -n app-qa
