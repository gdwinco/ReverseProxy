#!/bin/bash	

JBOSS_TGT_HOME=${PWD}/../temp-eap-7.0.0/jboss-eap-7.0
JBOSS_REMOTE_IP=127.0.0.1

# -- automate all in future, for now submite 1 by 1
#UPGRADE_01=${PWD}/eap_updates/jboss-eap-7.0.1-patch.zip
#UPGRADE_02=${PWD}/eap_updates/jboss-eap-7.0.2-patch.zip
#UPGRADE_03=${PWD}/eap_updates/jboss-eap-7.0.3-patch.zip

if [ -z "$1" ]
  then
    echo "No argument supplied, Enter integer to specify patch level "
    exit
else
    COUNT=$1
fi

PATCH=${PWD}/eap_updates/jboss-eap-7.0.${COUNT}-patch.zip

echo --- $PATCH
  $JBOSS_TGT_HOME/bin/jboss-cli.sh <<EOF
#  batch
#
  connect
  patch apply ${PATCH}
  shutdown --restart=true
#
#  run-batch
  exit
  EOF
